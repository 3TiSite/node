> ./svelte.js
  @3-/vite-base
  path > join

< (dir)=>
  svelte(dir)
  conf = (await ViteBase(dir))()
  # console.log conf.optimizeDeps
  # # conf.optimizeDeps.entries = [
  #   # './src/index.coffee'
  #   # './node_modules/@~3/full/Full.svelte'
  # # ]
  # console.log conf.optimizeDeps
  # for p from [
  #   '@~3/i18n'
  # ]
  #   conf.resolve.alias[p] = join(
  #     dir,'node_modules',p
  #   )
  # console.log conf.resolve
  conf
