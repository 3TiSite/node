[‼️]: ✏️README.mdt

# @3-/read

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

> @3-/read
  path > join dirname

{pathname} = new URL(import.meta.url)

dir = dirname dirname pathname

console.log await read join(dir,'dev.sh')
```

output :

```
#!/usr/bin/env bash

DIR=$(realpath ${0%/*})
cd $DIR

exec dev $@
```
