[‼️]: ✏️README.mdt

# @3-/cname_flatten

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

> @3-/cname_flatten:flatten

process.on(
  'uncaughtException'
  (err) =>
    console.error('uncaughtException',err)
    return
)

for i from await flatten(
  'AAAA'
  # 'A'
  'i18n.site'
  'i18n.site.a.bdydns.com'
  'user0.cf'
)
  console.log '>',i
```

output :

```
i18n.site
AAAA总记录数 95
https://dns.pub/dns-query?type=AAAA&name=user0.cf&edns_client_subnet=208.67.220.220
https://223.5.5.5/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=219.141.136.10
https://223.6.6.6/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=221.130.33.52
https://dns.google/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=202.106.196.115
https://dns.pub/dns-query?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=219.150.32.132
https://223.5.5.5/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=211.137.160.5
https://223.6.6.6/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=202.99.96.68
https://dns.google/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=222.222.222.222
https://dns.pub/dns-query?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=211.138.13.66
https://223.5.5.5/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=202.99.160.68
https://223.6.6.6/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=219.149.135.188
https://dns.google/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=211.138.106.3
https://dns.pub/dns-query?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=202.99.216.113
https://223.5.5.5/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=219.148.162.31
https://223.6.6.6/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=211.138.91.1
https://dns.google/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=202.99.224.68
https://dns.pub/dns-query?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=219.148.204.66
https://223.5.5.5/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=211.137.32.178
https://223.6.6.6/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=202.96.64.68
https://dns.google/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=219.149.194.55
https://dns.pub/dns-query?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=211.141.16.99
https://223.5.5.5/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=202.98.0.68
https://223.6.6.6/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=112.100.100.100
https://dns.google/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=211.137.241.34
https://dns.pub/dns-query?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=202.97.224.68
https://223.5.5.5/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=218.30.19.40
https://223.6.6.6/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=211.137.130.3
https://dns.google/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=221.11.1.67
https://dns.pub/dns-query?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=202.100.64.68
https://223.5.5.5/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=218.203.160.194
https://223.6.6.6/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=221.7.34.10
https://dns.google/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=202.100.128.68
https://dns.pub/dns-query?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=211.138.75.123
https://223.5.5.5/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=221.207.58.58
https://223.6.6.6/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=222.75.152.129
https://dns.google/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=218.203.123.116
https://dns.pub/dns-query?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=211.93.0.81
https://223.5.5.5/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=61.128.114.166
https://223.6.6.6/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=218.202.152.130
https://dns.google/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=221.7.1.21
https://dns.pub/dns-query?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=222.85.85.85
https://223.5.5.5/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=211.138.24.71
https://223.6.6.6/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=202.102.224.68
https://dns.google/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=202.103.24.68
https://dns.pub/dns-query?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=211.137.58.20
https://223.5.5.5/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=218.104.111.114
https://223.6.6.6/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=222.246.129.80
https://dns.google/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=211.142.210.98
https://dns.pub/dns-query?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=58.20.127.238
https://223.5.5.5/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=202.96.209.133
https://223.6.6.6/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=211.136.112.50
https://dns.google/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=210.22.70.3
https://dns.pub/dns-query?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=218.2.2.2
https://223.5.5.5/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=221.131.143.69
https://223.6.6.6/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=221.6.4.66
https://dns.google/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=202.101.172.35
https://dns.pub/dns-query?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=211.140.13.188
https://223.5.5.5/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=221.12.1.227
https://223.6.6.6/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=61.132.163.68
https://dns.google/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=211.138.180.2
https://dns.pub/dns-query?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=218.104.78.2
https://223.5.5.5/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=218.85.152.99
https://223.6.6.6/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=211.138.151.161
https://dns.google/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=218.104.128.106
https://dns.pub/dns-query?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=202.101.224.69
https://223.5.5.5/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=211.141.90.68
https://223.6.6.6/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=220.248.192.12
https://dns.google/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=219.146.1.66
https://dns.pub/dns-query?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=218.201.96.130
https://223.5.5.5/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=202.102.128.68
https://223.6.6.6/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=202.96.134.133
https://dns.google/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=211.139.163.6
https://dns.pub/dns-query?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=210.21.196.6
https://223.5.5.5/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=202.100.192.68
https://223.6.6.6/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=221.176.88.95
https://dns.google/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=221.11.132.2
https://dns.pub/dns-query?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=202.103.225.68
https://223.5.5.5/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=211.138.245.180
https://223.6.6.6/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=221.7.128.68
https://dns.google/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=61.128.192.68
https://dns.pub/dns-query?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=218.201.4.3
https://223.5.5.5/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=221.5.203.98
https://223.6.6.6/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=61.139.2.69
https://dns.google/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=211.137.82.4
https://dns.pub/dns-query?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=119.6.6.6
https://223.5.5.5/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=202.98.192.67
https://223.6.6.6/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=211.139.5.29
https://dns.google/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=221.13.28.234
https://dns.pub/dns-query?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=222.172.200.68
https://223.5.5.5/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=211.139.29.68
https://223.6.6.6/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=221.3.131.11
https://dns.google/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=202.98.224.68
https://dns.pub/dns-query?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=211.139.73.34
https://223.5.5.5/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=221.13.65.34
https://223.6.6.6/resolve?type=AAAA&name=i18n.site.a.bdydns.com&edns_client_subnet=202.112.144.30
```
