# Write your MySQL query statement below

SELECT *
FROM USERS 
WHERE MAIL REGEXP '^[A-Za-z][A-Za-z0-9_\.\-]*@LEETCODE[.]COM$'