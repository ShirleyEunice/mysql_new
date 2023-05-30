--Some of the filter queries are:
--WHERE
--SELECT DISTINCT
--AND
--OR
--IN
--NOT IN
--BETWEEN
--LIKE
--LIMIT
--IS NULL
--
--
-- 1. WHERE
/*
 SELECT
 select_list
 FROM
 table_name
 WHERE
 search_condition;
 */
--FROM->WHERE->SELECT->ORDER BY
SELECT
    lastName,
    firstName,
    jobTitle
FROM
    employees
WHERE
    jobTitle = "Sales Rep";

--
--
--2.  AND, OR:
-- select person who is sales person and also working in a particular company
SELECT
    lastName,
    firstName,
    jobTitle,
    officeCode
FROM
    employees
WHERE
    jobTitle = "Sales Rep"
    AND officeCode = 1;

-- shows the person who is sales rep and also works in office 1,2,3
SELECT
    lastName,
    firstName,
    jobTitle,
    officeCode
FROM
    employees
WHERE
    jobTitle = "Sales Rep"
    AND officeCode = 1
    OR officeCode = 2
    OR officeCode = 3;

--
--
--3. BETWEEN:
-- select the person working in office 1,2 and 3
SELECT
    lastName,
    firstName,
    jobTitle,
    officeCode
FROM
    employees
WHERE
    officeCode BETWEEN 1
    AND 3
ORDER BY
    officeCode;

--
--
--4. LIKE:
-- select the lastname ends with "son"
SELECT
    lastName,
    firstName
FROM
    employees
WHERE
    lastName LIKE "%son"
ORDER BY
    firstName;

-- select the lastname that contains "son"
SELECT
    lastName,
    firstName
FROM
    employees
WHERE
    lastName LIKE "%son%"
ORDER BY
    firstName;

--
--
--5. IN:
--It is similar to BETWEEN but it reduce the code and gives us output
-- select the person working in office 1,2 and 3
SELECT
    lastName,
    firstName,
    jobTitle,
    officeCode
FROM
    employees
WHERE
    officeCode IN(1, 2, 3)
ORDER BY
    officeCode;

--
--
--6. ISNULL:
--Check whether the value is NULL or not
SELECT
    lastName,
    firstName reportsTo
FROM
    employees
WHERE
    reportsTo IS NULL;

--
--
--7. IS NOT NULL:
SELECT
    lastName,
    firstName,
    reportsTo
FROM
    employees
WHERE
    reportsTo IS NOT NULL;

--
--
--8. <>
-- it returns all the person who doesn't have the particular value
SELECT
    *
FROM
    employees
WHERE
    jobTitle <> 'Sales Rep';

--
--
--9. >
-- It shows the result greater than the value
SELECT
    lastName,
    firstName jobTitle
FROM
    employees
WHERE
    officeCode > 5;

--
--
--10. <=
SELECT
    lastName,
    firstName jobTitle
FROM
    employees
WHERE
    officeCode <= 4;

--
--
--11. DISTINCT
-- It gives the unique datas
SELECT
    DISTINCT lastName
FROM
    employees
ORDER BY
    lastName;

--DISTINCY NULL
SELECT
    DISTINCT state
FROM
    customers;

--Should not display NULL value
SELECT
    DISTINCT state,
    city
FROM
    customers
WHERE
    state IS NOT NULL
ORDER BY
    state,
    city;

--
--
--name,country(USA), state CA,credit limit>100000
SELECT
    customerName,
    country
FROM
    customers
WHERE
    country = "USA"
    AND state = "CA"
    AND creditlimit > 100000;