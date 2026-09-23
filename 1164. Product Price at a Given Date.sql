/*1164. Product Price at a Given Date
https://leetcode.com/problems/product-price-at-a-given-date/description/
*/
/* Eventhough I solved this question with ctes it can be easily solved by examinign the question this way:
Realize we need the prices for the exact date 2019-08-16 therefore updates after this will be 10
Dive the products by two groups 
1. Products which has an update on or before the date 2019-08-16 select these products with the price of latest update day
2.Products which has an update after the date 2019-08-16 Select these producs with static price of 10 
Use UNION ALL to UNION rows 


My approach is selecting products which has change_date <= '2019-08-16'
and then finding the most recent change date and price
after that in the final query I used a JOIN to join it with Products table so that we can have acces to the product_id s that has an update after the date 2019-08-16
it is important since we may not encounter with these products with our where clause filtering in our cte

*/

with cte as (
SELECT 
product_id,
change_date,
ROW_NUMBER()OVER(PARTITION BY product_id ORDER BY change_date DESC) last_update,
-- MAX(change_date) OVER(PARTITION BY product_id) last_update,
new_price
FROM Products
WHERE change_date <= '2019-08-16'
),
cte2 as (
    SELECT * 
    FROM cte 
    WHERE last_update = 1
)

SELECT 
    p.product_id,
    COALESCE(c.new_price, 10) AS price
FROM (SELECT DISTINCT product_id FROM Products) p -- Used distinct to not duplicate the rows 
LEFT JOIN cte2 c ON p.product_id = c.product_id;

-- SELECT
-- p.product_id,
-- COALESCE(c.new_price,10) price
-- FROM cte2 c
-- RIGHT JOIN Products p ON p.product_id = c.product_id

