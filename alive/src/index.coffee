> @3-/dbq > $q $vId
  @3-/time/sec
  @3-/default:

{
  urlId
  hostId
} = $vId


< urlId
< hostId

idVMap = (table, id_set)=>
  new Map await $q("SELECT id,v FROM #{table} WHERE id IN (#{
    [...id_set].join(',')
  })")


_ping = (id, url, err, duration, warnErr)=>
  return

update = (id, kind_host, dns_type, host, url, err, duration, warnErr, kindName)=>
  # await $e(
  #   "UPDATE watch SET err=?,duration=?,warnErr=? WHERE id=?",
  #   err, duration, warnErr, id
  # )
  dns_type = 'IPV'+dns_type
  console.log {
    kindName
    dns_type
    host
    id, err, duration, warnErr
  }
  return

ping = (id, kind_host, dns_type, host, suffix, err, duration, warnErr, kindName)=>
  url = kind_host+'/'+dns_type+'/'+host+suffix
  err += 1
  try
    await _ping(url)
    -- err
  catch err
    console.error(err)
  finally
    update(id, kind_host, dns_type, host, url, err, duration, warnErr, kindName)
  return

< =>
  now = sec()

  kind_set = new Set
  host_set = new Set
  url_set = new Set

  li = await $q('SELECT id,host_id,kind_id,dns_type,err,url_id FROM watch WHERE ts<=?', now)
  if not li.length
    return

  for [
    id,host_id,kind_id,dns_type,err,url_id
  ] from li
    kind_set.add kind_id
    host_set.add host_id
    if url_id
      url_set.add url_id

  kind_li = await $q("SELECT id,host_id,duration,warnErr,v FROM kind WHERE id IN (#{
    [...kind_set].join(',')
  })")

  kind_map = new Map
  for i from kind_li
    host_set.add i[1]
    kind_map.set i[0],i.slice(1)

  host_v = await idVMap 'host', host_set
  url_v = await idVMap 'url', url_set

  ing = []
  for [id,host_id,kind_id,dns_type,err,url_id] from li
    kind = kind_map.get kind_id
    kind_host = host_v.get kind[0]
    host = host_v.get host_id

    ing.push ping(
      id
      kind_host
      dns_type
      host
      if url_id then '/'+url_v.get(url_id) else ''
      err
      ...kind.slice(1) # duration, warnErr, kindName
    )
  # console.log id,host_id,kind_id,dns_type,ts,err,url_id
  Promise.allSettled ing
