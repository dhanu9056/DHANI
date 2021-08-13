use cake_shop;
drop Procedure InsertSaleBill
go
Create Procedure InsertSaleBill
						@BillNo varchar(10),
						@BillMode varchar(7),
						@BillDate smalldatetime,
						@CustomerId int,
						@BillAmount decimal(8,2),
						@RoundupAmount decimal(8,2),     
						@FinalAmount decimal(8,2),
						@DetailXML XML	
as
Begin Transaction
Begin try
	Declare @BillId int

	Insert into SaleBill(BillNo,BillMode,BillDate,CustomerId,BillAmount,RoundupAmount,FinalAmount,EntryDate)
	Values(@BillNo,@BillMode,@BillDate,@CustomerId,@BillAmount,@RoundupAmount,@FinalAmount,GETDATE())
	set @BillId=@@IDENTITY

	Declare @xmlHandler int
	Exec sp_xml_preparedocument @xmlHandler OUTPUT,@DetailXML;

	insert into SaleBillDetail(BillId,ProductId,Quantity,Rate,Discount,TotalAmount,EntryDate)
	select @BillId,ProductId,Quantity,Rate,Discount,Total,GETDATE()
	from OPENXML(@xmlHandler,N'/Root/Data')
	with
	(
		ProductId int,
		Quantity int,
		Rate decimal(8,2),
		Discount real,
		Total decimal(8,2)
	)

	update Product set BalanceQuantity=ISNULL(BalanceQuantity,0)-p.Quantity
	from OPENXML(@xmlHandler,N'/Root/Data')
	with
	(
		ProductId int,
		Quantity int,
		Rate decimal(8,2),
		Discount real,
		Total decimal(8,2)
	)as p where Product.ProductId=p.ProductId

	commit
End try
Begin Catch
	RollBack
	;throw
End Catch
go

create procedure SelectListSaleDetail
as
/*Select  * from PurchaseBill where IsDeletd=0*/
		select SaleBill.BillId,SaleBill.BillNo,SaleBill.BillMode,SaleBill.BillDate,SaleBill.FinalAmount,
		Customer.Name from SaleBill
		inner join Customer on SaleBill.CustomerId=Customer.CustomerId
go
select * from SaleBill
Select * from SaleBillDetail
select * from Product

/*Procedure for get FromDate to ToDate On PurchaseBill Report*/
Drop procedure FromDateToDateOnSaleDetail
go
CREATE procedure FromDateToDateOnSaleBillDetail
	@FromDate datetime,
	@ToDate datetime
as
	select * from SaleBill where BillDate between @FromDate and @ToDate order by BillDate
go

/*Procedure for Select all bill details from billId on purchaseBillDetailsReport*/
drop procedure SelectAllSaleBillWhereBillId
go
create procedure SelectAllSaleBillWhereBillId
	@BillId int
As 
	select * from SaleBill where BillId=@BillId and IsDeleted=0;
go

/*Procedure for Select data from PurchaseBillDetails*/
Drop Procedure SelectSaleBillDeatilFromBillDetails
go
Create Procedure SelectSaleBillDeatilFromBillDetails
		@BillId int
As
	select * from SaleBillDetail where BillId=@BillId and IsDeleted=0;
go

drop procedure SelectMaxBillNoFromSaleBill
Create Procedure SelectMaxBillNoFromSaleBill		
As
	select Max(BillNo) from SaleBill
go



