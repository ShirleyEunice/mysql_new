-- ORDER BY CLAUSE
/*
 SELECT
 select_list
 FROM
 table_name
 ORDER BY
 column1 [ASC|DESC] 
 column2 [ASC|DESC]
 ...
 */
-- sort the customer by their last name in asc order
SELECT
    contactLastname,
    contactFirstname
FROM
    customers
ORDER BY
    contactLastname DESC,
    contactFirstname;

-- Orderline items from orderdeatils tables, to calculate subtotal and sort by subtotal
SELECT
    orderNumber,
    orderLineNumber,
    quantityOrdered * priceEach AS subtotal
FROM
    orderdetails
ORDER BY
    subtotal DESC
limit
    20;

-- FIELD FUNCTION:
-- Gives position of particular element
-- SYNTAX: SELECT FIELD(str,str1,str2...)
SELECT
    FIELD('A', 'B', 'C');

-- sort order based on their status
SELECT
    orderNumber,
    status
FROM
    orders
ORDER BY
    FIELD(
        status,
        "In Process",
        "On Hold",
        "Cancelled",
        "Resolved",
        "Disputed",
        "Shipped"
    );

-------------
-- order by and NULL
SELECT
    firstName,
    lastName,
    reportsTo
FROM
    employees
ORDER BY
    reportsTo
limit
    10;