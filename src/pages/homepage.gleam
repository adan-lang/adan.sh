import header

import lustre/element/html

pub fn view_homepage() {
  html.html([], [
    html.head([], [html.title([], header.website_title)]),
    html.body([], [
      html.p([], [
        html.text(
          "blehh (template) - go look @ https://github.com/adan-lang/adan.git",
        ),
      ]),
    ]),
  ])
}
