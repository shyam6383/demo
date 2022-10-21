

select * from {{source('TPCH_SF1','orders')}}
order by o_orderkey asc
limit 5000