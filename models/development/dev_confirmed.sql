
 --select  count(*)  from {{ref('dev_customer')}}



-----------------------------------------------------
-- with cte as(
--     select phone_number,

--     case
--         when substring(phone_number,2,2)<=20 then 'A'
--         else 'B'
--     end as category
--     from {{source('DBT_SKUMAR_STAGING','stg_customers')}}
-- )
--  select * from cte   order by category asc
-----------------------------------------------------
with cte as(
    {% set category = [ "A"] %}
select
    phone_number,
    {% for a in category %}
    case when category = '{{a}}'then 'A' else 'B' end as category_type
    {% endfor %}
from {{ref('dev_customer')}}
)
select * from cte
-- --------------------------------------------------------

 