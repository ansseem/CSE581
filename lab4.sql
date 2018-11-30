use Northwind;

/*
1.	Select all data from the Order Details table.
2.	Select all data from the Customers table, ordered by ContactName.
3.	Select all data from the Orders table, ordered by OrderDate, oldest date on top.
4.	Select all data from the Orders table, ordered by ShippedDate, newest date on top.
5.	Select all data from the Orders table, where order has not shipped yet (ShippedDate is null).
6.	Select CompanyName, ContactName and ContactTitle from the Customers table, where Company Name starts with D.
7.	Select EmployeeID, FirstName, LastName and Title from the Employees table, where last name starts with E, F or G.
8.	Select number of records from the Suppliers table. 
9.	List all data from Orders table for orderId 10253.
10.	List all order data (Orders table) placed by Customer ID AROUT or BERGS or BLAUS 
11.	List all company names that start with letters B or C (Customers table) 
12.	List of unique company names that placed their order in 1996 (Customers table, Orders table). Use YEAR(date)
13.	List out all records from Orders table for Company Name  B's Beverages (Customers table)
*/

select * from dbo.[Order Details];

select * from dbo.[Customers]
	order by ContactName;

select * from dbo.[Orders] 
	order by OrderDate asc;

select * from dbo.[Orders] 
	order by ShippedDate desc;

select * from dbo.[Orders]
	where ShippedDate is null;

select CompanyName, ContactName, ContactTitle from dbo.[Customers]
	where CompanyName like 'D%';

select EmployeeID, FirstName, LastName, Title from dbo.[Employees]
	where LastName like 'E%' 
	or LastName like 'F%'
	or LastName like 'G%';

select count(*) from dbo.[Suppliers];

select * from dbo.[Orders]
	where OrderID = 10253;

select * from dbo.[Orders]
	where orders.CustomerID = 'AROUT' 
	OR  orders.CustomerID = 'BERGS'
	or orders.CustomerID = 'BLAUS';

select CompanyName from dbo.[Customers]
	where CompanyName like 'B%'
	or CompanyName like 'C%';

select distinct CompanyName from dbo.[Customers], dbo.[Orders]
	where year(OrderDate) = 1996
	and Customers.CustomerID = Orders.CustomerID;

select * from dbo.[Orders] X, dbo.[Customers]
	where X.CustomerID = customers.CustomerID
	and customers.CompanyName = 'B''s Beverages'; 