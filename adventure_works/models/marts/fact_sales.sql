with
    order_sales as (
        select *
        from {{ ref('int_salesorder') }}
    )

select *
from order_sales