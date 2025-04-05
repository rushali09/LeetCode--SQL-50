# Write your MySQL query statement below


-- +----+-----+
-- | id | num |
-- +----+-----+
-- | 1  | 1   |
-- | 2  | 1   |
-- | 3  | 1   |

-- +----+-----+

SELECT DISTINCT L1.NUM AS ConsecutiveNums
FROM LOGS L1, LOGS L2, LOGS L3
WHERE L1.ID = L2.ID -1 AND L2.ID = L3.ID -1
AND L1.NUM = L2.NUM AND L2.NUM = L3.NUM