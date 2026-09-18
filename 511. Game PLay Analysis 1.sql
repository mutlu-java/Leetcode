/* Write your T-SQL query statement below 
Write a solution to find the first login date for each player
https://leetcode.com/problems/game-play-analysis-i/
*/

with cte_first_login as (
select *,
ROW_NUMBER() OVER(PARTITION BY player_id ORDER BY event_date asc) as f_log
from activity)

select player_id,
event_date as first_login
from cte_first_login
where f_log = 1;


