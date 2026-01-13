// =============================================================================
// THESIS TEMPLATE - template.typ
// Defines document styling, page layout, and formatting rules
// =============================================================================

#let thesis(
  title: none,
  author: none,
  date: none,
  institution: none,
  department: none,
  degree: none,
  adviser: none,
  co_adviser: none,
  body,
) = {
  // Document metadata
  set document(
    title: title,
    author: author,
    date: auto,
  )

  // Page settings (US Letter, 1-inch margins, 1.5-inch left margin)
  set page(
    width: 8.5in,
    height: 11in,
    margin: (top: 1in, bottom: 1in, left: 1.5in, right: 1in),
    numbering: "1",
    footer: context align(center)[
      #v(20pt) // Push page number down to avoid overlap with bottom figures
      #counter(page).display("1")
    ],
  )

  // Text settings (Times New Roman, 12pt, double-spaced)
  set text(
    font: "Times New Roman",
    size: 12pt,
    lang: "en",
  )

  // Paragraph settings
  set par(
    justify: true,
    leading: 2em,
    first-line-indent: 0.5in,
  )

  // Equation numbering (right-aligned)
  set math.equation(numbering: "Eq. (1)")

  // Remove in-text bold formatting (convention: avoid bold in body text)
  // Bold markers will be ignored, showing regular text
  show strong: it => it.body

  // Link styling for interactive PDF
  show link: set text(fill: rgb("#0000EE"))
  // Override for extended captions (make them look like normal text)
  show link.where(dest: "extended-caption"): set text(fill: black)

  // Citation references (bibliography) - blue
  // Table/Figure references - black (still clickable)
  show ref: it => {
    let el = it.element
    if el != none and el.func() == figure {
      // Table/Figure references: black text
      text(fill: black, it)
    } else if el != none and el.func() == heading {
      // Section references: black text
      text(fill: black, it)
    } else {
      // Citations and other references: blue
      text(fill: rgb("#0000EE"), it)
    }
  }

  // Heading styles - custom numbering that includes "Chapter" for level 1
  set heading(numbering: (..nums) => {
    let n = nums.pos()
    if n.len() == 1 {
      "Chapter " + str(n.at(0)) + ":"
    } else if n.len() == 2 {
      str(n.at(0)) + "." + str(n.at(1)) + "."
    } else if n.len() >= 3 {
      n.map(str).join(".") + "."
    }
  })

  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    v(0.4in)
    if it.body == [References] {
      // Reset numbering for References so it doesn't appear as "Chapter X" in TOC
      set heading(numbering: none, supplement: none)
      align(center)[
        #text(weight: "bold", size: 14pt)[REFERENCES]
      ]
    } else if it.body == [APPENDICES] {
      // Handle Appendices similarly
      set heading(numbering: none, supplement: none)
      align(center)[
        #text(weight: "bold", size: 14pt)[APPENDICES]
      ]
    } else {
      align(center)[
        #text(weight: "bold", size: 14pt)[CHAPTER #counter(heading).display("1")]
        #v(0.1in)
        #text(weight: "bold", size: 14pt)[#upper(it.body)]
      ]
    }
    v(0.2in)
  }

  // Prevent headings from being orphaned at bottom of page
  // sticky: true keeps heading with following content
  show heading.where(level: 2): it => {
    v(0.3in)
    block(breakable: false, sticky: true, below: 3em)[
      #text(weight: "bold", size: 12pt)[#it]
    ]
  }

  show heading.where(level: 3): it => {
    block(breakable: false, sticky: true, below: 3em)[
      #v(0.12in)
      #text(weight: "bold", size: 12pt, style: "italic")[#it]
    ]
  }

  show heading.where(level: 4): it => {
    block(breakable: false, sticky: true, below: 2em)[
      #v(0.1in)
      #text(weight: "bold", size: 12pt)[#it]
    ]
  }

  // Figure styling
  show figure.caption: set text(size: 10pt)

  // Keep figures and tables together with their captions
  show figure: set block(breakable: false)

  // Add black border to figure images
  show figure.where(kind: image): it => {
    block(breakable: false)[
      #box(stroke: 2pt + black, it.body)
      #it.caption
    ]
  }

  // Table captions: above the table, left-aligned, keep together
  show figure.where(kind: table): set figure.caption(position: top)
  show figure.where(kind: table): set figure(placement: none)
  show figure.where(kind: table): it => {
    block(breakable: false)[
      #align(left)[
        #it.caption
        #it.body
      ]
    ]
  }

  // Table styling
  set table(
    stroke: 0.5pt + black,
    inset: 6pt,
  )

  body
}

// Helper function for appendix sections
#let appendix(title, body) = {
  pagebreak()
  heading(level: 2, title)
  body
}

// Helper for extended captions (shown in text, hidden in outline)
#let extended(body) = link("extended-caption", body)
