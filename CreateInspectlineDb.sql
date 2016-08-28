
use "Inspectline"

go

if exists (select * from sysobjects where id = object_id('dbo.Customers') and sysstat & 0xf = 3)
	drop table "dbo"."Customers"

go

if exists (select * from sysobjects where id = object_id('dbo.Employees') and sysstat & 0xf = 3)
	drop table "dbo"."Employees"

go

if exists (select * from sysobjects where id = object_id('dbo.CustomerVehicle') and sysstat & 0xf = 3)
	drop table "dbo"."CustomerVehicle"

go

if exists (select * from sysobjects where id = object_id('dbo.Shop') and sysstat & 0xf = 3)
	drop table "dbo"."Shop"

go

if exists (select * from sysobjects where id = object_id('dbo.Inspection') and sysstat & 0xf = 3)
	drop table "dbo"."Inspection"
GO

CREATE TABLE Customers (
	"CustomerID" int IDENTITY (1, 1) NOT NULL ,
	"CustomerVehicleID" int NULL ,
	"LastName" nvarchar (20) NOT NULL ,
	"FirstName" nvarchar (10) NOT NULL ,
	"Title" nvarchar (30) NULL ,
	"Address" nvarchar (60) NULL ,
	"City" nvarchar (20) NULL ,
	"State" nvarchar (20) NULL ,
	"ZipCode" nvarchar (10) NULL ,
	"Country" nvarchar (15) NULL ,
	"CellPhone" nvarchar (24) NULL ,
	"HomePhone" nvarchar (24) NULL ,
	"Email" nvarchar (320) NULL ,
	CONSTRAINT "PK_Customers" PRIMARY KEY  CLUSTERED 
	(
		"CustomerID"
	)
)

GO
 CREATE  INDEX "City" ON "dbo"."Customers"("City")

 GO
 CREATE  INDEX "PostalCode" ON "dbo"."Customers"("ZipCode")

GO
CREATE TABLE "Employees" (
	"EmployeeID" int IDENTITY (1, 1) NOT NULL ,
	"LastName" nvarchar (20) NOT NULL ,
	"FirstName" nvarchar (10) NOT NULL ,
	"Title" nvarchar (30) NULL ,
	"BirthDate" "datetime" NULL ,
	"HireDate" "datetime" NULL ,
	"Address" nvarchar (60) NULL ,
	"City" nvarchar (20) NULL ,
	"State" nvarchar (20) NULL ,
	"ZipCode" nvarchar (10) NULL ,
	"Country" nvarchar (15) NULL ,
	"CellPhone" nvarchar (24) NULL ,
	"HomePhone" nvarchar (24) NULL ,
	"Email" nvarchar (320) NULL ,
		CONSTRAINT "PK_Employees" PRIMARY KEY  CLUSTERED 
	(
		"EmployeeID"
	),
	CONSTRAINT "CK_Birthdate" CHECK (BirthDate < getdate())
)
GO
 CREATE  INDEX "LastName" ON "dbo"."Employees"("LastName")
GO
 CREATE  INDEX "PostalCode" ON "dbo"."Employees"("ZipCode")
GO


GO
CREATE TABLE "CustomerVehicle" (
	"CustomerVehicleID" int IDENTITY (1, 1) NOT NULL ,
	"YearID" int NOT NULL,
    "MakeName" nvarchar (50) NOT NULL,
    "ModelName" nvarchar (100) NOT NULL,
    "SubmodelName" nvarchar (50) NULL,
    "Liter" nvarchar (6) NULL,
    "BaseVehicleID"  int NULL,
    "EngineBaseID" int NULL,
	CONSTRAINT "PK_CustomerVehicle" PRIMARY KEY  CLUSTERED 
	(
		"CustomerVehicleID"
	)
)

GO
CREATE TABLE "Shop" (
	"ShopID" int IDENTITY (1, 1) NOT NULL ,
    "ShopName" nvarchar (100) NOT NULL,
    "AddedOnDate" datetime NOT NULL,
    "Address" nvarchar (60) NULL ,
	"City" nvarchar (20) NULL ,
	"State" nvarchar (20) NULL ,
	"ZipCode" nvarchar (10) NULL ,
	"Country" nvarchar (15) NULL ,
	"ShopPhone" nvarchar (24) NULL ,
	"ShopEmail" nvarchar (320) NULL ,
	"ShopWebsite" nvarchar (320) NULL ,
	CONSTRAINT "PK_Shop" PRIMARY KEY  CLUSTERED 
	(
		"ShopID"
	)
)
GO
CREATE TABLE "Inspection" (
	"InspectionID" int IDENTITY (1, 1) NOT NULL ,
	"ShopID" int NOT NULL ,
    "CustomerID" int NOT NULL,
	"CustomerVehicleID" int NOT NULL ,
    "InspectionDate" datetime NOT NULL,
    "InspectionMileage" nvarchar (15) NOT NULL ,
	"InspectionResultID" int NULL,
	"EmployeeID" int NULL,
	CONSTRAINT "PK_Inspection" PRIMARY KEY  CLUSTERED 
	(
		"InspectionID"
	)
)