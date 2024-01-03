#!/usr/bin/env coffee

> @3-/read
  path > join dirname

{pathname} = new URL(import.meta.url)

dir = dirname dirname pathname

console.log await read join(dir,'dev.sh')
