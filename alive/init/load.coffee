#!/usr/bin/env coffee
> @3-/uridir
  @3-/nt/load.js
  path > join
  @3-/alive/loadKind.js
  @3-/alive/loadWatch.js

ROOT = uridir import.meta

{
  kind
  watch
  ip
} = new Proxy(
  {}
  get: (_, fp) =>
    load join ROOT,fp
)


console.log kind

# await loadKind kind
#
# await loadWatch watch

process.exit()
