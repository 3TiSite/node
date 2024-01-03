[‼️]: ✏️README.mdt

# @3-/tran_md

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

> ../lib/index.js:tranMd
  @3-/uridir
  @3-/read
  @3-/write
  path > join

ROOT = uridir(import.meta)
lang = 'tk'
langfp = join(ROOT,lang+'.md')

form_lang = 'en'

src = read join ROOT, form_lang+'.md'
console.log src
md = await tranMd(
  src
  form_lang
)(
  lang
  join ROOT, 'cache.'+form_lang+'.'+lang
  # langfp
)
console.log md
if md
  write(
    langfp
    md
  )
```

output :

```
Click ${0} on below image in order

Aşakdaky surata ${0} basyň
```
