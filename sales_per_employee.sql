-- How many cars did every employee sell?

SELECT e.employeeId, e.firstName, e.lastName, COUNT(*) as total_sales
FROM sales s
INNER JOIN employee e
    ON s.employeeId = e.employeeId
GROUP BY e.employeeId, e.firstName, e.lastName;


-- Group by and count
SELECT e.employeeId, e.firstName, e.lastName, count(*) as NumOfCarsSold
FROM sales s
INNER JOIN employee e
    ON s.employeeId = e.employeeId
GROUP BY e.employeeId, e.firstName, e.lastName
ORDER BY NumOfCarsSold DESC;

-- Let's print the least and most expensive car sold by each employee this year

SELECT e.employeeId, 
    e.firstName, 
    e.lastName, 
    MIN(salesAmount) AS MinSalesAmount, 
    MAX(salesAmount) as MaxSalesAmount
FROM sales s
INNER JOIN employee e
    ON s.employeeId = e.employeeId
WHERE s.soldDate >= date('now','start of year')
GROUP BY e.employeeId, e.firstName, e.lastName

-- Display report for employees who have sold at least 5 cars

SELECT e.employeeId, 
    count(*) AS NumOfCarsSold, 
    MIN(salesAmount) AS MinSalesAmount, 
    MAX(salesAmount) AS MaxSalesAmount
FROM sales s
INNER JOIN employee e
    ON s.employeeId = e.employeeId
WHERE s.soldDate >= date('now','start of year')
GROUP BY e.employeeId
HAVING count(*) > 5