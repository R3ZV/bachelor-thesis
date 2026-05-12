#let bigO(x) = $cal(O)(#x)$
#let abs(x) = $|#x|$

#let thesis(
  title: "",
  author: "",
  coordinator: "",
  date: "",
  abstract: none,
  body,
) = {

  set document(title: title, author: author)

  set page(paper: "a4", margin: 2.5cm)
  set text(
    font: ("Times New Roman"),
    size: 12pt,
    lang: "en"
  )

  set par(
    leading: 1.5em,
    justify: true,
    first-line-indent: 1.25cm,
    spacing: 1.5em
  )

  set heading(numbering: "1.1.")

  page(margin: (left: 2cm, right: 2cm, bottom: 1cm, top: 2.5cm), numbering: none)[
    #grid(
      columns: (20%, 60%, 20%),
      align(center + horizon)[
        #image("images/logo-ub.png", width: 100%)
      ],
      align(center + horizon)[
        #text(size: 14pt, weight: "bold")[UNIVERSITY OF BUCHAREST] \
        #v(0.3cm)
        #text(size: 12pt, weight: "bold")[MATHEMATICS AND COMPUTER SCIENCE]
      ],
      align(center + horizon)[
        #image("images/logo-fmi.png", width: 100%)
      ]
    )

    #v(1cm)
    #align(center)[
      #text(weight: "bold")[SPECIALIZATION COMPUTER SCIENCE]
    ]

    #v(1cm)
    #align(center)[
      #text(size: 14pt, weight: "bold")[Bachelor's Degree]
    ]

    #v(2.5cm)
    #align(center)[
      #text(size: 20pt, weight: "bold")[#upper(title)]
    ]

    #v(3cm)
    #align(center)[
      #text(size: 14pt, weight: "bold")[Graduate \ #author]
    ]

    #v(0.5cm)
    #align(center)[
      #text(size: 14pt, weight: "bold")[Scientific Coordinator \ #coordinator]
    ]

    #v(2cm)
    #align(center)[
      #text(size: 14pt, weight: "bold")[#date]
    ]
  ]

  if abstract != none {
    page(numbering: none)[
      #align(horizon)[
        #align(center)[
          #text(weight: "bold", size: 14pt)[Abstract]
        ]
        #v(1.5em)
        #abstract
      ]
    ]
  }

  page(numbering: none)[
    #outline(depth: 3, indent: auto)
  ]

  set page(numbering: "1")
  counter(page).update(1)

  body

  pagebreak(weak: true)
  bibliography("bibliography.bib", style: "ieee")
}
