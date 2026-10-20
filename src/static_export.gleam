import gleam/io
import lustre/element
import pages/homepage

pub fn main() {
  homepage.view_homepage()
  |> element.to_document_string()
  |> io.println
}
