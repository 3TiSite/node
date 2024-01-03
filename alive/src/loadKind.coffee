#!/usr/bin/env coffee

> ./index.js > hostId
  @3-/str2sec
  @3-/dbq > $e

< (kind) =>
  for [kind,o] from Object.entries kind
    duration = str2sec o.duration
    host_id = await hostId o.host
    await $e(
      "INSERT INTO kind(v,host_id,duration,warnErr)VALUES(?,?,?,?) ON DUPLICATE KEY UPDATE host_id=VALUES(host_id),warnErr=VALUES(warnErr),duration=VALUES(duration)",
      kind,host_id,duration,(+o.warnErr or 0)
    )
  return
