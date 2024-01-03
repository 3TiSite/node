#!/usr/bin/env coffee

> @3-/lang

< (lang_li, to)=>
  s = new Map
  for [k,li] from Object.entries lang_li
    if li
      for v from li.split ' '
        s.set v,k
    else
      s.set '',k

  to_from = []
  if to
    to_from.push [
      to
      s.get(to) or s.get ''
    ]
  else
    + default_lang
    for [to_lang,from_lang] from s.entries()
      if to_lang
        to_from.push [to_lang,from_lang]
      else
        default_lang = from_lang

    to_lang_map = new Map to_from

    default_from = to_lang_map.get default_lang

    if not default_from
      for i from new Set to_lang_map.values()
        if not to_lang_map.has i
          to_from.unshift [i, default_lang]

    for [i] from lang
      if i!=default_lang and i!=default_from and not to_lang_map.has i
        to_from.push [i, default_lang]

  to_from

# console.log JSON.stringify main({
#   en:""
#   zh:"zh-TW ja"
# })
