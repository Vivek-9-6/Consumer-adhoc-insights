 select 
	monthname(s.date) as month,
    year(s.date) as year,
    concat('$ ',round(sum(g.gross_price*s.sold_quantity)/1000000,2)) as Gross_sales_amt
from fact_sales_monthly s
join fact_gross_price g
using (product_code,fiscal_year)
join dim_customer c
using (customer_code)
where customer = 'Atliq Exclusive'
group by month, year
order by year
