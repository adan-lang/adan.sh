#!/usr/bin/env bash

set -e

COMMAND=$1

case "$COMMAND" in
    host)
        echo "Starting Lustre dev server..."
        exec gleam run -m lustre/dev start
        ;;
    build)
        echo "Compiling Gleam project..."
        exec gleam build
        ;;
    test)
        # use on non-browser projects
        exec gleam run
        ;;
    *)
        echo "usage: $0 {host|build|test}"
        exit 1
        ;;
esac