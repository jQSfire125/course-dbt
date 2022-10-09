with

source as (

    select * from {{ source('src_postgres', 'orders') }}

),

renamed_recast as (

    select
        order_id,
        promo_id,
        user_id as user_guid,
        address_id as address_guid,
        created_at::timestampntz as created_at_utc,
        order_cost,
        shipping_cost,
        order_total,
        tracking_id,
        shipping_service,
        estimated_delivery_at::timestampntz as estimated_delivery_at_utc,
        delivered_at::timestampntz as delivered_at_utc,
        status as order_status
        
    from source 

)

select * from renamed_recast