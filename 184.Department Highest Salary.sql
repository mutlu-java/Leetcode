/* Write your T-SQL query statement below
184. Department Highest Salary

*/
/* Write a solution to find employees who have the highest salary in each of the departments.  */



SELECT
Department,
Employee,
Salary
From
(
SELECT 
e.name Employee,
d.name Department,
e.Salary Salary,
Max(Salary) Over(Partition by e.departmentID) Top_Salary
FROM Employee e
LEFT JOIN Department d ON e.departmentID = d.id
)t
WHERE Salary = Top_Salary
