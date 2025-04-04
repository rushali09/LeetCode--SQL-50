# Write your MySQL query statement below

SELECT *, IF(X+Y>Z AND X+Z>Y AND Y+Z>X, 'Yes', 'No') AS triangle
FROM TRIANGLE 
