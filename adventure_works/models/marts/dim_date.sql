with
    dates_raw as (
        {{
            dbt_utils.date_spine(
                datepart="day"
                , start_date="cast('2011-01-01' as date)" 
                , end_date="cast('2014-12-31' as date)"
            )
        }}
    )

    , days_info as (
        select 
            cast(date_day as date) as data_dia
            , extract(dayofweek from date_day) as dia_da_semana
            , extract(month from date_day) as mes
            , extract(dayofyear from date_day) as dia_do_ano
            , extract(year from date_day) as ano
        from dates_raw
    )

/* renaming the column meanings, translating them into Portuguese */
    , days_named as (
        select
            *
            , case
                when dia_da_semana = 1 then 'Domingo'
                when dia_da_semana = 2 then 'Segunda-feira'
                when dia_da_semana = 3 then 'Terça-feira'
                when dia_da_semana = 4 then 'Quarta-feira'
                when dia_da_semana = 5 then 'Quinta-feira'
                when dia_da_semana = 6 then 'Sexta-feira'
                else 'Sábado' 
            end as nome_do_dia
            , case
                when mes = 1 then 'Janeiro'
                when mes = 2 then 'Fevereiro'
                when mes = 3 then 'Março'
                when mes = 4 then 'Abril'
                when mes = 5 then 'Maio'
                when mes = 6 then 'Junho'
                when mes = 7 then 'Julho'
                when mes = 8 then 'Agosto'
                when mes = 9 then 'Setembro'
                when mes = 10 then 'Outubro'
                when mes = 11 then 'Novembro'
                else 'Dezembro' 
            end as nome_do_mes
            , case
                when mes = 1 then 'Jan'
                when mes = 2 then 'Fev'
                when mes = 3 then 'Mar'
                when mes = 4 then 'Abr'
                when mes = 5 then 'Mai'
                when mes = 6 then 'Jun'
                when mes = 7 then 'Jul'
                when mes = 8 then 'Ago'
                when mes = 9 then 'Set'
                when mes = 10 then 'Out'
                when mes = 11 then 'Nov'
                else 'Dez' 
            end as abrev_do_mes
        from days_info
    )

select *
from days_named