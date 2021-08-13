/*Procedure for All Remaining Payment of Customer*/

drop Procedure SelectAllRemainingPaymentOfCustomer
go
Create Procedure SelectAllRemainingPaymentOfCustomer
@CustomerId int
as

	Select pb.BillId,BillNo,BillDate,FinalAmount,FinalAmount as BillAmount,FinalAmount - ISNULL(PaidAmount,0) as RemainingAmount 
	from SaleBill as pb Left Join (Select BillId,Sum(Amount) as PaidAmount from SalePayment Group By BillId) as pp on pb.BillId = pp.BillId
	Where BillMode = 'Credit' and  (FinalAmount - ISNULL(PaidAmount,0))>0 and  pb.CustomerId = @CustomerId

go

drop procedure InsertDetailIntoSalePayment
go
create procedure InsertDetailIntoSalePayment
			@PaymentDate smalldatetime,
			@BillId int,
			@CustomerId int,
			@PaymentType varchar(20),
			@TransactionNo varchar(20),
			@Amount decimal(8,2)
as
		insert into SalePayment(PaymentDate,BillId,CustomerId,PaymentType,TransactionNo,Amount,EntryDate)
		values(@PaymentDate,@BillId,@CustomerId,@PaymentType,@TransactionNo,@Amount,GETDATE())
go
		