

select * from {{source('TPCH_SF1','lineitem')}}
order by l_orderkey asc
limit 5000