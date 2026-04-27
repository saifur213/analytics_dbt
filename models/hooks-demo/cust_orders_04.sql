{{ config(
    materialized='table',
    pre_hook=[
        "CREATE TABLE IF NOT EXISTS DEV_DB.AUDIT.MODEL_RUNS (
            model_name STRING,
            run_type STRING,
            run_timestamp TIMESTAMP
        )",
        "INSERT INTO DEV_DB.AUDIT.MODEL_RUNS VALUES ('{{ this }}','start',CURRENT_TIMESTAMP)"
    ],
    post_hook=[
        "INSERT INTO DEV_DB.AUDIT.MODEL_RUNS VALUES ('{{ this }}','end',CURRENT_TIMESTAMP)"
    ]
) }}

SELECT TOP 20
    CUSTOMERID,
    CUSTOMERNAME,
    ORDERCOUNT
FROM {{ source('revenue_dev', 'customer_orders') }}
ORDER BY ORDERCOUNT DESC
