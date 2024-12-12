select 
    concat('Q',ceiling(month(date_add(date, interval 4 month))/3)) as Quarter,
    sum(sold_quantity) as sold_quantity
from fact_sales_monthly
where fiscal_year = 2020
group by Quarter
order by sold_quantity desc