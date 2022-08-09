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

-- filter using numerical numbers