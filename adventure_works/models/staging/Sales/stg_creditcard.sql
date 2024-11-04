with 
    fonte as (
        select
            *
        from {{ source('adventure_works', 'creditcard') }}
    )

    , renomeacao as (
        select
            creditcardid as pk_cartao_credito
            , cardtype as tipo_cartao_credito
            , cast(modifieddate as date) as data_alteracao
        from fonte
    )

select *
from renomeacao