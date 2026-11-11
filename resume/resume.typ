#let r = yaml("resume.yml")
#set document(title: r.name + " - Resume", author: r.name)
#set page(paper: "a4", margin: (top: 28.1pt, rest: 0.8in))
#set text(font: "Latin Modern Roman", size: 9.96pt, lang: "en", spacing: 100%)
#set par(leading: 5.13pt, spacing: 5.13pt, justify: false)
#show link: it => it
#let caps(body) = text(font: "Latin Modern Roman Caps", body)
#show heading: it => caps(it.body)
#let row(l, rt) = [#l #h(1fr) #rt \ ]
#let header(t, above, below: 1.3pt) = {
  v(above)
  pad(left: -14.6pt, {
    heading(level: 1, outlined: false, t)
    v(-1.0pt)
    line(length: 100%, stroke: 0.4pt)
  })
  v(below)
}
#align(center)[
  #text(size: 24.79pt, caps(r.name)) \
  #r.contact.map(c => if "url" in c { link(c.url, c.text) } else { c.text }).join([ | ])
]
#header("Experience", 7.4pt)
#for (i, e) in r.experience.enumerate() {
  if i > 0 { v(14.3pt) }
  row(text(size: 11.96pt, weight: 600, e.company), e.location)
  for ro in e.roles { row(emph(ro.title), ro.dates) }
  v(7.2pt)
  set list(indent: 15pt, body-indent: 2.1pt, spacing: 13.2pt, marker: [•], tight: true)
  pad(right: -1.5pt, list(..e.bullets))
}
#header("Education", 13.2pt)
#for e in r.education {
  row(text(size: 11.96pt, weight: 600, e.school), e.location)
  row([#e.degree #emph[--- #e.note]], e.date)
  for x in e.extra { row(emph(x.title), x.dates) }
}
#header("Skills", 11.5pt, below: 2.7pt)
#for s in r.skills { [#text(weight: 600)[#s.label:] #s.value] + linebreak() }
