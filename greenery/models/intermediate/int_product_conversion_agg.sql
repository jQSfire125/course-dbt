with events as (

  select * from {{ ref('stg_postgres__events')}}

),

order_items as (

  select * from {{ ref('stg_postgres__order_items')}}

),

checkout_sessions as (

  select 
    events.session_id,
    events.event_type,
    order_items.product_id
  from events
  left join order_items
    on events.order_id = order_items.order_id
  where event_type = 'checkout'

),

page_view_sessions as (

  select
    session_id,
    event_type,
    product_id
  from events
  where event_type = 'page_view'

),

unioned as (

  select * from checkout_sessions
    
  union all
    
  select * from page_view_sessions
    
),

final as (

  select 
    product_id,
    sum(case when event_type = 'checkout' then 1 else 0 end) as purchase_sessions,
    count(distinct session_id) as page_view_sessions
  from unioned
  group by 1

)

select * from final