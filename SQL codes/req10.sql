with cte1 as(
	select 
		division,
		product_code,
		product,
		sum(sold_quantity) as total_sold_quantity
    from fact_sales_monthly f
    join dim_product p
    using (product_code)
    where fiscal_year = 2021
    group by division, product_code, product
    ),
cte2 as (
	select 
		division, product_code, product, total_sold_quantity, rank() over(partition by division order by total_sold_quantity desc) as rank_order
	from cte1
    )
select cte2.division, cte2.product_code, cte2.product, cte2.total_sold_quantity, cte2.rank_order
from cte2
where cte2.rank_order in (1,2,3)