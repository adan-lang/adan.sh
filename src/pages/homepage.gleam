import constants

import lustre/attribute
import lustre/element/html

pub fn view_homepage() {
  html.html([], [
    html.head([], [
      html.title([], constants.website_title),
      html.link([
        attribute.rel("stylesheet"),
        attribute.href("/static/styles.css"),
      ]),
      html.link([
        attribute.rel("icon"),
        attribute.href("/static/assets/logo.png"),
        attribute.type_("image/png"),
      ]),
    ]),
    html.body([], [
      html.p(
        [
          attribute.class("hero"),
        ],
        [
          html.text("blehh (template)"),
        ],
      ),
    ]),
  ])
}
