[‼️]: ✏️README.mdt

# @3-/hwdns

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

> @3-/hwdns/mail.js

host = 'i18n.site'

# MX 数值越小优先级越高


CONF = [
  [
    {
      huaweicloud:[
        '3ti.site'
      ]
      cloudflare:[
        'u-01.eu.org'
      ]
    }
    {
      MX: [
        'mx.mailtie.com'
      ]
      TXT: [
        'mailtie=i18n.site@gmail.com'
        'v=spf1 include:_spf.google.com ~all'
      ]
      # https://app.easydmarc.com/onboard#verify_domain
      DMARC: 'v=DMARC1;p=none;rua=mailto:2d338fc2a3ba470f92fb33978095e4da@dmarc-reports.cloudflare.net,mailto:6b844dc396@rua.easydmarc.us;ruf=mailto:6b844dc396@ruf.easydmarc.us;fo=1;'
    }
  ]
]

await mail '3ti.site', CONF[0][1]




###
if recordsets.length > 0
  console.log await rm(zoneId, recordsets.map (i)=>i.id)
###

# console.log await enable()

# console.log zoneId

#
# for i from acme.recordsets
#   console.log i.name, i.status, i.type
#   if i.status == 'ACTIVE'
#     await disable i.id
#
# for i from acme.recordsets
#   console.log i.name, i.status, i.type
#   await enable i.id


console.log ''

# const client = dns.DnsClient.newBuilder()
#                             .withCredential(credentials)
#                             .withEndpoint(endpoint)
#                             .build();
# const request = new dns.SetRecordSetsStatusRequest();
# request.recordsetId = "123";
# const body = new dns.SetRecordSetsStatusReq();
# body.withStatus("DISABLE");
# request.withBody(body);
# const result = client.setRecordSetsStatus(request);
# result.then(result => {
#     console.log("JSON.stringify(result)::" + JSON.stringify(result));
# }).catch(ex => {
#     console.log("exception:" + JSON.stringify(ex));
# });
```

output :

```
rm 3ti.site. TXT [ '"mailtie=i18n.site@gmail.com"' ]
rm _dmarc.3ti.site. TXT [
  '"v=DMARC1;p=none;rua=mailto:2d338fc2a3ba470f92fb33978095e4da@dmarc-reports.cloudflare.net,mailto:6b844dc396@rua.easydmarc.us;ruf=mailto:6b844dc396@ruf.easydmarc.us;fo=1;"'
]
rm 3ti.site. TXT [ '"v=spf1 include:_spf.google.com ~all"' ]
new MX 3ti.site default_view [ '5 mx.mailtie.com' ]
new TXT _dmarc.3ti.site default_view [
  '"v=DMARC1;p=none;rua=mailto:2d338fc2a3ba470f92fb33978095e4da@dmarc-reports.cloudflare.net,mailto:6b844dc396@rua.easydmarc.us;ruf=mailto:6b844dc396@ruf.easydmarc.us;fo=1;"'
]
new TXT 3ti.site default_view [ '"mailtie=i18n.site@gmail.com"' ]
new TXT 3ti.site default_view [ '"v=spf1 include:_spf.google.com ~all"' ]
```
