> @3-/protojs
  @3-/split
  @3-/write
  @3-/read
  @3-/nt/load.js
  fs > existsSync readdirSync
  path > basename join dirname

import_map = {
  S:'import S from \'~/lib/S.js\''
  C:'import C from \'@~3/captcha\''
}

gen = (mod, dir, proto, to)=>
  api = join dir, 'api.nt'
  if existsSync api
    api = load api
    import_set = new Set
    li = Object.entries(api)
    if li.length
      kind_set = new Set
      t = []
      for [url, args] from li

        p = args.lastIndexOf('→')
        return_type = args.slice(p+1)
        args = args.slice(0,p)
        prefix = '🚧 '
        has_captcha = args.startsWith prefix
        if has_captcha
          args = args.slice(prefix.length)
          call = 'C'
        else
          call = 'S'
        import_set.add call
        kind_li = args.split ';'

        args = []
        kind_li = kind_li.map(
          (i)=>
            [name, type] = split(i,':')
            args.push name
            " * @param {#{type}} #{name}"
        ).join('\n')

        args = args.join(',')
        fetch = call+".#{url}(#{args})"
        if return_type != '()'
          kind_set.add return_type
          fetch = "#{return_type}(await #{fetch})"
          async = "async "
        else
          async = ""

        if args.length
          t.push '/**\n'+kind_li+'\n*/'

        export_name = 'const '+url+' ='
        t.push "export #{export_name} #{async}(#{args})=>#{fetch}\n"

      if kind_set.size
        t.unshift "import {#{[...kind_set].join(',')}} from './index.js'"

      for i from import_set
        t.unshift import_map[i]

      write(
        join to,mod,'S.js'
        t.join('\n')
      )

    d = join to, mod
    write(
      join d,'index.js'
      await protojs proto
    )
    write(
      join d, 'README.md'
      """
```proto
#{read(proto).trim()}
```
      """
    )
    pkgjson = join d, 'package.json'
    if not existsSync pkgjson
      write(
        pkgjson
        """
{
"name": "@5-/#{mod}",
"version": "0.1.0",
"repository": "https://github.com/3TiSite/api-proto-js.git",
"homepage": "https://github.com/3TiSite/api-proto-js/tree/main/#{mod}",
"author": "3Ti.Site@gmail.com",
"license": "Apache-2.0",
"exports": {
  ".": "./index.js",
  "./*": "./*"
},
"peerDependencies": {
  "@3-/proto": "^2.0.34",
  "@~3/captcha": "^0.1.61"
},
"type": "module"
}"""
    )
  return

dirgen = (mod, d, to)=>
  proto = join d, 'api.proto'
  if existsSync proto
    await gen(
      mod
      d
      proto
      to
    )
  return

< (root, to)=>
  if existsSync join(root,'Cargo.toml')
    await dirgen dirname(root),root,to
    return
  for dir from readdirSync(root)
    if dir.startsWith '.'
      continue
    dir = join root, dir
    for i from readdirSync(dir)
      if i.startsWith '.'
        continue
      await dirgen i, join(dir, i), to
  return
