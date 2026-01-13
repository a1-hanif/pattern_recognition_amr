// Table of Contents
// Auto-generated with clickable links

#page(numbering: "i")[
  #align(center, text(weight: "bold", size: 14pt)[TABLE OF CONTENTS])
  #v(0.5cm)

  #set par(first-line-indent: 0pt)

  // Custom outline entry formatting for chapters (level 1) - black text
  #show outline.entry.where(level: 1): it => {
    v(0.3em)
    text(fill: black)[
      #link(it.element.location())[
        #text(fill: black)[
          // Check if this is the References heading
          #{
            if it.element.body == [References] or it.element.body == [APPENDICES] {
              strong(upper(it.element.body))
            } else {
              strong[Chapter #counter(heading).at(it.element.location()).first(): #it.element.body]
            }
          }
          #box(width: 1fr, it.fill)
          #it.page()
        ]
      ]
    ]
  }

  // Auto-generated outline with clickable links
  #outline(
    title: none,
    indent: auto,
    depth: 3,
  )
]
