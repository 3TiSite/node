#!/usr/bin/env coffee

> ./index.js > expand_gen

argv = process.argv.slice(2)

cd argv[1] or process.cwd()

expand_gen('')

process.exit()
