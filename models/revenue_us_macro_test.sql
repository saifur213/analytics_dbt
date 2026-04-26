{{ config(
    schema='TRAINING',
    materialized='view'
) }}

SELECT
    *,
    {{ calculate_amount('quantity_sold', 'unit_sell_price') }} AS total_sell,
    {{
        calculate_amount(
            'quantity_sold',
            'unit_purchase_cost'
        )
    }} AS total_purchase_cost,
    ROUND(total_sell - total_purchase_cost) AS revenue
FROM {{ source('training', 'sales_us') }}
