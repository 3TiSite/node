> ./index.js > showRecordSetByZone disable enable rm zoneIdByName

< (host)=>
  zoneId = await zoneIdByName(host)
  {recordsets} = await showRecordSetByZone(
    # zoneId, '_acme-challenge', 'CNAME', offset=0
    {
      zoneId
      name: '_acme-challenge'
      # type: 'CNAME'
      # offset: 0
      # limit: 100
      # state: 'ACTIVE'
    }
  )

  to_rm = []
  for i from recordsets
    {id} = i
    console.log i.name, i.type, i.status, i.records
    if i.type == 'CNAME'
      if i.status == 'ACTIVE'
        await disable id
    else
      to_rm.push id
  await rm zoneId,to_rm

  =>
    for i from recordsets
      await enable i.id
    return
