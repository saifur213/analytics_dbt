{% macro calculate_amount(quantity_col, unit_sell_price, decimal_places=1) %}
  ROUND({{ quantity_col }} * {{ unit_sell_price }})
{% endmacro %}

{% macro generate_profit_model(table_name) %}
SELECT 
    sales_date,
    SUM(quantity_sold * unit_sell_price) AS total_revenue,
    SUM(quantity_sold * unit_purchase_cost) AS total_cost,
    ROUND(total_revenue - total_cost) AS total_profit
FROM {{ source('training', table_name) }}
GROUP BY sales_date
{% endmacro %}