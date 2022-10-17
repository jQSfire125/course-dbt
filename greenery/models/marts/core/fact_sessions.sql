with aggregated_session_events as (

  select * from {{ ref('int_session_events_agg') }}

),

users as (

  select * from {{ ref('stg_postgres__users') }}

),

session_length as (

  select
    session_id,
    min(created_at_utc) as first_event,
    max(created_at_utc) as last_event
  from {{ ref('stg_postgres__events') }}
  group by 1

),

final as (

  select
    aggregated_session_events.session_id,
    aggregated_session_events.user_guid,
    users.first_name,
    users.last_name,
    users.email,
    aggregated_session_events.add_to_carts,
    aggregated_session_events.checkouts,
    aggregated_session_events.package_shippeds,
    aggregated_session_events.page_views,
    session_length.first_event,
    session_length.last_event,
    datediff('minute', session_length.first_event, session_length.last_event) as session_length_minutes
  from aggregated_session_events
  left join users
    on aggregated_session_events.user_guid = users.user_guid
  left join session_length
    on aggregated_session_events.session_id = session_length.session_id

)

select * from final