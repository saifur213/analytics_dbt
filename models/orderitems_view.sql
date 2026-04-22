{{ config(schema='revenue_dev', materialized='view') }}

SELECT
    OrderItemID,
    OrderID,
    ProductID,
    Quantity,
    UnitPrice,
    Quantity * UnitPrice AS TotalPrice,
    Updated_at
FROM
    {{ source('revenue_dev', 'orderitems') }}