/* Write your T-SQL query statement below */
/*   LOOK again because thew question asks for the first login date and consecutive second date.*/
/* 550. Game Play Analysis IV */
/* https://leetcode.com/problems/game-play-analysis-iv*/

WITH cte AS (
SELECT
    player_id,
    event_date,
    MIN(event_date)OVER(PARTITION BY player_id) first_day
    
    
FROM Activity)
, cte2 as(
SELECT
    player_id,
    event_date,
    first_day,
    DATEADD(DAY, 1 , first_day) second_day
FROM cte
)

SELECT
    ROUND(
    CAST(
    COUNT(DISTINCT player_id) AS DECIMAL (10,2) ) / (SELECT COUNT(DISTINCT player_id) FROM Activity)
    ,2) AS fraction
from cte2
WHERE event_date=second_day