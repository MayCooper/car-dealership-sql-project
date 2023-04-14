-- I'll rank the car models the salespeople have sold the most

SELECT e.firstName, e.lastName, m.model,
  COUNT(m.model) AS NumberSold
FROM sales s
INNER JOIN employee e
  ON s.employeeId = e.employeeId
INNER JOIN inventory i
  ON i.inventoryId = s.inventoryId
INNER JOIN model m
  ON m.modelId = i.modelId
GROUP BY e.firstName, e.lastName, m.model;


-- add in the windowing function
SELECT e.firstName, e.lastName, m.model,
  COUNT(m.model) AS NumberSold,
  RANK() OVER (PARTITION BY s.employeeId 
               ORDER BY COUNT(m.model) DESC) AS Rank
FROM sales s
INNER JOIN employee e
  ON s.employeeId = e.employeeId
INNER JOIN inventory i
  ON i.inventoryId = s.inventoryId
INNER JOIN model m
  ON m.modelId = i.modelId
GROUP BY e.firstName, e.lastName, m.model;
