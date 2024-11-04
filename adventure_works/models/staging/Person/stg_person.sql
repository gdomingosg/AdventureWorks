with 
    fonte as (
        select
            *
        from {{ source('adventure_works', 'person') }}
    )

    , renomeacao as (
        select
            cast(businessentityid as int) as pk_pessoa
            , cast(persontype as varchar) as tipo_pessoa
            , firstname || ' ' || lastname as nome_pessoa
            , cast(emailpromotion as varchar) as receber_promocao
            , rowguid
            , cast(modifieddate as date) as data_alteracao 
        from fonte
    )

select *
from renomeacao