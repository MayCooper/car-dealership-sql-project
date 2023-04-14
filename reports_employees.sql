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