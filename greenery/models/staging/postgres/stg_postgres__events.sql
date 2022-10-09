with

source as (

    select * from {{ source('src_postgres', 'events') }}

),

renamed_recast as (

    select
        event_id,
        session_id,
        user_id as user_guid,
        event_type,
        page_url,
        created_at::timestampntz as created_at_utc,
        order_id,
        product_id

    from source

)

select * from renamed_recast