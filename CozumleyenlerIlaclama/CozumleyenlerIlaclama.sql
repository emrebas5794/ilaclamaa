USE [CozumleyenlerIlaclama]
GO
/****** Object:  Table [dbo].[Authorized]    Script Date: 11.11.2015 16:45:07 ******/
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
/****** Object:  Table [dbo].[City]    Script Date: 11.11.2015 16:45:07 ******/
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
/****** Object:  Table [dbo].[Customer]    Script Date: 11.11.2015 16:45:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Bind] [uniqueidentifier] NOT NULL,
	[Ad] [nvarchar](250) NOT NULL,
	[TelNo] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Ilce] [nvarchar](100) NOT NULL,
	[Adres] [nvarchar](max) NOT NULL,
	[Aktif] [int] NOT NULL,
	[FirmaTurId] [int] NOT NULL,
	[FirmaTipId] [int] NOT NULL,
	[SektorId] [int] NOT NULL,
	[IlId] [int] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomerKind]    Script Date: 11.11.2015 16:45:07 ******/
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
/****** Object:  Table [dbo].[CustomerType]    Script Date: 11.11.2015 16:45:07 ******/
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
/****** Object:  Table [dbo].[Employee]    Script Date: 11.11.2015 16:45:07 ******/
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
	[Adres] [nvarchar](200) NOT NULL,
	[BolgeId] [int] NOT NULL,
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
/****** Object:  Table [dbo].[Product]    Script Date: 11.11.2015 16:45:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Bınd] [uniqueidentifier] NOT NULL,
	[UrunAd] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Region]    Script Date: 11.11.2015 16:45:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Bind] [nvarchar](100) NOT NULL,
	[Bolge] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Regions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sector]    Script Date: 11.11.2015 16:45:07 ******/
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
/****** Object:  View [dbo].[Customers_View]    Script Date: 11.11.2015 16:45:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Customers_View]
AS
SELECT        dbo.City.Il, dbo.CustomerKind.FirmaTip, dbo.CustomerType.FirmaTur, dbo.Sector.Sektor, dbo.Customer.Ad, dbo.Customer.TelNo, dbo.Customer.Email, dbo.Customer.Adres, dbo.Customer.Aktif, dbo.Customer.Ilce, 
                         dbo.Customer.Id, dbo.Customer.Bind
FROM            dbo.City INNER JOIN
                         dbo.Customer ON dbo.City.Id = dbo.Customer.IlId INNER JOIN
                         dbo.CustomerType ON dbo.Customer.FirmaTurId = dbo.CustomerType.Id INNER JOIN
                         dbo.CustomerKind ON dbo.Customer.FirmaTipId = dbo.CustomerKind.Id INNER JOIN
                         dbo.Sector ON dbo.Customer.SektorId = dbo.Sector.Id

GO
/****** Object:  View [dbo].[Employees_View]    Script Date: 11.11.2015 16:45:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Employees_View]
AS
SELECT        dbo.Employee.Id AS Expr1, dbo.Employee.Bind AS Expr2, dbo.Employee.Ad AS Expr3, dbo.Employee.Soyad AS Expr4, dbo.Employee.Email AS Expr5, dbo.Employee.Adres AS Expr6, 
                         dbo.Employee.BolgeId AS Expr7, dbo.Employee.CepTel AS Expr8, dbo.Employee.Sifre AS Expr9, dbo.Employee.AracPlaka AS Expr10, dbo.Employee.Fotograf AS Expr11, dbo.Region.Bolge, 
                         dbo.Region.Id AS Expr12, dbo.Employee.*
FROM            dbo.Employee INNER JOIN
                         dbo.Region ON dbo.Employee.BolgeId = dbo.Region.Id

GO
SET IDENTITY_INSERT [dbo].[Authorized] ON 

INSERT [dbo].[Authorized] ([Id], [CustomerId], [Bind], [Ad], [Soyad], [Unvan], [Telefon], [Email]) VALUES (1009, 14, N'027bdf0a-adcd-4337-861f-bc9f5732cbaf', N'EMİNE', N'CİNCİ', N'JIJ', N'1111111111', N'uytgyugtı')
INSERT [dbo].[Authorized] ([Id], [CustomerId], [Bind], [Ad], [Soyad], [Unvan], [Telefon], [Email]) VALUES (1017, 6, N'1fb6ccfb-4528-4748-a353-113237e2c02a', N'AAH5TRU5', N'AAA', N'AAA', N'2222222222', N'cdewfe')
INSERT [dbo].[Authorized] ([Id], [CustomerId], [Bind], [Ad], [Soyad], [Unvan], [Telefon], [Email]) VALUES (2010, 7, N'b57efe79-e944-4fd9-ad15-44af5fb1182c', N'KEMAL', N'HAS', N'OIOI', N'1111111111', N'JHIOJOI')
INSERT [dbo].[Authorized] ([Id], [CustomerId], [Bind], [Ad], [Soyad], [Unvan], [Telefon], [Email]) VALUES (2011, 6, N'9d18f8b2-890c-4e09-9689-a6b9e51562da', N'YUSUF', N'CARIK', N'İK', N'1111111111', N'zwxxw')
SET IDENTITY_INSERT [dbo].[Authorized] OFF
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([Id], [Il]) VALUES (1, N'İSTANBUL')
INSERT [dbo].[City] ([Id], [Il]) VALUES (2, N'ANKARA')
INSERT [dbo].[City] ([Id], [Il]) VALUES (3, N'BURSA')
INSERT [dbo].[City] ([Id], [Il]) VALUES (4, N'ORDU')
SET IDENTITY_INSERT [dbo].[City] OFF
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Id], [Bind], [Ad], [TelNo], [Email], [Ilce], [Adres], [Aktif], [FirmaTurId], [FirmaTipId], [SektorId], [IlId]) VALUES (6, N'd2f7cb22-af2d-4168-b1c0-03ec29148eb1', N'MAHMUT', N'2222222222', N'wxxxx', N'WXZ', N'WX', 1, 1, 2, 2, 4)
INSERT [dbo].[Customer] ([Id], [Bind], [Ad], [TelNo], [Email], [Ilce], [Adres], [Aktif], [FirmaTurId], [FirmaTipId], [SektorId], [IlId]) VALUES (7, N'fdb524df-5e63-4fb7-b563-f8b9eef0cd6c', N'TİARPİ', N'7777777777', N'yyyyyyyyyyyyyyyyyyyyy', N'YYYYYYYYYYY', N'YYYYYYYYYYYYYYYYYYYYYYYYYYY', 2, 2, 1, 1, 3)
INSERT [dbo].[Customer] ([Id], [Bind], [Ad], [TelNo], [Email], [Ilce], [Adres], [Aktif], [FirmaTurId], [FirmaTipId], [SektorId], [IlId]) VALUES (14, N'e6b92381-682a-4eac-a079-470fc81c1e37', N'ŞEYMA', N'2222222222', N'wd', N'ÜMRANİYE', N'DDW', 1, 1, 3, 1, 1)
INSERT [dbo].[Customer] ([Id], [Bind], [Ad], [TelNo], [Email], [Ilce], [Adres], [Aktif], [FirmaTurId], [FirmaTipId], [SektorId], [IlId]) VALUES (1024, N'e3183c04-3086-4f02-9b25-d7cd8ef395c2', N'ASD', N'2222222222', N'a@gmail.com', N'ÜMRANİYE', N'ÇAKMAK', 1, 1, 2, 1, 2)
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[CustomerKind] ON 

INSERT [dbo].[CustomerKind] ([Id], [FirmaTip]) VALUES (1, N'EV')
INSERT [dbo].[CustomerKind] ([Id], [FirmaTip]) VALUES (2, N'İŞ YERİ')
INSERT [dbo].[CustomerKind] ([Id], [FirmaTip]) VALUES (3, N'OKUL')
SET IDENTITY_INSERT [dbo].[CustomerKind] OFF
SET IDENTITY_INSERT [dbo].[CustomerType] ON 

INSERT [dbo].[CustomerType] ([Id], [FirmaTur]) VALUES (1, N'BİREYSEL ')
INSERT [dbo].[CustomerType] ([Id], [FirmaTur]) VALUES (2, N'KURUMSAL')
SET IDENTITY_INSERT [dbo].[CustomerType] OFF
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Id], [Bind], [Ad], [Soyad], [Email], [Adres], [BolgeId], [CepTel], [Sifre], [AracPlaka], [Fotograf]) VALUES (28, N'33bd002b-a48e-4d5d-83f4-1d9050cacb1e', N'MEHMET', N'SEYFİ', N'a@gmail.com', N'Sarıyer', 2, N'1111111111', N'123', N'34TR78', N'/Files/Image/db6715be-6f1f-4fe6-9bec-550e2ceaddd4.jpg')
INSERT [dbo].[Employee] ([Id], [Bind], [Ad], [Soyad], [Email], [Adres], [BolgeId], [CepTel], [Sifre], [AracPlaka], [Fotograf]) VALUES (29, N'2efcc261-8991-4a05-a788-4df3747a57a6', N'ZEYNEP4TIIIIIII', N'BAYRAKG56H6J', N'a@gmail.comxe', N'Ümraniyeıııııı', 3, N'2222222222', N'333', N'34WE34G4YH5', N'/Files/Image/55e7bb98-3aed-417b-9a14-09c5fc16cf96.jpg')
INSERT [dbo].[Employee] ([Id], [Bind], [Ad], [Soyad], [Email], [Adres], [BolgeId], [CepTel], [Sifre], [AracPlaka], [Fotograf]) VALUES (31, N'48f7d748-3863-42f9-90ea-3313133dc9c8', N'KAZIM', N'SARI', N'k@gmail.com', N'Tarabya', 1, N'2222222222', N'222', N'22PR234', N'/Files/Image/99875c21-8e36-4530-9074-86141f121046.jpg')
INSERT [dbo].[Employee] ([Id], [Bind], [Ad], [Soyad], [Email], [Adres], [BolgeId], [CepTel], [Sifre], [AracPlaka], [Fotograf]) VALUES (32, N'53d31942-dc6a-42c0-877f-d4bd2cf696dc', N'HANİFE', N'ÇAMLI', N'h@gmail.com', N'Beşiktaş', 2, N'4444444444', N'344445', N'RRR', N'/Files/Image/c6cd4872-7dbf-4d94-9c45-18299c91b5ec.jpg')
SET IDENTITY_INSERT [dbo].[Employee] OFF
SET IDENTITY_INSERT [dbo].[Region] ON 

INSERT [dbo].[Region] ([Id], [Bind], [Bolge]) VALUES (1, N'DD7A5CF0-6840-4CCD-9E21-C7C88F908725', N'MARMARA 1. BÖLGE')
INSERT [dbo].[Region] ([Id], [Bind], [Bolge]) VALUES (2, N'4B64FCFF-2F1A-4462-8504-C6B1077B3CE1', N'MARMARA 2.BÖLGE')
INSERT [dbo].[Region] ([Id], [Bind], [Bolge]) VALUES (3, N'E45D52AF-C00F-4D15-AFBA-694D2F974DE3', N'MARMARA 4.BÖLGE')
SET IDENTITY_INSERT [dbo].[Region] OFF
SET IDENTITY_INSERT [dbo].[Sector] ON 

INSERT [dbo].[Sector] ([Id], [Sektor]) VALUES (1, N'YAZILIM')
INSERT [dbo].[Sector] ([Id], [Sektor]) VALUES (2, N'TEMİZLİK')
INSERT [dbo].[Sector] ([Id], [Sektor]) VALUES (3, N'GIDA')
INSERT [dbo].[Sector] ([Id], [Sektor]) VALUES (4, N'EĞİTİM')
SET IDENTITY_INSERT [dbo].[Sector] OFF
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[48] 4[13] 2[27] 3) )"
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
         Begin Table = "City"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
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
         Begin Table = "CustomerKind"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 263
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CustomerType"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 226
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Sector"
            Begin Extent = 
               Top = 6
               Left = 870
               Bottom = 185
               Right = 1040
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
      Begin ColumnWidths = 13
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
      End
   End
   Begin Criter' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Customers_View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'iaPane = 
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
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Customers_View'
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
               Top = 6
               Left = 246
               Bottom = 241
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
