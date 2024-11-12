with
    customer as (
        select
            *
        from {{ ref('stg_customer') }}
    )

    , person as (
        select
            *
        from {{ ref('stg_person') }}
    )

    , store as (
        select *
        from {{ ref('stg_store') }}
    )

    , joined as (
        select
            stg_customer.pk_cliente
            , coalesce(stg_store.nome_loja, stg_person.nome_pessoa) as nome_cliente
            , stg_person.tipo_pessoa as tipo_cliente
        from stg_customer
        left join stg_person 
            on stg_customer.fk_pessoa = stg_person.pk_pessoa
        left join stg_store 
            on stg_customer.fk_loja = stg_store.pk_loja
    )

select *
from joined