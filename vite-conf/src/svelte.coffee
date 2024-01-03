> @3-/vite-base/sveltePreprocess.js
  @3-/read
  ./IS_DEV.js
  chalk
  path > join dirname

findRenderWords = (str)=>
  regex = /\b(\w+)\$(\.(render)|$)/g
  matches = []
  while match = regex.exec(str)
    matches.push match[1]
  return matches

{greenBright} = chalk

IMPORT_onMount = 1
IMPORT_onI18n = 2

IMPORT = {}

IMPORT[IMPORT_onMount] = 'import {onMount} from \'svelte\''
# IMPORT[IMPORT_onI18n] = 'import onI18n from \'@8p/lang/onMount.js\''
IMPORT[IMPORT_onI18n] = 'import onI18n from \'@~3/lang/onMount.js\''

svelte = (txt, fp, rfp)=>
  r = []

  + in_script, in_pug, script_line, in_style, dir

  pug_i18n = new Set
  auto_import = new Set

  for line, pos in txt.split '\n'
    if in_style
      if line.startsWith '</style>'
        in_style = false
      else
        if IS_DEV and rfp.startsWith 'node_modules/'
          if not dir
            # console.log rfp
            dir = '/@fs/'+dirname(fp)+'/'

          line = line.replace('\'./','\''+dir).replace('"./','"'+dir)
    else if line.startsWith '<style'
      in_style = true
    else if in_script
      if line.startsWith '</script>'
        import_li = []
        for i from auto_import
          import_li.push IMPORT[i]
        if import_li.length
          r[script_line] = r[script_line]+import_li.join(';')
        in_script = false
      else
        for i from findRenderWords(line)
          pug_i18n.add i
        if line.startsWith 'onMount '
          auto_import.add IMPORT_onMount
        if line.startsWith 'onI18n '
          for j from [IMPORT_onI18n, IMPORT_onMount]
            auto_import.add j
          line = 'onMount '+line
    else if in_pug
      if line.startsWith '</template>'
        in_pug = false
      else
        line = line.replace(
          /:>([^\s]*)(\s|\))/g
          (_,s1,s2)=>
            pug_i18n.add s1
            ':'+s1+'$'+s2
        ).replace(
          /(\s|")>([^\s"]+)(\b|")/g
          (_,s0,s1,s2)=>
            pug_i18n.add s1
            s0+'{@html '+s1+'$}'+s2
        )
    else if line.startsWith '<script'
      in_script = true
      script_line = pos
    else if line.startsWith '<template'
      in_pug = true
    r.push line

  if pug_i18n.size and script_line != undefined
    js = []
    var_li = []
    dict_li = []

    # 已经 auto_import 了
    if not r[script_line].endsWith('>')
      js.push ''

    for i from [IMPORT_onI18n, IMPORT_onMount]
      if not auto_import.has i
        js.push IMPORT[i]

    import_var = []
    for i from pug_i18n
      si = '_$'+i
      import_var.push si
      var_li.push i+'$'
      dict_li.push i+'$=this['+si+']'

    js.push "import {#{import_var.join(',')}} from '~/lib/I18N.js'"
    js.push "#{var_li.join('=')}=''"
    js.push "`onMount(onI18n(function(){#{dict_li.join(';')}}))`"
    r[script_line] += js.join(';')

  r = r.join('\n')

  # if ~ rfp.indexOf 'Lang.svelte'
  #   console.log r
  return r

< (dir)=>
  len = dir.length + 1
  sveltePreprocess.unshift(
    markup: ({content, filename})=>
      if filename.endsWith '.svelte'
        relpeath = filename.slice(len)
        console.log greenBright relpeath
        return {
          code: svelte(content, filename, relpeath)
        }
      return
  )
  return
