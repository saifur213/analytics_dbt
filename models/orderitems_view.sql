{{ config(materialized='view') }}

SELECT
    ORDERITEMID,
    ORDERID,
    PRODUCTID,
    QUANTITY,
    UNITPRICE,
    UPDATED_AT,
    QUANTITY * UNITPRICE AS TOTALPRICE
FROM
    {{ source('revenue_dev', 'orderitems') }}
