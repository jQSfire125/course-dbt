with aggregated_product_events as (

   select * from {{ ref('int_product_events_agg') }}

),

aggregated_product_orders as (

   select * from {{ ref('int_product_orders_agg') }}

),

conversions as (

  select * from {{ ref('int_product_conversion_agg') }}

),

products as (

  select * from {{ ref('stg_postgres__products') }}

),

final as (

  select
    aggregated_product_events.product_id,
    products.product_name,
    products.price,
    products.inventory,
    aggregated_product_events.page_views,
    aggregated_product_events.add_to_carts,
    aggregated_product_orders.nb_orders,
    aggregated_product_orders.nb_units,
    round(div0(conversions.purchase_sessions, conversions.page_view_sessions) * 100,2) as conversion
  from aggregated_product_events
  left join aggregated_product_orders
    on aggregated_product_events.product_id = aggregated_product_orders.product_id
  left join conversions
    on aggregated_product_events.product_id = conversions.product_id
  left join products
    on aggregated_product_events.product_id = products.product_id

)

select * from final