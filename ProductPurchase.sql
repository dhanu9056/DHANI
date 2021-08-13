/*Procedure for inert into Purchasedetails*/
drop Procedure InsertPurchaseBill
go
Create Procedure InsertPurchaseBill
						@BillNo varchar(10),
						@BillMode varchar(7),
						@BillDate smalldatetime,
						@SupplierId int,
						@BillAmount decimal(8,2),
						@RoundupAmount decimal(8,2),     
						@FinalAmount decimal(8,2),
						@DetailXML XML	
as
Begin Transaction
Begin try
	Declare @BillId int

	Insert into PurchaseBill(BillNo,BillMode,BillDate,SupplierId,BillAmount,RoundupAmount,FinalAmount,EntryDate)
	Values(@BillNo,@BillMode,@BillDate,@SupplierId,@BillAmount,@RoundupAmount,@FinalAmount,GETDATE())
	set @BillId=@@IDENTITY

	Declare @xmlHandler int
	Exec sp_xml_preparedocument @xmlHandler OUTPUT,@DetailXML;

	insert into PurchaseBillDetail(BillId,ProductId,Quantity,Rate,Discount,TotalAmount,EntryDate)
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

	update Product set BalanceQuantity=ISNULL(BalanceQuantity,0)+p.Quantity
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

select * from Product
select * from PurchaseBill
select * from PurchaseBillDetail 

/*Procedure for Select * from Purchase bill  */
create procedure SelectListPurchaseDetail
as
			
		select PurchaseBill.BillId,PurchaseBill.BillNo,PurchaseBill.BillMode,PurchaseBill.BillDate,PurchaseBill.FinalAmount,
		Supplier.Name from PurchaseBill
		inner join Supplier on PurchaseBill.SupplierId=Supplier.SupplierId
go

/*Procedure for get FromDate to ToDate On PurchaseBill Report*/
Drop procedure FromDateToDateOnPurchaseBillDetail
go
CREATE procedure FromDateToDateOnPurchaseBillDetail
	@FromDate datetime,
	@ToDate datetime
as
	select * from PurchaseBill where BillDate between @FromDate and @ToDate order by BillDate
go

/*Procedure for Select all bill details from billId on purchaseBillDetailsReport*/
drop procedure SelectAllPurchaseBillWhereBillId
go
create procedure SelectAllPurchaseBillWhereBillId
	@BillId int
As 
	select * from PurchaseBill where BillId=@BillId and IsDeleted=0;
go

/*Procedure for Select data from PurchaseBillDetails*/
Drop Procedure SelectPurchaseBillDeatilFromBillDetails
go
Create Procedure SelectPurchaseBillDeatilFromBillDetails
		@BillId int
As
	select * from PurchaseBillDetail where BillId=@BillId and IsDeleted=0;
go