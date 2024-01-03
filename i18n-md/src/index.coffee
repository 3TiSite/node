#!/usr/bin/env coffee

> @3-/lang:LANG
  @3-/lang/NOSPACE.js
  @3-/utf8/utf8e.js
  path > join
  @3-/write
  @3-/nt/load.js
  @3-/u8/u8merge.js
  fs > existsSync

< (pwd, file_li, to_from)=>
  public_dir = join pwd, 'public'

  lang_set = new Set
  for li from to_from
    for i from li
      lang_set.add i

  li = []
  for [code, lang] from LANG
    if lang_set.has code
      li.push(code,lang)


  site_fp = join pwd, 'site.nt'
  if existsSync site_fp
    site = load site_fp
  else
    site = {}

  site.lang = li.join(';')
  write(
    join public_dir, 'site'
    JSON.stringify site
  )

  li = []
  for lang from lang_set
    fp = join pwd,lang,'i18n.nt'
    if existsSync fp
      g = load fp
      for [k,v] from Object.entries(g)
        g[k] = v
    else
      g = {}
    write(
      join public_dir, lang, '_'
      JSON.stringify g
    )
  # 编译 nt
  # for f from file_li
  #   if f.endsWith '.nt'
  #     fp = join pwd, f
  #     if existsSync fp
  #       g = load fp
  #     else
  #       g = {}
  #     for lang from lang_set
  #       write(
  #         join public_dir, lang, f.slice(0,-3)
  #         pack merge(
  #           g
  #           load join pwd, lang, f
  #         )
  #       )
  return

if process.argv[1] == decodeURI (new URL(import.meta.url)).pathname
  await main()
  process.exit()

