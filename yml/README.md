[‼️]: ✏️README.mdt

# @3-/yml

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

> @3-/yml/Yml.js

cwd = process.cwd()
console.log cwd
yml = Yml(cwd)
yml.a = 1
console.log yml.a
```

output :

```
/Users/z/3Ti/node/yml
1
```
