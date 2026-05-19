#import "../../config.typ": *

#set page(background: [
  #grid(
    rows: (0.2fr, 5pt, 1fr),
    rect(
      height: 100%,
      width: 100%,
      fill: cover_bg_secondary_color
    ),
    rect(
      height: 100%,
      width: 125%,
      stroke: 2pt + cover_bg_line_stroke_color,
      fill: cover_bg_line_color
    ),
    rect(
      height: 100%,
      width: 100%,
      fill: cover_bg_primary_color
    )
  )
])
#align(horizon)[
  #align(start, text(weight: "bold")[
    #set text(size: 1.2em)
    #pad(bottom: 32pt)[
      #image(
        "../../media/logo_saq.jpg",
        width: 3in,
      )
    ]
    
    #pad(bottom: 16pt)[
      #upper[#report_type]
    ]
    
    #pad(bottom: 94pt)[#upper[#title_block]]
    
    #pad(bottom: 32pt)[
      #underline[#author_name] \
      #author_id
    ]
    
    #pad(bottom: 24pt)[
      Pembimbing \
      #underline[#advisor_name]
    ]
    
    #text(weight:"bold")[
      #upper[
        #program_of_study\
        #campus_name \
        #year
      ]
    ]
  ])
]
#set page(background: none)

#pagebreak()

#align(horizon)[
  #align(start, text(weight: "bold")[
    #set text(size: 1.2em)
    #pad(bottom: 32pt)[
      #image(
        "../../media/logo_saq.jpg",
        width: 3in,
      )
    ]
    
    #pad(bottom: 16pt)[
      #upper[#report_type]
    ]
    
    #pad(bottom: 94pt)[#upper[#title_block]]
    
    #pad(bottom: 32pt)[
      #underline[#author_name] \
      #author_id
    ]
    
    #pad(bottom: 24pt)[
      Pembimbing \
      #underline[#advisor_name]
    ]
    
    #text(weight:"bold")[
      #upper[
        #program_of_study\
        #campus_name \
        #year
      ]
    ]
  ])
]
