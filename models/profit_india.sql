{{ config(schema='TRAINING', materialized='view')}}

{{ generate_profit_model('sales_india') }}