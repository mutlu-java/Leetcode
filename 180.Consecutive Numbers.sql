/*


*/



SELECT DISTINCT num as ConsecutiveNums
FROM 
(
SELECT
id,
num,
LEAD(num)OVER(Order BY id) "lead1",
LAG(num) OVER(Order BY id) "lag1"
FROM Logs) T 
WHERE num = lead1 AND num = lag1
