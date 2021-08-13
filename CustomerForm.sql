
Create Procedure InsertIntoCustomer
		@Name varchar(50),
		@AddressLine varchar(50)=null,
		@City varchar(50)=null,
		@Pincode int=null,				
		@CustomerState varchar(50)=null,
		@Country varchar(20)='India',
		@MobileNo bigint=null
		
As
	insert into Customer(Name,AddressLine,City,Pincode,CustomerState,Country,MobileNo,EntryDate)values(@Name,@AddressLine,@City,@Pincode,@CustomerState,@Country,@MobileNo,getdate())
go
drop Procedure InsertIntoCustomer

create procedure SelectAllFromCustomer
As
	select * from Customer where IsDeleted=0;
go
drop Procedure SelectAllFromCustomer

create procedure UpdateCustomerFromCustomerList
				@CustomerId int,
				@Name varchar(50),
				@AddressLine varchar(50)=null,
				@City varchar(50)=null,
				@Pincode int=null,				
				@CustomerState varchar(50)=null,
				@Country varchar(20)='India',
				@MobileNo bigint=null
As
	update Customer
	set
	Name=@Name,AddressLine=@AddressLine,City=@City,Pincode=@Pincode,
	CustomerState=@CustomerState,Country=@Country,MobileNo=@MobileNo
	where CustomerId=@CustomerId
go
drop procedure UpdateCustomerFromCustomerList

create procedure DeleteRecoredFromCustomerList
			@CustomerId int
As
		Update Customer Set IsDeleted=1,DeletedDate=getdate()
		where CustomerId=@CustomerId
go
drop procedure DeleteRecoredFromCustomerList

create procedure SelectCustomerListFromUpdateCustomer
		@CustomerId int
as
		Select * from Customer where CustomerId=@CustomerId and IsDeleted=0;
go

/*procedure for selectCustomerData from Customer for Sale Bill*/
create procedure SelectCustomerIdCustomerName
As
	select CustomerId,Name from Customer where IsDeleted=0;
go
drop procedure SelectCustomerIdCustomerName

/*Procedure for Customer OutStanding*/
Create Procedure SelectAllCustomerOutstanding
As
	Select c.*, a.RemainingAmount
	From(Select CustomerId,Sum(RemainingAmount) as RemainingAmount
	From(Select pb.BillId,CustomerId,FinalAmount - ISNULL(PaidAmount,0) as RemainingAmount 
	from (Select BillId,CustomerId,FinalAmount from SaleBill Where BillMode = 'Credit') as pb 
	Left Join (Select BillId,Sum(Amount) as PaidAmount from SalePayment Group By BillId) as pp on pb.BillId = pp.BillId) as B
	Group By CustomerId having Sum(RemainingAmount)>0) as a Left Join Customer as c on a.CustomerId = c.CustomerId
go
