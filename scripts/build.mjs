import { spawnSync } from "node:child_process";
import { cpSync, mkdirSync, mkdtempSync, rmSync, writeFileSync } from "node:fs";
import os from "node:os";
import path from "node:path";
import { fileURLToPath } from "node:url";

const projectRoot = path.resolve(path.dirname(fileURLToPath(import.meta.url)), "..");
const gleamVersion = "1.19.2";

function run(command, args, options = {}) {
    const result = spawnSync(command, args, {
        cwd: options.cwd ?? projectRoot,
        encoding: "utf8",
        ...options,
    });

    if (result.error) throw result.error;
    if (result.status !== 0) {
        throw new Error(
            `${command} ${args.join(" ")} failed with exit code ${result.status}\n${result.stderr}`,
        );
    }

    return result;
}

function findGleam(archivePath) {
    const entries = run("tar", ["-tzf", archivePath]).stdout.split("\n").filter(Boolean);
    const binary = entries.find((entry) => path.posix.basename(entry) === "gleam");
    if (!binary) throw new Error("The Gleam archive did not contain the compiler binary.");
    return binary;
}

function ensureGleam() {
    const installed = spawnSync("gleam", ["--version"], { stdio: "ignore" });
    if (installed.status === 0) return "gleam";

    const platform = process.platform === "linux" ? "unknown-linux-musl" : null;
    const architecture = { x64: "x86_64", arm64: "aarch64" }[process.arch];
    if (!platform || !architecture) {
        throw new Error("A Gleam compiler is required. Automatic installation supports Linux x64 and arm64.");
    }

    const archiveName = `gleam-v${gleamVersion}-${architecture}-${platform}.tar.gz`;
    const downloadUrl = `https://github.com/gleam-lang/gleam/releases/download/v${gleamVersion}/${archiveName}`;
    const temporaryDirectory = mkdtempSync(path.join(os.tmpdir(), "adan-gleam-"));
    const archivePath = path.join(temporaryDirectory, archiveName);
    const download = spawnSync("curl", ["--fail", "--location", "--silent", "--show-error", downloadUrl, "--output", archivePath]);
    if (download.error) throw download.error;
    if (download.status !== 0) throw new Error(`Failed to download Gleam from ${downloadUrl}`);

    const binaryPath = findGleam(archivePath);
    run("tar", ["-xzf", archivePath, "-C", temporaryDirectory]);
    return path.join(temporaryDirectory, binaryPath);
}

const gleam = ensureGleam();
const exportProject = path.join(projectRoot, "build", "static_export");
const sourceFiles = [
    "constants.gleam",
    "elements/footer.gleam",
    "elements/navbar.gleam",
    "pages/homepage.gleam",
    "static_export.gleam",
];

mkdirSync(exportProject, { recursive: true });
writeFileSync(
    path.join(exportProject, "gleam.toml"),
    `name = "adan_static_export"\nversion = "1.0.0"\ntarget = "javascript"\n\n[dependencies]\ngleam_stdlib = "== 1.0.3"\nlustre = "== 5.7.0"\n`,
);

for (const sourceFile of sourceFiles) {
    const destination = path.join(exportProject, "src", sourceFile);
    mkdirSync(path.dirname(destination), { recursive: true });
    cpSync(path.join(projectRoot, "src", sourceFile), destination);
}

const rendered = run(gleam, [
    "run",
    "--target",
    "javascript",
    "--runtime",
    "nodejs",
    "--module",
    "static_export",
    "--no-print-progress",
], { cwd: exportProject });

if (!rendered.stdout.includes("<html")) {
    throw new Error("The static exporter did not return an HTML document.");
}

const outputDirectory = path.join(projectRoot, "dist");
rmSync(outputDirectory, { recursive: true, force: true });
mkdirSync(outputDirectory, { recursive: true });
writeFileSync(path.join(outputDirectory, "index.html"), rendered.stdout);
cpSync(path.join(projectRoot, "priv"), path.join(outputDirectory, "static"), { recursive: true });
cpSync(path.join(projectRoot, "robots.txt"), path.join(outputDirectory, "robots.txt"));

console.log(`Static site written to ${path.relative(projectRoot, outputDirectory)}/`);