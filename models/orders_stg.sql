{{
    config(
        materialized='incremental',
        unique_key='orderid',
        incremental_strategy='merge'
    )
}}

select
    src.orderid,
    src.orderdate,
    src.customerid,
    src.employeeid,
    src.storeid,
    src.status as statuscd,
    src.updated_at,

    case
        when src.status = '01' then 'In Progress'
        when src.status = '02' then 'Completed'
        when src.status = '03' then 'Cancelled'
    end as statusdesc,

    case
        when src.storeid = 1000 then 'Online'
        else 'In-store'
    end as order_channel,

    current_timestamp as dbt_updated_at

from {{ source('revenue_dev', 'orders') }} as src

{% if is_incremental() %}
    where src.updated_at >= (
        select max(tgt.updated_at)
        from {{ this }} as tgt
    )
{% endif %}
