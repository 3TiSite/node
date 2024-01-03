#!/usr/bin/env coffee

> ./lib/_.cjs:lib
  fs > writeFileSync
  @3-/uridir
  path > join

ROOT = uridir import.meta

txt = []
li = []

for i of lib
  if not i.startsWith('_')
    li.push "#{i} as _#{i}"
    txt.push "export const #{i} = wrap(_#{i})"

txt.unshift """import {#{li.join(',')}} from './_.cjs'

const encoder = new TextEncoder(),
  encode = encoder.encode.bind(encoder),
  wrap = (func)=>{
    return (txt)=>{
      if (txt.constructor === String){
        txt = encode(txt);
      }
      return func(txt)
    }
  }
"""

writeFileSync(
  join ROOT,'lib/index.js'
  txt.join('\n')
)

