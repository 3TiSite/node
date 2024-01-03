#!/usr/bin/env coffee

> ./index.js > urlId
  @3-/str2sec
  @3-/dbq > $e

< (kind) =>
  for [kind,o] from Object.entries kind
    duration = str2sec o.duration
    url_id = await urlId o.url
    await $e(
      "INSERT INTO kind(v,url_id,duration,warnErr)VALUES(?,?,?,?) ON DUPLICATE KEY UPDATE url_id=VALUES(url_id),warnErr=VALUES(warnErr),duration=VALUES(duration)",
      kind,url_id,duration,(+o.warnErr or 0)
    )
  return
