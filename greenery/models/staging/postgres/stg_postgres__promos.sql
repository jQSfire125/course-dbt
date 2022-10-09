with

source as (

    select * from {{ source('src_postgres', 'promos') }}

),

renamed as (

    select
        promo_id,
        discount,
        status as promo_status
        
    from source 

)

select * from renamed