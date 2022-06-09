-- CREATE A DATABASE CALLED 'SHOP'
CREATE DATABASE Shop;
USE Shop;
-- ADD A NEW TABLE CALLED 'SALES1' AND ADD SOME DATA
CREATE TABLE Sales1 (
  Store VARCHAR(10), 
  Week INT, 
  Day VARCHAR(20), 
  SalesPerson VARCHAR(20), 
  SalesAmount FLOAT, 
  Month VARCHAR(20)
);
INSERT INTO Sales1 (
  Store, Week, Day, SalesPerson, SalesAmount, 
  Month
) 
VALUES 
  (
    'London', 2, 'Monday', 'Frank', 56.25, 
    'May'
  ), 
  (
    'London', 5, 'Tuesday', 'Frank', 74.32, 
    'Sep'
  ), 
  (
    'London', 5, 'Monday', 'Bill', 98.42, 
    'Sep'
  ), 
  (
    'London', 5, 'Saturday', 'Bill', 73.90, 
    'Dec'
  ), 
  (
    'London', 1, 'Tuesday', 'Josie', 44.27, 
    'Sep'
  ), 
  (
    'Dusseldorf', 4, 'Monday', 'Manfred', 
    77.00, 'Jul'
  ), 
  (
    'Dusseldorf', 3, 'Tuesday', 'Inga', 
    9.99, 'Jun'
  ), 
  (
    'Dusseldorf', 4, 'Wednesday', 'Manfred', 
    86.81, 'Jul'
  ), 
  (
    'London', 6, 'Friday', 'Josie', 74.02, 
    'Oct'
  ), 
  (
    'Dusseldorf', 1, 'Saturday', 'Manfred', 
    43.11, 'Apr'
  );
-- USE COUNT TO FIND OUT HOW MANY COLUMN VALUES SPECIFIED IN SALESPERSON
SELECT 
  COUNT(SalesPerson) 
FROM 
  Sales1;
-- USE COUNT TO FIND OUT HOW MANY SALES EACH SALES PERSON HAS MADE
SELECT 
  SalesPerson, 
  COUNT(SalesPerson) 
FROM 
  Sales1 
GROUP BY 
  SalesPerson;
-- FIND ALL SALES RECORDS (AND ALL COLUMNS) THAT TOOK PLACE IN THE LONDON STORE, NOT IN DECEMBER, BUT SALES CONCLUDED BY BILL OR FRANK FOR THE AMOUNT HIGHER THAN £50
SELECT 
  * 
FROM 
  Sales1 s 
WHERE 
  s.Store = 'London' 
  AND s.Month <> 'Dec' 
  AND s.salesperson IN ('Bill', 'Frank') 
  AND s.salesamount > 50;
-- FIND OUT HOW MANY SALES TOOK PLACE EACH WEEK (IN NO PARTICULAR ORDER)
SELECT 
  s.week, 
  COUNT(s.Week) 
FROM 
  Sales1 s 
GROUP BY 
  s.Week;
-- FIND OUT HOW MANY SALES TOOK PLACE EACH WEEK (AND PRESENT DATA BY WEEK IN DESCENDING AND THEN IN ASCENDING ORDER)
SELECT 
  s.week, 
  COUNT(s.Week) AS 'Number of Sales' 
FROM 
  Sales1 s 
GROUP BY 
  s.Week 
ORDER BY 
  Week DESC;
SELECT 
  s.week, 
  COUNT(s.Week) AS 'Number of Sales' 
FROM 
  Sales1 s 
GROUP BY 
  s.Week 
ORDER BY 
  Week ASC;
-- FIND OUT HOW MANY SALES WERE RECORDED EACH WEEK ON DIFFERENT DAYS OF THE WEEK 
SELECT 
  s.week, 
  COUNT(s.salesamount) AS 'Total Sales This Day', 
  s.day 
FROM 
  Sales1 s 
WHERE 
  s.week = 1 
GROUP BY 
  s.day 
ORDER BY 
  s.week;
SELECT 
  s.week, 
  COUNT(s.salesamount) AS 'Total Sales This Day', 
  s.day 
FROM 
  Sales1 s 
WHERE 
  s.week = 2 
GROUP BY 
  s.day 
ORDER BY 
  s.week;
SELECT 
  s.week, 
  COUNT(s.salesamount) AS 'Total Sales This Day', 
  s.day 
FROM 
  Sales1 s 
WHERE 
  s.week = 3 
GROUP BY 
  s.day 
ORDER BY 
  s.week;
SELECT 
  s.week, 
  COUNT(s.salesamount) AS 'Total Sales This Day', 
  s.day 
FROM 
  Sales1 s 
WHERE 
  s.week = 4 
GROUP BY 
  s.day 
ORDER BY 
  s.week;
SELECT 
  s.week, 
  COUNT(s.salesamount) AS 'Total Sales This Day', 
  s.day 
FROM 
  Sales1 s 
WHERE 
  s.week = 5 
GROUP BY 
  s.day 
ORDER BY 
  s.week;
SELECT 
  s.week, 
  COUNT(s.salesamount) AS 'Total Sales This Day', 
  s.day 
FROM 
  Sales1 s 
WHERE 
  s.week = 6 
GROUP BY 
  s.day 
ORDER BY 
  s.week;
-- WE NEED TO CHANGE SALESPERSON'S NAME INGA TO ANNETTE
UPDATE 
  Sales1 
SET 
  Salesperson = 'Annette' 
WHERE 
  Salesperson = 'Inga';
SET 
  SQL_SAFE_UPDATES = 0;
-- FIND OUT HOW MANY SALES DID ANNETTE DO
SELECT 
  COUNT(s.week) AS 'Sales by Annette' 
FROM 
  Sales1 s 
WHERE 
  salesperson = 'Annette';
-- FIND THE TOTAL SALES AMOUNT BY EACH PERSON BY DAY
SELECT 
  s.salesperson, 
  SUM(s.salesamount) AS 'Total Sales Amount', 
  s.day 
FROM 
  Sales1 s 
WHERE 
  s.day = 'Monday' 
GROUP BY 
  s.salesperson 
ORDER BY 
  s.day;
SELECT 
  s.salesperson, 
  SUM(s.salesamount) AS 'Total Sales Amount', 
  s.day 
FROM 
  Sales1 s 
WHERE 
  s.day = 'Tuesday' 
GROUP BY 
  s.salesperson 
ORDER BY 
  s.day;
SELECT 
  s.salesperson, 
  SUM(s.salesamount) AS 'Total Sales Amount', 
  s.day 
FROM 
  Sales1 s 
WHERE 
  s.day = 'Wednesday' 
GROUP BY 
  s.salesperson 
ORDER BY 
  s.day;
SELECT 
  s.salesperson, 
  SUM(s.salesamount) AS 'Total Sales Amount', 
  s.day 
FROM 
  Sales1 s 
WHERE 
  s.day = 'Thursday' 
GROUP BY 
  s.salesperson 
ORDER BY 
  s.day;
SELECT 
  s.salesperson, 
  SUM(s.salesamount) AS 'Total Sales Amount', 
  s.day 
FROM 
  Sales1 s 
WHERE 
  s.day = 'Friday' 
GROUP BY 
  s.salesperson 
ORDER BY 
  s.day;
SELECT 
  s.salesperson, 
  SUM(s.salesamount) AS 'Total Sales Amount', 
  s.day 
FROM 
  Sales1 s 
WHERE 
  s.day = 'Saturday' 
GROUP BY 
  s.salesperson 
ORDER BY 
  s.day;
-- HOW MUCH (SUM) EACH PERSON SOLD FOR THE GIVEN PERIOD
SELECT 
  s.salesperson, 
  ROUND(
    SUM(s.salesamount), 
    2
  ) AS 'Total Sales' 
FROM 
  Sales1 s 
GROUP BY 
  s.salesperson;
-- HOW MUCH (SUM) EACH PERSON SOLD FOR THE GIVEN PERIOD, INCLUDING THE NUMBER OF SALES PER PERSON, THEIR AVERAGE, LOWEST AND HIGHEST SALE AMOUNTS
SELECT 
  s.salesperson, 
  ROUND(
    SUM(s.salesamount), 
    2
  ) AS 'Total Sales', 
  ROUND(
    AVG(s.salesamount), 
    2
  ) AS 'Average Sales Amount', 
  ROUND(
    MIN(s.salesamount), 
    2
  ) AS 'Lowest Sales Amount', 
  ROUND(
    MAX(s.salesamount), 
    2
  ) AS 'Highest Sales Amount' 
FROM 
  Sales1 s 
GROUP BY 
  s.salesperson;
-- FIND THE TOTAL MONETARY SALES AMOUNT ACHIEVED BY EACH STORE
SELECT 
  s.store, 
  ROUND(
    SUM(s.salesamount), 
    2
  ) AS 'Total Sales' 
FROM 
  Sales1 s 
GROUP BY 
  s.store;
-- FIND THE NUMBER OF SALES BY EACH PERSON IF THEY DID LESS THAN 3 SALES FOR THE PAST PERIOD
SELECT 
  s.salesperson, 
  COUNT(s.salesamount) AS 'Total Sales' 
FROM 
  Sales1 s 
GROUP BY 
  s.salesperson 
HAVING 
  COUNT(s.salesamount) < 3;
-- FIND THE TOTAL AMOUNT OF SALES BY MONTH WHERE COMBINED TOTAL IS LESS THAN £100
SELECT 
  s.month, 
  COUNT(s.salesamount) AS 'Total Sales' 
FROM 
  Sales1 s 
GROUP BY 
  s.month 
HAVING 
  COUNT(s.salesamount) < 100;
