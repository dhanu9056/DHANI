Drop Procedure SelectAllRemainingPaymentOfSupplier
go
Create Procedure SelectAllRemainingPaymentOfSupplier
@SupplierId int
as

	Select pb.BillId,BillNo,BillDate,FinalAmount,FinalAmount as BillAmount,FinalAmount - ISNULL(PaidAmount,0) as RemainingAmount 
	from PurchaseBill as pb Left Join (Select BillId,Sum(Amount) as PaidAmount from PurchasePayment Group By BillId) as pp on pb.BillId = pp.BillId
	Where BillMode = 'Credit' and  (FinalAmount - ISNULL(PaidAmount,0))>0 and  pb.SupplierId = @SupplierId

go
drop procedure InsertDetailIntoPurchasePayment
go
create procedure InsertDetailIntoPurchasePayment
			@PaymentDate smalldatetime,
			@BillId int,
			@SupplierId int,
			@PaymentType varchar(20),
			@TransactionNo varchar(20),
			@Amount decimal(8,2)
as
		insert into PurchasePayment(PaymentDate,BillId,SupplierId,PaymentType,TransactionNo,Amount,EntryDate)
		values(@PaymentDate,@BillId,@SupplierId,@PaymentType,@TransactionNo,@Amount,GETDATE())
go
			

			