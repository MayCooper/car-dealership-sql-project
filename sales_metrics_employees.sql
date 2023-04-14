-- List sales people who have zero sales

SELECT e.firstName, e.lastName, e.title, e.startDate, s.salesId
FROM employee e
LEFT JOIN sales s
    ON e.employeeId = s.employeeId
WHERE e.title = 'Sales Person'
AND s.salesId IS NULL;


-- List all customers & their sales, despite nulls

SELECT c.firstName, c.lastName, c.email, s.salesAmount, s.soldDate
FROM customer c
INNER JOIN sales s
    ON c.customerId = s.customerId
UNION

-- UNION WITH CUSTOMERS WHO HAVE NO SALES

SELECT c.firstName, c.lastName, c.email, s.salesAmount, s.soldDate
FROM customer c
LEFT JOIN sales s
    ON c.customerId = s.customerId
WHERE s.salesId IS NULL
UNION

-- UNION WITH SALES MISSING CUSTOMER DATA

SELECT c.firstName, c.lastName, c.email, s.salesAmount, s.soldDate
FROM sales s
LEFT JOIN customer c
    ON c.customerId = s.customerId
WHERE c.customerId IS NULL;



