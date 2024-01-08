#!/usr/bin/env coffee

> ./index.js > argId hostId
  @3-/dbq > $e $one

insert = (kind_id, host_id, arg_id)=>
  for dns_type from [4,6]
    await $e(
      'INSERT INTO watch(kind_id,host_id,arg_id,dns_type)VALUES(?,?,?,?) ON DUPLICATE KEY UPDATE id=id'
      kind_id, host_id, arg_id, dns_type
    )
  return

< (IP, watch)=>
  for [kind, li] from Object.entries watch
    kind_id = await $one('SELECT id FROM kind WHERE v=?',kind)
    if Array.isArray li[0]
      for [host, arg_li] from li
        console.log host, arg_li
        host_id = await hostId host
        for arg from arg_li
          arg_id = await argId arg
          await insert kind_id, host_id, arg_id
    else
      for host from li
        console.log host
        if host.includes '.'
          host_id = await hostId host
        else
          host_id = IP.get host
        await insert kind_id, host_id, 0
  return
