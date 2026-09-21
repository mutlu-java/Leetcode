/*
https://leetcode.com/problems/nth-highest-salary/description/
Write a solution to find the nth highest distinct salary from the Employee table. If there are less than n distinct salaries, return null.

My approach was using a dense_rank() inside a subquery to rank the salaries, after that even if there were duplicates 
by using SELECT MAX(salary) I would be able to return 1 result from the subquery
*/


CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    RETURN (
        /* Write your T-SQL query statement below. */

        SELECT MAX(salary)
        FROM
        (
        SELECT 
        id,
        salary,
        DENSE_RANK() OVER(ORDER BY salary DESC) AS nth_salary
        FROM Employee
        )t
        WHERE nth_salary = @N

    );
END