

select * from {{source('TPCH_SF1','nation')}}
order by n_nationkey asc
limit 5000