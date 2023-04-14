-- Displays the number of cars sold this month, and last month

-- Get the data
SELECT strftime('%Y-%m', soldDate) AS MonthSold,
  COUNT(*) AS NumberCarsSold
FROM sales
GROUP BY strftime('%Y-%m', soldDate);

-- Apply the window function
SELECT strftime('%Y-%m', soldDate) AS MonthSold,
  COUNT(*) AS NumberCarsSold,
  LAG(COUNT(*), 1, 0) OVER (ORDER BY strftime('%Y-%m', soldDate)) AS LastMonthCarsSold
FROM sales
GROUP BY strftime('%Y-%m', soldDate)
ORDER BY strftime('%Y-%m', soldDate);
