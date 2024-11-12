with
    order_sales as (
        select *
        from {{ ref('int_salesorder') }}
    )

    , cartao as (
        select *
        from {{ ref('dim_creditcard') }}
    )

    , cliente as (
        select *
        from {{ ref('dim_customer') }}
    )

    , dim_data as (
        select *
        from {{ ref('dim_date') }}
    ) 

    , geo as (
        select *
        from {{ ref('dim_location') }}
    )

    , produto as (
        select *
        from {{ ref('dim_product') }}
    )

    , motivo as (
        select *
        from {{ ref('dim_reason') }}
    )

select *
from order_sales