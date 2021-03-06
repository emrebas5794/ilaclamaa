USE [master]
GO
/****** Object:  Database [CozumleyenlerIlaclama]    Script Date: 15.12.2015 14:43:48 ******/
CREATE DATABASE [CozumleyenlerIlaclama]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CozumleyenlerIlaclama', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CozumleyenlerIlaclama.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CozumleyenlerIlaclama_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CozumleyenlerIlaclama_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CozumleyenlerIlaclama] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CozumleyenlerIlaclama].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CozumleyenlerIlaclama] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CozumleyenlerIlaclama] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CozumleyenlerIlaclama] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CozumleyenlerIlaclama] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CozumleyenlerIlaclama] SET ARITHABORT OFF 
GO
ALTER DATABASE [CozumleyenlerIlaclama] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CozumleyenlerIlaclama] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CozumleyenlerIlaclama] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CozumleyenlerIlaclama] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CozumleyenlerIlaclama] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CozumleyenlerIlaclama] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CozumleyenlerIlaclama] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CozumleyenlerIlaclama] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CozumleyenlerIlaclama] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CozumleyenlerIlaclama] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CozumleyenlerIlaclama] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CozumleyenlerIlaclama] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CozumleyenlerIlaclama] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CozumleyenlerIlaclama] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CozumleyenlerIlaclama] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CozumleyenlerIlaclama] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CozumleyenlerIlaclama] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CozumleyenlerIlaclama] SET RECOVERY FULL 
GO
ALTER DATABASE [CozumleyenlerIlaclama] SET  MULTI_USER 
GO
ALTER DATABASE [CozumleyenlerIlaclama] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CozumleyenlerIlaclama] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CozumleyenlerIlaclama] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CozumleyenlerIlaclama] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CozumleyenlerIlaclama] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CozumleyenlerIlaclama', N'ON'
GO
USE [CozumleyenlerIlaclama]
GO
/****** Object:  User [NT AUTHORITY\SYSTEM]    Script Date: 15.12.2015 14:43:48 ******/
CREATE USER [NT AUTHORITY\SYSTEM] FOR LOGIN [NT AUTHORITY\SYSTEM] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [NT AUTHORITY\SYSTEM]
GO
ALTER ROLE [db_datareader] ADD MEMBER [NT AUTHORITY\SYSTEM]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [NT AUTHORITY\SYSTEM]
GO
/****** Object:  Table [dbo].[Authorized]    Script Date: 15.12.2015 14:43:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authorized](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Bind] [uniqueidentifier] NOT NULL,
	[Ad] [nvarchar](100) NOT NULL,
	[Soyad] [nvarchar](100) NOT NULL,
	[Unvan] [nvarchar](100) NOT NULL,
	[Telefon] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NULL,
 CONSTRAINT [PK_Competent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[City]    Script Date: 15.12.2015 14:43:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Il] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 15.12.2015 14:43:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Bind] [uniqueidentifier] NOT NULL,
	[Ad] [nvarchar](250) NOT NULL,
	[FaturaUnvani] [nvarchar](250) NOT NULL,
	[TelNo] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Ilce] [nvarchar](100) NOT NULL,
	[Adres] [nvarchar](max) NOT NULL,
	[HizmetId] [nvarchar](100) NOT NULL,
	[DurumId] [int] NOT NULL,
	[FirmaTurId] [int] NOT NULL,
	[FirmaTipId] [int] NOT NULL,
	[SektorId] [int] NOT NULL,
	[IlId] [int] NOT NULL,
	[Renk] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomerActivity]    Script Date: 15.12.2015 14:43:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerActivity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MusteriId] [int] NOT NULL,
	[Aktivite] [nvarchar](200) NOT NULL,
	[Yetkili] [nvarchar](200) NULL,
	[Tarih] [datetime] NOT NULL CONSTRAINT [DF_CustomerActivity_Tarih]  DEFAULT (getdate()),
	[AktiviteNotu] [nvarchar](3000) NULL,
	[AktiviteSonucu] [nvarchar](200) NULL,
	[Hatirlatma] [nvarchar](50) NOT NULL,
	[HatirlatmaMesaji] [nvarchar](500) NULL,
	[HatirlatmaTarihi] [datetime] NULL,
	[Aktif] [int] NOT NULL,
 CONSTRAINT [PK_CustomerActivity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomerKind]    Script Date: 15.12.2015 14:43:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerKind](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirmaTip] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_CustomerKind] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomerType]    Script Date: 15.12.2015 14:43:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirmaTur] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_FirmaTip] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee]    Script Date: 15.12.2015 14:43:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Bind] [uniqueidentifier] NOT NULL,
	[Ad] [nvarchar](100) NOT NULL,
	[Soyad] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[BolgeId] [nvarchar](50) NOT NULL,
	[Adres] [nvarchar](200) NOT NULL,
	[CepTel] [nvarchar](100) NOT NULL,
	[Sifre] [nvarchar](50) NOT NULL,
	[AracPlaka] [nvarchar](50) NOT NULL,
	[Fotograf] [nvarchar](300) NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EmployeeNotification]    Script Date: 15.12.2015 14:43:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeNotification](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Icerik] [nvarchar](2000) NOT NULL,
	[MusteriId] [int] NULL,
	[Durum] [nvarchar](50) NOT NULL,
	[EklendigiTarih] [datetime] NOT NULL,
	[GosterilecegiTarih] [datetime] NULL,
	[EmployeeId] [int] NOT NULL,
 CONSTRAINT [PK_EmployeeNotification] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ExtraServiceContract]    Script Date: 15.12.2015 14:43:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExtraServiceContract](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Bind] [uniqueidentifier] NOT NULL,
	[HizmetTipi] [nvarchar](500) NOT NULL,
	[Personel] [nvarchar](50) NOT NULL,
	[Tarih] [datetime] NOT NULL,
	[Aciklama] [nvarchar](max) NOT NULL,
	[MusteriId] [int] NOT NULL,
 CONSTRAINT [PK_ExtraServiceContract] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Region]    Script Date: 15.12.2015 14:43:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Bolge] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Regions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sector]    Script Date: 15.12.2015 14:43:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sector](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Sektor] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Sektor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Service]    Script Date: 15.12.2015 14:43:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Bind] [uniqueidentifier] NOT NULL,
	[HizmetAdi] [nvarchar](250) NOT NULL,
	[HizmetGrupId] [int] NOT NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ServiceContract]    Script Date: 15.12.2015 14:43:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceContract](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Bind] [uniqueidentifier] NOT NULL,
	[HizmetTipi] [nvarchar](500) NOT NULL,
	[Personel] [nvarchar](100) NOT NULL,
	[Tarih] [datetime] NOT NULL,
	[Aciklama] [nvarchar](max) NOT NULL,
	[MusteriId] [int] NOT NULL,
 CONSTRAINT [PK_ServiceContract] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ServiceGroup]    Script Date: 15.12.2015 14:43:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceGroup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[HizmetGrup] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_ServiceGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Situation]    Script Date: 15.12.2015 14:43:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Situation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Durum] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Situation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Station]    Script Date: 15.12.2015 14:43:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Station](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [nvarchar](500) NOT NULL,
	[Tur] [nvarchar](200) NOT NULL,
	[Aciklama] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_Station] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StationCustomer]    Script Date: 15.12.2015 14:43:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StationCustomer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MusteriId] [int] NOT NULL,
	[IstasyonId] [int] NOT NULL,
	[Yer] [nvarchar](500) NOT NULL,
	[Tarih] [datetime] NOT NULL,
	[Aciklama] [nvarchar](500) NOT NULL,
	[Numara] [int] NULL,
 CONSTRAINT [PK_StationCustomer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[Customers_View]    Script Date: 15.12.2015 14:43:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Customers_View]
AS
SELECT        Id, Bind, Ad, TelNo, Email, Ilce, Adres, DurumId, FirmaTurId, FirmaTipId, SektorId, IlId,
                             (SELECT        Durum
                               FROM            dbo.Situation
                               WHERE        (Id = dbo.Customer.DurumId)) AS Durum,
                             (SELECT        FirmaTur
                               FROM            dbo.CustomerType
                               WHERE        (Id = dbo.Customer.FirmaTurId)) AS FirmaTur,
                             (SELECT        FirmaTip
                               FROM            dbo.CustomerKind
                               WHERE        (Id = dbo.Customer.FirmaTipId)) AS FirmaTip,
                             (SELECT        Sektor
                               FROM            dbo.Sector
                               WHERE        (Id = dbo.Customer.SektorId)) AS Sektor,
                             (SELECT        Il
                               FROM            dbo.City
                               WHERE        (Id = dbo.Customer.IlId)) AS Il, FaturaUnvani, HizmetId
FROM            dbo.Customer


GO
/****** Object:  View [dbo].[CustomerStation_View]    Script Date: 15.12.2015 14:43:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CustomerStation_View]
AS
SELECT        dbo.Station.Ad, dbo.Station.Tur, dbo.StationCustomer.Aciklama, dbo.StationCustomer.Numara, dbo.StationCustomer.Tarih, dbo.StationCustomer.Yer, dbo.StationCustomer.MusteriId, dbo.StationCustomer.Id, 
                         dbo.StationCustomer.IstasyonId
FROM            dbo.Station INNER JOIN
                         dbo.StationCustomer ON dbo.Station.Id = dbo.StationCustomer.IstasyonId

GO
/****** Object:  View [dbo].[Employees_View]    Script Date: 15.12.2015 14:43:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Employees_View]
AS
SELECT        dbo.Employee.Bind AS Expr2, dbo.Employee.Ad AS Expr3, dbo.Employee.Soyad AS Expr4, dbo.Employee.Email AS Expr5, dbo.Employee.Adres AS Expr6, dbo.Employee.CepTel AS Expr8, 
                         dbo.Employee.Sifre AS Expr9, dbo.Employee.AracPlaka AS Expr10, dbo.Employee.Fotograf AS Expr11, dbo.Region.Bolge, dbo.Employee.Bind, dbo.Employee.Ad, dbo.Employee.Soyad, dbo.Employee.Email, 
                         dbo.Employee.Adres AS BolgeId, dbo.Employee.CepTel, dbo.Employee.Sifre, dbo.Employee.AracPlaka, dbo.Employee.Fotograf, dbo.Employee.Id AS Expr1, dbo.Employee.BolgeId AS Expr12, dbo.Region.Id
FROM            dbo.Employee INNER JOIN
                         dbo.Region ON dbo.Employee.BolgeId = dbo.Region.Id


GO
/****** Object:  View [dbo].[Service_View]    Script Date: 15.12.2015 14:43:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Service_View]
AS
SELECT        dbo.ServiceGroup.HizmetGrup, dbo.Service.Id AS Expr1, dbo.Service.Bind AS Expr2, dbo.Service.HizmetAdi AS Expr3, dbo.Service.HizmetGrupId AS Expr4, dbo.Service.*
FROM            dbo.Service INNER JOIN
                         dbo.ServiceGroup ON dbo.Service.HizmetGrupId = dbo.ServiceGroup.Id


GO
/****** Object:  View [dbo].[ServiceContract_View]    Script Date: 15.12.2015 14:43:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ServiceContract_View]
AS
SELECT        ES.Tarih, ES.HizmetTipi, C.Ad, C.Renk
FROM            ExtraServiceContract AS ES JOIN
                         Customer AS C ON C.Id = ES.MusteriId
UNION ALL
SELECT        S.Tarih, S.HizmetTipi, C.Ad, C.Renk
FROM            ServiceContract AS S JOIN
                         Customer AS C ON C.Id = S.MusteriId

GO
SET IDENTITY_INSERT [dbo].[Authorized] ON 

INSERT [dbo].[Authorized] ([Id], [CustomerId], [Bind], [Ad], [Soyad], [Unvan], [Telefon], [Email]) VALUES (2012, 1025, N'e21ead84-1ad2-4569-8174-696c646d918a', N'ENKAXW', N'GBVJGHB', N'HVGJGVJ', N'2222222222', N'gtyugtı')
INSERT [dbo].[Authorized] ([Id], [CustomerId], [Bind], [Ad], [Soyad], [Unvan], [Telefon], [Email]) VALUES (2013, 4, N'2e1d7951-9016-4c7b-9413-850c300b10e3', N'RGEH', N'GG', N'GG', N'2222222222', N'egg')
INSERT [dbo].[Authorized] ([Id], [CustomerId], [Bind], [Ad], [Soyad], [Unvan], [Telefon], [Email]) VALUES (3013, 3, N'30f968c1-bd4b-42f6-8971-fdfe11084340', N'VFE', N'EEE', N'EEE', N'3333333333', N'fgqg3t')
INSERT [dbo].[Authorized] ([Id], [CustomerId], [Bind], [Ad], [Soyad], [Unvan], [Telefon], [Email]) VALUES (3015, 1, N'5f90b54c-0820-4093-b38a-99feed48f491', N'ENES', N'HOIHOI', N'HHOIH', N'4444444444', N'bkjçnn')
INSERT [dbo].[Authorized] ([Id], [CustomerId], [Bind], [Ad], [Soyad], [Unvan], [Telefon], [Email]) VALUES (3016, 1, N'989ea225-43c7-4b64-9a5c-ea9f48fd3be7', N'EMİNE', N'CİNCİ', N'İK', N'2222222222', N'mkmmm')
INSERT [dbo].[Authorized] ([Id], [CustomerId], [Bind], [Ad], [Soyad], [Unvan], [Telefon], [Email]) VALUES (3017, 1, N'ac771ba6-ea9b-435f-865d-9056f12d18cf', N'İİİİİİŞŞŞŞŞ', N'CİNCİ', N'KOKK', N'7777777777', N'7hhnhuı')
INSERT [dbo].[Authorized] ([Id], [CustomerId], [Bind], [Ad], [Soyad], [Unvan], [Telefon], [Email]) VALUES (3018, 1, N'9c2f3ca9-b212-428d-b6e4-c68a59c5ab16', N'MESUT', N'SEYHAN', N'UZAMAN', N'7777777777', N'uhuhjk')
INSERT [dbo].[Authorized] ([Id], [CustomerId], [Bind], [Ad], [Soyad], [Unvan], [Telefon], [Email]) VALUES (3019, 1, N'f4d1ffd0-ef2e-482b-885a-176b515d6e45', N'CCC', N'CCC', N'CCC', N'2222222222', N'2222')
SET IDENTITY_INSERT [dbo].[Authorized] OFF
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([Id], [Il]) VALUES (1, N'İSTANBUL')
INSERT [dbo].[City] ([Id], [Il]) VALUES (2, N'ANKARA')
INSERT [dbo].[City] ([Id], [Il]) VALUES (3, N'BURSA')
INSERT [dbo].[City] ([Id], [Il]) VALUES (4, N'ORDU')
SET IDENTITY_INSERT [dbo].[City] OFF
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Id], [Bind], [Ad], [FaturaUnvani], [TelNo], [Email], [Ilce], [Adres], [HizmetId], [DurumId], [FirmaTurId], [FirmaTipId], [SektorId], [IlId], [Renk]) VALUES (31, N'6f84eb18-a737-4b3c-a6a4-e19b9e2dab3e', N'REW', N'DSA', N'2222222222', N'd', N'D', N'D', N'19', 1, 16, 3, 3, 1, N'rgb(92, 76, 106)')
INSERT [dbo].[Customer] ([Id], [Bind], [Ad], [FaturaUnvani], [TelNo], [Email], [Ilce], [Adres], [HizmetId], [DurumId], [FirmaTurId], [FirmaTipId], [SektorId], [IlId], [Renk]) VALUES (32, N'0c4fea67-92b9-4083-92ba-09ea4026dabb', N'QWERT', N'QWER', N'3333333333', N'QWERT', N'QWER', N'QWER', N'24', 2, 16, 3, 4, 2, N'rgb(191, 9, 195)')
INSERT [dbo].[Customer] ([Id], [Bind], [Ad], [FaturaUnvani], [TelNo], [Email], [Ilce], [Adres], [HizmetId], [DurumId], [FirmaTurId], [FirmaTipId], [SektorId], [IlId], [Renk]) VALUES (33, N'b1ba62c3-91ba-43c5-881f-295dd9989244', N'İŞ BANKASI ', N'İŞ BANKASI AŞ', N'3333333333', N'dw', N'KADIKÖY', N'SDC', N'28', 1, 16, 1, 4, 2, N'rgb(25, 196, 227)')
INSERT [dbo].[Customer] ([Id], [Bind], [Ad], [FaturaUnvani], [TelNo], [Email], [Ilce], [Adres], [HizmetId], [DurumId], [FirmaTurId], [FirmaTipId], [SektorId], [IlId], [Renk]) VALUES (34, N'4078fe1d-de8a-49fd-b190-fe34c88ca7e5', N'TİARPİ ', N'TİARPİ YAZILIM', N'2222222222', N'e', N'BEYKOZ', N'WE', N'25', 3, 15, 3, 1, 1, N'rgb(143, 158, 246)')
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[CustomerActivity] ON 

INSERT [dbo].[CustomerActivity] ([Id], [MusteriId], [Aktivite], [Yetkili], [Tarih], [AktiviteNotu], [AktiviteSonucu], [Hatirlatma], [HatirlatmaMesaji], [HatirlatmaTarihi], [Aktif]) VALUES (5, 1, N'SMS GÖNDERİLDİ', N'3016', CAST(N'2015-11-24 12:03:27.290' AS DateTime), N'güzel ve verimli bir toplantıydı', N'%100 OLUMLU', N'Evet', N'fg5', CAST(N'2015-11-06 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[CustomerActivity] ([Id], [MusteriId], [Aktivite], [Yetkili], [Tarih], [AktiviteNotu], [AktiviteSonucu], [Hatirlatma], [HatirlatmaMesaji], [HatirlatmaTarihi], [Aktif]) VALUES (9, 1, N'SMS GÖNDERİLDİ', N'3017', CAST(N'2015-11-25 13:42:11.647' AS DateTime), N'ggg', N'%90 OLUMLU', N'Evet', N'gggg', CAST(N'2015-11-25 13:48:00.000' AS DateTime), 1)
INSERT [dbo].[CustomerActivity] ([Id], [MusteriId], [Aktivite], [Yetkili], [Tarih], [AktiviteNotu], [AktiviteSonucu], [Hatirlatma], [HatirlatmaMesaji], [HatirlatmaTarihi], [Aktif]) VALUES (10, 1, N'DAHA SONRA GÖRÜŞÜLECEK', N'3015', CAST(N'2015-11-25 13:44:54.613' AS DateTime), N'güzeldi', N'%50 OLUMLU', N'Evet', N'hatirlat', CAST(N'2015-11-25 06:03:00.000' AS DateTime), 1)
INSERT [dbo].[CustomerActivity] ([Id], [MusteriId], [Aktivite], [Yetkili], [Tarih], [AktiviteNotu], [AktiviteSonucu], [Hatirlatma], [HatirlatmaMesaji], [HatirlatmaTarihi], [Aktif]) VALUES (11, 1, N'SÖZLEŞME YAPILDI', N'3018', CAST(N'2015-11-25 15:14:14.490' AS DateTime), N'sssxcergh', N'%90 OLUMLU', N'Evet', N'xxxxx', CAST(N'2016-01-26 19:21:00.000' AS DateTime), 1)
INSERT [dbo].[CustomerActivity] ([Id], [MusteriId], [Aktivite], [Yetkili], [Tarih], [AktiviteNotu], [AktiviteSonucu], [Hatirlatma], [HatirlatmaMesaji], [HatirlatmaTarihi], [Aktif]) VALUES (12, 1, N'ULAŞILAMADI', N'3017', CAST(N'2015-11-25 15:32:43.483' AS DateTime), N'4444', N'%20 OLUMLU', N'Evet', N'eeeeee', CAST(N'2015-12-01 16:32:00.000' AS DateTime), 1)
INSERT [dbo].[CustomerActivity] ([Id], [MusteriId], [Aktivite], [Yetkili], [Tarih], [AktiviteNotu], [AktiviteSonucu], [Hatirlatma], [HatirlatmaMesaji], [HatirlatmaTarihi], [Aktif]) VALUES (13, 1, N'E-POSTA GÖNDERİLDİ', N'3016', CAST(N'2015-11-26 17:48:44.083' AS DateTime), N'wef', N'%50 OLUMLU', N'Evet', N'wwww', CAST(N'2015-11-11 20:48:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[CustomerActivity] OFF
SET IDENTITY_INSERT [dbo].[CustomerKind] ON 

INSERT [dbo].[CustomerKind] ([Id], [FirmaTip]) VALUES (1, N'EV')
INSERT [dbo].[CustomerKind] ([Id], [FirmaTip]) VALUES (3, N'OKUL')
SET IDENTITY_INSERT [dbo].[CustomerKind] OFF
SET IDENTITY_INSERT [dbo].[CustomerType] ON 

INSERT [dbo].[CustomerType] ([Id], [FirmaTur]) VALUES (15, N'BİREYSEL')
INSERT [dbo].[CustomerType] ([Id], [FirmaTur]) VALUES (16, N'KURUMSAL')
SET IDENTITY_INSERT [dbo].[CustomerType] OFF
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Id], [Bind], [Ad], [Soyad], [Email], [BolgeId], [Adres], [CepTel], [Sifre], [AracPlaka], [Fotograf]) VALUES (1022, N'27facc7a-5a2f-4097-be55-6d50ed4cc28e', N'EMİNE NUR ', N'CİNCİ', N'e', N'10', N'ERTYU', N'2222222222', N'12345', N'34THYFF', N'/Files/Image/135a5b2b-43a0-42c5-aff6-caba31f18cd8.png')
INSERT [dbo].[Employee] ([Id], [Bind], [Ad], [Soyad], [Email], [BolgeId], [Adres], [CepTel], [Sifre], [AracPlaka], [Fotograf]) VALUES (1023, N'fabd3f08-375c-49c2-8945-7b6cdd1a7d19', N'MEHMET', N'YAVKI', N'm', N'10', N'dfghj', N'2222222222', N'12345', N'GHJK', N'/Files/Image/f25c2b20-067c-4f8a-b2f2-bc52a8404f83.jpg')
INSERT [dbo].[Employee] ([Id], [Bind], [Ad], [Soyad], [Email], [BolgeId], [Adres], [CepTel], [Sifre], [AracPlaka], [Fotograf]) VALUES (1024, N'54b5ed23-c4da-4ea2-b827-38f6cf4a0f09', N'KAZIM', N'PEK', N'k', N'10', N'sdfghj', N'2222222222', N'12345', N'SDFGHJK', N'/Files/Image/281208e4-2e34-4609-9916-be1193851783.jpg')
INSERT [dbo].[Employee] ([Id], [Bind], [Ad], [Soyad], [Email], [BolgeId], [Adres], [CepTel], [Sifre], [AracPlaka], [Fotograf]) VALUES (1025, N'd8103b4a-57f5-48bf-86e0-28232f2745cb', N'ŞEYMA', N'FAZ', N's', N'11', N'wqertyuı', N'2345678345', N'12345', N'234RT5Y', N'/Files/Image/c1818286-dc0e-43b0-88b2-18d619bb28ea.jpg')
SET IDENTITY_INSERT [dbo].[Employee] OFF
SET IDENTITY_INSERT [dbo].[EmployeeNotification] ON 

INSERT [dbo].[EmployeeNotification] ([Id], [Icerik], [MusteriId], [Durum], [EklendigiTarih], [GosterilecegiTarih], [EmployeeId]) VALUES (17, N'28', 33, N'OKUNDU', CAST(N'2015-04-12 16:16:41.000' AS DateTime), CAST(N'2015-12-01 16:16:00.000' AS DateTime), 1021)
INSERT [dbo].[EmployeeNotification] ([Id], [Icerik], [MusteriId], [Durum], [EklendigiTarih], [GosterilecegiTarih], [EmployeeId]) VALUES (18, N'24', 33, N'OKUNMADI', CAST(N'2015-04-12 16:16:41.000' AS DateTime), CAST(N'2015-12-18 16:16:00.000' AS DateTime), 1021)
INSERT [dbo].[EmployeeNotification] ([Id], [Icerik], [MusteriId], [Durum], [EklendigiTarih], [GosterilecegiTarih], [EmployeeId]) VALUES (19, N'30', 33, N'OKUNDU', CAST(N'2015-04-12 16:16:41.000' AS DateTime), CAST(N'2015-12-03 16:16:00.000' AS DateTime), 1021)
INSERT [dbo].[EmployeeNotification] ([Id], [Icerik], [MusteriId], [Durum], [EklendigiTarih], [GosterilecegiTarih], [EmployeeId]) VALUES (20, N'24,25', 34, N'OKUNDU', CAST(N'2015-12-04 23:14:40.660' AS DateTime), CAST(N'2015-12-04 23:14:00.000' AS DateTime), 1021)
INSERT [dbo].[EmployeeNotification] ([Id], [Icerik], [MusteriId], [Durum], [EklendigiTarih], [GosterilecegiTarih], [EmployeeId]) VALUES (21, N'19,27', 31, N'OKUNMADI', CAST(N'2015-12-04 23:18:16.070' AS DateTime), CAST(N'2015-12-17 23:17:00.000' AS DateTime), 1021)
INSERT [dbo].[EmployeeNotification] ([Id], [Icerik], [MusteriId], [Durum], [EklendigiTarih], [GosterilecegiTarih], [EmployeeId]) VALUES (22, N'28,24', 31, N'OKUNMADI', CAST(N'2015-04-12 23:18:58.000' AS DateTime), CAST(N'2015-11-30 23:18:00.000' AS DateTime), 0)
INSERT [dbo].[EmployeeNotification] ([Id], [Icerik], [MusteriId], [Durum], [EklendigiTarih], [GosterilecegiTarih], [EmployeeId]) VALUES (23, N'24', 31, N'OKUNMADI', CAST(N'2015-04-12 23:18:58.000' AS DateTime), CAST(N'2015-12-23 23:18:00.000' AS DateTime), 0)
INSERT [dbo].[EmployeeNotification] ([Id], [Icerik], [MusteriId], [Durum], [EklendigiTarih], [GosterilecegiTarih], [EmployeeId]) VALUES (24, N'25,30', 31, N'OKUNMADI', CAST(N'2015-04-12 23:18:58.000' AS DateTime), CAST(N'2015-12-04 23:18:00.000' AS DateTime), 0)
INSERT [dbo].[EmployeeNotification] ([Id], [Icerik], [MusteriId], [Durum], [EklendigiTarih], [GosterilecegiTarih], [EmployeeId]) VALUES (25, N'24,27', 31, N'OKUNDU', CAST(N'2015-12-04 23:25:02.450' AS DateTime), CAST(N'2015-10-27 01:23:00.000' AS DateTime), 1021)
INSERT [dbo].[EmployeeNotification] ([Id], [Icerik], [MusteriId], [Durum], [EklendigiTarih], [GosterilecegiTarih], [EmployeeId]) VALUES (26, N'24', 31, N'OKUNMADI', CAST(N'2015-12-05 10:06:46.903' AS DateTime), CAST(N'2015-12-06 10:06:00.000' AS DateTime), 1021)
INSERT [dbo].[EmployeeNotification] ([Id], [Icerik], [MusteriId], [Durum], [EklendigiTarih], [GosterilecegiTarih], [EmployeeId]) VALUES (27, N'24,25', 31, N'OKUNDU', CAST(N'2015-05-12 10:07:18.000' AS DateTime), CAST(N'2015-12-05 10:06:00.000' AS DateTime), 1021)
INSERT [dbo].[EmployeeNotification] ([Id], [Icerik], [MusteriId], [Durum], [EklendigiTarih], [GosterilecegiTarih], [EmployeeId]) VALUES (28, N'25', 31, N'OKUNDU', CAST(N'2015-05-12 10:07:18.000' AS DateTime), CAST(N'2015-12-01 10:06:00.000' AS DateTime), 1021)
INSERT [dbo].[EmployeeNotification] ([Id], [Icerik], [MusteriId], [Durum], [EklendigiTarih], [GosterilecegiTarih], [EmployeeId]) VALUES (29, N'28', 32, N'OKUNDU', CAST(N'2015-05-12 12:04:14.000' AS DateTime), CAST(N'2015-12-05 12:04:00.000' AS DateTime), 1021)
INSERT [dbo].[EmployeeNotification] ([Id], [Icerik], [MusteriId], [Durum], [EklendigiTarih], [GosterilecegiTarih], [EmployeeId]) VALUES (30, N'27', 32, N'OKUNMADI', CAST(N'2015-12-05 12:04:30.577' AS DateTime), CAST(N'2015-12-01 12:03:00.000' AS DateTime), 1021)
INSERT [dbo].[EmployeeNotification] ([Id], [Icerik], [MusteriId], [Durum], [EklendigiTarih], [GosterilecegiTarih], [EmployeeId]) VALUES (31, N'28', 33, N'OKUNMADI', CAST(N'2015-05-12 12:06:21.000' AS DateTime), CAST(N'2015-12-05 12:05:00.000' AS DateTime), 1021)
INSERT [dbo].[EmployeeNotification] ([Id], [Icerik], [MusteriId], [Durum], [EklendigiTarih], [GosterilecegiTarih], [EmployeeId]) VALUES (32, N'24', 33, N'OKUNMADI', CAST(N'2015-05-12 12:06:21.000' AS DateTime), CAST(N'2015-11-30 12:05:00.000' AS DateTime), 1021)
INSERT [dbo].[EmployeeNotification] ([Id], [Icerik], [MusteriId], [Durum], [EklendigiTarih], [GosterilecegiTarih], [EmployeeId]) VALUES (33, N'30', 33, N'OKUNMADI', CAST(N'2015-05-12 12:06:21.000' AS DateTime), CAST(N'2015-12-18 12:05:00.000' AS DateTime), 1021)
INSERT [dbo].[EmployeeNotification] ([Id], [Icerik], [MusteriId], [Durum], [EklendigiTarih], [GosterilecegiTarih], [EmployeeId]) VALUES (34, N'19', 33, N'OKUNMADI', CAST(N'2015-05-12 12:06:21.000' AS DateTime), CAST(N'2015-12-05 12:05:00.000' AS DateTime), 1023)
INSERT [dbo].[EmployeeNotification] ([Id], [Icerik], [MusteriId], [Durum], [EklendigiTarih], [GosterilecegiTarih], [EmployeeId]) VALUES (35, N'28,24,19', 33, N'OKUNMADI', CAST(N'2015-05-12 12:06:21.000' AS DateTime), CAST(N'2015-12-05 12:05:00.000' AS DateTime), 1021)
INSERT [dbo].[EmployeeNotification] ([Id], [Icerik], [MusteriId], [Durum], [EklendigiTarih], [GosterilecegiTarih], [EmployeeId]) VALUES (36, N'30', 33, N'OKUNMADI', CAST(N'2015-10-12 16:42:16.000' AS DateTime), CAST(N'2015-12-11 16:41:00.000' AS DateTime), 1022)
INSERT [dbo].[EmployeeNotification] ([Id], [Icerik], [MusteriId], [Durum], [EklendigiTarih], [GosterilecegiTarih], [EmployeeId]) VALUES (37, N'27,19', 33, N'OKUNMADI', CAST(N'2015-10-12 16:42:16.000' AS DateTime), CAST(N'2015-12-19 16:41:00.000' AS DateTime), 1024)
INSERT [dbo].[EmployeeNotification] ([Id], [Icerik], [MusteriId], [Durum], [EklendigiTarih], [GosterilecegiTarih], [EmployeeId]) VALUES (38, N'24', 33, N'OKUNMADI', CAST(N'2015-10-12 16:42:16.000' AS DateTime), CAST(N'2015-12-23 16:41:00.000' AS DateTime), 1022)
INSERT [dbo].[EmployeeNotification] ([Id], [Icerik], [MusteriId], [Durum], [EklendigiTarih], [GosterilecegiTarih], [EmployeeId]) VALUES (39, N'27,19', 33, N'OKUNMADI', CAST(N'2015-10-12 16:42:16.000' AS DateTime), CAST(N'2015-12-10 16:41:00.000' AS DateTime), 1022)
INSERT [dbo].[EmployeeNotification] ([Id], [Icerik], [MusteriId], [Durum], [EklendigiTarih], [GosterilecegiTarih], [EmployeeId]) VALUES (40, N'28', 33, N'OKUNMADI', CAST(N'2015-12-10 16:43:35.973' AS DateTime), CAST(N'2015-12-29 16:43:00.000' AS DateTime), 1022)
INSERT [dbo].[EmployeeNotification] ([Id], [Icerik], [MusteriId], [Durum], [EklendigiTarih], [GosterilecegiTarih], [EmployeeId]) VALUES (41, N'25', 34, N'OKUNMADI', CAST(N'2015-12-10 16:44:34.207' AS DateTime), CAST(N'2015-12-09 16:44:00.000' AS DateTime), 1024)
INSERT [dbo].[EmployeeNotification] ([Id], [Icerik], [MusteriId], [Durum], [EklendigiTarih], [GosterilecegiTarih], [EmployeeId]) VALUES (42, N'28', 34, N'OKUNMADI', CAST(N'2015-12-10 16:44:45.573' AS DateTime), CAST(N'2015-12-09 16:44:00.000' AS DateTime), 1022)
SET IDENTITY_INSERT [dbo].[EmployeeNotification] OFF
SET IDENTITY_INSERT [dbo].[ExtraServiceContract] ON 

INSERT [dbo].[ExtraServiceContract] ([Id], [Bind], [HizmetTipi], [Personel], [Tarih], [Aciklama], [MusteriId]) VALUES (6, N'25407f3d-986f-4263-bedf-73a3b542983f', N'24,28', N'2', CAST(N'2015-12-06 17:15:00.000' AS DateTime), N'', 6)
INSERT [dbo].[ExtraServiceContract] ([Id], [Bind], [HizmetTipi], [Personel], [Tarih], [Aciklama], [MusteriId]) VALUES (7, N'a4000812-b28a-42a6-bfb0-4ef0f3451c66', N'30', N'7', CAST(N'2015-12-16 17:17:00.000' AS DateTime), N'', 6)
INSERT [dbo].[ExtraServiceContract] ([Id], [Bind], [HizmetTipi], [Personel], [Tarih], [Aciklama], [MusteriId]) VALUES (8, N'94185083-f60b-4486-b9ae-ec68700567c3', N'24,25', N'1021', CAST(N'2015-12-04 23:14:00.000' AS DateTime), N'', 34)
INSERT [dbo].[ExtraServiceContract] ([Id], [Bind], [HizmetTipi], [Personel], [Tarih], [Aciklama], [MusteriId]) VALUES (9, N'86503653-9c88-4de3-81b3-694a4b0b31bb', N'19,27', N'1021', CAST(N'2015-12-02 23:17:00.000' AS DateTime), N'aswerty', 31)
INSERT [dbo].[ExtraServiceContract] ([Id], [Bind], [HizmetTipi], [Personel], [Tarih], [Aciklama], [MusteriId]) VALUES (10, N'65faa7b7-eb87-4a06-afc4-c8f0d9ec37fa', N'24,27', N'1021', CAST(N'2015-10-27 01:23:00.000' AS DateTime), N'', 31)
INSERT [dbo].[ExtraServiceContract] ([Id], [Bind], [HizmetTipi], [Personel], [Tarih], [Aciklama], [MusteriId]) VALUES (11, N'eb6a4499-d10c-4d0d-9895-18231bf0276d', N'24', N'1021', CAST(N'2015-12-06 10:06:00.000' AS DateTime), N'', 31)
INSERT [dbo].[ExtraServiceContract] ([Id], [Bind], [HizmetTipi], [Personel], [Tarih], [Aciklama], [MusteriId]) VALUES (12, N'5e8edb7d-fc4c-4ca6-b4d4-cb2d4e24f690', N'27', N'1021', CAST(N'2015-12-01 12:03:00.000' AS DateTime), N'ert', 32)
INSERT [dbo].[ExtraServiceContract] ([Id], [Bind], [HizmetTipi], [Personel], [Tarih], [Aciklama], [MusteriId]) VALUES (13, N'7adee75a-6daa-480b-959b-00f83fba35b5', N'28', N'1022', CAST(N'2015-12-29 16:43:00.000' AS DateTime), N'cvbnmöç.', 33)
INSERT [dbo].[ExtraServiceContract] ([Id], [Bind], [HizmetTipi], [Personel], [Tarih], [Aciklama], [MusteriId]) VALUES (14, N'0a7b2091-4cb1-460c-bede-b8c3423d2a80', N'25', N'1024', CAST(N'2015-12-09 16:44:00.000' AS DateTime), N'zxcvbnmöç', 34)
INSERT [dbo].[ExtraServiceContract] ([Id], [Bind], [HizmetTipi], [Personel], [Tarih], [Aciklama], [MusteriId]) VALUES (15, N'defb8fd5-e168-4e21-bdca-811b2a9ed996', N'28', N'1022', CAST(N'2015-12-09 16:44:00.000' AS DateTime), N'xcvbnmöç', 34)
SET IDENTITY_INSERT [dbo].[ExtraServiceContract] OFF
SET IDENTITY_INSERT [dbo].[Region] ON 

INSERT [dbo].[Region] ([Id], [Bolge]) VALUES (1, N'MARMARA 1. BÖLGE')
INSERT [dbo].[Region] ([Id], [Bolge]) VALUES (10, N'DOĞU ANADOLU')
INSERT [dbo].[Region] ([Id], [Bolge]) VALUES (11, N'GÜNEYDOĞU ANAOLU')
SET IDENTITY_INSERT [dbo].[Region] OFF
SET IDENTITY_INSERT [dbo].[Sector] ON 

INSERT [dbo].[Sector] ([Id], [Sektor]) VALUES (1, N'YAZILIM')
INSERT [dbo].[Sector] ([Id], [Sektor]) VALUES (3, N'GIDA')
INSERT [dbo].[Sector] ([Id], [Sektor]) VALUES (4, N'EĞİTİM')
INSERT [dbo].[Sector] ([Id], [Sektor]) VALUES (5, N'TARIM')
SET IDENTITY_INSERT [dbo].[Sector] OFF
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([Id], [Bind], [HizmetAdi], [HizmetGrupId]) VALUES (19, N'58cf102e-bbf8-4afc-a6e5-eefc558b8d46', N'WWWW', 11)
INSERT [dbo].[Service] ([Id], [Bind], [HizmetAdi], [HizmetGrupId]) VALUES (24, N'a2e19962-02d1-439b-a080-5d01ec1e3229', N'SİVRİ SİNEK', 6)
INSERT [dbo].[Service] ([Id], [Bind], [HizmetAdi], [HizmetGrupId]) VALUES (25, N'e414b56f-f256-424f-9183-af786429d13b', N'AKREP', 4)
INSERT [dbo].[Service] ([Id], [Bind], [HizmetAdi], [HizmetGrupId]) VALUES (27, N'37ff48c5-cec2-4236-b748-ebfb0db46310', N'FARE', 10)
INSERT [dbo].[Service] ([Id], [Bind], [HizmetAdi], [HizmetGrupId]) VALUES (28, N'aeb3e1c7-0599-455d-acc2-f369bee96e2b', N'TAHTA KURUSU', 9)
INSERT [dbo].[Service] ([Id], [Bind], [HizmetAdi], [HizmetGrupId]) VALUES (30, N'739e28ba-77ca-46ca-a07f-2f32fbfd6e63', N'UÇAN PİRE', 7)
SET IDENTITY_INSERT [dbo].[Service] OFF
SET IDENTITY_INSERT [dbo].[ServiceContract] ON 

INSERT [dbo].[ServiceContract] ([Id], [Bind], [HizmetTipi], [Personel], [Tarih], [Aciklama], [MusteriId]) VALUES (203, N'e7e0a310-b906-4b73-9864-1cf0bc4451ac', N'28', N'1021', CAST(N'2015-12-01 16:16:00.000' AS DateTime), N'', 33)
INSERT [dbo].[ServiceContract] ([Id], [Bind], [HizmetTipi], [Personel], [Tarih], [Aciklama], [MusteriId]) VALUES (204, N'16e9da2e-ac3f-4d08-9226-4affb566b159', N'24', N'1021', CAST(N'2015-12-18 16:16:00.000' AS DateTime), N'', 33)
INSERT [dbo].[ServiceContract] ([Id], [Bind], [HizmetTipi], [Personel], [Tarih], [Aciklama], [MusteriId]) VALUES (205, N'9f679d03-94a1-443c-a56b-450c32aee928', N'30', N'1021', CAST(N'2015-12-03 16:16:00.000' AS DateTime), N'', 33)
INSERT [dbo].[ServiceContract] ([Id], [Bind], [HizmetTipi], [Personel], [Tarih], [Aciklama], [MusteriId]) VALUES (206, N'6b5af9e4-6a68-438e-876d-b5d3718c50a3', N'28,24', N'', CAST(N'2015-11-30 23:18:00.000' AS DateTime), N'', 31)
INSERT [dbo].[ServiceContract] ([Id], [Bind], [HizmetTipi], [Personel], [Tarih], [Aciklama], [MusteriId]) VALUES (207, N'e09ac141-3438-4636-b423-52e2d5c1352b', N'24', N'', CAST(N'2015-12-23 23:18:00.000' AS DateTime), N'', 31)
INSERT [dbo].[ServiceContract] ([Id], [Bind], [HizmetTipi], [Personel], [Tarih], [Aciklama], [MusteriId]) VALUES (208, N'6024520f-4a28-4966-9051-934b37921f0b', N'25,30', N'', CAST(N'2015-12-04 23:18:00.000' AS DateTime), N'', 31)
INSERT [dbo].[ServiceContract] ([Id], [Bind], [HizmetTipi], [Personel], [Tarih], [Aciklama], [MusteriId]) VALUES (209, N'43023a24-b582-4720-8310-2a9d4614c2e3', N'24,25', N'1021', CAST(N'2015-12-05 10:06:00.000' AS DateTime), N'', 31)
INSERT [dbo].[ServiceContract] ([Id], [Bind], [HizmetTipi], [Personel], [Tarih], [Aciklama], [MusteriId]) VALUES (210, N'd07a2ec0-92f3-4d60-9d13-f12d9a0377dd', N'25', N'1021', CAST(N'2015-12-01 10:06:00.000' AS DateTime), N'', 31)
INSERT [dbo].[ServiceContract] ([Id], [Bind], [HizmetTipi], [Personel], [Tarih], [Aciklama], [MusteriId]) VALUES (211, N'3cbbc3dd-a840-43bd-a720-56d7a65720f7', N'28', N'1021', CAST(N'2015-12-05 12:04:00.000' AS DateTime), N'dfrgthyju', 32)
INSERT [dbo].[ServiceContract] ([Id], [Bind], [HizmetTipi], [Personel], [Tarih], [Aciklama], [MusteriId]) VALUES (212, N'c0404100-9a40-4b82-92b8-97e54f2cab02', N'28', N'1021', CAST(N'2015-12-05 12:05:00.000' AS DateTime), N'', 33)
INSERT [dbo].[ServiceContract] ([Id], [Bind], [HizmetTipi], [Personel], [Tarih], [Aciklama], [MusteriId]) VALUES (213, N'9db051d9-72d3-407d-98de-88faabaebd44', N'24', N'1021', CAST(N'2015-11-30 12:05:00.000' AS DateTime), N'', 33)
INSERT [dbo].[ServiceContract] ([Id], [Bind], [HizmetTipi], [Personel], [Tarih], [Aciklama], [MusteriId]) VALUES (214, N'b364a53a-5530-4ce9-b521-a8ecc9e5e256', N'30', N'1021', CAST(N'2015-12-18 12:05:00.000' AS DateTime), N'', 33)
INSERT [dbo].[ServiceContract] ([Id], [Bind], [HizmetTipi], [Personel], [Tarih], [Aciklama], [MusteriId]) VALUES (215, N'badf1475-8149-4607-9669-630655dd337b', N'19', N'1023', CAST(N'2015-12-05 12:05:00.000' AS DateTime), N'', 33)
INSERT [dbo].[ServiceContract] ([Id], [Bind], [HizmetTipi], [Personel], [Tarih], [Aciklama], [MusteriId]) VALUES (216, N'a7229fa3-071a-41d1-8014-89a7204bd366', N'28,24,19', N'1021', CAST(N'2015-12-05 12:05:00.000' AS DateTime), N'', 33)
INSERT [dbo].[ServiceContract] ([Id], [Bind], [HizmetTipi], [Personel], [Tarih], [Aciklama], [MusteriId]) VALUES (217, N'1ca74e0f-7cd8-4f06-92a1-c1077041de01', N'30', N'1022', CAST(N'2015-12-11 16:41:00.000' AS DateTime), N'', 33)
INSERT [dbo].[ServiceContract] ([Id], [Bind], [HizmetTipi], [Personel], [Tarih], [Aciklama], [MusteriId]) VALUES (218, N'1ecddd32-9af1-4644-a3ca-56d5e2ca60dc', N'27,19', N'1024', CAST(N'2015-12-19 16:41:00.000' AS DateTime), N'', 33)
INSERT [dbo].[ServiceContract] ([Id], [Bind], [HizmetTipi], [Personel], [Tarih], [Aciklama], [MusteriId]) VALUES (219, N'34e3d331-fca7-4e62-88ec-5d2f81067895', N'24', N'1022', CAST(N'2015-12-23 16:41:00.000' AS DateTime), N'', 33)
INSERT [dbo].[ServiceContract] ([Id], [Bind], [HizmetTipi], [Personel], [Tarih], [Aciklama], [MusteriId]) VALUES (220, N'4fa7c530-fb2d-4499-b306-1b271e7f1670', N'27,19', N'1022', CAST(N'2015-12-10 16:41:00.000' AS DateTime), N'', 33)
SET IDENTITY_INSERT [dbo].[ServiceContract] OFF
SET IDENTITY_INSERT [dbo].[ServiceGroup] ON 

INSERT [dbo].[ServiceGroup] ([Id], [HizmetGrup]) VALUES (3, N'KARINCA')
INSERT [dbo].[ServiceGroup] ([Id], [HizmetGrup]) VALUES (4, N'AKREP')
INSERT [dbo].[ServiceGroup] ([Id], [HizmetGrup]) VALUES (5, N'HİJYEN')
INSERT [dbo].[ServiceGroup] ([Id], [HizmetGrup]) VALUES (6, N'UÇAN HAŞERAT')
INSERT [dbo].[ServiceGroup] ([Id], [HizmetGrup]) VALUES (7, N'PİRE')
INSERT [dbo].[ServiceGroup] ([Id], [HizmetGrup]) VALUES (8, N'KEDİ TOPLAMAK')
INSERT [dbo].[ServiceGroup] ([Id], [HizmetGrup]) VALUES (9, N'HAŞERE KONTROLÜ')
INSERT [dbo].[ServiceGroup] ([Id], [HizmetGrup]) VALUES (10, N'KEMİRGEN KONTROLÜ')
INSERT [dbo].[ServiceGroup] ([Id], [HizmetGrup]) VALUES (11, N'DİĞER')
SET IDENTITY_INSERT [dbo].[ServiceGroup] OFF
SET IDENTITY_INSERT [dbo].[Situation] ON 

INSERT [dbo].[Situation] ([Id], [Durum]) VALUES (1, N'AKTİF')
INSERT [dbo].[Situation] ([Id], [Durum]) VALUES (2, N'PASİF')
INSERT [dbo].[Situation] ([Id], [Durum]) VALUES (3, N'DÖNEMSEL HİZMET')
SET IDENTITY_INSERT [dbo].[Situation] OFF
SET IDENTITY_INSERT [dbo].[Station] ON 

INSERT [dbo].[Station] ([Id], [Ad], [Tur], [Aciklama]) VALUES (4, N'R3T', N'FEG', N'WFGT')
INSERT [dbo].[Station] ([Id], [Ad], [Tur], [Aciklama]) VALUES (7, N'ENES', N'TJTJ', N'FEGTFF')
INSERT [dbo].[Station] ([Id], [Ad], [Tur], [Aciklama]) VALUES (8, N'FEG', N'GE', N'EGY')
INSERT [dbo].[Station] ([Id], [Ad], [Tur], [Aciklama]) VALUES (9, N'RHEHRGRH', N'FW', N'WWW')
INSERT [dbo].[Station] ([Id], [Ad], [Tur], [Aciklama]) VALUES (1002, N'EFC', N'EEE', N'EEEE')
INSERT [dbo].[Station] ([Id], [Ad], [Tur], [Aciklama]) VALUES (1003, N'FARE', N'KAPAN', N'ÖLDÜRÜCÜ')
INSERT [dbo].[Station] ([Id], [Ad], [Tur], [Aciklama]) VALUES (1004, N'TİMSAH', N'ÖLDÜRÜCÜ', N'TİMSAH ÖLDÜRÜR')
SET IDENTITY_INSERT [dbo].[Station] OFF
SET IDENTITY_INSERT [dbo].[StationCustomer] ON 

INSERT [dbo].[StationCustomer] ([Id], [MusteriId], [IstasyonId], [Yer], [Tarih], [Aciklama], [Numara]) VALUES (2, 4, 1004, N'yatak odası', CAST(N'2015-01-12 00:00:00.000' AS DateTime), N'öldürücü', 2)
INSERT [dbo].[StationCustomer] ([Id], [MusteriId], [IstasyonId], [Yer], [Tarih], [Aciklama], [Numara]) VALUES (1004, 2, 7, N'patlıcan', CAST(N'2015-01-28 00:00:00.000' AS DateTime), N'3f22', 3)
INSERT [dbo].[StationCustomer] ([Id], [MusteriId], [IstasyonId], [Yer], [Tarih], [Aciklama], [Numara]) VALUES (1018, 1, 1003, N'tuvalet', CAST(N'2015-11-12 00:00:00.000' AS DateTime), N'dikkat', 1)
INSERT [dbo].[StationCustomer] ([Id], [MusteriId], [IstasyonId], [Yer], [Tarih], [Aciklama], [Numara]) VALUES (1019, 1, 1003, N'kapı arkası', CAST(N'2015-11-12 00:00:00.000' AS DateTime), N'hde', 2)
INSERT [dbo].[StationCustomer] ([Id], [MusteriId], [IstasyonId], [Yer], [Tarih], [Aciklama], [Numara]) VALUES (1020, 1, 7, N'hrj55', CAST(N'2015-11-06 00:00:00.000' AS DateTime), N'5yyy', 3)
INSERT [dbo].[StationCustomer] ([Id], [MusteriId], [IstasyonId], [Yer], [Tarih], [Aciklama], [Numara]) VALUES (1027, 1, 7, N'', CAST(N'2015-11-25 00:00:00.000' AS DateTime), N'', 4)
INSERT [dbo].[StationCustomer] ([Id], [MusteriId], [IstasyonId], [Yer], [Tarih], [Aciklama], [Numara]) VALUES (1030, 1, 7, N'', CAST(N'2015-11-25 00:00:00.000' AS DateTime), N'', 7)
INSERT [dbo].[StationCustomer] ([Id], [MusteriId], [IstasyonId], [Yer], [Tarih], [Aciklama], [Numara]) VALUES (1031, 1, 7, N'', CAST(N'2015-11-12 00:00:00.000' AS DateTime), N'', 8)
INSERT [dbo].[StationCustomer] ([Id], [MusteriId], [IstasyonId], [Yer], [Tarih], [Aciklama], [Numara]) VALUES (1032, 7, 8, N'', CAST(N'2015-12-01 00:00:00.000' AS DateTime), N'', 1)
INSERT [dbo].[StationCustomer] ([Id], [MusteriId], [IstasyonId], [Yer], [Tarih], [Aciklama], [Numara]) VALUES (1033, 7, 8, N'', CAST(N'2015-12-01 00:00:00.000' AS DateTime), N'', 2)
INSERT [dbo].[StationCustomer] ([Id], [MusteriId], [IstasyonId], [Yer], [Tarih], [Aciklama], [Numara]) VALUES (1039, 31, 1003, N'banyo', CAST(N'2015-12-09 00:00:00.000' AS DateTime), N'ÇOK TEHLİKELİDCGHVWCEBRNTMYŞBVDLSAfxxvfgtkg', 5)
INSERT [dbo].[StationCustomer] ([Id], [MusteriId], [IstasyonId], [Yer], [Tarih], [Aciklama], [Numara]) VALUES (1040, 31, 1004, N'mutfak', CAST(N'2015-12-18 00:00:00.000' AS DateTime), N'asdfghjuklşisadfghjklşisdfghjklşwertyuıopsdfghjklşwertyuıopertyuıo', 6)
INSERT [dbo].[StationCustomer] ([Id], [MusteriId], [IstasyonId], [Yer], [Tarih], [Aciklama], [Numara]) VALUES (1041, 31, 1003, N'yatak odası', CAST(N'2015-12-17 00:00:00.000' AS DateTime), N'ertyuıopwertyuıoertyuısfghjklwertyuırtyuı', 7)
INSERT [dbo].[StationCustomer] ([Id], [MusteriId], [IstasyonId], [Yer], [Tarih], [Aciklama], [Numara]) VALUES (1042, 31, 1004, N'kiler', CAST(N'2015-12-26 00:00:00.000' AS DateTime), N'ertyuıoertyuıo', 8)
INSERT [dbo].[StationCustomer] ([Id], [MusteriId], [IstasyonId], [Yer], [Tarih], [Aciklama], [Numara]) VALUES (1051, 33, 1004, N'bv', CAST(N'2015-12-05 00:00:00.000' AS DateTime), N'İlk planda bilgi verme amacı güdülür. Okuyucu bir konuda aydınlatılmaya çalışılır. Makale, deneme, fikir yazıları ve bilimsel yazılarda sıkça kullanılır. b) Tartışma: Yazar okura kendi görüşünü benimsetmeye çalışır. Okur bir konuda yönlendirilir. Devrik cümleler ve soru cümleleri hakim olabilir. Bence, bana göre, benim anladığım... gibi ifadelere dikkat edilmelidir.', 9)
INSERT [dbo].[StationCustomer] ([Id], [MusteriId], [IstasyonId], [Yer], [Tarih], [Aciklama], [Numara]) VALUES (1052, 33, 1003, N'bvc', CAST(N'2015-12-05 00:00:00.000' AS DateTime), N'wertyuıoıujyhg', 10)
INSERT [dbo].[StationCustomer] ([Id], [MusteriId], [IstasyonId], [Yer], [Tarih], [Aciklama], [Numara]) VALUES (1053, 33, 1004, N'bv', CAST(N'2015-12-05 00:00:00.000' AS DateTime), N'', 11)
INSERT [dbo].[StationCustomer] ([Id], [MusteriId], [IstasyonId], [Yer], [Tarih], [Aciklama], [Numara]) VALUES (1054, 33, 1003, N'nbv', CAST(N'2015-12-05 00:00:00.000' AS DateTime), N'', 12)
INSERT [dbo].[StationCustomer] ([Id], [MusteriId], [IstasyonId], [Yer], [Tarih], [Aciklama], [Numara]) VALUES (1056, 34, 9, N'', CAST(N'2015-12-05 00:00:00.000' AS DateTime), N'qwertyuıopASDFGHJKLŞİ,', 1)
INSERT [dbo].[StationCustomer] ([Id], [MusteriId], [IstasyonId], [Yer], [Tarih], [Aciklama], [Numara]) VALUES (1057, 34, 9, N'', CAST(N'2015-12-05 00:00:00.000' AS DateTime), N'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 2)
INSERT [dbo].[StationCustomer] ([Id], [MusteriId], [IstasyonId], [Yer], [Tarih], [Aciklama], [Numara]) VALUES (1058, 34, 9, N'', CAST(N'2015-12-05 00:00:00.000' AS DateTime), N'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 3)
INSERT [dbo].[StationCustomer] ([Id], [MusteriId], [IstasyonId], [Yer], [Tarih], [Aciklama], [Numara]) VALUES (1059, 34, 9, N'', CAST(N'2015-12-05 00:00:00.000' AS DateTime), N'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', 4)
SET IDENTITY_INSERT [dbo].[StationCustomer] OFF
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[26] 4[16] 2[30] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -96
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Customer"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 324
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 18
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Customers_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Customers_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[21] 2[21] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Station"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 154
               Right = 229
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "StationCustomer"
            Begin Extent = 
               Top = 0
               Left = 360
               Bottom = 198
               Right = 530
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CustomerStation_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CustomerStation_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Employee"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 276
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Region"
            Begin Extent = 
               Top = 12
               Left = 388
               Bottom = 247
               Right = 558
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 25
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Employees_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Employees_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[8] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Service"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 229
               Right = 441
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ServiceGroup"
            Begin Extent = 
               Top = 25
               Left = 614
               Bottom = 121
               Right = 784
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Service_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Service_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[22] 4[13] 2[33] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -96
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ServiceContract_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ServiceContract_View'
GO
USE [master]
GO
ALTER DATABASE [CozumleyenlerIlaclama] SET  READ_WRITE 
GO
