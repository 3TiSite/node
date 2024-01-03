> @3-/mark

< (i)=>
  i = mark i.replace(
    /\${([\w-]+)\}/g
    (_,s)=>
      "$/_"+s+"_/"
  )
  if i.charAt(2) == '>'
    i = i.slice(3,-4)
  i.replace(
    /\$\/<em>([\w-]+)<\/em>\//g
    (_,s)=>
      "<code $>#{s}</code>"
  )
