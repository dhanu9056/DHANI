Create Procedure InsertIntoSupplier
		@Name varchar(50),
		@AddressLine varchar(50)=null,
		@City varchar(50)=null,
		@Pincode int=null,
		@SupplierState varchar(50)=null,
		@Country varchar(20)='India',	
		@MobileNo bigint=null			
As
	insert into Supplier(Name,AddressLine,City,Pincode,SupplierState,Country,MobileNo,EntryDate)values(@Name,@AddressLine,@City,@Pincode,@SupplierState,@Country,@MobileNo,getdate())
go
drop procedure InsertIntoSupplier

create procedure SelectAllFromSupplier
As
	select * from Supplier where IsDeleted=0;
go
drop procedure SelectAllFromSupplier

create procedure UpdateSupplierList
			@SupplierId int,
			@Name varchar(50),
			@AddressLine varchar(50)=null,
			@City varchar(50)=null,
			@Pincode int=null,
			@SupplierState varchar(50)=null,
			@Country varchar(20)='India',	
			@MobileNo bigint=null		
As
	update Supplier 
	SET
	Name=@Name,AddressLine=@AddressLine,City=@City,Pincode=@Pincode,SupplierState=@SupplierState,
	Country=@Country,MobileNo=@MobileNo
	where SupplierId=@SupplierId
go
drop procedure UpdateSupplierList

create procedure DeleteRecoredFromSupplierList
				@SupplierId int
As
		Update Supplier Set IsDeleted=1,DeletedDate=getdate()
		where SupplierId=@SupplierId
go
drop procedure DeleteRecoredFromSupplierList

drop procedure SelectSupplierListFromUpdateSupplier
go
create procedure SelectSupplierListFromUpdateSupplier
		@SupplierId int
as
		Select * from Supplier where SupplierId=@SupplierId and IsDeleted=0;
go

/*procedure for selectSupplierData from supplier for product purchase*/
create procedure SelectSupplierIdSupplierName
As
	select SupplierId,Name from Supplier where IsDeleted=0;
go
drop procedure SelectSupplierIdSupplierName

drop Procedure SelectAllSupplierOutstanding
go

/*Procedure for Supplier OutStanding*/
Create Procedure SelectAllSupplierOutstanding
As
	Select s.*, a.RemainingAmount
	From(Select SupplierId,Sum(RemainingAmount) as RemainingAmount
	From(Select pb.BillId,SupplierId,FinalAmount - ISNULL(PaidAmount,0) as RemainingAmount 
	from (Select BillId,SupplierId,FinalAmount from PurchaseBill Where BillMode = 'Credit') as pb 
	Left Join (Select BillId,Sum(Amount) as PaidAmount from PurchasePayment Group By BillId) as pp on pb.BillId = pp.BillId) as B
	Group By SupplierId having Sum(RemainingAmount)>0) as a Left Join Supplier as s on a.SupplierId = s.SupplierId
go
