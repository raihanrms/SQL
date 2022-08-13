-- nth highest salary
select * from Employees order by Salary desc

select max(Salary) from Employees -- highest salary

select max(Salary) from Employees -- 2nd highest salary
where Salary < (select max(Salary) from Employees)

-- nth highest salary using sub query
select top 1 Salary from
(select distinct top 2 Salary -- 2nd highest salary 
-- (select distinct top 3 Salary -- 3rd highest salary
from Employees order by Salary desc)
Result Order by Salary

/* SQL Server utilities interpret GO 
as a signal that they should send the 
current batch of Transact-SQL statements 
to an instance of SQL Server
*/
go

-- nth highest salary using cte (common table expression)
with result1 as -- make the Employees a cte
(
	-- on this result set we applied a rank
	select Salary, DENSE_RANK() over (order by Salary desc) as denserank
	from Employees 
)
select top 1 Salary from result1 where result1.denserank = N -- replace N for the any nth number

/* Note: using it with row_number function will
work when there is no duplicate data.
We can use distinct function to solve that.
*/

-- any other highest salary
