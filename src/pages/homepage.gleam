import constants

import elements/footer
import elements/navbar

import lustre/attribute
import lustre/element/html

pub fn view_homepage() {
  html.html([], [
    html.head([], [
      html.meta([
        attribute.attribute("name", "viewport"),
        attribute.attribute("content", "width=device-width, initial-scale=1"),
      ]),
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
        attribute.href(
          "https://cdn.jsdelivr.net/npm/@fontsource/monaspace-radon@5.3.0/index.css",
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
      html.main([attribute.class("home-main")], [
        html.section([attribute.class("home-intro")], [
          html.h1([attribute.class("home-title")], [
            html.text("ADAN"),
          ]),
          html.p([attribute.class("home-description")], [
            html.text("Use high level programming for lower level jobs."),
          ]),
          html.div([attribute.class("home-actions")], [
            html.a(
              [
                attribute.href("https://try.adan.sh/"),
                attribute.class("home-action home-action--primary"),
                attribute.target("_blank"),
                attribute.rel("noopener noreferrer"),
              ],
              [html.text("Try ADAN")],
            ),
            html.a(
              [
                attribute.href("https://docs.adan.sh/"),
                attribute.class("home-action"),
                attribute.target("_blank"),
                attribute.rel("noopener noreferrer"),
              ],
              [html.text("Read our docs")],
            ),
          ]),
        ]),
        html.section(
          [
            attribute.class("home-example"),
            attribute.attribute("aria-label", "ADAN code example"),
          ],
          [
            html.pre([attribute.class("home-code")], [
              html.code([attribute.class("home-code-content")], [
                html.span([attribute.class("syntax-keyword")], [
                  html.text("local"),
                ]),
                html.text(" message = "),
                html.span([attribute.class("syntax-string")], [
                  html.text("\"Hello\""),
                ]),
                html.text("\n"),
                html.span([attribute.class("syntax-keyword")], [
                  html.text("local"),
                ]),
                html.text(" person = "),
                html.span([attribute.class("syntax-string")], [
                  html.text("\"world\""),
                ]),
                html.text("\n\n"),
                html.span([attribute.class("syntax-keyword")], [
                  html.text("function"),
                ]),
                html.text(" "),
                html.span([attribute.class("syntax-function")], [
                  html.text("announce"),
                ]),
                html.text(" "),
                html.span([attribute.class("syntax-operator")], [
                  html.text("->"),
                ]),
                html.text(" (message, person) {\n    "),
                html.span([attribute.class("syntax-function")], [
                  html.text("print"),
                ]),
                html.text("("),
                html.span([attribute.class("syntax-string")], [
                  html.text("`"),
                  html.span([attribute.class("syntax-interpolation")], [
                    html.text("${message}"),
                  ]),
                  html.text(", "),
                  html.span([attribute.class("syntax-interpolation")], [
                    html.text("${person}"),
                  ]),
                  html.text("!`"),
                ]),
                html.text(")\n}\n\n"),
                html.span([attribute.class("syntax-function")], [
                  html.text("announce"),
                ]),
                html.text(" "),
                html.span([attribute.class("syntax-operator")], [
                  html.text("<-"),
                ]),
                html.text(" (message, person)"),
              ]),
            ]),
          ],
        ),
      ]),
      footer.view_footer(),
    ]),
  ])
}
