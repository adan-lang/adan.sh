import constants

import elements/navbar

import lustre/attribute
import lustre/element/html

pub fn view_homepage() {
  html.html([], [
    html.head([], [
      html.title([], constants.website_title),
      html.link([
        attribute.rel("preconnect"),
        attribute.href("https://fonts.googleapis.com"),
      ]),
      html.link([
        attribute.rel("preconnect"),
        attribute.href("https://fonts.gstatic.com"),
        attribute.attribute("crossorigin", ""),
      ]),
      html.link([
        attribute.rel("stylesheet"),
        attribute.href(
          "https://fonts.googleapis.com/css2?family=Inter:wght@400;700&display=swap",
        ),
      ]),
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
      navbar.view_navbar(),
    ]),
  ])
}
