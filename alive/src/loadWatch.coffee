#!/usr/bin/env coffee

> ./index.js > urlId hostId
  @3-/dbq > $e $one

< (watch)=>
  for [kind, li] from Object.entries watch
    kind_id = await $one('SELECT id FROM kind WHERE v=?',kind)
    if Array.isArray li
      for [host, url_li] from li
        console.log host, url_li
        host_id = await hostId host
        for url from url_li
          url_id = await urlId url
          for dns_type from [4,6]
            await $e(
              'INSERT INTO watch(kind_id,host_id,url_id,dns_type)VALUES(?,?,?,?) ON DUPLICATE KEY UPDATE id=id'
              kind_id, host_id, url_id, dns_type
            )
    else
      for host from li
        # TODO
        console.log host
  return
