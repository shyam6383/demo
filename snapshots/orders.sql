do{% snapshot orders_snapshot_check %}

    {{
        config(
          target_schema='snapshots',
          strategy='check',
          unique_key='id',
          check_cols='all',
          invalidate_hard_deletes=true,
        )
    }}

    select * from {{ source('jaffle_shop', 'orders') }}

{% endsnapshot %}