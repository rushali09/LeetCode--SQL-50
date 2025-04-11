# Write your MySQL query statement below

SELECT 
    CASE
        WHEN ID=(SELECT MAX(ID) FROM SEAT) AND MOD(ID,2)= 1
        THEN ID

        WHEN MOD(ID,2)=1
        THEN ID+1

        ELSE ID-1
    END AS ID, STUDENT
FROM SEAT
ORDER BY ID ASC