> mariadb > createPool importFile
  assert/strict:assert
  @3-/is_dev:IS_DEV

# https://github.com/mariadb-corporation/mariadb-connector-nodejs/blob/master/documentation/promise-api.md

{
  DB_HOST
  DB_USER
  DB_PASSWORD
  DB_PORT
  DB_NAME
  DB_COMPRESS
  DB_CONN_LIMIT
  DB_SSL
} = process.env

CONF = {
  host: DB_HOST
  user: DB_USER
  port: Number.parseInt(DB_PORT) or 3306
  database: DB_NAME
  password: DB_PASSWORD
}

if DB_SSL
  CONF.ssl = JSON.parse(DB_SSL)

if DB_COMPRESS
  CONF.compress = true

POOL = createPool({
  connectionLimit: Number.parseInt(DB_CONN_LIMIT) or 8
  acquireTimeout: 19999
  trace: IS_DEV
  bigIntAsNumber: true
  ...CONF
})

< $import = (file)=>
  importFile({
    file
    ...CONF
  })

conn = =>
  POOL.getConnection()

< $ = (func)=>
  new Promise (resolve, reject)=>
    try
      c = await conn()
      resolve await func(c)
    catch err
      reject err
    finally
      c?.release()
    return

< $e = (sql, args...)=>
  $(
    (c)=>
      c.execute(
        sql
        args
      )
  )

< $q = (sql, args...)=>
  $ (c)=>
    c.query(
      {
        sql
        rowsAsArray: true
      }
      args
    )

< $li0 = (sql, args...)=>
  r = await $q(sql, args...)
  r.map (i)=>i[0]

< $row = (sql, args...)=>
  r = await $q(sql, args...)
  r[0]

< $one = (sql, args...)=>
  r = await $row(sql, args...)
  r[0]

export $vId = new Proxy(
  {}
  {
    get: (_,name) =>
      sql = "SELECT #{name}(?)"
      (v)=>
        $one(sql,v)
  }
)
