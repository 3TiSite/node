> mariadb > createPool importFile
  assert/strict:assert
  @3-/is_dev:IS_DEV

# https://github.com/mariadb-corporation/mariadb-connector-nodejs/blob/master/documentation/promise-api.md

{
  MYSQL_HOST
  MYSQL_USER
  MYSQL_PWD
  MYSQL_PORT
  MYSQL_DB
  MYSQL_COMPRESS
  MYSQL_CONN_LIMIT
  MYSQL_SSL
} = process.env

CONF = {
  host: MYSQL_HOST
  user: MYSQL_USER
  port: Number.parseInt(MYSQL_PORT) or 3306
  database: MYSQL_DB
  password: MYSQL_PWD
}

if MYSQL_SSL
  CONF.ssl = JSON.parse(MYSQL_SSL)

if MYSQL_COMPRESS
  CONF.compress = true

POOL = createPool({
  connectionLimit: Number.parseInt(MYSQL_CONN_LIMIT) or 8
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
