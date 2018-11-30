use Northwind;

/*
1.	List all employee names in the following format: LAST NAME, first name. (Uppercased last name, followed by comma and space, followed by lowercased first name).
2.	List all company names as well as the length of their name, from the Customers table. 2 Columns – Company Name, Text length.
3.	List all shipped dates as well as expected delivery dates from the Orders table WHERE SHIP DATE IS NOT NULL. (Expected delivery date is 5 days from the ship date).
4.	List all orders from the Orders table that were shipped in 1998. 
5.	List all orders placed on January 1st 1997, from the Orders table. 
6.	Find the oldest / youngest employee’s date of birth from Employee table.
7.	Calculate the average freight (rounded up to cent) for each Ship City from Orders table.
8.	Count how many unique orders from [Order Details] table. 
9.	Get dates of First and Last orders placed (Orders table)
*/

select Upper(LastName) + ', ' + ' ' + Lower(FirstName) from dbo.[Employees];

select CompanyName, LEN(CompanyName) from dbo.[Customers];

select Convert (Date, ShippedDate+5) DeliverDate, ShippedDate from dbo.[Orders]
	where ShippedDate is not null;

select * from dbo.[Orders]
	where Year(ShippedDate) = 1998;

select * from dbo.[Orders]
	where Year(OrderDate) = 1997
	and Month(OrderDate) = '1'
	and DAY(OrderDate) = '1';

select min(BirthDate), max(BirthDate) from dbo.[Employees];

select round(avg(freight),2) as AvgFreight, A.ShipCity from dbo.[Orders] A
	group by A.ShipCity;

select OrderID, count(*) from dbo.[Order Details] 
	group by OrderID having Count(*) = 1;

select min(OrderDate), max(orderDate) from dbo.[Orders];