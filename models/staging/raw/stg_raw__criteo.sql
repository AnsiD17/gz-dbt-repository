with 

source as (

    select * from {{ source('raw', 'criteo') }}

),

renamed as (

    select
        date_date,
        paid_source,
        campaign_key,
        campgn_name AS campaign_name,
        cast(ads_cost as float64) as ads_cost,
        cast(impression as float64) as impression,
        cast(click as float64) as click

    from source

)

select * from renamed
