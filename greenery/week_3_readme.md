### Part 1.Models
---
What is our overall conversion rate?
A: 62.5%

```sql
select 
    round(div0((select count(event_type) as total
         from dev_db.dbt_rogeliomontemayor.stg_postgres__events
         where event_type = 'checkout'),
        (select count(distinct(session_id))
        from dev_db.dbt_rogeliomontemayor.stg_postgres__events)) * 100, 1) 
		as overall_conversion_rate;
```


What is our conversion rate by product?  
A: Here are the top 5 products by converstion rate. The rest can be found on the query.
|Product|Conversion|
|:--- | :---: |
| String of pearls	| 60.94 |
| Arrow Head	| 55.56 |
| Cactus	| 54.55 |
| ZZ Plant	| 53.97 |
| Bamboo	| 53.73 |

```sql
	select
	     product_name,
		 conversion
	from dev_db.dbt_rogeliomontemayor.fact_product_orders
	order by 2 desc
   ```
 <br> 

### Part 2.Macros
---
Added Jinja to int_product_events_agg.sql and int_session_events.sql to loop through the event_types. 

Added a macro `grant_role` that grants select to the given role.

 <br> 

### Part 3.Post Hook
---
I added a post-hook to dbt_project.yml that calls the macro `grant_role`.

 <br> 

### Part 4.Packages
---
I installed `dbt_utils` and `dbt_codegen` in `packages.yml`

Used `get_column_values` macro in the jinja on `int_product_events_agg.sql` and `int_session_events.sql`

Used the `accepted_range` test on `fact_product_orders`

 <br> 

### Part 5. dbt Snapshots
---
Which orders changed from week 2 to week 3?
A: 3 more orders went from "preparing" to "shipped":
* 8385cfcd-2b3f-443a-a676-9756f7eb5404
* e24985f3-2fb3-456e-a1aa-aaf88f490d70
* 5741e351-3124-4de7-9dff-01a448e7dfd4

```sql
	select 
	  order_id 
	from dev_db.dbt_rogeliomontemayor.snapshot_orders 
	where dbt_valid_to > '2022-10-18'
```