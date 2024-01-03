< (n)=>
  Math.floor(
    1970+(--n)/12
  ) + '-' + (
    (n%12+1)+''
  ).padStart(2, '0')
