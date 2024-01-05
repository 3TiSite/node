#!/usr/bin/env coffee

> ./index.coffee:main

argv = process.argv.slice(2)
for dir from readdirSync arv[1] or process.cwd()
  if dir.startsWith '.'
    continue
  dir = join root, dir
  for i from readdirSync dir
    if i.startsWith '.'
      continue
    if existsSync join dir,i,'Cargo.toml'
      await main join(dir,i)
process.exit()
