with aggregated_order_items as (

  select * from {{ ref('int_order_items_agg') }}

),

users as (

  select * from {{ ref('stg_postgres__users') }}

),

orders as (

  select * from {{ ref('stg_postgres__orders') }}

),

is_promo as (

  select 
    order_id,
    case when promo_id is not null then TRUE ELSE FALSE end as is_promo
  from orders

),

final as (

  select
    orders.order_id,
    orders.user_guid,
    orders.address_guid,
    users.first_name,
    users.last_name,
    users.email,
    aggregated_order_items.nb_items_order,
    orders.order_total,
    is_promo.is_promo,
    orders.created_at_utc as order_created_at_utc,
    orders.order_status
  from orders
  left join users
    on orders.user_guid = users.user_guid
  left join is_promo
    on orders.order_id = is_promo.order_id
  left join aggregated_order_items
    on orders.order_id = aggregated_order_items.order_id

)

select * from final