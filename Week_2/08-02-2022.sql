--Finds the stored query associated with the name customer_credits and execute.
SELECT
    *
FROM
    (
        SELECT
            name,
            credit_limit
        FROM
            customers
    );  
    
--Query returns sales amount by the customer by year
SELECT
    name AS customer,
    SUM( quantity * unit_price ) sales_amount,
    EXTRACT(
        YEAR
    FROM
        order_date
    ) YEAR
FROM
    orders
INNER JOIN order_items
        USING(order_id)
INNER JOIN customers
        USING(customer_id)
WHERE
    status = 'Shipped'
GROUP BY
    name,
    EXTRACT(
        YEAR
    FROM
        order_date
    );
--OR
CREATE OR REPLACE VIEW customer_sales AS 
SELECT
    name AS customer,
    SUM( quantity * unit_price ) sales_amount,
    EXTRACT(
        YEAR
    FROM
        order_date
    ) YEAR
FROM
    orders
INNER JOIN order_items
        USING(order_id)
INNER JOIN customers
        USING(customer_id)
WHERE
    status = 'Shipped'
GROUP BY
    name,
    EXTRACT(
        YEAR
    FROM
        order_date
    );
    
--Retrieve the sales by the customer in 2017
SELECT
    customer,
    sales_amount
FROM
    customer_sales
WHERE
    YEAR = 2017
ORDER BY
    sales_amount DESC;
    
########Creating View#########
--View shows the employee id, name and years of service
CREATE VIEW employee_yos AS
SELECT
    employee_id,
    first_name || ' ' || last_name full_name,
    FLOOR( months_between( CURRENT_DATE, hire_date )/ 12 ) yos
FROM
    employees;

--
CREATE VIEW employee_yos (employee_id, full_name, yos) AS
SELECT
    employee_id,
    first_name || ' ' || last_name,
    FLOOR( months_between( CURRENT_DATE, hire_date )/ 12 )
FROM
    employees;

SELECT
    *
FROM
    employee_yos
WHERE
    yos = 15
ORDER BY
    full_name; 

--
CREATE OR REPLACE VIEW customer_credits(
        customer_id,
        name,
        credit
    ) AS 
SELECT
        customer_id,
        name,
        credit_limit
    FROM
        customers WITH READ ONLY;
--
CREATE OR REPLACE VIEW backlogs AS
SELECT
    product_name,
    EXTRACT(
        YEAR
    FROM
        order_date
    ) YEAR,
    SUM( quantity * unit_price ) amount
FROM
    orders
INNER JOIN order_items
        USING(order_id)
INNER JOIN products
        USING(product_id)
WHERE
    status = 'Pending'
GROUP BY
    EXTRACT(
        YEAR
    FROM
        order_date
    ),
    product_name;

CREATE VIEW vw_emp
	AS
			SELECT
				empno,ename,job,mgr,hiredate,sal,comm,deptno
			FROM
				emp;

SELECT * FROM vw_emp;