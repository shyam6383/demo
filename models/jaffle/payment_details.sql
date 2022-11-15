{{
  config(
    schema = "raw",
    materialized = "view"
  )
}}



{%- set payment_methods = get_payment_methods() -%}

select
id,
{%- for paymentmethod in payment_methods %}
sum(case when paymentmethod = '{{paymentmethod}}' 
then amount end) as {{paymentmethod}}_amount
{%- if not loop.last %},{% endif -%}
{% endfor %}
from {{source('stripe','payment')}}
group by 1
