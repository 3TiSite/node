#!/usr/bin/env coffee
> @3-/uridir
  @3-/nt/load.js
  path > join
  @3-/alive/loadKind.js
  @3-/alive/loadWatch.js

ROOT = uridir import.meta

# await loadKind load join ROOT,'kind.nt'

await loadWatch load join ROOT,'watch.nt'

process.exit()
