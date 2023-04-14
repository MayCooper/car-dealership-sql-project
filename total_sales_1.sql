-- Summarise sales per year by using a CTE

WITH cte AS (
SELECT strftime('%Y', soldDate) AS soldYear, 
  salesAmount
FROM sales
)
SELECT soldYear, 
  '$' || ROUND(sum(salesAmount), 2) AS AnnualSales
FROM cte
GROUP BY soldYear
ORDER BY soldYear;



SELECT strftime('%Y', soldDate) AS soldYear, 
       '$' || CAST(sum(salesAmount) AS NUMERIC) || '.00' AS AnnualSales
FROM sales
GROUP BY soldYear
ORDER BY soldYear;
