create procedure InsertIntoProduct
						@ProductType varchar(20),
						@WithEgg varchar(5),
						@Flavor varchar (20),
						@Theme varchar(20)=null,
						@Occassion varchar(20)=null,
						@ProductWeight real,
						@Measurement varchar(5),
						@Shape varchar(10)=null,
						@SaleRate decimal(7,2)
As
	insert into Product(ProductType,WithEgg,Flavor,Theme,Occassion,ProductWeight,Measurement,Shape,SaleRate,EntryDate)
	values(@ProductType,@WithEgg,@Flavor,@Theme,@Occassion,@ProductWeight,@Measurement,@Shape,@SaleRate,getdate())
go
drop procedure InsertIntoProduct

create procedure SelectAllFromProduct
As
	select * from Product where IsDeleted=0;
go
drop procedure SelectAllFromProduct

create procedure UpdateProductList
						@productId int,
						@ProductType varchar(20),
						@WithEgg varchar(5),
						@Flavor varchar (20),
						@Theme varchar(20)=null,
						@Occassion varchar(20)=null,
						@ProductWeight real,
						@Measurement varchar(5),
						@Shape varchar(10)=null,
						@SaleRate decimal(7,2)	
As
	update Product
	set
	ProductType=@ProductType,WithEgg=@WithEgg,Flavor=@Flavor,Theme=@Theme,
	Occassion=@Occassion,ProductWeight=@ProductWeight,Measurement=@Measurement,
	Shape=@Shape,SaleRate=@SaleRate
	where ProductId=@ProductId
go

drop procedure UpdateProductList

create procedure DeleteRecoredFromProductList
			@ProductId int
As
		Update Product set IsDeleted=1,DeletedDate=getdate()
		where ProductId=@ProductId
go
drop procedure DeleteRecoredFromProductList

create procedure SelectProductListFromUpdateProduct
		@ProductId int
As
		Select * from Product where ProductId=@ProductId and IsDeleted=0;
go

/*create procedure for product purchase bill*/
create procedure SelectProductIdProductTypeFromProduct
As
	select ProductId,ProductType+''+Flavor+''+'ProductWeight-'+Cast(ProductWeight as varchar)+''+Measurement as ProductType from Product where IsDeleted=0;
go
drop procedure SelectProductIdProductTypeFromProduct

/*Create procedure product for saleBill */
create procedure SelectProductIdProductTypeFromProduct
As
	select ProductId,ProductType from Product where IsDeleted=0;
go
drop procedure SelectProductIdProductTypeFromProduct

/* procedure for select saleRate from Product*/
create procedure SelectSaleRatefromProduct
			@ProductId int
As
	select SaleRate,BalanceQuantity from Product where ProductId=@ProductId and IsDeleted=0;
go
drop procedure SelectSaleRatefromProduct

