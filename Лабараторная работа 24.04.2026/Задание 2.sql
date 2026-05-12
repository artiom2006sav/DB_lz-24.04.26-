--2.2

use SalesDB

go 
create function dbo.fn_GetCustomers()
	returns table 
	as 
	return (
		select * from 
		Customers 
	)

go
create function dbo.fn_GetOrdersByStatus(@status nvarchar(20))
	returns table 
	as 
	return(
		select * from Orders
		where [status] = @status 
	)
go

use LogisticsDB
go 
create function dbo.fn_GetShipmentsByWarehouse(@wid int)
	returns table 
	as 
	return (
		select * from Shipments
		where WarehousesID = @wid
	)
--2.3
go
select * from SalesDB.dbo.fn_GetCustomers()
select * from SalesDB.dbo.fn_GetOrdersByStatus('Новый')
select * from LogisticsDB.dbo.fn_GetShipmentsByWarehouse(1)