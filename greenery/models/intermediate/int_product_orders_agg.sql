with orders as (

  select * from {{ ref('stg_postgres__orders') }}

), 

order_items as (

  select * from {{ ref('stg_postgres__order_items') }}

), 

orders_and_order_items as (

  select 
    orders.order_id,
    order_items.product_id,
    order_items.quantity
  from orders
  join order_items
    on orders.order_id = order_items.order_id

),

final as (
  
  select 
    product_id,
    count(order_id) as nb_orders,
    sum(quantity) as nb_units
  from orders_and_order_items
  group by 1

)

select * from final