[‼️]: ✏️README.mdt

# @3-/apint

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

> @3-/apint > gen_nt
  @3-/read
  @3-/uridir
  path > join

ROOT = uridir(import.meta)

rs = read join ROOT,'test.rs'

console.log gen_nt(rs,'')
```

output :

```

Index() -> StateLi
[ { Index: '→StateLi' }, [ 'index as Index' ] ]
```
