use SalesDB;
go
create or alter procedure add_customer
    @name nvarchar(100),
    @email nvarchar(100)
as
begin
    set nocount on;
    if exists (select 1 from Customers where Email = @email)
    begin
        print 'Клиент с таким Email уже существует';
        return;
    end

    insert into Customers (FullName, Email)
    values (@name, @email);
    select * from Customers where Email = @email;
end;
go
exec dbo.add_customer 'Алексей Мирин', 'alex_mir@example.com'
------------------------
go
create or alter procedure add_order
    @customerid int,
    @total float,
    @status nvarchar(20) = 'Подтверждён'
as
begin
    set nocount on
    if not exists (select 1 from Customers where CustomerID = @customerid)
    begin
        throw 50002, 'Ошибка: Клиент с таким ID не существует.', 1
    end

    insert into Orders (CustomerID, OrderTotal, [Status])
    values (@customerid, @total, @status);

    select * from Orders where OrderID = scope_identity()
end
go
exec dbo.add_order @customerid = 1, @total = 5400.50 


-------------------------
use SalesDB;
update Orders set [Status] = 'Подтвержден' where OrderID = 1

use LogisticsDB;
select * from Shipments
select * from SalesDB.dbo.Orders

use SalesDB;
insert into Orders (CustomerID, OrderTotal) values (1, 100.0)
