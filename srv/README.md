[‼️]: ✏️README.mdt

# @3-/srv

返回值

    如果函数，会被传入 res ，可以 res.writeStatus(status).end(r)

    如果不是 undefined ，会被 msgpack pack

post,put

如果 content_type.endsWith '/json'

    body 如果 length > 1

    会被 json parse

    如果是一个数组 会 f.apply opt, body

    否则会 f.call opt, body

否则如果 body 有的长度 f.call opt, body

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee
```

output :

```
/test
→ http://127.0.0.1:3223
uWS.App {}
post test
post test
post test
post test
```
