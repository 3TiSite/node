#!/usr/bin/env coffee

> ./index.js > argId
  @3-/str2sec
  @3-/dbq > $e

< (kind) =>
  for [kind,o] from Object.entries kind
    duration = str2sec o.duration
    arg_id = await argId o.arg
    await $e(
      "INSERT INTO kind(v,arg_id,duration,warnErr)VALUES(?,?,?,?) ON DUPLICATE KEY UPDATE arg_id=VALUES(arg_id),warnErr=VALUES(warnErr),duration=VALUES(duration)",
      kind,arg_id,duration,(+o.warnErr or 0)
    )
  return
