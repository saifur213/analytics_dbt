{{
    config(
        materialized='incremental',
        unique_key='ORDERID',
        incremental_strategy='merge'
    )
}}

SELECT
    src.orderid,
    src.orderdate,
    src.customerid,
    src.employeeid,
    src.storeid,
    src.status AS statuscd,
    src.updated_at,

    CASE
        WHEN src.status = '01' THEN 'In Progress'
        WHEN src.status = '02' THEN 'Completed'
        WHEN src.status = '03' THEN 'Cancelled'
    END AS statusdesc,

    CASE
        WHEN src.storeid = 1000 THEN 'Online'
        ELSE 'In-store'
    END AS order_channel,

    CURRENT_TIMESTAMP AS dbt_updated_at

FROM {{ source('revenue_dev', 'orders') }} AS src

{% if is_incremental() %}
WHERE src.UPDATED_AT >= (
    SELECT MAX(tgt.UPDATED_AT)
    FROM {{ this }} AS tgt
)
{% endif %}
