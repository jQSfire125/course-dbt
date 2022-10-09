with

source as (

    select * from {{ source('src_postgres', 'products') }}

),

renamed as (

    select
        product_id,
        name as product_name,
        price,
        inventory
        
    from source 

)

select * from renamed