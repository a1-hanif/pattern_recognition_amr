// Approval Sheet
// This page is typically signed by panel members after defense

#page(numbering: none)[
  #align(center)[
    #text(weight: "bold", size: 14pt)[APPROVAL SHEET]
    #v(1cm)
  ]

  This thesis entitled *"THESIS TITLE HERE"* prepared and submitted by *Author Name(s)*, in partial fulfillment of the requirements for the degree of *[Degree Name]*, has been examined and is recommended for acceptance and approval for ORAL EXAMINATION.

  #v(1cm)
  #grid(
    columns: (1fr, 1fr),
    gutter: 2cm,
    [
      #align(center)[
        #line(length: 100%)
        *Prof. Adviser Name* \
        Adviser
      ]
    ],
    [
      #align(center)[
        #line(length: 100%)
        *Prof. Co-Adviser Name* \
        Co-Adviser
      ]
    ],
  )

  #v(1cm)

  Approved by the Committee on Oral Examination with a grade of *PASSED*.

  #v(1cm)

  #grid(
    columns: (1fr, 1fr),
    gutter: 2cm,
    [
      #align(center)[
        #line(length: 100%)
        *Panel Member 1* \
        Chairperson
      ]
    ],
    [
      #align(center)[
        #line(length: 100%)
        *Panel Member 2* \
        Member
      ]
    ],
  )

  #v(1cm)

  #align(center)[
    #line(length: 40%)
    *Panel Member 3* \
    Member
  ]

  #v(1cm)

  Accepted in partial fulfillment of the requirements for the degree of *[Degree Name]*.

  #v(1cm)
  #align(center)[
    #line(length: 60%)
    *Dean Name* \
    Dean, [College Name]
  ]
]
