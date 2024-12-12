 select
	f.customer_code,
    c.customer,
    round(avg(pre_invoice_discount_pct),4) as average_discount_pct
from fact_pre_invoice_deductions f
join dim_customer c
on f.customer_code = c.customer_code
where f.fiscal_year = 2021 and c.market = 'India'
group by f.customer_code, c.customer
order by  average_discount_pct desc
limit 5