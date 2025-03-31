# Write your MySQL query statement below

SELECT 

    ROUND(SUM(IF(ORDER_DATE=CUSTOMER_PREF_DELIVERY_DATE,1,0))*100/COUNT(DISTINCT          CUSTOMER_ID),2) AS IMMEDIATE_PERCENTAGE
FROM DELIVERY 
WHERE (CUSTOMER_ID, ORDER_DATE) IN 
(SELECT CUSTOMER_ID, MIN(ORDER_DATE) AS FIRST_ORDER
FROM DELIVERY 
GROUP BY CUSTOMER_ID)












-- Delivery table:
-- +-------------+-------------+------------+-----------------------------+
-- | delivery_id | customer_id | order_date | customer_pref_delivery_date |
-- +-------------+-------------+------------+-----------------------------+
-- | 1           | 1           | 2019-08-01 | 2019-08-02                  | S
-- | 2           | 2           | 2019-08-02 | 2019-08-02                  | I          
-- | 5           | 3           | 2019-08-21 | 2019-08-22                  | S               
-- | 7           | 4           | 2019-08-09 | 2019-08-09                  | I
-- +-------------+-------------+------------+-----------------------------+
-- Output: 
-- +----------------------+
-- | immediate_percentage |
-- +----------------------+
-- | 50.00                |
-- +----------------------+






