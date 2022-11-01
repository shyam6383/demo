

select * from {{source('TPCH_SF1','part')}}
order by p_partkey asc
limit 5000