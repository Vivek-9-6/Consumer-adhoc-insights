with cte1 as(
	select 
		date,
        sold_quantity,
		ceiling(month(date_add(date, interval 4 month))/3) as Q
        from fact_sales_monthly
        where fiscal_year = 2020
	)
select
	case
		when Q = 1 then concat('[',1,'] ',monthname(date))
        when Q = 2 then concat('[',2,'] ',monthname(date))
        when Q = 3 then concat('[',3,'] ',monthname(date))
        when Q = 4 then concat('[',4,'] ',monthname(date))
	end as Quarter,
		sum(sold_quantity) as sold_quantity
from cte1
group by Quarter
order by Quarter, sold_quantity