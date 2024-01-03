#!/usr/bin/env coffee

> ../src/all/CODE.js:_CODE
  ../src/index.js:NOW
  ../src/name/zh.js:ZH

CODE = new Set _CODE

for [i] from NOW
  CODE.delete i
ZHM = new Map ZH

# 字节
for i from "mn ckb sr nso st uk".split(' ')
  CODE.delete i


for i from CODE
  console.log i,ZHM.get(i)
