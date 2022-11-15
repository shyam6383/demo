--select * from {{source('DBT_SKUMAR_STAGING','product_sales')}}
with cte as(
    select * from {{source('DBT_SKUMAR_STAGING','product_sales')}}
),
min as(
    select emp_name,country,sales,
    sum(sales) OVER(PARTITION BY Country)as sum_sales,
    min(sales)over(PARTITION BY country)as min_sales,
    rank() over(order by sales) as rank_sales,
    LEAD(Sales,1) OVER  (ORDER BY country) as lead_sales,
    LAG(Sales,1) OVER  (ORDER BY country) as lag_sales,
    first_value(sales)over (ORDER BY country) as first_sales from cte
)
select * from min where emp_name ='MikeJohnson'
