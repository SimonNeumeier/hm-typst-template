#import "../utils.typ": *
#import "../study-info.typ": *

#let thesis-titlepage(
  title: none,
  subtitle: none,
  title-translation: none,
  subtitle-translation: none,
  date: none,
  author: none,
  id: none,
  supervisors: none,
  study-info: none,
  gender: none,
  examiner-gender: none,
  draft: true,
  date-today: none,
  additional-logo: none,
  additional-text: none,
  t: none,
) = {
  align(center, [
    #v(1cm)

    #if additional-logo == none and additional-text == none {
      // Standard Layout
      image("../media/HM_logo.png", width: 45%)

      [#t.hm \ ]
      study-info.fk
    } else {
      // Layout with additional logo
      grid(
        columns: (1fr, 1fr),
        column-gutter: 1cm,

        // Hochschule München
        align(center, stack(
          dir: ttb,
          spacing: 0.2cm,
          image("../media/HM_logo.png", width: 75%),
          text(size: 9pt, t.hm),
          text(size: 9pt, study-info.fk),
        )),

        // Additional Logo
        align(center, stack(
          dir: ttb,
          spacing: 0.2cm,
          if additional-logo != none {
            additional-logo
          },
          if additional-text != none {
            text(size: 9pt,  additional-text)
          },
        )),
      )
    }

    #v(2cm)

    #text(size: 14pt)[#study-info.thesis-type \ #t.for-the-degree-of \ #study-info.degree]

    // Title
    #text(size: 16pt, weight: "bold", [
      #if title != none {
        title
      } else {
        todo[#t.title]
      }
    ])
    // Subtitle
    #if subtitle != none {
      v(0.15cm)
      text(size: 13pt, subtitle)
    }

    // Title translation
    #if title-translation != none or subtitle-translation != none {
      v(0.6cm)
      if title-translation != none {
        text(size: 14pt, weight: "medium", title-translation)
      }
      if subtitle-translation != none {
        v(0.15cm)
        text(size: 12pt, subtitle-translation)
      }
    }

    #v(0.5cm)

    #text(size: 14pt)[
      #if draft {
        text(hm-color)[
          #t.draft \
          #t.as-of: #date-today]
      } else {
        [
          #t.submission-date \
          #date
        ]
      }
    ]

    #v(1fr)

    #grid(
      columns: (auto, auto),
      row-gutter: 1em,
      column-gutter: 1.5em,
      align: (right, left),

      [#(t.author)(gender: gender)], [#if (author != none) { author } else { todo[#(t.author)(gender: "m")] }],

      [#t.student-id], [#if (id != none) { id } else { todo[Matrikelnummer] }],

      [#t.study-program], [#study-info.name],

      [
        #if (supervisors != none) {
          if type(supervisors) == array {
            t.examiners
          } else {
            (t.examiner)(gender: examiner-gender)
          }
        } else {
          (t.examiner)(gender: "m")
        }
      ],
      [
        #if (supervisors != none) {
          if type(supervisors) == array {
            supervisors.join("\n")
          } else {
            supervisors
          }
        } else {
          todo[#(t.examiner)(gender: "m")]
        }
      ],
    )

  ])
}

#let modularbeit-titlepage(
  subject: none,
  project-subtitle : none,
  project-description: none,
  authors: (),
  draft: true,
  date-today: none,
  study-info: none,
  additional-logo: none,
  additional-text: none,
  t: none,
) = {
  align(center, [
    #v(1cm)

    #if additional-logo == none and additional-text == none {
      // Standard Layout
      image("../media/HM_logo.png", width: 45%)

      [#t.hm \ ]
      study-info.fk
    } else {
      // Layout with additional logo
      grid(
        columns: (1fr, 1fr),
        column-gutter: 1cm,

        // Hochschule München
        align(center, stack(
          dir: ttb,
          spacing: 0.2cm,
          image("../media/HM_logo.png", width: 75%),
          t.hm,
          study-info.fk,
        )),

        // Additional Logo
        align(center, stack(
          dir: ttb,
          spacing: 0.2cm,
          if additional-logo != none {
            additional-logo
          },
          if additional-text != none {
            additional-text
          },
        )),
      )
    }

    #v(2cm)

    #text(size: 16pt, weight: "bold", if (subject != none) {
      subject
    } else {
      todo[#t.subject]
    })

    #text(size: 14pt, if (project-subtitle != none) {
      project-subtitle
    } else {
      todo[#t.project-subtitle]
    })

    #project-description

    #v(0.5cm)

    #if draft {
      text(hm-color)[
        #t.draft \
        #t.as-of: #date-today]
    } else {
      [
        #t.as-of: #date-today
      ]
    }

    #v(1fr)

    #if (authors != none) {
      if type(authors) == array {
        authors.join("\n")
      } else {
        authors
      }
    }

  ])
}

#let hauptseminar-paper-titlepage(
  title: none,
  date: none,
  author: none,
  id: none,
  supervisors: none,
  study-info: none,
  gender: none,
  examiner-gender: none,
  draft: true,
  date-today: none,
  major: none,
  t: none,
) = {
  align(center, [
    #v(1cm)

    #image("../media/HM_logo.png", width: 45%)

    #t.hm \
    #study-info.fk

    #v(2cm)

    #text(size: 14pt)[#t.seminar #study-info.name \ #major]

    #text(size: 16pt, weight: "bold", if (title != none) {
      title
    } else {
      todo[#t.title]
    })


    #v(0.5cm)

    #text(size: 14pt)[
      #if draft {
        text(hm-color)[
          #t.draft \
          #t.as-of: #date-today]
      } else {
        [
          #t.submission-date \
          #date
        ]
      }
    ]

    #v(1fr)

    #grid(
      columns: (auto, auto),
      row-gutter: 1em,
      column-gutter: 1.5em,
      align: (right, left),

      [#(t.author)(gender: gender)], [#if (author != none) { author } else { todo[#(t.author)(gender: "m")] }],

      [#t.student-id], [#if (id != none) { id } else { todo[Matrikelnummer] }],

      [
        #if (supervisors != none) {
          if type(supervisors) == array {
            t.examiners
          } else {
            (t.examiner)(gender: examiner-gender)
          }
        } else {
          (t.examiner)(gender: "m")
        }
      ],
      [
        #if (supervisors != none) {
          if type(supervisors) == array {
            supervisors.join("\n")
          } else {
            supervisors
          }
        } else {
          todo[#(t.examiner)(gender: "m")]
        }
      ],
    )

  ])
}
