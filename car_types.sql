-- Let's find sales of cars which are electric by using a subquery
SELECT *
FROM sales s
INNER JOIN inventory i
  ON s.inventoryId = i.inventoryId;


-- 2. reviewing the model table
Select *
from model
limit 10;

-- 3. I'll lookup the modelId for the electric models
SELECT modelId
FROM model
WHERE EngineType = 'Electric';


-- Final query
SELECT s.soldDate, s.salesAmount, i.colour, i.year
FROM sales s
INNER JOIN inventory i
  ON s.inventoryId = i.inventoryId
WHERE i.modelId IN (
  SELECT modelId
  FROM model
  WHERE EngineType = 'Electric'
)
