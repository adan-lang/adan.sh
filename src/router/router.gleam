import lustre/element

import pages/homepage

import wisp.{type Request, type Response}

pub fn handle(req: Request) -> Response {
  let assert Ok(priv) = wisp.priv_directory("adan_sh")
  use <- wisp.serve_static(req, under: "/static", from: priv)
  case wisp.path_segments(req) {
    [] -> ok()
    _ -> wisp.not_found()
  }
}

fn ok() -> Response {
  homepage.view_homepage()
  |> element.to_document_string()
  |> wisp.html_response(200)
}
