

--select * from {{source('DBT_SKUMAR_STAGING','stg_customers')}}

 -----------using case statment--------------------------
with cte as(
    select phone_number,
    case
        when substring(phone_number,2,2)<=20 then 'A'
        when substring(phone_number,2,2)>20 then 'B'
        when substring(phone_number,2,2)>40 then 'C'
        else 'other'
    end as category
    from {{source('DBT_SKUMAR_STAGING','stg_customers')}}
)
 select * from cte   order by category asc
------------------------------------------------------------

--------------using iff statment----------------------------

--select phone_number,
--iff(substring(phone_number,2,2)<=20,'A','B') as category 
 --from {{source('DBT_SKUMAR_STAGING','stg_customers')}}
----------------------------------------------------------------

 --select phone_number,substring(phone_number,2,2)<=20  as category
    --from {{source('DBT_SKUMAR_STAGING','stg_customers')}}
 ------------------------------------------------------------

