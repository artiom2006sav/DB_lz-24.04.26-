create database LogisticsDB
use LogisticsDB

drop table Warehouses

create table Warehouses(
	WarehousesID int identity(1,1) primary key,
	Location nvarchar(100) unique not null, 
	Capacity float not null, 
	ManagerContact nvarchar(50) not null default 'Не назначен', 
	CreatedDate datetime not null default getdate()
)

create table Shipments(
	ShipmentsID int identity(1,1) primary key, 
	WarehousesID int not null, 
	OrderID int not null, 
	TrackingCode nvarchar(50) not null unique,
	[Weight] float not null, 
	DispatchDate datetime, 
	[Status] nvarchar(20)
	foreign key (WarehousesID) references Warehouses(WarehousesID)
)

insert into Warehouses (Location, Capacity, ManagerContact)
values 
    ('Москва, ул. Ленина, 10', 5000.0, '+7 (495) 111-22-33'),
    ('Санкт-Петербург, пр. Стачек, 45', 3500.0, '+7 (812) 222-33-44'),
    ('Екатеринбург, ул. Космонавтов, 12', 2800.0, '+7 (343) 333-44-55'),
    ('Новосибирск, ул. Большевистская, 90', 4200.0, 'Не назначен'),
    ('Краснодар, ул. Красная, 5', 1500.0, '+7 (861) 444-55-66');

insert into Shipments (WarehousesID, OrderID, TrackingCode, [Weight], DispatchDate, [Status])
values 
    (1, 1, 'TRK001-RU', 12.5, getdate(), 'В пути'),
    (1, 2, 'TRK002-RU', 5.0, getdate(), 'Доставлено'),
    (2, 4, 'TRK004-RU', 25.3, getdate(), 'В пути'),
    (3, 6, 'TRK006-RU', 2.1, null, 'Готовится'),
    (5, 7, 'TRK007-RU', 10.0, getdate(), 'В пути'),
    (2, 9, 'TRK009-RU', 1.5, getdate(), 'Доставлено'),
    (4, 11, 'TRK011-RU', 40.0, null, 'Готовится'),
    (1, 12, 'TRK012-RU', 8.7, getdate(), 'В пути'),
    (3, 14, 'TRK014-RU', 14.2, getdate(), 'Доставлено'),
    (5, 16, 'TRK016-RU', 3.3, getdate(), 'В пути')
