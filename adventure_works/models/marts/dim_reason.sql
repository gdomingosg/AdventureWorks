with
    motivo as (
        select *
        from {{ ref('int_salesreason') }}
    )

select *
from motivo