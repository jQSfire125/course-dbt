{% test later_than(model, column_name, earlier_date) %}

select *
from {{model}}
where {{column_name}} < {{earlier_date}}
/* if this is true, then column_name is not after earlier_date
This can be used when we want to know for example that a 
delivery date is never before the purchase date for example.

Usage: 

  - name: delivered_at_utc
    tests:
      - later_than:
          earlier_date: created_at_utc

*/

{% endtest %}