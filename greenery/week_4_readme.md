### Part 1.Snapshots
---
Which orders changed from week 2 to week 3?
A: 3 more orders went from "preparing" to "shipped":
* 38c516e8-b23a-493a-8a5c-bf7b2b9ea995
* d1020671-7cdf-493c-b008-c48535415611
* aafb9fbd-56e1-4dcc-b6b2-a3fd91381bb6

```sql
	select 
	  order_id 
	from dev_db.dbt_rogeliomontemayor.snapshot_orders 
	where dbt_valid_to > '2022-10-31'
```

 <br> 

### Part 2.Modeling challenge
---
How are our users moving throught the product funnel?
A: 578 sessions with page_views led to 467 sessions with add_to_carts which led to 361 sessions with checkouts

|Stage| Sessions | % of total| % of previous step |
|:--- | :---: |  :---: |  :---: |
| Page Views | 578	| 100 % | 100 %  |
| Add To Carts	| 467 | 80.8 % | 80.8 % |
| Checkouts	| 361 | 62.5 % | 77.3 % |

You can see the Sigma Dashboard [here](https://app.sigmacomputing.com/corise-dbt/workbook/workbook-3ZiEZV54sCXIYbYiF2ayIZ)

Which steps in the funnel have largest drop off points?  
A: The biggest drop off is between add to carts and checkouts. 

 <br> 

### Part 3.Reflection questions 3A
---
If your organization is thinking about using dbt, how would you pitch the value of dbt/analytics engineering to a decision maker at your organization?
A: My organization is thinking of using dbt in the future. It is almost a sure thing. If I had to, however, I would pitch the value of dbt in terms of having a version-controlled and modular way of updating the information the data team makes available to our stakeholders. I saw enough in this course to know that using dbt would improve how we do things.


If you are thinking about moving to analytics engineering, what skills have you picked that give you the most confidence in pursuing this next step?
A: First of all, I feel a lot more confident using dbt. I am excited to use this tool at work in the next few months. I also am very interested in data modeling. We could do better data modeling, and I want to learn more.

It was also cool to use Gitpod and practice some more with Snowflake. I also liked learning about Sigma.

 <br> 