use Northwind;

/*
1.	List all orders and their corresponding order details.
2.	List all orders (OrderID) and all customers (Company Name), matching records appropriately.
3.	List all company names that placed more than 5 orders.
4.	List orders (OrderID) and corresponding customers (Company Name), only where the records match up.
5.	List matching orders (OrderID) and all customers (Company Name).
6.	List all employees (names and IDs only) and their corresponding managers (names only).
7.	List all orders (OrderID) and matching customers (Company Name).
*/

Select * from [Order Details] d
	full outer join Orders o
	on d.OrderID = o.OrderID;

select OrderID, CompanyName from dbo.[Orders] o
	full outer join Customers c
	on o.CustomerID = c.CustomerID;

select CompanyName from dbo.[Customers] c
	inner join Orders o
	on c.CustomerID = o.CustomerID 
	group by c.CompanyName having count(*) > 5;
 
 select OrderID, CompanyName from dbo.[Orders] o
	inner join Customers c
	on o.CustomerID = c.CustomerID;

 select OrderID, CompanyName from dbo.[Orders] o
	right join Customers c
	on o.CustomerID = c.CustomerID

select e1.EmployeeID, e1.FirstName, e1.LastName, e2.FirstName, e2.LastName from dbo.[Employees] e1 
	left outer join Employees e2
	on e1.ReportsTo = e2.EmployeeID;

select OrderID, CompanyName from dbo.[Orders] o
	left join Customers c
	on o.CustomerID = c.CustomerID;