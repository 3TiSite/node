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
  console.log txt
  console.log decode 'en',txt
