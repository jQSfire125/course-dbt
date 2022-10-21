{{
  config(
    materialized = 'view'
  )
}}

with order_items as (

  select * from {{ ref('stg_postgres__order_items') }}

),

final as (

  select
    order_id,
    sum(quantity) as nb_items_order
  from order_items
  group by 1 

)

select * from final