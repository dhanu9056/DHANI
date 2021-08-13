use cake_shop;

create table UserLogin(
					UserId int identity(1,1) primary key,
					Name varchar(20) not null,
					LoginName varchar(10) not null unique,
					UserPassword varchar(10) not null,
					MobileNo bigint,
					Email varchar(30),
					EntryDate smalldatetime,
					IsDeleted bit default(0),
					DeleteDate smalldatetime
				);
select * from UserLogin;
drop table UserLogin	

create table Supplier(
						SupplierId int identity(1,1) primary key,
						Name varchar(50) not null,
						AddressLine varchar(50),
						City varchar(50),
						Pincode int,
						SupplierState varchar(50),
						Country varchar(20) default('India'),
						MobileNo bigint,
						EntryDate smalldatetime,
						IsDeleted bit default(0),
						DeletedDate smalldatetime
					);
Select * from Supplier;
drop table Supplier

create table Customer(
						CustomerId int identity(1,1) primary key,
						Name varchar(50) not null,
						AddressLine varchar(20),
						City varchar(50),
						Pincode int,
						CustomerState varchar(50),
						Country varchar(20) default('India'),
						MobileNo bigint,
						EntryDate smalldatetime,
						IsDeleted bit default(0),
						DeletedDate smalldatetime
					);
select * from Customer
drop table Customer

create table Product(
						ProductId int identity(1,1) primary key,
						ProductType varchar(20) not null,
						WithEgg varchar(5) not null,
						Flavor varchar (20) not null,
						Theme varchar(20),
						Occassion varchar(20),
						ProductWeight real not null,
						Measurement varchar(5),
						Shape varchar(10),
						BalanceQuantity int,
						SaleRate decimal(7,2) not null,
						EntryDate smalldatetime,
						IsDeleted bit default(0),
						DeletedDate smalldatetime
					);
select * from Product
drop table Product

create table PurchaseBill(
						BillId int identity(1,1) primary key,
						BillNo varchar(10) not null,
						BillMode varchar(7) check(BillMode in ('Cash','Credit'))not null,
						BillDate smalldatetime not null,
						SupplierId int foreign key references Supplier(SupplierId) not null,
						BillAmount decimal(8,2)not null,
						RoundupAmount decimal(8,2) check(RoundupAmount BETWEEN -0.50 AND 0.50) not null,     
						FinalAmount decimal(8,2) not null,
						EntryDate smalldatetime,
						IsDeleted bit default(0),
						DeletedDate smalldatetime
					);
select * from PurchaseBill
drop table PurchaseBill

create table PurchaseBillDetail(
								DetailId int identity(1,1) primary key,
								BillId int foreign key references PurchaseBill(BillId)not null,
								ProductId int foreign key references Product(ProductId) not null,
								Quantity int not null,
								Rate decimal(8,2) not null,
								Discount real check(Discount between 0 and 100),
								TotalAmount decimal(8,2) not null,
								EntryDate smalldatetime,
								IsDeleted bit default(0),
								DeletedDate smalldatetime
							);
drop table PurchaseBillDetail
select *from PurchaseBillDetail

create table SaleBill(
						BillId int identity(1,1) primary key,
						BillNo varchar(10) not null,
						BillMode varchar(7) check(BillMode in ('Cash','Credit'))not null,
						BillDate smalldatetime not null,
						CustomerId int foreign key references Customer(CustomerId) not null,
						BillAmount decimal(8,2)not null,
						RoundupAmount decimal(8,2) check(RoundupAmount BETWEEN -0.50 AND 0.50) not null,     
						FinalAmount decimal(8,2) not null,
						EntryDate smalldatetime,
						IsDeleted bit default(0),
						DeletedDate smalldatetime	
				);
Select * from SaleBill
drop table SaleBill
delete from SaleBill
create table SaleBillDetail(
								DetailId int identity(1,1) primary key,
								ProductId int foreign key references Product(ProductId)not null,
								BillId int foreign key references SaleBill(BillId)not null,
								Quantity  int,
								Rate decimal(8,2) not null,
								Discount real check(Discount between 0 and 100),
								TotalAmount decimal(8,2) not null,
								EntryDate smalldatetime,
								IsDeleted bit default(0),
								DeletedDate smalldatetime	
						);
Select * from SaleBillDetail
drop table SaleBillDetail
delete from SaleBillDetail
create table PurchasePayment(
							PaymentId int identity(1,1) primary key,
							PaymentDate smalldatetime not null,
							BillId int foreign key references PurchaseBill(BillId),
							SupplierId int foreign key references Supplier(SupplierId)not null,
							PaymentType varchar(20) not null check(PaymentType in('Cash','NEFT','RTGS','UPI','Card')),
							TransactionNo varchar(20), 
							Amount decimal(8,2) not null,
							EntryDate smalldatetime,
							IsDeleted bit default(0),
							DeletedDate smalldatetime
						);
drop table PurchasePayment
select * from PurchasePayment
delete from PurchasePayment
create table SalePayment(
							PaymentId int identity(1,1) primary key,
							PaymentDate smalldatetime not null,
							BillId int foreign key references SaleBill(BillId),
							CustomerId int foreign key references Customer(CustomerId) not null,
							PaymentType varchar(20) not null check(PaymentType in('Cash','NEFT','RTGS','UPI','Card')),
							TransactionNo varchar(20), 
							Amount decimal(8,2) not null,
							EntryDate smalldatetime,
							IsDeleted bit default(0),
							DeletedDate smalldatetime
						);
drop table SalePayment
select * from SalePayment





