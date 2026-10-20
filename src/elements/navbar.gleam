import lustre/attribute
import lustre/element.{type Element}
import lustre/element/html

pub fn view_navbar() -> Element(msg) {
  html.nav([attribute.class("navbar")], [
    html.a([attribute.href("/"), attribute.class("navbar-brand")], [
      html.img([
        attribute.src("/static/assets/logo.png"),
        attribute.alt("Logo"),
        attribute.class("navbar-logo"),
      ]),
      html.span([attribute.class("navbar-title")], [html.text("ADAN")]),
    ]),
    html.div([attribute.class("navbar-links")], [
      html.a(
        [
          attribute.href("https://github.com/adan-lang/adan"),
          attribute.class("navbar-link"),
          attribute.target("_blank"),
          attribute.rel("noopener noreferrer"),
        ],
        [html.text("Source")],
      ),
      html.a(
        [
          attribute.href("https://docs.adan.sh/"),
          attribute.class("navbar-link"),
          attribute.target("_blank"),
          attribute.rel("noopener noreferrer"),
        ],
        [html.text("Documentation")],
      ),
      html.a(
        [
          attribute.href("https://try.adan.sh/"),
          attribute.class("navbar-link"),
          attribute.target("_blank"),
          attribute.rel("noopener noreferrer"),
        ],
        [html.text("Demo")],
      ),
      html.a(
        [
          attribute.href("https://get.adan.sh/"),
          attribute.class("navbar-link navbar-link--cta"),
          attribute.target("_blank"),
          attribute.rel("noopener noreferrer"),
        ],
        [html.text("Download")],
      ),
    ]),
  ])
}
