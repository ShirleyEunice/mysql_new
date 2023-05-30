--GROUPING QUERIES IN SQL:
--
--GROUP BY
--HAVING
--ROLLUP
--
--
--1. GROUP BY:
-- Group by work with aggreagte functions. It allows aggregate functions to perform 
-- particular action
/*
 SELECT
 c1,c2,c3...cn,aggregate function(ci)
 FROM 
 table_name
 WHERE
 where_condition
 GROUP BY c1,c2,c3,...cn
 */
--
--FROM->WHERE->GROUP By->DISTINCT->ORDER BY-> LIMIT
SELECT
    status
FROM
    orders
GROUP BY
    status;

--
SELECT
    DISTINCT status
FROM
    orders;

--The above two queries gives the same output. what to reply when 
--question is rasied between GROUP By and DISTINCT.
--DISTINCT= it provides the unique data
--GROUP BY =it is performed by the aggregate functions(considering
--all datas as single entity)
SELECT
    status,
    COUNT(*)
FROM
    orders
GROUP BY
    status;

--
--Get the total amount of all orders by status, join order table with
-- orderdetails table
--SUM method will be used
SELECT
    status,
    SUM(quantityOrdered * priceEach) AS amount
FROM
    orders
    INNER JOIN orderdetails USING (orderNumber)
GROUP BY
    status;

--
--Return thr order numbers and the total amount of each order
SELECT
    orderNumber,
    SUM(quantityOrdered * priceEach) AS total
FROM
    orderdetails
GROUP BY
    orderNumber;

--
--Get the total for each years
SELECT
    YEAR(orderDate) AS year,
    SUM(quantityOrdered * priceEach) AS total
FROM
    orders
    INNER JOIN orderdetails USING(orderNumber)
WHERE
    status = "Shipped"
GROUP BY
    YEAR(orderDate);

--
--
--
--2. HAVING CLAUSE:
--GROUP BY with HAVING CLAUSE
--Used with GROUP BY
--Select the statements to specify the filter condition for group of rows
--or aggreagete functions 
--
--FROM->WHERE->GROUP BY->HAVING->SELECt->DISTINCT->ORDER BY->LIMIT
--
--select the total sales of the years after 2003;
SELECT
    YEAR(orderDate) AS year,
    SUM(quantityOrdered * priceEach) AS total
FROM
    orders
    INNER JOIN orderdetails USING(orderNumber)
WHERE
    status = "Shipped"
GROUP BY
    year
HAVING
    year > 2003;

--
--
--Number of orders per year
SELECT
    count(orderNumber) AS Total,
    YEAR(orderDate) AS year
FROM
    orders
GROUP BY
    YEAR;

--
--
--Number of orders by status DESC
SELECT
    status,
    count(*) AS "number"
FROM
    orders
GROUP BY
    status
ORDER BY
    status DESC;

--
--
--Get order number,the number of items sold per order and total sales for each from the order table.
SELECT
    orderNumber,
    SUM(quantityOrdered) AS itemsCount,
    SUM(priceEach * quantityOrdered) AS TOTALORDER
FROM
    orderdetails
GROUP BY
    orderNumber;

--
--
--Find the total sales greater then 1000
SELECT
    orderNumber,
    SUM(quantityOrdered) AS itemsCount,
    SUM(priceEach * quantityOrdered) AS Total
FROM
    orderdetails
GROUP BY
    orderNumber
HAVING
    Total > 1000;

--
--
--Find the total sales greater then 1000 and item count>600
SELECT
    orderNumber,
    SUM(quantityOrdered) AS itemsCount,
    SUM(priceEach * quantityOrdered) AS Total
FROM
    orderdetails
GROUP BY
    orderNumber
HAVING
    Total > 1000
    AND itemsCount > 600;

--
--
--Find all the orders that already shipped and total amount greater than
--1500,join with ORDERS
SELECT
    a.orderNumber,
    status,
    SUM(priceEach * quantityOrdered) AS Total
FROM
    orderDetails a
    INNER JOIN orders b ON b.orderNumber = a.orderNumber
GROUP BY
    orderNumber,
    status
HAVING
    status = "Shipped"
    AND Total > 1500;

--
--
--
--3. ROLLUP CLAUSE:
--MySQL ROLLUP clause to generate subtotals and grand totals
--Create a new table named sales that stores the order values
--summarized by product lines and years
--The data comes from the products, orders, and orderDetails tables
--
CREATE TABLE sales
SELECT
    productline,
    YEAR(orderDate) orderYear,
    SUM(priceEach * quantityOrdered) AS Total
FROM
    orderDetails
    INNER JOIN orders USING(orderNumber)
    INNER JOIN products USING(productCode)
GROUP BY
    productline,
    orderYear;

--
--
--Grouping set is a set of columns which we wanted to group.
--
SELECT
    productline,
    SUM(Total) totalOrderValue
FROM
    sales
GROUP BY
    productline;