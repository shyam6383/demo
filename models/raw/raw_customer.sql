select * from {{source('TPCH_SF1','customer')}}
order by c_custkey asc
limit 5000