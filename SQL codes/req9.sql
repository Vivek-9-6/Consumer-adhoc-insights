with cte1 as (
	select
		c.channel,
		concat( round(sum(gross_price*sold_quantity)/1000000,2), ' M') as gross_sales_mln
	from fact_sales_monthly f
    join fact_gross_price g
    using (product_code, fiscal_year)
    join dim_customer c
    using (customer_code)
    where f.fiscal_year = 2021
    group by c.channel
    ),
cte2 as (
	select
		sum(gross_sales_mln) as total
	from cte1
	)
select 
	cte1.channel,
    cte1.gross_sales_mln,
    concat( round(gross_sales_mln*100/total,2), ' %') as percentage
from cte1, cte2
order by percentage desc