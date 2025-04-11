# Write your MySQL query statement below

SELECT VISITED_ON,
    (SELECT SUM(AMOUNT)
    FROM CUSTOMER
    WHERE VISITED_ON BETWEEN DATE_SUB(C.VISITED_ON, INTERVAL 6 DAY) 
    AND C.VISITED_ON
    ) AS AMOUNT, 
   ROUND((SELECT SUM(AMOUNT)/7
    FROM CUSTOMER
    WHERE VISITED_ON BETWEEN DATE_SUB(C.VISITED_ON, INTERVAL 6 DAY) 
    AND C.VISITED_ON
    ),2) AS AVERAGE_AMOUNT
FROM CUSTOMER C
WHERE VISITED_ON >= (
    SELECT DATE_ADD(MIN(VISITED_ON), INTERVAL 6 DAY)
    FROM CUSTOMER
)
GROUP BY VISITED_ON
ORDER BY VISITED_ON