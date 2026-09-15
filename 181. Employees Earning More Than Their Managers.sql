
-- Q/ Find the employees who has higher salaries than their managers

-- Inner join is used to see the employee information and manager information
--side by side to filter with where clause b indicates employee, a indicates manager


SELECT b.name as Employee
FROM Employee A
INNER JOIN Employee B
on A.id = B.managerid
where b.salary > a.salary
  
  ss