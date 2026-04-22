{{ config(schema='STG', materialized='table')}}

{{ dbt_utils.deduplicate(
    relation=source('stg', 'orderitems'),
    partition_by='orderid',
    order_by="updated_at desc",
   )
}}