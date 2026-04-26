{{
    config(
        materialized='incremental',
        unique_key='ORDERID',
        incremental_strategy='merge'
    )
}}

SELECT
    ORDERID,
    ORDERDATE,
    CUSTOMERID,
    EMPLOYEEID,
    STOREID,
    STATUS AS STATUSCD,

    UPDATED_AT,

    CASE
        WHEN STATUS = '01' THEN 'In Progress'
        WHEN STATUS = '02' THEN 'Completed'
        WHEN STATUS = '03' THEN 'Cancelled'
    END AS STATUSDESC,

    CASE
        WHEN STOREID = 1000 THEN 'Online'
        ELSE 'In-store'
    END AS ORDER_CHANNEL,
    current_timestamp AS DBT_UPDATED_AT

FROM {{ source('revenue_dev', 'orders') }}

{% if is_incremental() %}
    WHERE UPDATED_AT >= (SELECT max(UPDATED_AT) FROM {{ this }})
{% endif %}
