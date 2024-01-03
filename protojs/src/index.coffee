> protobufjs:Pb
  @3-/snake > SNAKE

DEFAULT_0 = new Set [
  'double'
  'enum_'
  'fixed32'
  'fixed64'
  'float'
  'i32'
  'i64'
  'sfixed32'
  'sfixed64'
  'sint32'
  'sint64'
  'u32'
  'u64'
]

NODEFAULT = 'nodefault'

< (proto_fp)=>
  pb = await Pb.load proto_fp

  li = []
  lip = li.push.bind li

  enum_set = new Set
  cast_set = new Set
  decode_import = new Set
  decode_default = 0

  has_bin = 0

  for ns from Object.values pb.nested
    for [k,any] from Object.entries ns.nested
      nodefault = 0

      {comment} = any
      if comment
        comment = new Set comment.trim().split(' ')
        if comment.has NODEFAULT
          nodefault = 1

      cls = any.constructor.className
      switch cls
        when 'Enum'
          enum_set.add k
          lip "/* Enum #{k} */"
          for [ek,ev] from Object.entries any.values
            lip 'export const ' + SNAKE(k) + '_' + SNAKE(ek) + ' = ' + ev
          lip ''

        when 'Type'
          meta_li = []
          max_key_len = 0
          for [key, o] from Object.entries any.fields
            {type, repeated, id, optional} = o
            if key.length > max_key_len
              max_key_len = key.length
            meta_li.push [id, repeated, key, type, o.options?.proto3_optional]

          meta_li.sort((a,b)=>a[0]-b[0])

          pos = 0
          func_li = []
          comment_li = []
          default_li = []
          array_pos = []

          for [id, repeated, key, type, optional] from meta_li
            type0 = type.charAt 0
            cast_prefix = '$'
            is_int_li = false

            if type0.toLowerCase() != type0
              if enum_set.has type
                cast_type = 'enum_'
                cast_set.add cast_type
              else
                cast_prefix = ''
                cast_type = type
            else
              if ['uint64','uint32','int64','int32'].includes(type)
                type = type.replace('uint','u').replace('int','i')
                if repeated
                  type += 'Li'
                  is_int_li = true
              cast_type = type
              cast_set.add cast_type

            --id

            if repeated
              array_pos.push id
              if not nodefault
                default_li[id] = if is_int_li then 2 else 1
              rtype = "[#{type}]"
            else
              rtype = type
              if optional
                rtype += '?'
              else if not nodefault
                if DEFAULT_0.has cast_type
                  v = 0
                else
                  switch cast_type
                    when 'string'
                      v = ''
                    when 'bool'
                      v = false
                    when 'bytes'
                      v = 'BIN'
                      has_bin = 1
                if v != undefined
                  default_li[id] = v

            comment_li.push "#{id} #{key.padEnd(max_key_len)}\t#{rtype}"

            loop
              if id == pos
                ++pos
                func_li.push cast_prefix+cast_type
                break
              else
                ++pos
                func_li.push ''

          comment = '/*\n  '+comment_li.join('\n  ')+'\n*/'
          func_str = "[#{func_li.join(',')}],"

          # 全部都是数组
          if array_pos.length == default_li.length
            nodefault = 1

          if default_li.length == 1
            func_name = func_li[0]
            if array_pos.length and not (func_name.endsWith('Li') and func_name.startsWith('$'))
              decode_import.add 'li'
              decode = """li(#{func_li[0]})"""
            else
              # import_one = 1
              # default_val = default_li[0]
              # if default_val != undefined
              #   default_val = ','+default_val
              # decode = """one(#{func_li[0]}#{default_val})"""
              lip "\nexport { default as #{k} #{comment}} from '@3-/proto/decode/#{func_li[0].slice(1)}.js'"
              continue
          else if nodefault
            decode_import.add NODEFAULT
            decode = "nodefault(#{func_str}#{JSON.stringify array_pos})"
          else
            decode_default = 1
            decode = """decode(
              #{func_str}
              #{JSON.stringify(default_li).replaceAll('null','').replaceAll('"BIN"','BIN')}
            )"""

          lip "export const #{k} #{comment} = "+'$'+decode+'\n'

  js = li.join('\n').trim()

  decode = 'default as $decode'
  if decode_import.size
    decode_import = "#{[...decode_import].map((i)=>"#{i} as $#{i}").join(',')}"
    if decode_default
      decode_import = decode+','+decode_import
  else
    decode_import = decode

  import_ = [
    """import {#{decode_import}} from '@3-/proto/decode.js'
import {#{[...cast_set].map((i)=>"#{i} as $#{i}").join(',')}} from '@3-/proto/decode/types.js'"""
  ]
  if has_bin
    import_.push 'import BIN from "@3-/proto/decode/BIN.js"'

  import_.join('\n')+'\n\n'+js
