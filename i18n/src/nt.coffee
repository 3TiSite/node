> @3-/tran
  @3-/tranvar/decode.js
  @3-/tranvar/encode.js
  @3-/xxhash3 > hash128
  @3-/cache
  @3-/bar:Bar
  @3-/cache_map:CacheMap
  @3-/write
  @3-/u8/u8eq.js
  @3-/nt/dump.js
  @3-/nt/load.js
  path > join
  fs > readFileSync existsSync

cacheNt = cache load

< (dir, relpath, to_lang, from_lang)=>

  from_nt = cacheNt join dir, from_lang, relpath

  if not from_nt
    return

  to_nt = load(join dir, to_lang, relpath) or {}

  [mget,mset,msave]=  CacheMap(
    join dir,'.i18n', from_lang+'.'+to_lang, relpath
  )

  kli = []
  vli = []

  exist = new Set Object.keys to_nt

  for [k,v] from Object.entries from_nt
    hash = hash128(v)
    if exist.has k
      exist.delete k
      pre = mget(k)
      if pre and u8eq pre,hash
        continue
    mset k,hash
    kli.push k
    vli.push v

  for i from exist
    delete to_nt[i]

  {length} = vli
  if length
    n = 0
    bar = Bar(length)
    for to from (await tran(
      from_lang, to_lang, [], vli.map(encode)
    ))[1].map(
      (txt)=>
        decode(to_lang, txt)
    )
      to_nt[kli[n]] = to
      bar()
      bar.log(
        from_lang+' → '+to_lang+' '+vli[n]+' → '+to
      )
      ++n

  if length or exist.size
    dump(
      join dir, to_lang, relpath
      to_nt
    )
  msave()
  return
