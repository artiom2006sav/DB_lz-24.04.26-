create database SalesDB
use SalesDB

drop table Customers 


create table Customers(
	CustomerID int identity(1,1) primary key,
	FullName nvarchar(100) not null, 
	Email nvarchar(100) unique not null, 
	RegistrationDate datetime not null default getdate()
)

create table Orders(
	OrderID int identity(1,1) primary key, 
	CustomerID int not null, 
	OrderTotal float not null check(OrderTotal > 0), 
	OrderDate datetime not null default getdate(), 
	[Status] nvarchar(20) not null default 'Новый'
	foreign key (CustomerID) references Customers(CustomerID)
)
select * from Orders

insert into customers (fullname, email)
values 
	('Иванов Иван', 'ivanov@mail.ru'),
	('Петров Петр', 'petrov@yandex.ru'),
	('Сидорова Анна', 'sidorova@gmail.com'),
	('Кузнецов Алексей', 'kuznetsov@bk.ru'),
	('Павлова Мария', 'pavlova@mail.ru'),
	('Макаров Кирилл', 'makarov@yandex.ru'),
	('Андреев Василий', 'andreev@gmail.com'),
	('Сергеева Ольга', 'sergeeva@bk.ru'),
	('Федоров Артем', 'fedorov@mail.ru'),
	('Никитина Ирина', 'nikitina@yandex.ru'),
	('Егоров Павел', 'egorov@gmail.com'),
	('Степанова Юлия', 'stepanova@bk.ru'),
	('Николаев Роман', 'nikolaev@mail.ru'),
	('Морозова Светлана', 'morozova@yandex.ru'),
	('Волков Антон', 'volkov@gmail.com'),
	('Лебедева Инна', 'lebedeva@bk.ru'),
	('Семенов Денис', 'semenov@mail.ru'),
	('Белова Виктория', 'belova@yandex.ru'),
	('Тихонов Никита', 'tikhonov@gmail.com'),
	('Григорьева Лилия', 'grigoreva@bk.ru')

insert into orders (customerid, ordertotal, [status])
values 
	(1, 1500.50, 'Новый'),
	(2, 2300.00, 'Подтверждён'),
	(3, 850.00, 'Новый'),
	(4, 12000.00, 'Подтверждён'),
	(5, 450.00, 'Отменён'),
	(6, 3200.10, 'Новый'),
	(7, 990.00, 'Подтверждён'),
	(8, 5600.00, 'Новый'),
	(9, 1250.00, 'Подтверждён'),
	(10, 780.00, 'Отменён'),
	(11, 4300.00, 'Новый'),
	(12, 2100.50, 'Подтверждён'),
	(13, 670.00, 'Новый'),
	(14, 8900.00, 'Подтверждён'),
	(15, 340.00, 'Новый'),
	(16, 1100.00, 'Подтверждён'),
	(17, 5200.00, 'Новый'),
	(18, 2900.00, 'Подтверждён'),
	(19, 150.00, 'Отменён'),
	(20, 9500.00, 'Подтверждён')

