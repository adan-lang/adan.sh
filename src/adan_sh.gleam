import gleam/bytes_tree
import gleam/erlang/process
import gleam/http/request.{type Request}
import gleam/http/response

import lustre/element

import mist

import pages/homepage

fn handle_request(_request: Request(mist.Connection)) {
  let html =
    homepage.view_homepage()
    |> element.to_document_string()

  response.new(200)
  |> response.set_header("content-type", "text/html")
  |> response.set_body(mist.Bytes(bytes_tree.from_string(html)))
}

pub fn main() {
  let port = 8000

  let assert Ok(_) =
    mist.new(handle_request)
    |> mist.port(port)
    |> mist.start

  process.sleep_forever()
}
