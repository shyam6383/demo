

select * from {{source('TPCH_SF1','partsupp')}}
order by ps_partkey asc
limit 5000