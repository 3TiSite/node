#!/usr/bin/env coffee

> @3-/protojs
  @3-/uridir
  chalk
  path > join
  fs > readdirSync

{greenBright} = chalk

ROOT = uridir(import.meta)

console.log await protojs join ROOT, 'api.proto'
