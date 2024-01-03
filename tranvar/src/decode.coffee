#!/usr/bin/env coffee

> @3-/lang/NOSPACE.js

< (lang, i)=>
  i = i.replace(
    /\$\/_([\w-]+)_\//
    (_,s)=>
      "${#{s}}"
  )
  if NOSPACE.has lang
    i = i.replace(
      /<code \$>([\w-]+)<\/code>/g
      (_,s)=>
        "${#{s}}"
    )
  else
    i = i.replace(
      /\s?<code \$>([\w-]+)<\/code>([\s!.?:,])?/g
      (
        _
        t
        s
      )=>
        t = " ${#{t}}"
        s = s?.trimEnd()
        if s
          t += s
        else
          t += ' '
        t
    ).trim()
  i
