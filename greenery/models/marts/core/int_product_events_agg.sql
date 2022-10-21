{{
  config(
    materialized = 'view'
  )
}}

with events as (

  select * from {{ ref('stg_postgres__events') }}

), 

final as (
  
  select product_id,
    sum(case when event_type = 'add_to_cart' then 1 else 0 end) as add_to_carts,
    sum(case when event_type = 'page_view' then 1 else 0 end) as page_views
  from events
  where product_id is not null
  group by 1

)

select * from final