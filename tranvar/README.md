[‼️]: ✏️README.mdt

# @3-/tranvar

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

> @3-/tranvar/encode.js
  @3-/tranvar/decode.js

for i from [
  "${a} test"
  "${a}test"
  "${a}:test"
  "${a}.test"
  "${a}?test"
  "${a},test"
  "${a}!test"
]

  txt = encode i
  console.log decode 'en',txt
```

output :

```
${a} test
${a} test
${a}:test
${a}.test
${a}?test
${a},test
${a}!test
```
