with A as (
	select
		segment,
		count( distinct product_code) as x
	from fact_sales_monthly f
	join dim_product p
	using (product_code)
	where fiscal_year = 2020
	group by segment
    ),
B as (
	select
		segment,
		count( distinct product_code) as y
	from fact_sales_monthly f
	join dim_product p
	using (product_code)
	where fiscal_year = 2021
	group by segment
    )
select 
	A.segment,
    A.x as product_count_2020,
    B.y as product_count_2021,
    y-x as difference
from A
join B
using (segment)
order by difference desc

