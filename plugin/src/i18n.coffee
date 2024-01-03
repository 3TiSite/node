#!/usr/bin/env coffee

> ./conf.js > ROOT
  json5
  fs > readdirSync rmSync existsSync
  path > join
  ./NodeModules.js:@ > node_modules
  @3-/nt/load.js
  @3-/write
  @3-/utf8/utf8e.js
  @3-/urle
  @3-/i18n
  @3-/u8/u8eq.js
  @3-/lang:LANG
  @3-/xxhash3 > hash128
#   @3-/utf8/utf8d.js
#
# decode = (bin)=>
#   li = []
#   start = 0
#   for i,p in bin
#     if i == 0
#       li.push utf8d bin.subarray start, p
#       start = p + 1
#   return li


I18N = join ROOT,'i18n'
SRC = join ROOT,'src'
PUBLIC_I18N = join ROOT, 'public/i18n'
rmSync(PUBLIC_I18N, { recursive: true, force: true })

merge = (li)=>
  totalLength = li.reduce(
    (acc, arr) => acc + arr.length
    0
  ) + li.length - 1

  mergedArray = new Uint8Array(totalLength)

  currentIndex = 0

  for arr, index in li
    mergedArray.set(arr, currentIndex)

    currentIndex += arr.length

    if index isnt li.length - 1
      mergedArray[currentIndex++] = 0

  return mergedArray

export default main = =>
  console.log '\n# i18n\n'
  await i18n I18N
  + keys
  lang_fp = {}
  li = NodeModules('i18n')

  for [lang, lang_name] from LANG
    fp = join(I18N,lang,'i18n.nt')
    if not existsSync fp
      continue
    o = load fp
    not_keys = not keys
    lang_nt = join 'i18n',lang,'i18n.nt'
    for i from li
      nfp = join(node_modules, i, lang_nt)
      t = load nfp
      if not_keys
        console.log i+':', Object.keys(t).join(' ')
      o = {
        ...t
        ...o
      }

    if not_keys
      keys = Object.keys(o)
      keys.sort()
      console.log ''

    r = []
    for i from keys
      v = o[i]
      if not_keys
        console.log i + ':', v
      r.push utf8e v
    r = merge r
    # console.log decode r
    name = urle hash128 r
    lang_fp[lang] = name
    write(
      join PUBLIC_I18N, name
      r
    )

  write(
    join(
      SRC, 'lib/I18N.js'
    )
    [
      'export default '+ json5.stringify(
        lang_fp, null, 2
      )
    ].concat(
      keys.map(
        (i,p)=>"export const _$#{i}=#{p}"
      )
    ).join('\n')
  )
  return


if process.argv[1] == decodeURI (new URL(import.meta.url)).pathname
  await main()
