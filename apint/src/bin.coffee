#!/usr/bin/env coffee

> ./index.js:gen

argv = process.argv.slice(2)

await gen argv[1] or process.cwd()

process.exit()
