#!/usr/bin/env coffee
> @3-/uridir
  @3-/nt/load.js
  path > join
  @3-/alive/loadKind.js
  @3-/alive/loadWatch.js
  @3-/alive/loadIp.js

ROOT = uridir import.meta

{
  kind
  watch
  ip
} = new Proxy(
  {}
  get: (_, fp) =>
    load join ROOT,fp+'.nt'
)


IP = await loadIp ip

console.log IP

# await loadKind kind
#
# await loadWatch watch

process.exit()
