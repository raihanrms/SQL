-- Notes
-- To execute the whole script, press Execute(F5)
-- To execute a single query, select the single query and hit F5

-- Query from different(master) database
-- select CustomerName, Notes from KCC.dbo.Customers
-----------------------------------------------------

-- Query in the current database
select CustomerName, Notes from dbo.Customers

-- Custom column header
select CustomerName as [Customer Name] from dbo.Customers

-- Remove duplicates from a query
select distinct CustomerName as [Customer Name] from dbo.Customers

-- all of the columns together and get top 3 records
select top(3) * from dbo.Customers

-- filter users from WA using (where)
select * from dbo.Customers where State = 'WA'

-- filter users not from WA using (where)
select * from dbo.Customers where State <> 'WA'
select * from dbo.Customers where State != 'WA'

-- filter user from WA or NY using (where)
select * from dbo.Customers where State = 'WA' or State = 'NY'

-- fliter user from multiple states using (in or notin)
select * from dbo.Customers where State in ('WA', 'NY', 'UT')
select * from dbo.Customers where State not in ('WA', 'NY', 'UT')

-- get user from a certain location using (and) and (or)
select * from dbo.Customers 
where CustomerName = 'Tres Delicious' AND (Country = 'United States' or Country = 'France')

-- filter user names whose name begins with 'a'
select * from dbo.Customers 
where CustomerName like 'A%' AND (Country = 'United States' or Country = 'France')

-- filter user names whose name doesn't begin with 'a'
select * from dbo.Customers 
where CustomerName not like 'A%' AND (Country = 'United States' or Country = 'France')

-- for the result to show up, there has to be overlap between oders and customer
-- when join is called, by default inner-join gets executed

-- filter using numerical numbers using (join), also using alias to clean things up
select OrderID, OrderDate, OrderTotal, CustomerName, Phone 
from dbo.Orders o inner join dbo.Customers c 
on o.CustomerID = c.CustomerID

-- what if there is a customer didn't order anything, but still want to view them
select OrderID, OrderDate, OrderTotal, CustomerName, Phone 
from dbo.Orders o right outer join dbo.Customers c 
on o.CustomerID = c.CustomerID

-- all order weather is a customer or not
select OrderID, OrderDate, OrderTotal, CustomerName, Phone 
from dbo.Orders o left outer join dbo.Customers c 
on o.CustomerID = c.CustomerID


-- getting customer id
select OrderID, OrderDate, OrderTotal, c.CustomerID, CustomerName, Phone 
from dbo.Orders o right outer join dbo.Customers c 
on o.CustomerID = c.CustomerID

-- (oderby) order total
select OrderID, OrderDate, OrderTotal, c.CustomerID, CustomerName, Phone 
from dbo.Orders o right outer join dbo.Customers c 
on o.CustomerID = c.CustomerID
-- order by OrderTotal asc
order by OrderTotal desc

-- functions
select * from dbo.Orders
-- as of now this is August, that's why -8
where OrderDate >= Dateadd(month,-8,getdate()) -- dynamic
-- where OrderDate >= '2/18/2022' (static)

-- count of all orders from february
select count(*) from dbo.Orders
where OrderDate >= Dateadd(month,-8,getdate())

-- sum all of the order tables from february
select sum(OrderTotal) from dbo.Orders
where OrderDate >= Dateadd(month,-8,getdate())
-- $65,891 revenue, not too bad for a cookie company.

-- order total by customer id (group by)
select count(*) from dbo.Orders
where OrderDate >= Dateadd(month,-8,getdate())
group by CustomerID

-- query designer
-- right click and select (Design Query in Editor -> Select Tables -> Click and Done)
SELECT Customers.CustomerName, Orders.OrderID, Orders.OrderDate, SUM(Orders.OrderTotal) AS Expr1
FROM Customers INNER JOIN
Orders ON Customers.CustomerID = Orders.CustomerID
WHERE (Orders.OrderDate >= CONVERT(DATETIME, '2022-02-18 00:00:00', 102))
GROUP BY Customers.CustomerName, Orders.OrderID, Orders.OrderDate