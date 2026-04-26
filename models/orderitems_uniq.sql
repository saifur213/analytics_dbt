{{ config(materialized='table') }}

{{ dbt_utils.deduplicate(
    relation=source('revenue_dev', 'orderitems'),
    partition_by='orderid',
    order_by="updated_at desc",
   )
}}
