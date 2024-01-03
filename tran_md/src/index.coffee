#!/usr/bin/env coffee

> ./tranMd.js
  ./merge.js
  @3-/tran:cacheTran
  ./updateCache.js
  @3-/cache_map:CacheMap

< (md, from_lang)=>
  r = tranMd md
  [comment_li, htm_li] = r
  more = r.slice(2)

  (to_lang, cache_fp, update_md_fp)=>
    ctxt = CacheMap cache_fp+'Txt'
    chtm = CacheMap cache_fp
    if update_md_fp
      updateCache(
        update_md_fp
        comment_li
        htm_li
        ctxt
        chtm
      )
    else
      return merge(
        (await cacheTran(
          from_lang
          to_lang
          comment_li
          htm_li
          ctxt
          chtm
        )).concat more
        to_lang
      )
    return
