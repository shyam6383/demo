{{
  config(
    materialized='incremental',
    update_columns=['c_phone']
  )
}}

select c_phone from {{source('dbt_skumar','raw_customer')}}
order by c_custkey asc 
limit 5000

 