/* Write your T-SQL query statement below */



with cte_salary_ranking AS (
SELECT
    e.id emp_id,
    e.name  Employee,
    e.salary Salary,
    DENSE_RANK() OVER( PARTITION BY e.departmentId ORDER BY Salary DESC) as salary_rank,
    e.departmentId dept_id,
    d.name Department
FROM Employee e
JOIN Department d ON e.departmentId = d.id
)

SELECT 
   Department,
   Employee,
   Salary
FROM cte_salary_ranking
WHERE salary_rank <=3
