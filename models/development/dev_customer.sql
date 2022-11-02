with cte as(
{% set condition = ['<=10','<20','>10','>20'] %}
{% set val = ['A','B','B','C'] %}
select phone_number,

 case
  {% for types , aa in  zip(condition , val) %}
    when substring(phone_number,2,2){{types}} then '{{aa}}'
    {% endfor %}
    else 'others'
    end as category
    from {{source('DBT_SKUMAR_STAGING','stg_customers')}}
)
select * from cte
