--1757. Recyclable and Low Fat Products
SELECT PRODUCT_ID
FROM PRODUCTS
WHERE LOW_FATS = 'Y' AND RECYCLABLE = 'Y'
--

-- 584. Find Customer Referee
SELECT NAME
FROM CUSTOMER
WHERE REFEREE_ID <> 2  OR REFEREE_ID IS NULL
--

--595. Big Countries
SELECT NAME, POPULATION, AREA
FROM WORLD
WHERE AREA >= 3000000 OR POPULATION >= 25000000
--

--1148. Article Views I
SELECT DISTINCT AUTHOR_ID AS ID
FROM VIEWS
WHERE AUTHOR_ID = VIEWER_ID
ORDER BY ID 
--

--1683. Invalid Tweets

SELECT TWEET_ID
FROM TWEETS
WHERE CHAR_LENGTH(CONTENT) > 15
--

--1378. Replace Employee ID With The Unique Identifier

SELECT EU.UNIQUE_ID, E.NAME
FROM EMPLOYEES E
LEFT JOIN EMPLOYEEUNI EU
ON E.ID = EU.ID
--

--1068. Product Sales Analysis I
SELECT P.PRODUCT_NAME, S.YEAR, S.PRICE
FROM SALES S 
INNER JOIN PRODUCT P 
ON S.PRODUCT_ID = P.PRODUCT_ID
--

--1581. Customer Who Visited but Did Not Make Any Transactions
SELECT V.CUSTOMER_ID, COUNT(V.VISIT_ID) AS COUNT_NO_TRANS
FROM VISITS V
LEFT JOIN TRANSACTIONS T
ON V.VISIT_ID = T.VISIT_ID
WHERE T.TRANSACTION_ID IS NULL
GROUP BY CUSTOMER_ID
--

--197. Rising Temperature
SELECT W1.id
FROM Weather W1
JOIN Weather W2
  ON DATEDIFF(W1.recordDate, W2.recordDate) = 1
WHERE W1.temperature > W2.temperature;
--

--1661. Average Time of Process per Machine
SELECT A1.MACHINE_ID, ROUND(AVG(A2.TIMESTAMP-A1.TIMESTAMP),3) AS PROCESSING_TIME
FROM ACTIVITY A1 
INNER JOIN ACTIVITY A2
ON A1.MACHINE_ID = A2.MACHINE_ID AND 
A1.PROCESS_ID = A2.PROCESS_ID
WHERE A1.TIMESTAMP < A2.TIMESTAMP
GROUP BY A1.MACHINE_ID
--

--577. Employee Bonus
SELECT NAME, BONUS
FROM EMPLOYEE E
LEFT JOIN BONUS B USING(EMPID)
WHERE BONUS < 1000 OR BONUS IS NULL
--

--1280. Students and Examinations
SELECT S.STUDENT_ID, S.STUDENT_NAME, SUB.SUBJECT_NAME, COUNT(E.SUBJECT_NAME) AS ATTENDED_EXAMS
FROM STUDENTS S
CROSS JOIN SUBJECTS SUB
LEFT JOIN EXAMINATIONS E 
ON S.STUDENT_ID = E.STUDENT_ID 
AND SUB.SUBJECT_NAME = E.SUBJECT_NAME
GROUP BY S.STUDENT_ID, S.STUDENT_NAME, SUB.SUBJECT_NAME
ORDER BY S.STUDENT_ID, SUB.SUBJECT_NAME
--

--570. Managers with at Least 5 Direct Reports
SELECT E1.NAME
FROM EMPLOYEE E1
INNER JOIN EMPLOYEE E2
ON E1.ID = E2.MANAGERID
GROUP BY E2.MANAGERID
HAVING COUNT(E2.MANAGERID) >= 5
--

--1934. Confirmation Rate
SELECT  USER_ID, 
       ROUND(IFNULL(SUM(ACTION= 'CONFIRMED')/COUNT(*),0),2) AS CONFIRMATION_RATE
FROM SIGNUPS S
LEFT JOIN CONFIRMATIONS C USING (USER_ID)
GROUP BY USER_ID
--

--620. Not Boring Movies
SELECT ID, MOVIE, DESCRIPTION, RATING
FROM CINEMA
WHERE MOD(ID,2) =1 AND DESCRIPTION <> 'BORING'
ORDER BY RATING DESC
--

--1251. Average Selling Price
SELECT P.PRODUCT_ID, ROUND(IFNULL(SUM(US.UNITS * P.PRICE)/SUM(US.UNITS),0),2) AS AVERAGE_PRICE
FROM PRICES P 
LEFT JOIN UNITSSOLD US 
ON P.PRODUCT_ID = US.PRODUCT_ID
AND US.PURCHASE_DATE BETWEEN P.START_DATE AND P.END_DATE
GROUP BY P.PRODUCT_ID
--

--1075. Project Employees I
SELECT P.PROJECT_ID, 
        ROUND(SUM(E.EXPERIENCE_YEARS)/COUNT(E.EMPLOYEE_ID),2) AS AVERAGE_YEARS
FROM PROJECT P
LEFT JOIN EMPLOYEE E
ON P.EMPLOYEE_ID = E.EMPLOYEE_ID
GROUP BY PROJECT_ID
--

--1633. Percentage of Users Attended a Contest
SELECT CONTEST_ID, 
       ROUND(COUNT(DISTINCT USER_ID)/ (SELECT COUNT(USER_ID) FROM USERS) * 100,2) AS PERCENTAGE
FROM USERS U 
RIGHT JOIN REGISTER R USING(USER_ID)
GROUP BY CONTEST_ID
ORDER BY PERCENTAGE DESC, CONTEST_ID
--

--1211. Queries Quality and Percentage
SELECT QUERY_NAME, 
        ROUND(AVG(RATING/POSITION),2) AS QUALITY,
        ROUND(SUM(CASE WHEN RATING < 3 THEN 1 ELSE 0 END) * 100/ COUNT(*),2) AS      POOR_QUERY_PERCENTAGE
FROM QUERIES
GROUP BY QUERY_NAME
--

--1193. Monthly Transactions I
SELECT  DATE_FORMAT(TRANS_DATE, '%Y-%m') AS MONTH, 
        COUNTRY, 
        COUNT(ID) AS TRANS_COUNT,
        SUM(STATE= 'APPROVED') AS APPROVED_COUNT,
        SUM(AMOUNT) AS TRANS_TOTAL_AMOUNT,
        SUM(CASE WHEN STATE= 'APPROVED' THEN AMOUNT ELSE 0 END) AS APPROVED_TOTAL_AMOUNT
FROM TRANSACTIONS
GROUP BY MONTH, COUNTRY
--

--1174. Immediate Food Delivery II
SELECT 
    ROUND(AVG(CASE 
        WHEN ORDER_DATE = customer_pref_delivery_date THEN 1 ELSE 0 END) * 100,2) AS IMMEDIATE_PERCENTAGE
FROM DELIVERY
WHERE (CUSTOMER_ID,ORDER_DATE) IN
(SELECT CUSTOMER_ID, MIN(ORDER_DATE)
FROM DELIVERY 
GROUP BY CUSTOMER_ID)
--

--550. Game Play Analysis IV
SELECT ROUND(COUNT(DISTINCT PLAYER_ID)/ (SELECT COUNT(DISTINCT PLAYER_ID) FROM ACTIVITY),2) AS FRACTION
FROM ACTIVITY
WHERE (PLAYER_ID, DATE_SUB(EVENT_DATE, INTERVAL 1 DAY)) IN
(SELECT PLAYER_ID, MIN(EVENT_DATE)
FROM ACTIVITY
GROUP BY PLAYER_ID)
--


--2356 Number of Unique Subjects Taught by Each Teacher
SELECT TEACHER_ID, COUNT(DISTINCT SUBJECT_ID) AS CNT
FROM TEACHER
GROUP BY TEACHER_ID
--

--596. Classes More Than 5 Students
FROM COURSES
GROUP BY CLASS
HAVING COUNT(STUDENT) >=5
--

--1141. User Activity for the Past 30 Days I
SELECT ACTIVITY_DATE AS DAY, COUNT(DISTINCT USER_ID) AS ACTIVE_USERS
FROM ACTIVITY
WHERE ACTIVITY_DATE >= '2019-06-28' AND ACTIVITY_DATE <= '2019-07-27'
GROUP BY ACTIVITY_DATE
--











