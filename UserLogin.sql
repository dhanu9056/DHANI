Create Procedure SelectUserCount
As
	Select Count(UserId) from UserLogin where IsDeleted=0;
go
drop Procedure SelectUserCount

Create Procedure InsertInRegistration
		@Name varchar(20),
		@LoginName varchar(20),
		@UserPassword varchar(15),
		@MobileNo bigint,
		@Email varchar(30)
As
	insert into UserLogin(Name,LoginName,UserPassword,MobileNo,Email,EntryDate)
	values(@Name,@LoginName,@UserPassword,@MobileNo,@Email,GetDate())
go
drop Procedure InsertInRegistration

Create Procedure SelectAllFromUserLoginWhereLoginNameAndUserPassword
		@LoginName varchar(20),
		@UserPassword varchar(10)
As
   select * from UserLogin where IsDeleted=0 and LoginName=@LoginName and UserPassword=@UserPassword
go
drop Procedure SelectAllFromUserLoginWhereLoginNameAndUserPassword