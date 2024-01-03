#!/usr/bin/env coffee

> @3-/write
  path > join
  ./conf.js > ROOT
  ./NodeModules.js:@ > node_modules

index_styl = 'index.styl'

export default =>
  STYL = []

  exist = new Set

  for i from NodeModules(index_styl)
    STYL.push i

  console.log '# styl\n\n'+STYL.join '\n'

  write(
    join ROOT,'src/styl/plugin.styl'
    STYL.map(
      (i)=>"@import '#{i}/#{index_styl}'"
    ).join '\n'
  )
  return

