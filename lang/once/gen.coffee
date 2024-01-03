#!/usr/bin/env coffee

> ../src/CODE.js
  @3-/uridir
  @3-/write
  json5
  path > join dirname


ROOT = dirname uridir(import.meta)

wjs = (name, o)=>
  write(
    join ROOT, 'src', name+'.js'
    '''// gen by once/gen.coffee\n'''+o
  )


write(
  join ROOT, '../../srv/rust/lib/lang/src/code_id.rs'
'''
// gen by node/lang/once/gen.coffee

use phf::{OrderedSet,phf_ordered_set};

pub static LANG: OrderedSet<&'static str> = phf_ordered_set! {
'''+JSON.stringify(CODE).slice(1,-1)+'};'
)


# ###
#
# 阿里
# 字符长度上限是5000字符
# https://help.aliyun.com/zh/machine-translation/support/supported-languages-and-codes/
#
# google
# https://cloud.google.com/translate/docs/languages?hl=zh-cn
#
# ###
