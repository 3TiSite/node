#!/usr/bin/env coffee

> @3-/htm2md
  @3-/title-case
  @3-/tranvar/decode.js

HTML_ESCAPE = [
  ['&', '&amp;']
  ['<', '&lt;']
  ['>', '&gt;']
]


escape = (str) =>
  for [k,v] from HTML_ESCAPE
    str = str.replaceAll k,v
  str

prefix_title = (prefix, txt)=>
  if prefix.startsWith('#') and not prefix.trimEnd().replaceAll('#','')
    txt = TitleCase txt
  prefix + txt

export default (
  [
    comment_li
    htm_li
    htm_pos
    code_li
    md
  ]
  to_lang
)=>
  for [p,prefix,suffix],n in htm_pos
    htm = decode to_lang, htm_li[n]
    md[p] = prefix_title (prefix or ''), htm2md(htm)+(suffix or '')

  n = 0
  for [p, code_li, comment_pos_li] from code_li
    for i from comment_pos_li
      code_li[i] = comment_li[n++]
    md[p] = code_li.join('')

  md.join('')

