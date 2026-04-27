{% snapshot customers_history %}

{{
    config(
      target_schema='consumption',
      unique_key='CUSTOMERID',
      strategy='timestamp',
      updated_at='updated_at',
    )
}}


SELECT * FROM {{ source('revenue_dev', 'customers') }}

{% endsnapshot %}