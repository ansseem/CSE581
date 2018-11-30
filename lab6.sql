use northwind;

/*
1.	Select all data from the Orders table, ordered by OrderDate, newest date on top, for orders shipped between January 1997 and August 1997.
2.	Select all data from the Orders table, ordered by OrderDate, newest date on top, for orders placed between July 1996 and January 1997.
3.	Select all data from the Orders table, for orders placed in January 1998.
4.	Select count of Orders shipped in 1996, 1997 and 1998. (one query containing all values) -> 2 columns (count and year), 3 rows (1 row per year). 
5.	Select all records from Employee table that any title related to “Sale”.
6.	Select all data from Orders table whose freight is more than 500.
7.	List all employees who have worked in company Northwind for more than 25 years.
8.	Calculate the average number of days it takes Northwind for all orders from “Ordered” (OrderDate) to “Shipped” (ShippedDate) status.
*/

select * from dbo.[Orders]
	where ShippedDate between '1997-01-01' and '1997-08-31'
	order by OrderDate desc;

select * from dbo.[Orders]
	where OrderDate between '1996-07-01' and '1997-01-31'
	order by OrderDate desc;

select * from dbo.[Orders]
	where Year(OrderDate) = 1998
	and Month(OrderDate) = '1';

select YEAR(ShippedDate), count(*) from dbo.[Orders] 
	where YEAR(ShippedDate) IN ('1996','1997','1998') 
	group by YEAR(ShippedDate);

select * from dbo.[Employees]
	where Title like '%sale%';

select * from dbo.[Orders]
	where freight > 500;

select * from dbo.[Employees]
	where (GETDATE()-HireDate) > 365*25;

select avg(CONVERT(int,ShippedDate-OrderDate)) from dbo.[Orders];
