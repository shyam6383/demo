

select * from {{source('TPCH_SF1','supplier')}}
order by s_suppkey asc
limit 5000