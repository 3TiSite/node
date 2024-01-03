> js-yaml:yaml
  @3-/read
  @3-/write

{load:loads,dump:dumps} = yaml

< loads = loads
< dumps = dumps

< load = (fp)=>
  loads read fp

< dump = (fp, o)=>
  write fp, dumps(o)

