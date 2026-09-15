
--183.Customers who never placed an order
SELECT c.name Customers
FROM Customers c
LEFT JOIN orders o 
on c.id = o.customerId
where o.customerId IS NULL