#!/usr/bin/env coffee

> ./index.js > expand_gen
  path > join
  @3-/write

argv = process.argv.slice(2)

dir = argv[1] or process.cwd()

cd dir

write(
  join dir, 'api.nt'
  (await expand_gen(''))[0]
)

process.exit()
