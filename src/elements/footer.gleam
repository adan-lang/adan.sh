import lustre/attribute
import lustre/element.{type Element}
import lustre/element/html

pub fn view_footer() -> Element(msg) {
  html.footer([attribute.class("footer")], [
    html.div([attribute.class("footer-top")], [
      html.div([attribute.class("footer-brand")], [
        html.img([
          attribute.src("/static/assets/logo.png"),
          attribute.alt("Logo"),
          attribute.class("footer-logo"),
        ]),
        html.span([attribute.class("footer-title")], [html.text("ADAN")]),
      ]),
      html.p([attribute.class("footer-tagline")], [
        html.text(
          "Beginner friendly language with inferred typing and no memory managing. Use high level programming for lower level jobs.",
        ),
      ]),
    ]),
    html.div([attribute.class("footer-bottom")], [
      html.span([attribute.class("footer-license")], [
        html.text("Licensed under MIT"),
      ]),
      html.div([attribute.class("footer-links")], [
        html.a(
          [
            attribute.href("mailto:hello@adan.sh"),
            attribute.class("footer-link"),
            attribute.target("_blank"),
            attribute.rel("noopener noreferrer"),
          ],
          [html.text("hello@adan.sh")],
        ),
        html.a(
          [
            attribute.href("https://github.adan.sh/"),
            attribute.class("footer-link"),
            attribute.target("_blank"),
            attribute.rel("noopener noreferrer"),
          ],
          [html.text("GitHub")],
        ),
      ]),
    ]),
  ])
}
