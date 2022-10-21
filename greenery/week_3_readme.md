### Part 1.Models
---
What is our overall conversion rate?
A: 

What is our conversion rate by product?
A: 

```sql
   
	     select
	        *
	     from dev_db.dbt_rogeliomontemayor.fact_product_orders
	     group by 1
	     order by 4 desc
       
   ```


### Part 2.Macros
---
I added macros to int_product_events_agg.sql and int_session_events.sql

### Part 3.Post Hook
---
I added a post-hook to dbt_project.yml

### Part 4.Packages
---
I installed dbt_utils and dbt_codegen in packages.yml

### Part 3. dbt Snapshots
---
Which orders changed from week 2 to week 3?
A: 3 more orders went from "preparing" to "shipped":
8385cfcd-2b3f-443a-a676-9756f7eb5404
e24985f3-2fb3-456e-a1aa-aaf88f490d70
5741e351-3124-4de7-9dff-01a448e7dfd4