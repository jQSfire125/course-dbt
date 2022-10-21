### Part 1.Models
---
What is our repeat user rate?
A: 0.80

What are good indicators of a user who will likely purchase again? What about indicators of users who are likely NOT to purchase again? If you had more data, what features would you want to look into to answer this question?
A: I would try to look at the time between purchases, patterns for repeat users. Maybe page views could be a good indicator. With more data, we could probably build a model that tries predict purchases and see which features are more imporant in the model. 

Explain the marts models you added. Why did you organize the models in the way you did?
A: I added three main models:

* fact_sessions.- that combines aggregated session events, user information, the first and last event of a session and the session length in minutes. This one is in the core mart because the information might be useful to multiple teams.

* fact_user_orders.- that combines order information with total number of items in the order, user information and whether a promo was applied. This one is in the marketing mart because it might be helpful for the marketing team to look at order level data.

* fact_product_orders.- that combines product information with the number of page_view and add_to_cart events as well as the number of orders and total items ordered. This one is in the product mart because it might be helpful to look at product level data for the product team.

### Part 2. Tests
---
What assumptions are you making about each model?
A: On the staging models, I check for no nulls on the fields that I think should not be empty and for uniqueness on the primary key fields.

* fact_sessions.- Since I am aggregating at the session level, I assume that the session id is unique and not null. I also assume that the user is not null. For the counts of events, I check that there are all 0 or more. For the first and last event, I check that last is greater or equal to first. Also check that the session in minutes is positive.

* fact_user_orders.- Since I am aggregating at the order level, I assume that the order id is unique and not null. I also assume that the user_id is not null. I also check for nb_items order to be a positive value, is_promo to be not null.

* fact_product_orders.- Since I am aggregating at the product leve, I assume that the product id is unique and not null. I also assume that the page_views, add_to_carts, nb_orders, and nb_products are positive numbers.

Did you find any “bad” data as you added and ran tests on your models? How did you go about either cleaning the data in the dbt model or adjusting your assumptions/tests?
A: No.

Our stakeholders at Greenery want to understand the state of the data each day. Explain how you would ensure these tests are passing regularly and how you would alert stakeholders about bad data getting through.
A: We would run all the models on daily and would communicate via Slack on the #data channel when there are issues and the marts affected.

### Part 3. dbt Snapshots
---
Which orders changed from week 1 to week 2?
A: These 3 orders went from "preparing" to "shipped":
914b8929-e04a-40f8-86ee-357f2be3a2a2
05202733-0e17-4726-97c2-0520c024ab85
939767ac-357a-4bec-91f8-a7b25edd46c9