-- Let's get the cars sold for each employee by month

SELECT e.firstName, e.lastName, s.soldDate, s.salesAmount
FROM sales s
INNER JOIN employee e
  ON s.employeeId = e.employeeId
WHERE s.soldDate >= '2021-01-01'
AND s.soldDate < '2022-01-01';


-- 2. implementing case statements for each month

SELECT e.firstName, e.lastName,
  CASE WHEN strftime('%m', soldDate) = '01'
      THEN salesAmount END AS JanSales,
  CASE 
      WHEN strftime('%m', soldDate) = '02'
      THEN salesAmount END AS FebSales,
  CASE 
      WHEN strftime('%m', soldDate) = '03'
      THEN salesAmount END AS MarSales,
  CASE 
      WHEN strftime('%m', soldDate) = '04' 
      THEN salesAmount END AS AprSales,
  CASE 
      WHEN strftime('%m', soldDate) = '05' 
      THEN salesAmount END AS MaySales,
  CASE 
      WHEN strftime('%m', soldDate) = '06' 
      THEN salesAmount END AS JunSales,
  CASE 
      WHEN strftime('%m', soldDate) = '07' 
      THEN salesAmount END AS JulSales,
  CASE 
      WHEN strftime('%m', soldDate) = '08' 
      THEN salesAmount END AS AugSales,
  CASE 
      WHEN strftime('%m', soldDate) = '09' 
      THEN salesAmount END AS SepSales,
  CASE 
      WHEN strftime('%m', soldDate) = '10' 
      THEN salesAmount END AS OctSales,
  CASE 
      WHEN strftime('%m', soldDate) = '11' 
      THEN salesAmount END AS NovSales,
  CASE 
      WHEN strftime('%m', soldDate) = '12' 
      THEN salesAmount END AS DecSales
FROM sales s
INNER JOIN employee e
  ON s.employeeId = e.employeeId
WHERE s.soldDate >= '2021-01-01'
  AND s.soldDate < '2022-01-01'
ORDER BY e.lastName, e.firstName

-- 3. Grouping the data

SELECT e.firstName, e.lastName,
  SUM(CASE 
        WHEN strftime('%m', soldDate) = '01' 
        THEN salesAmount END) AS JanSales,
  SUM(CASE 
        WHEN strftime('%m', soldDate) = '02' 
        THEN salesAmount END) AS FebSales,
  SUM(CASE 
        WHEN strftime('%m', soldDate) = '03' 
        THEN salesAmount END) AS MarSales,
  SUM(CASE 
        WHEN strftime('%m', soldDate) = '04' 
        THEN salesAmount END) AS AprSales,
  SUM(CASE 
        WHEN strftime('%m', soldDate) = '05' 
        THEN salesAmount END) AS MaySales,
  SUM(CASE 
        WHEN strftime('%m', soldDate) = '06' 
        THEN salesAmount END) AS JunSales,
  SUM(CASE 
        WHEN strftime('%m', soldDate) = '07' 
        THEN salesAmount END) AS JulSales,
  SUM(CASE 
        WHEN strftime('%m', soldDate) = '08' 
        THEN salesAmount END) AS AugSales,
  SUM(CASE 
        WHEN strftime('%m', soldDate) = '09' 
        THEN salesAmount END) AS SepSales,
  SUM(CASE 
        WHEN strftime('%m', soldDate) = '10' 
        THEN salesAmount END) AS OctSales,
  SUM(CASE 
        WHEN strftime('%m', soldDate) = '11' 
        THEN salesAmount END) AS NovSales,
  SUM(CASE 
        WHEN strftime('%m', soldDate) = '12' 
        THEN salesAmount END) AS DecSales
FROM sales s
INNER JOIN employee e
  ON s.employeeId = e.employeeId
WHERE s.soldDate >= '2021-01-01'
  AND s.soldDate < '2022-01-01'
GROUP BY e.firstName, e.lastName
ORDER BY e.lastName, e.firstName
