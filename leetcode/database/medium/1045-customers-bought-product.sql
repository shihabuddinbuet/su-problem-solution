-- Question 93
-- Table: Customer

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | customer_id | int     |
-- | product_key | int     |
-- +-------------+---------+
-- product_key is a foreign key to Product table.
-- Table: Product

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | product_key | int     |
-- +-------------+---------+
-- product_key is the primary key column for this table.
 

-- Write an SQL query for a report that provides the customer ids from the Customer table that bought all the products in the Product table.

-- For example:

-- Customer table:
-- +-------------+-------------+
-- | customer_id | product_key |
-- +-------------+-------------+
-- | 1           | 5           |
-- | 2           | 6           |
-- | 3           | 5           |
-- | 3           | 6           |
-- | 1           | 6           |
-- +-------------+-------------+

-- Product table:
-- +-------------+
-- | product_key |
-- +-------------+
-- | 5           |
-- | 6           |
-- +-------------+

-- Result table:
-- +-------------+
-- | customer_id |
-- +-------------+
-- | 1           |
-- | 3           |
-- +-------------+
-- The customers who bought all the products (5 and 6) are customers with id 1 and 3.

-- Solution
select customer_id
from customer
group by customer_id
having count(distinct product_key) = (select COUNT(distinct product_key) from product)
-----------------------------------------

Table: Customer
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| customer_id | int     |
| product_key | int     |
+-------------+---------+

DROP TABLE IF EXISTS Customer;
CREATE TABLE IF NOT EXISTS Customer (
	customer_id int,
	product_key int
);


INSERT INTO Customer values(1, 5);
INSERT INTO Customer values(2, 6);
INSERT INTO Customer values(2, 6);
INSERT INTO Customer values(3, 5);
INSERT INTO Customer values(3, 6);
INSERT INTO Customer values(1, 6);
INSERT INTO Customer values(1, 6);


Table: Product 
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| product_key | int     |
+-------------+---------+

DROP TABLE IF EXISTS Product;
CREATE TABLE IF NOT EXISTS Product (
	product_key int
);

INSERT INTO Product values(5);
INSERT INTO Product values(6);


select 
	customer_id
from Customer
group by 1 
having count(distinct product_key) = (select count(*) from Product)
;