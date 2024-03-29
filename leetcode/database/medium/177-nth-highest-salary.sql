-- Question 50
-- Write a SQL query to get the nth highest salary from the Employee table.

-- +----+--------+
-- | Id | Salary |
-- +----+--------+
-- | 1  | 100    |
-- | 2  | 200    |
-- | 3  | 300    |
-- +----+--------+
-- For example, given the above Employee table, the nth highest salary where n = 2 is 200. If there is no nth highest salary, then the query should return null.

-- +------------------------+
-- | getNthHighestSalary(2) |
-- +------------------------+
-- | 200                    |
-- +------------------------+

-- Solution 
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      select distinct a.salary
      from
      (select salary, 
      dense_rank() over(order by salary desc) as rk
      from Employee) a
      where a.rk = N
  );
END
---------------------------------------------


Table: Salary

+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+

DROP TABLE IF EXISTS Salary;
CREATE TABLE IF NOT EXISTS Salary (
	id int,
	salary int
);


INSERT INTO Salary values(1,100);
INSERT INTO Salary values(2,200);
INSERT INTO Salary values(3,300);

First Solution:
--------------------
drop function if exists getNthSalary;
create function getNthSalary(n int) 
returns int 
language plpgsql 
as 
$$
	declare 
		nth_highest integer;
	begin
		select 
			salary into nth_highest
		from(select 
				salary,
				dense_rank() over(order by salary desc) d_rank
			from Salary
			)t
		where d_rank = n;
		return nth_highest;
	end;
$$;

select getNthSalary(2);

Second Solution:
--------------------------
DROP FUNCTION IF EXISTS getNthSalary;
CREATE FUNCTION getNthSalary(n int) returns int language plpgsql
as 
$$
	declare nth_highest int;
	begin
		select 
			distinct salary into nth_highest
		from Salary
		order by salary desc offset n limit 1;
		return nth_highest;
	end;
$$;
select getNthSalary(2);

Third Solution:
-----------------------------
DROP FUNCTION IF EXISTS getNthSalary;
CREATE FUNCTION getNthSalary(n int) returns int language plpgsql
as 
$$
	declare nth_highest int;
	begin
		select 
			salary into nth_highest
		from (select 
				distinct salary 
			from salary
			order by salary desc limit n
			) t
		order by salary asc limit 1; 
		return nth_highest;
	end;
$$;
select getNthSalary(2);











