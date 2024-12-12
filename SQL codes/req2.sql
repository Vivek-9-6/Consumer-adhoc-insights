with A as (
	select count( distinct product_code) as x
    from fact_sales_monthly
    where fiscal_year = 2020
    ),
B as (
    select count( distinct product_code) as y
    from fact_sales_monthly
    where fiscal_year = 2021
    )
select
	A.x as unique_product_2020,
    B.y as unique_product_2021,
	round((B.y- A.x)*100/A.x,2) as percentage_chg
    from A,B
    