{{ config(materialized='table') }}

SELECT
    OS.CUSTOMERID,
    C.CUSTOMERNAME,
    SUM(OS.ORDERCOUNT) AS ORDERCOUNT,
    SUM(OS.REVENUE) AS REVENUE
FROM
    {{ ref('orders_fact') }} AS OS
INNER JOIN
    {{ ref('customers_view') }} AS C
    ON OS.CUSTOMERID = C.CUSTOMERID
GROUP BY
    OS.CUSTOMERID,
    C.CUSTOMERNAME
