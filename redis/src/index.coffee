> ioredis:Redis
  @3-/split/rsplit.js

{env} = process

hostPort = (s)=>
  [host,port] = rsplit(s,':')
  o = {
    host
  }
  if port
    o.port = +port
  o

conn = (password, user, node, db)=>
  opt = {}
  if password
    opt.password = password
  if user
    opt.username = user

  node = node.split(' ')

  if node.length > 1
    redis = new Redis.Cluster(
      node.map hostPort
      redisOptions: opt
    )
  else
    if db
      opt.db = +db
    redis = new Redis {
      ...opt
      ...hostPort node[0]
    }

  redis

< new Proxy(
  {}
  get: (_, name)=>
    args = []
    for i from 'PASSWORD USER NODE DB'.split(' ')
      args.push env[name + '_' + i]
    conn ...args
)
