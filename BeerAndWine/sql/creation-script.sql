-- create db table Users

CREATE TABLE Users (
  Id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
  Username nvarchar(100) NOT NULL,
  Password nvarchar(100) NOT NULL,
  Email nvarchar(100) NOT NULL,
  Name nvarchar(100) NOT NULL,
  Role nvarchar(50) NOT NULL default 'User'
)


-- create db table Categories

CREATE TABLE Categories (
  Id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
  Name nvarchar(max) NOT NULL
)


-- create db table SubCategories

CREATE TABLE SubCategories (
  Id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
  Name nvarchar(max) NOT NULL,
  CategoryId int NOT NULL,
  CONSTRAINT FK_SubCategories_Categories FOREIGN KEY (CategoryId) REFERENCES Categories(id)
)


-- create db table Brands

CREATE TABLE Brands (
  Id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
  Name nvarchar(500) NOT NULL
)


-- create db table Products

CREATE TABLE Products (
  Id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
  Name nvarchar(max) NOT NULL,
  Price money NOT NULL,
  BrandId int NOT NULL,
  CategoryId int NOT NULL,
  SubCategoryId int NOT NULL,
  Description nvarchar(max) NULL,
  CONSTRAINT FK_Products_Brands FOREIGN KEY (BrandId) REFERENCES Brands(id),
  CONSTRAINT FK_Products_Categories FOREIGN KEY (CategoryId) REFERENCES Categories(id),
  CONSTRAINT FK_Products_SubCategories FOREIGN KEY (SubCategoryId) REFERENCES SubCategories(id)
)


-- create db table ProductImages

CREATE TABLE ProductImages (
  Id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
  ProductId int NOT NULL,
  Name nvarchar(max) NULL,
  Extension nvarchar(500) NULL,
  CONSTRAINT FK_ProductImages_Products FOREIGN KEY (ProductId) REFERENCES Products(id)
)


-- create db table Orders

CREATE TABLE Orders (
  Id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
  UserId int NOT NULL,
  TotalAmount money NOT NULL,
  PaymentType nvarchar(50) NOT NULL,
  PaymentStatus nvarchar(50) NULL,
  DateOfPurchase datetime NOT NULL,
  Name nvarchar(200) NOT NULL,
  Address nvarchar(max) NOT NULL,
  Phone nvarchar(50) NOT NULL,
  CONSTRAINT FK_Orders_Users FOREIGN KEY (UserId) REFERENCES Users(id)
)


-- create db table Orders

CREATE TABLE CardDetails (
  Id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
  OrderId int NOT NULL,
  CardNumber nvarchar(50) NOT NULL,
  ValidDate datetime NOT NULL,
  Code nvarchar(5) NOT NULL,
  CONSTRAINT FK_CardDetails_Orders FOREIGN KEY (OrderId) REFERENCES Orders(id)
)


-- create procedure BindAllProducts

create procedure BindAllProducts
as
select A.*,B.*,B.Name as ImageName, C.Name as BrandName 
from Products A
inner join Brands C on C.Id = A.BrandId
cross apply(select top 1 * 
            from ProductImages B 
            where B.ProductId = A.Id 
            order by B.ProductId desc
            ) as B
order by A.Id desc
return 0


-- create procedure InsertProduct

create procedure InsertProduct (
@Name nvarchar(MAX),
@Price money,
@BrandId int,
@CategoryId int,
@SubCategoryId int,
@Description nvarchar(MAX)
)
as
insert into Products values(@Name, @Price, @BrandId, @CategoryId, @SubCategoryId, @Description) 
select SCOPE_IDENTITY()
return 0