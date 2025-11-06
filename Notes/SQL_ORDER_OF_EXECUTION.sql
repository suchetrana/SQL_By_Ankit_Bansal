select country, city, sum(order_id) as sum_orders
from orders
where city like 'H%'
group by country, city
order by sum_orders desc
limit 3;

| Step  | Clause                | What it does                                           | Example action in your query                                     |
| ----- | --------------------- | ------------------------------------------------------ | ---------------------------------------------------------------- |
| **1** | **FROM**              | Identify source tables and perform joins               | Starts with the `orders` table                                   |
| **2** | **WHERE**             | Filter rows *before* grouping (row-level filter)       | Keeps only rows where `city LIKE 'H%'`                           |
| **3** | **GROUP BY**          | Groups remaining rows into buckets                     | Groups by `country, city`                                        |
| **4** | **HAVING**            | Filter groups *after* aggregation (group-level filter) | Keeps groups where `SUM(order_id)` is non-zero or non-null       |
| **5** | **SELECT**            | Choose which columns/aggregates to return              | Computes `SUM(order_id)` and returns `country, city, sum_orders` |
| **6** | **ORDER BY**          | Sort final result set                                  | Sorts by `sum_orders DESC`                                       |
| **7** | **LIMIT** *(if used)* | Restrict number of rows returned                       | Not used here, but would be last                                 |
