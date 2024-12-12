select distinct market
from dim_customer
where customer = 'Atliq Exclusive'and region = 'APAC'
order by market