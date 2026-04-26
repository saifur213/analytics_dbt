{{ config(
    materialized='table',
    pre_hook=[
        "CREATE TABLE IF NOT EXISTS TEST_DB.AUDIT.MODEL_RUNS (
            model_name STRING,
            run_type STRING,
            run_timestamp TIMESTAMP
        )",
        "INSERT INTO TEST_DB.AUDIT.MODEL_RUNS VALUES ('{{ this }}','start',CURRENT_TIMESTAMP)"
    ],
    post_hook=[
        "INSERT INTO TEST_DB.AUDIT.MODEL_RUNS VALUES ('{{ this }}','end',CURRENT_TIMESTAMP)"
    ]
) }}

SELECT TOP 20
    CUSTOMERID,
    CUSTOMERNAME,
    ORDERCOUNT
FROM STG.CUSTOMER_ORDERS
ORDER BY ORDERCOUNT DESC
