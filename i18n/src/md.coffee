#!/usr/bin/env coffee
> @3-/cache
  @3-/tran_md
  @3-/read
  @3-/write
  path > join

tranMd = cache (dir, relpath, from_lang)=>
  TranMd(
    read join(dir, from_lang, relpath)
    from_lang
  )

< (dir, relpath, to_lang, from_lang, from_change)=>
  # console.log from_lang,'→',to_lang, relpath
  tran = tranMd(dir, relpath, from_lang)

  args = []
  if not from_change
    args.push join dir, to_lang, relpath

  out = await tran(
    to_lang
    join dir,'.i18n',"#{from_lang}.#{to_lang}", relpath
    ...args
  )
  if out != undefined
    write(
      join dir, to_lang, relpath
      out
    )
  return
