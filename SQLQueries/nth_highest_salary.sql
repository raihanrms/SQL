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

-- nth highest salary using cte (common table expression)

-- any other highest salary