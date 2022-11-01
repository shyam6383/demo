

with cte as(
select concat('(', substring(c_phone,0,2) , ')')as cc,replace(substring(c_phone,3,10),'-','')as num ,*from
{{source('dbt_skumar_raw','raw_customer')}}
)
select concat(cc, num) as phone_number ,*from cte






