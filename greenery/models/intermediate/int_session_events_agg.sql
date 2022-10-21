{% 
  set event_types = dbt_utils.get_column_values(
    table=ref('stg_postgres__events'),
    column='event_type'
 ) 
%}

with events as (

  select * from {{ ref('stg_postgres__events') }}

), 

final as (
  
  select
    user_guid,
    session_id,
    {%- for event_type in event_types %}
    sum(case when event_type = '{{event_type}}' then 1 else 0 end) as {{event_type}}s
    {%- if not loop.last %},{% endif -%}
    {% endfor %}
  from events
  group by 1,2

)

select * from final