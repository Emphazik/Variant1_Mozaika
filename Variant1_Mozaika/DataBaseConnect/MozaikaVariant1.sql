USE [Variant1]
GO
/****** Object:  Table [dbo].[Materials]    Script Date: 30.05.2025 11:54:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materials](
	[MaterialID] [int] IDENTITY(1,1) NOT NULL,
	[MaterialName] [nvarchar](100) NOT NULL,
	[MaterialTypeID] [int] NOT NULL,
	[UnitPrice] [decimal](10, 2) NOT NULL,
	[StockQuantity] [decimal](10, 2) NOT NULL,
	[MinimumQuantity] [decimal](10, 2) NOT NULL,
	[PackageQuantity] [decimal](10, 2) NOT NULL,
	[UnitID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaterialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialSuppliers]    Script Date: 30.05.2025 11:54:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialSuppliers](
	[MaterialSupplierID] [int] IDENTITY(1,1) NOT NULL,
	[MaterialID] [int] NOT NULL,
	[SupplierID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaterialSupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialTypes]    Script Date: 30.05.2025 11:54:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialTypes](
	[MaterialTypeID] [int] IDENTITY(1,1) NOT NULL,
	[MaterialTypeName] [nvarchar](100) NOT NULL,
	[LossPercentage] [decimal](5, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaterialTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTypes]    Script Date: 30.05.2025 11:54:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTypes](
	[ProductTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ProductTypeName] [nvarchar](50) NOT NULL,
	[Coefficient] [decimal](5, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 30.05.2025 11:54:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierName] [nvarchar](100) NOT NULL,
	[SupplierTypeID] [int] NOT NULL,
	[INN] [nvarchar](12) NOT NULL,
	[Rating] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupplierTypes]    Script Date: 30.05.2025 11:54:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplierTypes](
	[SupplierTypeID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierTypeName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SupplierTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Units]    Script Date: 30.05.2025 11:54:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Units](
	[UnitID] [int] IDENTITY(1,1) NOT NULL,
	[UnitName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UnitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Materials] ON 

INSERT [dbo].[Materials] ([MaterialID], [MaterialName], [MaterialTypeID], [UnitPrice], [StockQuantity], [MinimumQuantity], [PackageQuantity], [UnitID]) VALUES (41, N'Глина', 1, CAST(15.29 AS Decimal(10, 2)), CAST(1975.00 AS Decimal(10, 2)), CAST(5500.00 AS Decimal(10, 2)), CAST(30.00 AS Decimal(10, 2)), 2)
INSERT [dbo].[Materials] ([MaterialID], [MaterialName], [MaterialTypeID], [UnitPrice], [StockQuantity], [MinimumQuantity], [PackageQuantity], [UnitID]) VALUES (42, N'Каолин', 1, CAST(18.20 AS Decimal(10, 2)), CAST(1030.00 AS Decimal(10, 2)), CAST(3500.00 AS Decimal(10, 2)), CAST(25.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Materials] ([MaterialID], [MaterialName], [MaterialTypeID], [UnitPrice], [StockQuantity], [MinimumQuantity], [PackageQuantity], [UnitID]) VALUES (43, N'Гидрослюда', 1, CAST(17.20 AS Decimal(10, 2)), CAST(2147.00 AS Decimal(10, 2)), CAST(3500.00 AS Decimal(10, 2)), CAST(25.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Materials] ([MaterialID], [MaterialName], [MaterialTypeID], [UnitPrice], [StockQuantity], [MinimumQuantity], [PackageQuantity], [UnitID]) VALUES (44, N'Монтмориллонит', 1, CAST(17.67 AS Decimal(10, 2)), CAST(3000.00 AS Decimal(10, 2)), CAST(3000.00 AS Decimal(10, 2)), CAST(30.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Materials] ([MaterialID], [MaterialName], [MaterialTypeID], [UnitPrice], [StockQuantity], [MinimumQuantity], [PackageQuantity], [UnitID]) VALUES (45, N'Перлит', 2, CAST(13.99 AS Decimal(10, 2)), CAST(150.00 AS Decimal(10, 2)), CAST(1000.00 AS Decimal(10, 2)), CAST(50.00 AS Decimal(10, 2)), 2)
INSERT [dbo].[Materials] ([MaterialID], [MaterialName], [MaterialTypeID], [UnitPrice], [StockQuantity], [MinimumQuantity], [PackageQuantity], [UnitID]) VALUES (46, N'Стекло', 2, CAST(2.40 AS Decimal(10, 2)), CAST(3000.00 AS Decimal(10, 2)), CAST(1500.00 AS Decimal(10, 2)), CAST(500.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Materials] ([MaterialID], [MaterialName], [MaterialTypeID], [UnitPrice], [StockQuantity], [MinimumQuantity], [PackageQuantity], [UnitID]) VALUES (47, N'Дегидратированная глина', 2, CAST(21.95 AS Decimal(10, 2)), CAST(3000.00 AS Decimal(10, 2)), CAST(2500.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Materials] ([MaterialID], [MaterialName], [MaterialTypeID], [UnitPrice], [StockQuantity], [MinimumQuantity], [PackageQuantity], [UnitID]) VALUES (48, N'Шамот', 2, CAST(27.50 AS Decimal(10, 2)), CAST(2300.00 AS Decimal(10, 2)), CAST(1960.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Materials] ([MaterialID], [MaterialName], [MaterialTypeID], [UnitPrice], [StockQuantity], [MinimumQuantity], [PackageQuantity], [UnitID]) VALUES (49, N'Техническая сода', 3, CAST(54.55 AS Decimal(10, 2)), CAST(1200.00 AS Decimal(10, 2)), CAST(1500.00 AS Decimal(10, 2)), CAST(25.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Materials] ([MaterialID], [MaterialName], [MaterialTypeID], [UnitPrice], [StockQuantity], [MinimumQuantity], [PackageQuantity], [UnitID]) VALUES (50, N'Жидкое стекло', 3, CAST(76.59 AS Decimal(10, 2)), CAST(500.00 AS Decimal(10, 2)), CAST(1500.00 AS Decimal(10, 2)), CAST(15.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Materials] ([MaterialID], [MaterialName], [MaterialTypeID], [UnitPrice], [StockQuantity], [MinimumQuantity], [PackageQuantity], [UnitID]) VALUES (51, N'Кварц', 4, CAST(375.96 AS Decimal(10, 2)), CAST(1500.00 AS Decimal(10, 2)), CAST(2500.00 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Materials] ([MaterialID], [MaterialName], [MaterialTypeID], [UnitPrice], [StockQuantity], [MinimumQuantity], [PackageQuantity], [UnitID]) VALUES (52, N'Полевой шпат', 4, CAST(15.99 AS Decimal(10, 2)), CAST(750.00 AS Decimal(10, 2)), CAST(1500.00 AS Decimal(10, 2)), CAST(100.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Materials] ([MaterialID], [MaterialName], [MaterialTypeID], [UnitPrice], [StockQuantity], [MinimumQuantity], [PackageQuantity], [UnitID]) VALUES (53, N'Краска-раствор', 5, CAST(200.90 AS Decimal(10, 2)), CAST(1496.00 AS Decimal(10, 2)), CAST(2500.00 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)), 2)
INSERT [dbo].[Materials] ([MaterialID], [MaterialName], [MaterialTypeID], [UnitPrice], [StockQuantity], [MinimumQuantity], [PackageQuantity], [UnitID]) VALUES (54, N'Порошок цветной', 5, CAST(84.39 AS Decimal(10, 2)), CAST(511.00 AS Decimal(10, 2)), CAST(1750.00 AS Decimal(10, 2)), CAST(25.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Materials] ([MaterialID], [MaterialName], [MaterialTypeID], [UnitPrice], [StockQuantity], [MinimumQuantity], [PackageQuantity], [UnitID]) VALUES (55, N'Кварцевый песок', 2, CAST(4.29 AS Decimal(10, 2)), CAST(3000.00 AS Decimal(10, 2)), CAST(1600.00 AS Decimal(10, 2)), CAST(50.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Materials] ([MaterialID], [MaterialName], [MaterialTypeID], [UnitPrice], [StockQuantity], [MinimumQuantity], [PackageQuantity], [UnitID]) VALUES (56, N'Жильный кварц', 2, CAST(18.60 AS Decimal(10, 2)), CAST(2556.00 AS Decimal(10, 2)), CAST(1600.00 AS Decimal(10, 2)), CAST(25.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Materials] ([MaterialID], [MaterialName], [MaterialTypeID], [UnitPrice], [StockQuantity], [MinimumQuantity], [PackageQuantity], [UnitID]) VALUES (57, N'Барий углекислый', 4, CAST(303.64 AS Decimal(10, 2)), CAST(340.00 AS Decimal(10, 2)), CAST(1500.00 AS Decimal(10, 2)), CAST(25.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Materials] ([MaterialID], [MaterialName], [MaterialTypeID], [UnitPrice], [StockQuantity], [MinimumQuantity], [PackageQuantity], [UnitID]) VALUES (58, N'Бура техническая', 4, CAST(125.99 AS Decimal(10, 2)), CAST(165.00 AS Decimal(10, 2)), CAST(1300.00 AS Decimal(10, 2)), CAST(25.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Materials] ([MaterialID], [MaterialName], [MaterialTypeID], [UnitPrice], [StockQuantity], [MinimumQuantity], [PackageQuantity], [UnitID]) VALUES (59, N'Углещелочной реагент', 3, CAST(3.45 AS Decimal(10, 2)), CAST(450.00 AS Decimal(10, 2)), CAST(1100.00 AS Decimal(10, 2)), CAST(25.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Materials] ([MaterialID], [MaterialName], [MaterialTypeID], [UnitPrice], [StockQuantity], [MinimumQuantity], [PackageQuantity], [UnitID]) VALUES (60, N'Пирофосфат натрия', 3, CAST(700.99 AS Decimal(10, 2)), CAST(356.00 AS Decimal(10, 2)), CAST(1200.00 AS Decimal(10, 2)), CAST(25.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Materials] ([MaterialID], [MaterialName], [MaterialTypeID], [UnitPrice], [StockQuantity], [MinimumQuantity], [PackageQuantity], [UnitID]) VALUES (61, N'2222222', 2, CAST(1111.00 AS Decimal(10, 2)), CAST(1111.00 AS Decimal(10, 2)), CAST(1111.00 AS Decimal(10, 2)), CAST(1111.00 AS Decimal(10, 2)), 2)
SET IDENTITY_INSERT [dbo].[Materials] OFF
GO
SET IDENTITY_INSERT [dbo].[MaterialSuppliers] ON 

INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (1, 53, 19)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (2, 42, 3)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (3, 42, 9)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (4, 46, 19)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (5, 55, 1)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (6, 45, 6)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (7, 41, 4)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (8, 55, 20)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (9, 47, 9)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (10, 52, 4)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (11, 41, 1)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (12, 54, 19)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (13, 56, 17)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (14, 52, 1)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (15, 43, 9)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (16, 46, 20)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (17, 52, 12)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (18, 44, 9)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (19, 51, 11)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (20, 57, 17)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (21, 50, 12)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (22, 48, 17)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (23, 41, 6)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (24, 51, 15)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (25, 43, 3)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (26, 45, 9)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (27, 48, 19)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (28, 57, 20)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (29, 58, 20)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (30, 49, 18)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (31, 60, 20)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (32, 43, 4)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (33, 56, 15)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (34, 45, 10)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (35, 55, 15)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (36, 44, 4)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (37, 53, 12)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (38, 46, 7)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (39, 54, 12)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (40, 42, 1)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (41, 50, 18)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (42, 58, 7)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (43, 47, 11)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (44, 58, 13)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (45, 44, 3)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (46, 50, 16)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (47, 50, 7)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (48, 54, 16)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (49, 54, 8)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (50, 59, 16)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (51, 51, 14)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (52, 56, 13)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (53, 53, 16)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (54, 51, 13)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (55, 47, 2)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (56, 55, 14)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (57, 57, 7)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (58, 48, 2)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (59, 47, 7)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (60, 43, 5)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (61, 60, 7)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (62, 45, 5)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (63, 49, 7)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (64, 41, 10)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (65, 49, 16)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (66, 44, 10)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (67, 59, 12)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (68, 49, 8)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (69, 58, 2)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (70, 60, 5)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (71, 56, 10)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (72, 46, 2)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (73, 59, 8)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (74, 57, 5)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (75, 60, 8)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (76, 42, 5)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (77, 48, 11)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (78, 59, 5)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (79, 53, 8)
INSERT [dbo].[MaterialSuppliers] ([MaterialSupplierID], [MaterialID], [SupplierID]) VALUES (80, 52, 10)
SET IDENTITY_INSERT [dbo].[MaterialSuppliers] OFF
GO
SET IDENTITY_INSERT [dbo].[MaterialTypes] ON 

INSERT [dbo].[MaterialTypes] ([MaterialTypeID], [MaterialTypeName], [LossPercentage]) VALUES (1, N'Пластичные материалы
', CAST(0.12 AS Decimal(5, 2)))
INSERT [dbo].[MaterialTypes] ([MaterialTypeID], [MaterialTypeName], [LossPercentage]) VALUES (2, N'Добавка
', CAST(0.20 AS Decimal(5, 2)))
INSERT [dbo].[MaterialTypes] ([MaterialTypeID], [MaterialTypeName], [LossPercentage]) VALUES (3, N'Электролит
', CAST(0.15 AS Decimal(5, 2)))
INSERT [dbo].[MaterialTypes] ([MaterialTypeID], [MaterialTypeName], [LossPercentage]) VALUES (4, N'Глазурь
', CAST(0.30 AS Decimal(5, 2)))
INSERT [dbo].[MaterialTypes] ([MaterialTypeID], [MaterialTypeName], [LossPercentage]) VALUES (5, N'Пигмент
', CAST(0.25 AS Decimal(5, 2)))
SET IDENTITY_INSERT [dbo].[MaterialTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductTypes] ON 

INSERT [dbo].[ProductTypes] ([ProductTypeID], [ProductTypeName], [Coefficient]) VALUES (1, N'Тип продукции 1', CAST(1.20 AS Decimal(5, 2)))
INSERT [dbo].[ProductTypes] ([ProductTypeID], [ProductTypeName], [Coefficient]) VALUES (2, N'Тип продукции 2', CAST(8.59 AS Decimal(5, 2)))
INSERT [dbo].[ProductTypes] ([ProductTypeID], [ProductTypeName], [Coefficient]) VALUES (3, N'Тип продукции 3', CAST(3.45 AS Decimal(5, 2)))
INSERT [dbo].[ProductTypes] ([ProductTypeID], [ProductTypeName], [Coefficient]) VALUES (4, N'Тип продукции 4', CAST(5.60 AS Decimal(5, 2)))
SET IDENTITY_INSERT [dbo].[ProductTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [SupplierTypeID], [INN], [Rating], [StartDate]) VALUES (1, N'БрянскСтройресурс', 1, N'9432455179', 8, CAST(N'2015-12-20' AS Date))
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [SupplierTypeID], [INN], [Rating], [StartDate]) VALUES (2, N'Стройкомплект', 1, N'7803888520', 7, CAST(N'2017-09-13' AS Date))
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [SupplierTypeID], [INN], [Rating], [StartDate]) VALUES (3, N'Железногорская руда', 2, N'8430391035', 7, CAST(N'2016-12-23' AS Date))
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [SupplierTypeID], [INN], [Rating], [StartDate]) VALUES (4, N'Белая гора', 2, N'4318170454', 8, CAST(N'2019-05-27' AS Date))
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [SupplierTypeID], [INN], [Rating], [StartDate]) VALUES (5, N'Тульский обрабатывающий завод ', 2, N'7687851800', 7, CAST(N'2015-06-16' AS Date))
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [SupplierTypeID], [INN], [Rating], [StartDate]) VALUES (6, N'ГорТехРазработка', 3, N'6119144874', 9, CAST(N'2021-12-27' AS Date))
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [SupplierTypeID], [INN], [Rating], [StartDate]) VALUES (7, N'Сапфир', 4, N'1122170258', 3, CAST(N'2022-04-10' AS Date))
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [SupplierTypeID], [INN], [Rating], [StartDate]) VALUES (8, N'ХимБытСервис', 3, N'8355114917', 5, CAST(N'2022-03-13' AS Date))
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [SupplierTypeID], [INN], [Rating], [StartDate]) VALUES (9, N'ВоронежРудоКомбинат', 4, N'3532367439', 8, CAST(N'2023-11-11' AS Date))
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [SupplierTypeID], [INN], [Rating], [StartDate]) VALUES (10, N'Смоленский добывающий комбинат', 4, N'2362431140', 3, CAST(N'2018-11-23' AS Date))
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [SupplierTypeID], [INN], [Rating], [StartDate]) VALUES (11, N'МосКарьер', 3, N'4159215346', 2, CAST(N'2012-07-07' AS Date))
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [SupplierTypeID], [INN], [Rating], [StartDate]) VALUES (12, N'КурскРесурс', 1, N'9032455179', 4, CAST(N'2021-07-23' AS Date))
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [SupplierTypeID], [INN], [Rating], [StartDate]) VALUES (13, N'Нижегородская разработка', 4, N'3776671267', 9, CAST(N'2016-05-23' AS Date))
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [SupplierTypeID], [INN], [Rating], [StartDate]) VALUES (14, N'Речная долина', 4, N'7447864518', 8, CAST(N'2015-06-25' AS Date))
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [SupplierTypeID], [INN], [Rating], [StartDate]) VALUES (15, N'Карелия добыча', 3, N'9037040523', 6, CAST(N'2017-03-09' AS Date))
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [SupplierTypeID], [INN], [Rating], [StartDate]) VALUES (16, N'Московский ХимЗавод', 3, N'6221520857', 4, CAST(N'2015-05-07' AS Date))
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [SupplierTypeID], [INN], [Rating], [StartDate]) VALUES (17, N'Горная компания', 1, N'2262431140', 3, CAST(N'2020-12-22' AS Date))
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [SupplierTypeID], [INN], [Rating], [StartDate]) VALUES (18, N'Минерал Ресурс', 2, N'4155215346', 7, CAST(N'2015-05-22' AS Date))
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [SupplierTypeID], [INN], [Rating], [StartDate]) VALUES (19, N'Арсенал', 1, N'3961234561', 5, CAST(N'2010-11-25' AS Date))
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [SupplierTypeID], [INN], [Rating], [StartDate]) VALUES (20, N'КамчаткаСтройМинералы', 1, N'9600275878', 7, CAST(N'2016-12-20' AS Date))
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
GO
SET IDENTITY_INSERT [dbo].[SupplierTypes] ON 

INSERT [dbo].[SupplierTypes] ([SupplierTypeID], [SupplierTypeName]) VALUES (1, N'ЗАО')
INSERT [dbo].[SupplierTypes] ([SupplierTypeID], [SupplierTypeName]) VALUES (2, N'ООО')
INSERT [dbo].[SupplierTypes] ([SupplierTypeID], [SupplierTypeName]) VALUES (3, N'ПАО')
INSERT [dbo].[SupplierTypes] ([SupplierTypeID], [SupplierTypeName]) VALUES (4, N'ОАО')
SET IDENTITY_INSERT [dbo].[SupplierTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Units] ON 

INSERT [dbo].[Units] ([UnitID], [UnitName]) VALUES (1, N'кг')
INSERT [dbo].[Units] ([UnitID], [UnitName]) VALUES (2, N'л')
SET IDENTITY_INSERT [dbo].[Units] OFF
GO
ALTER TABLE [dbo].[Materials]  WITH CHECK ADD FOREIGN KEY([MaterialTypeID])
REFERENCES [dbo].[MaterialTypes] ([MaterialTypeID])
GO
ALTER TABLE [dbo].[Materials]  WITH CHECK ADD FOREIGN KEY([UnitID])
REFERENCES [dbo].[Units] ([UnitID])
GO
ALTER TABLE [dbo].[MaterialSuppliers]  WITH CHECK ADD FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Materials] ([MaterialID])
GO
ALTER TABLE [dbo].[MaterialSuppliers]  WITH CHECK ADD FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[Suppliers]  WITH CHECK ADD FOREIGN KEY([SupplierTypeID])
REFERENCES [dbo].[SupplierTypes] ([SupplierTypeID])
GO
