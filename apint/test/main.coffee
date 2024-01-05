#!/usr/bin/env coffee

> @3-/apint > out_mod_li
  @3-/read
  @3-/uridir
  path > join

ROOT = uridir(import.meta)

rs = read join ROOT,'test.rs'

for [mod,i] from out_mod_li(rs)
  console.log mod
