USE [master]
GO
/****** Object:  Database [WebsiteBanSua29DB]    Script Date: 28/05/2024 10:18:55 PM ******/
CREATE DATABASE [WebsiteBanSua29DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebsiteBanSua29DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\WebsiteBanSua29DB.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WebsiteBanSua29DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\WebsiteBanSua29DB_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WebsiteBanSua29DB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebsiteBanSua29DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebsiteBanSua29DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebsiteBanSua29DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebsiteBanSua29DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebsiteBanSua29DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebsiteBanSua29DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebsiteBanSua29DB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [WebsiteBanSua29DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebsiteBanSua29DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebsiteBanSua29DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebsiteBanSua29DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebsiteBanSua29DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebsiteBanSua29DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebsiteBanSua29DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebsiteBanSua29DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebsiteBanSua29DB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [WebsiteBanSua29DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebsiteBanSua29DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebsiteBanSua29DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebsiteBanSua29DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebsiteBanSua29DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebsiteBanSua29DB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [WebsiteBanSua29DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebsiteBanSua29DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WebsiteBanSua29DB] SET  MULTI_USER 
GO
ALTER DATABASE [WebsiteBanSua29DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebsiteBanSua29DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebsiteBanSua29DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebsiteBanSua29DB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [WebsiteBanSua29DB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [WebsiteBanSua29DB]
GO
/****** Object:  User [vy1234]    Script Date: 28/05/2024 10:18:55 PM ******/
CREATE USER [vy1234] FOR LOGIN [vy1234] WITH DEFAULT_SCHEMA=[vy1234]
GO
ALTER ROLE [db_owner] ADD MEMBER [vy1234]
GO
/****** Object:  Schema [vy1234]    Script Date: 28/05/2024 10:18:55 PM ******/
CREATE SCHEMA [vy1234]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 28/05/2024 10:18:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categories]    Script Date: 28/05/2024 10:18:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 28/05/2024 10:18:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[PhoneNumber] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Role] [int] NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 28/05/2024 10:18:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](max) NOT NULL,
	[CustomerAddress] [nvarchar](max) NOT NULL,
	[CustomerPhoneNumber] [nvarchar](max) NOT NULL,
	[CustomerEmail] [nvarchar](max) NOT NULL,
	[SumPrices] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductOrders]    Script Date: 28/05/2024 10:18:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductOrders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[productId] [int] NOT NULL,
	[orderId] [int] NOT NULL,
	[countOrder] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProductOrders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 28/05/2024 10:18:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
	[Prices] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[SaleId] [int] NOT NULL,
	[EndDate] [datetime2](7) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sales]    Script Date: 28/05/2024 10:18:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[percentSale] [int] NOT NULL,
 CONSTRAINT [PK_Sales] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240528115744_Init', N'8.0.5')
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [CategoryName]) VALUES (1, N'Sữa tươi')
INSERT [dbo].[Categories] ([Id], [CategoryName]) VALUES (2, N'Sữa hạt')
INSERT [dbo].[Categories] ([Id], [CategoryName]) VALUES (3, N'Sữa bột')
INSERT [dbo].[Categories] ([Id], [CategoryName]) VALUES (4, N'Sữa chua ăn')
INSERT [dbo].[Categories] ([Id], [CategoryName]) VALUES (5, N'Sữa chua uống')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([Id], [Name], [PhoneNumber], [Password], [Address], [Email], [Role]) VALUES (2, N'Admin', N'09123456789', N'admin', N'123 tân bình', N'admin@gmail.com', 2)
INSERT [dbo].[Customers] ([Id], [Name], [PhoneNumber], [Password], [Address], [Email], [Role]) VALUES (3, N'vy123', N'09098888888', N'123', N'46 trường sơn', N'vy123@gmail.com', 1)
INSERT [dbo].[Customers] ([Id], [Name], [PhoneNumber], [Password], [Address], [Email], [Role]) VALUES (4, N'test0', N'09081999999', N'0', N'1 hòa bình', N'test0@gmail.com', 1)
SET IDENTITY_INSERT [dbo].[Customers] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [CustomerName], [CustomerAddress], [CustomerPhoneNumber], [CustomerEmail], [SumPrices], [CreatedDate], [ModifiedDate]) VALUES (1, N'vy123', N'46 trường sơn', N'09098888888', N'vy123@gmail.com', 37430, CAST(N'2024-05-28 12:18:03.9633731' AS DateTime2), CAST(N'2024-05-28 12:18:03.9635114' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [CustomerName], [CustomerAddress], [CustomerPhoneNumber], [CustomerEmail], [SumPrices], [CreatedDate], [ModifiedDate]) VALUES (2, N'vy123', N'46 trường sơn', N'09098888888', N'vy123@gmail.com', 37430, CAST(N'2024-05-28 12:19:31.2121774' AS DateTime2), CAST(N'2024-05-28 12:19:31.2121778' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [CustomerName], [CustomerAddress], [CustomerPhoneNumber], [CustomerEmail], [SumPrices], [CreatedDate], [ModifiedDate]) VALUES (3, N'test0', N'1 hòa bình', N'09081999999', N'test0@gmail.com', 374300, CAST(N'2024-05-28 12:59:21.9209769' AS DateTime2), CAST(N'2024-05-28 12:59:21.9209772' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [CustomerName], [CustomerAddress], [CustomerPhoneNumber], [CustomerEmail], [SumPrices], [CreatedDate], [ModifiedDate]) VALUES (4, N'test0', N'1 hòa bình', N'09081999999', N'test0@gmail.com', 343830, CAST(N'2024-05-28 13:03:19.3793984' AS DateTime2), CAST(N'2024-05-28 13:03:19.3793987' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [CustomerName], [CustomerAddress], [CustomerPhoneNumber], [CustomerEmail], [SumPrices], [CreatedDate], [ModifiedDate]) VALUES (5, N'test0', N'1 hòa bình', N'09081999999', N'test0@gmail.com', 305680, CAST(N'2024-05-28 13:18:26.4370420' AS DateTime2), CAST(N'2024-05-28 13:18:26.4370426' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [CustomerName], [CustomerAddress], [CustomerPhoneNumber], [CustomerEmail], [SumPrices], [CreatedDate], [ModifiedDate]) VALUES (6, N'test0', N'1 hòa bình', N'09081999999', N'test0@gmail.com', 8080, CAST(N'2024-05-28 13:22:24.4145990' AS DateTime2), CAST(N'2024-05-28 13:22:24.4145994' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [CustomerName], [CustomerAddress], [CustomerPhoneNumber], [CustomerEmail], [SumPrices], [CreatedDate], [ModifiedDate]) VALUES (7, N'test0', N'1 hòa bình', N'09081999999', N'test0@gmail.com', 120170, CAST(N'2024-05-28 13:22:39.9619762' AS DateTime2), CAST(N'2024-05-28 13:22:39.9619764' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [CustomerName], [CustomerAddress], [CustomerPhoneNumber], [CustomerEmail], [SumPrices], [CreatedDate], [ModifiedDate]) VALUES (8, N'test0', N'1 hòa bình', N'09081999999', N'test0@gmail.com', 37430, CAST(N'2024-05-28 13:22:45.1380427' AS DateTime2), CAST(N'2024-05-28 13:22:45.1380433' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [CustomerName], [CustomerAddress], [CustomerPhoneNumber], [CustomerEmail], [SumPrices], [CreatedDate], [ModifiedDate]) VALUES (9, N'test0', N'1 hòa bình', N'09081999999', N'test0@gmail.com', 8080, CAST(N'2024-05-28 13:22:52.0160169' AS DateTime2), CAST(N'2024-05-28 13:22:52.0160174' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [CustomerName], [CustomerAddress], [CustomerPhoneNumber], [CustomerEmail], [SumPrices], [CreatedDate], [ModifiedDate]) VALUES (10, N'vy123', N'46 trường sơn', N'09098888888', N'vy123@gmail.com', 730250, CAST(N'2024-05-28 13:26:42.3434065' AS DateTime2), CAST(N'2024-05-28 13:26:42.3434072' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [CustomerName], [CustomerAddress], [CustomerPhoneNumber], [CustomerEmail], [SumPrices], [CreatedDate], [ModifiedDate]) VALUES (11, N'test0', N'1 hòa bình', N'09081999999', N'test0@gmail.com', 500000, CAST(N'2024-05-28 13:35:09.6264162' AS DateTime2), CAST(N'2024-05-28 13:35:09.6264166' AS DateTime2))
INSERT [dbo].[Orders] ([Id], [CustomerName], [CustomerAddress], [CustomerPhoneNumber], [CustomerEmail], [SumPrices], [CreatedDate], [ModifiedDate]) VALUES (12, N'test0', N'1 hòa bình', N'09081999999', N'test0@gmail.com', 1000000, CAST(N'2024-05-28 13:36:15.2659187' AS DateTime2), CAST(N'2024-05-28 13:36:15.2659190' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[ProductOrders] ON 

INSERT [dbo].[ProductOrders] ([Id], [productId], [orderId], [countOrder], [CreatedDate], [ModifiedDate]) VALUES (1, 1, 1, 5, CAST(N'2024-05-28 12:18:04.0230633' AS DateTime2), CAST(N'2024-05-28 12:18:04.0232083' AS DateTime2))
INSERT [dbo].[ProductOrders] ([Id], [productId], [orderId], [countOrder], [CreatedDate], [ModifiedDate]) VALUES (2, 1, 2, 10, CAST(N'2024-05-28 12:19:31.2651024' AS DateTime2), CAST(N'2024-05-28 12:19:31.2651028' AS DateTime2))
INSERT [dbo].[ProductOrders] ([Id], [productId], [orderId], [countOrder], [CreatedDate], [ModifiedDate]) VALUES (3, 1, 3, 10, CAST(N'2024-05-28 12:59:22.2666737' AS DateTime2), CAST(N'2024-05-28 12:59:22.2669353' AS DateTime2))
INSERT [dbo].[ProductOrders] ([Id], [productId], [orderId], [countOrder], [CreatedDate], [ModifiedDate]) VALUES (4, 2, 4, 10, CAST(N'2024-05-28 13:03:19.4585335' AS DateTime2), CAST(N'2024-05-28 13:03:19.4588235' AS DateTime2))
INSERT [dbo].[ProductOrders] ([Id], [productId], [orderId], [countOrder], [CreatedDate], [ModifiedDate]) VALUES (5, 1, 4, 1, CAST(N'2024-05-28 13:03:19.5266426' AS DateTime2), CAST(N'2024-05-28 13:03:19.5266430' AS DateTime2))
INSERT [dbo].[ProductOrders] ([Id], [productId], [orderId], [countOrder], [CreatedDate], [ModifiedDate]) VALUES (6, 5, 5, 1, CAST(N'2024-05-28 13:18:26.5188345' AS DateTime2), CAST(N'2024-05-28 13:18:26.5188348' AS DateTime2))
INSERT [dbo].[ProductOrders] ([Id], [productId], [orderId], [countOrder], [CreatedDate], [ModifiedDate]) VALUES (7, 4, 5, 5, CAST(N'2024-05-28 13:18:26.5664803' AS DateTime2), CAST(N'2024-05-28 13:18:26.5664807' AS DateTime2))
INSERT [dbo].[ProductOrders] ([Id], [productId], [orderId], [countOrder], [CreatedDate], [ModifiedDate]) VALUES (8, 3, 5, 1, CAST(N'2024-05-28 13:18:26.5947911' AS DateTime2), CAST(N'2024-05-28 13:18:26.5947914' AS DateTime2))
INSERT [dbo].[ProductOrders] ([Id], [productId], [orderId], [countOrder], [CreatedDate], [ModifiedDate]) VALUES (9, 3, 6, 1, CAST(N'2024-05-28 13:22:24.4365908' AS DateTime2), CAST(N'2024-05-28 13:22:24.4365911' AS DateTime2))
INSERT [dbo].[ProductOrders] ([Id], [productId], [orderId], [countOrder], [CreatedDate], [ModifiedDate]) VALUES (10, 1, 7, 1, CAST(N'2024-05-28 13:22:40.0148824' AS DateTime2), CAST(N'2024-05-28 13:22:40.0148853' AS DateTime2))
INSERT [dbo].[ProductOrders] ([Id], [productId], [orderId], [countOrder], [CreatedDate], [ModifiedDate]) VALUES (11, 2, 7, 1, CAST(N'2024-05-28 13:22:40.0497853' AS DateTime2), CAST(N'2024-05-28 13:22:40.0497856' AS DateTime2))
INSERT [dbo].[ProductOrders] ([Id], [productId], [orderId], [countOrder], [CreatedDate], [ModifiedDate]) VALUES (12, 5, 7, 1, CAST(N'2024-05-28 13:22:40.0733598' AS DateTime2), CAST(N'2024-05-28 13:22:40.0733602' AS DateTime2))
INSERT [dbo].[ProductOrders] ([Id], [productId], [orderId], [countOrder], [CreatedDate], [ModifiedDate]) VALUES (13, 1, 8, 1, CAST(N'2024-05-28 13:22:45.1715757' AS DateTime2), CAST(N'2024-05-28 13:22:45.1715760' AS DateTime2))
INSERT [dbo].[ProductOrders] ([Id], [productId], [orderId], [countOrder], [CreatedDate], [ModifiedDate]) VALUES (14, 3, 9, 1, CAST(N'2024-05-28 13:22:52.0380416' AS DateTime2), CAST(N'2024-05-28 13:22:52.0380420' AS DateTime2))
INSERT [dbo].[ProductOrders] ([Id], [productId], [orderId], [countOrder], [CreatedDate], [ModifiedDate]) VALUES (15, 1, 10, 5, CAST(N'2024-05-28 13:26:42.3987472' AS DateTime2), CAST(N'2024-05-28 13:26:42.3987476' AS DateTime2))
INSERT [dbo].[ProductOrders] ([Id], [productId], [orderId], [countOrder], [CreatedDate], [ModifiedDate]) VALUES (16, 4, 10, 10, CAST(N'2024-05-28 13:26:42.4224058' AS DateTime2), CAST(N'2024-05-28 13:26:42.4224063' AS DateTime2))
INSERT [dbo].[ProductOrders] ([Id], [productId], [orderId], [countOrder], [CreatedDate], [ModifiedDate]) VALUES (17, 5, 10, 1, CAST(N'2024-05-28 13:26:42.4513745' AS DateTime2), CAST(N'2024-05-28 13:26:42.4513750' AS DateTime2))
INSERT [dbo].[ProductOrders] ([Id], [productId], [orderId], [countOrder], [CreatedDate], [ModifiedDate]) VALUES (18, 6, 11, 10, CAST(N'2024-05-28 13:35:09.8563487' AS DateTime2), CAST(N'2024-05-28 13:35:09.8563489' AS DateTime2))
INSERT [dbo].[ProductOrders] ([Id], [productId], [orderId], [countOrder], [CreatedDate], [ModifiedDate]) VALUES (19, 6, 12, 20, CAST(N'2024-05-28 13:36:15.2833250' AS DateTime2), CAST(N'2024-05-28 13:36:15.2833253' AS DateTime2))
SET IDENTITY_INSERT [dbo].[ProductOrders] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [ProductName], [Image], [Prices], [Count], [CategoryId], [SaleId], [EndDate], [CreatedDate], [ModifiedDate]) VALUES (1, N'Sữa Tươi Tiệt Trùng Nguyên Chất TH true MILK 1 L', N'/img/15199d69-01c6-4f24-96d0-92cefc0bb86b.jpg', 39400, 67, 1, 3, CAST(N'2024-11-20 00:00:00.0000000' AS DateTime2), CAST(N'2024-05-28 12:15:46.3722293' AS DateTime2), CAST(N'2024-05-28 12:15:46.3723493' AS DateTime2))
INSERT [dbo].[Products] ([Id], [ProductName], [Image], [Prices], [Count], [CategoryId], [SaleId], [EndDate], [CreatedDate], [ModifiedDate]) VALUES (2, N'Sữa Tươi Tiệt Trùng TH true MILK Hương Dâu Tự Nhiên 180 ml', N'/img/7e60733c-a34e-482d-a40a-a72dea3b3720.jpg', 38300, 89, 1, 2, CAST(N'2024-11-20 00:00:00.0000000' AS DateTime2), CAST(N'2024-05-28 13:02:32.0505487' AS DateTime2), CAST(N'2024-05-28 13:02:32.0505493' AS DateTime2))
INSERT [dbo].[Products] ([Id], [ProductName], [Image], [Prices], [Count], [CategoryId], [SaleId], [EndDate], [CreatedDate], [ModifiedDate]) VALUES (3, N'Sữa Tươi Tiệt Trùng Nguyên Chất TH true MILK 220 ml', N'/img/8e830492-a26a-4a67-94cb-fd751228ad32.jpg', 10100, 97, 1, 2, CAST(N'2024-04-20 00:00:00.0000000' AS DateTime2), CAST(N'2024-05-28 13:12:43.8824724' AS DateTime2), CAST(N'2024-05-28 13:12:43.8824729' AS DateTime2))
INSERT [dbo].[Products] ([Id], [ProductName], [Image], [Prices], [Count], [CategoryId], [SaleId], [EndDate], [CreatedDate], [ModifiedDate]) VALUES (4, N'Sữa Tươi Bổ sung Ngũ Cốc TH true MILK LIGHT MEAL 180ml', N'/img/4d2a7e3c-d3f3-4ab2-b67e-683cef5aac59.jpg', 49100, 85, 1, 1, CAST(N'2024-10-20 00:00:00.0000000' AS DateTime2), CAST(N'2024-05-28 13:13:42.7920401' AS DateTime2), CAST(N'2024-05-28 13:13:42.7920404' AS DateTime2))
INSERT [dbo].[Products] ([Id], [ProductName], [Image], [Prices], [Count], [CategoryId], [SaleId], [EndDate], [CreatedDate], [ModifiedDate]) VALUES (5, N'Sữa Tươi Tiệt Trùng TH true MILK Công Thức TOPKID Hoàn Toàn Từ Sữa Tươi Organic – Vị Kem Vanilla Tự Nhiên 180 ml', N'/img/c1ba303c-9e16-4b2c-ad88-35572522f371.jpg', 52100, 97, 1, 1, CAST(N'2024-10-20 00:00:00.0000000' AS DateTime2), CAST(N'2024-05-28 13:17:23.6301244' AS DateTime2), CAST(N'2024-05-28 13:17:23.6301248' AS DateTime2))
INSERT [dbo].[Products] ([Id], [ProductName], [Image], [Prices], [Count], [CategoryId], [SaleId], [EndDate], [CreatedDate], [ModifiedDate]) VALUES (6, N'SỮA TƯƠI THANH TRÙNG NGUYÊN CHẤT VINAMILK GREEN FARM KHÔNG ĐƯỜNG', N'/img/09bf03f4-6914-4d65-bee1-bc957b3025f6.jpg', 50000, 70, 1, 1, CAST(N'2024-10-20 00:00:00.0000000' AS DateTime2), CAST(N'2024-05-28 13:31:32.4049897' AS DateTime2), CAST(N'2024-05-28 13:31:32.4049901' AS DateTime2))
INSERT [dbo].[Products] ([Id], [ProductName], [Image], [Prices], [Count], [CategoryId], [SaleId], [EndDate], [CreatedDate], [ModifiedDate]) VALUES (7, N'SỮA TƯƠI THANH TRÙNG VINAMILK GREEN FARM RẤT ÍT ĐƯỜNG', N'/img/1fa88edd-dc59-4762-a116-e0db1db3e14f.jpg', 49000, 100, 1, 1, CAST(N'2024-11-21 00:00:00.0000000' AS DateTime2), CAST(N'2024-05-28 13:44:24.9809010' AS DateTime2), CAST(N'2024-05-28 13:44:24.9809020' AS DateTime2))
INSERT [dbo].[Products] ([Id], [ProductName], [Image], [Prices], [Count], [CategoryId], [SaleId], [EndDate], [CreatedDate], [ModifiedDate]) VALUES (8, N'SỮA TƯƠI TIỆT TRÙNG VINAMILK 100% ÍT ĐƯỜNG THÙNG 48 ', N'/img/4597d81b-8041-43dd-8745-2cfa2f50b9da.jpg', 248000, 100, 1, 3, CAST(N'1988-12-25 00:00:00.0000000' AS DateTime2), CAST(N'2024-05-28 13:46:33.9072129' AS DateTime2), CAST(N'2024-05-28 13:46:33.9072132' AS DateTime2))
INSERT [dbo].[Products] ([Id], [ProductName], [Image], [Prices], [Count], [CategoryId], [SaleId], [EndDate], [CreatedDate], [ModifiedDate]) VALUES (9, N'SỮA TƯƠI TIỆT TRÙNG VINAMILK GREEN FARM KHÔNG ĐƯỜNG THÙNG 48 HỘP', N'/img/5fc28f95-910b-406a-9421-4b4e494db2a3.jpg', 405000, 100, 1, 2, CAST(N'2024-08-12 00:00:00.0000000' AS DateTime2), CAST(N'2024-05-28 13:51:42.1584737' AS DateTime2), CAST(N'2024-05-28 13:51:42.1584742' AS DateTime2))
INSERT [dbo].[Products] ([Id], [ProductName], [Image], [Prices], [Count], [CategoryId], [SaleId], [EndDate], [CreatedDate], [ModifiedDate]) VALUES (10, N'THÙNG 48 SỮA BỊCH DINH DƯỠNG VINAMILK ÍT ĐƯỜNG', N'/img/e1fea294-1d9e-432a-9c9a-6d49d4406491.jpg', 302000, 100, 1, 1, CAST(N'2026-02-10 00:00:00.0000000' AS DateTime2), CAST(N'2024-05-28 13:53:40.4156171' AS DateTime2), CAST(N'2024-05-28 13:53:40.4156179' AS DateTime2))
INSERT [dbo].[Products] ([Id], [ProductName], [Image], [Prices], [Count], [CategoryId], [SaleId], [EndDate], [CreatedDate], [ModifiedDate]) VALUES (11, N'SỮA TƯƠI TIỆT TRÙNG VINAMILK 100% DÂU THÙNG 48 HỘP', N'/img/73bbe224-c517-40fe-a76a-269170dbc5e1.jpg', 325000, 100, 1, 1, CAST(N'2025-12-12 00:00:00.0000000' AS DateTime2), CAST(N'2024-05-28 13:56:12.6822525' AS DateTime2), CAST(N'2024-05-28 13:56:12.6822530' AS DateTime2))
INSERT [dbo].[Products] ([Id], [ProductName], [Image], [Prices], [Count], [CategoryId], [SaleId], [EndDate], [CreatedDate], [ModifiedDate]) VALUES (12, N'SỮA TƯƠI TIỆT TRÙNG VINAMILK 100% SOCOLA THÙNG 48 HỘP', N'/img/9fa80c3a-8ae3-498b-8159-d456453b43c3.jpg', 330000, 100, 1, 3, CAST(N'2024-10-17 00:00:00.0000000' AS DateTime2), CAST(N'2024-05-28 14:04:27.1087220' AS DateTime2), CAST(N'2024-05-28 14:04:27.1087225' AS DateTime2))
INSERT [dbo].[Products] ([Id], [ProductName], [Image], [Prices], [Count], [CategoryId], [SaleId], [EndDate], [CreatedDate], [ModifiedDate]) VALUES (13, N'Sữa Hạt và Gạo Lứt Đỏ TH true NUT 180 ml', N'/img/607be853-2025-4bad-b17e-8bddecd0c5b2.jpg', 49300, 50, 2, 3, CAST(N'2024-06-15 00:00:00.0000000' AS DateTime2), CAST(N'2024-05-28 14:06:07.5195894' AS DateTime2), CAST(N'2024-05-28 14:06:07.5195900' AS DateTime2))
INSERT [dbo].[Products] ([Id], [ProductName], [Image], [Prices], [Count], [CategoryId], [SaleId], [EndDate], [CreatedDate], [ModifiedDate]) VALUES (14, N'Sữa Hạt và Nghệ TH true NUT 180 ml', N'/img/41cfe493-fec7-4d60-848f-15ba8e86f447.jpg', 35500, 89, 2, 2, CAST(N'2024-04-30 00:00:00.0000000' AS DateTime2), CAST(N'2024-05-28 14:07:32.5798238' AS DateTime2), CAST(N'2024-05-28 14:07:32.5798242' AS DateTime2))
INSERT [dbo].[Products] ([Id], [ProductName], [Image], [Prices], [Count], [CategoryId], [SaleId], [EndDate], [CreatedDate], [ModifiedDate]) VALUES (15, N'Sữa Hạt và Gấc TH true NUT 180 ml', N'/img/f123ba12-3668-4933-80b3-c815794d4982.jpg', 39600, 30, 2, 4, CAST(N'2024-10-10 00:00:00.0000000' AS DateTime2), CAST(N'2024-05-28 14:11:59.4728364' AS DateTime2), CAST(N'2024-05-28 14:11:59.4728370' AS DateTime2))
INSERT [dbo].[Products] ([Id], [ProductName], [Image], [Prices], [Count], [CategoryId], [SaleId], [EndDate], [CreatedDate], [ModifiedDate]) VALUES (16, N'Sữa bột dinh dưỡng ngũ cốc', N'/img/cd29ccf5-e131-4546-970c-f5201eae1757.jpg', 12000, 56, 3, 6, CAST(N'2024-11-11 00:00:00.0000000' AS DateTime2), CAST(N'2024-05-28 14:14:55.3017646' AS DateTime2), CAST(N'2024-05-28 14:14:55.3017650' AS DateTime2))
INSERT [dbo].[Products] ([Id], [ProductName], [Image], [Prices], [Count], [CategoryId], [SaleId], [EndDate], [CreatedDate], [ModifiedDate]) VALUES (17, N'Sữa Bịch có Đường Cô Gái Hà Lan', N'/img/92165d59-9271-44db-a58c-20b8ffc164b3.jpg', 9800, 57, 1, 5, CAST(N'2024-03-03 00:00:00.0000000' AS DateTime2), CAST(N'2024-05-28 14:16:22.2588809' AS DateTime2), CAST(N'2024-05-28 14:16:22.2588814' AS DateTime2))
INSERT [dbo].[Products] ([Id], [ProductName], [Image], [Prices], [Count], [CategoryId], [SaleId], [EndDate], [CreatedDate], [ModifiedDate]) VALUES (18, N'NutiMilk 100% Sữa New Zealand Bò ăn cỏ tự nhiên Có đường 180ml', N'/img/8727cbba-83d4-4b26-90b4-f259e85c8778.jpg', 32800, 20, 1, 1, CAST(N'2024-07-24 00:00:00.0000000' AS DateTime2), CAST(N'2024-05-28 14:18:29.9734745' AS DateTime2), CAST(N'2024-05-28 14:18:29.9734750' AS DateTime2))
INSERT [dbo].[Products] ([Id], [ProductName], [Image], [Prices], [Count], [CategoryId], [SaleId], [EndDate], [CreatedDate], [ModifiedDate]) VALUES (19, N'Hộp NutiMilk Sữa tươi Tươi Sạch Có đường Hộp 1L', N'/img/4a3960c2-28a8-4de4-895e-7e58649f293b.jpg', 35400, 46, 1, 1, CAST(N'2024-08-13 00:00:00.0000000' AS DateTime2), CAST(N'2024-05-28 14:20:09.5330983' AS DateTime2), CAST(N'2024-05-28 14:20:09.5330986' AS DateTime2))
INSERT [dbo].[Products] ([Id], [ProductName], [Image], [Prices], [Count], [CategoryId], [SaleId], [EndDate], [CreatedDate], [ModifiedDate]) VALUES (20, N'Nutimilk Sữa chua nha đam - Hộp 100g', N'/img/a53626f7-e9c9-4a62-8515-05ec84474403.jpg', 28900, 34, 4, 1, CAST(N'2024-05-31 00:00:00.0000000' AS DateTime2), CAST(N'2024-05-28 14:22:06.8841633' AS DateTime2), CAST(N'2024-05-28 14:22:06.8841639' AS DateTime2))
INSERT [dbo].[Products] ([Id], [ProductName], [Image], [Prices], [Count], [CategoryId], [SaleId], [EndDate], [CreatedDate], [ModifiedDate]) VALUES (21, N'SỮA HẠT 9 LOẠI HẠT VINAMILK', N'/img/b18d15f3-7a3c-48cb-8933-40d16326f888.jpg', 45880, 50, 2, 1, CAST(N'2024-06-20 00:00:00.0000000' AS DateTime2), CAST(N'2024-05-28 14:23:48.3471816' AS DateTime2), CAST(N'2024-05-28 14:23:48.3471819' AS DateTime2))
INSERT [dbo].[Products] ([Id], [ProductName], [Image], [Prices], [Count], [CategoryId], [SaleId], [EndDate], [CreatedDate], [ModifiedDate]) VALUES (22, N'Sữa Hạt Macca TH true NUT 180 ml', N'/img/65f1c916-b5f1-466a-ae59-2a0e7359cdb2.jpg', 56000, 70, 2, 4, CAST(N'2024-12-18 00:00:00.0000000' AS DateTime2), CAST(N'2024-05-28 14:25:10.2274400' AS DateTime2), CAST(N'2024-05-28 14:25:10.2274410' AS DateTime2))
INSERT [dbo].[Products] ([Id], [ProductName], [Image], [Prices], [Count], [CategoryId], [SaleId], [EndDate], [CreatedDate], [ModifiedDate]) VALUES (23, N'Sữa bột bổ sung dinh dưỡng Anlene Total 10 lon 400g', N'/img/3840d0b4-e04c-4894-bf17-653d1ec3daab.jpg', 396000, 300, 3, 1, CAST(N'2026-02-25 00:00:00.0000000' AS DateTime2), CAST(N'2024-05-28 14:28:30.2691838' AS DateTime2), CAST(N'2024-05-28 14:28:30.2691842' AS DateTime2))
INSERT [dbo].[Products] ([Id], [ProductName], [Image], [Prices], [Count], [CategoryId], [SaleId], [EndDate], [CreatedDate], [ModifiedDate]) VALUES (24, N'SỮA HẠT CAO ĐẠM VINAMILK', N'/img/a4a2a2c3-cff3-4f4d-882d-8715970e82d4.jpg', 45900, 21, 2, 1, CAST(N'2024-07-31 00:00:00.0000000' AS DateTime2), CAST(N'2024-05-28 14:31:26.5979103' AS DateTime2), CAST(N'2024-05-28 14:31:26.5979107' AS DateTime2))
INSERT [dbo].[Products] ([Id], [ProductName], [Image], [Prices], [Count], [CategoryId], [SaleId], [EndDate], [CreatedDate], [ModifiedDate]) VALUES (25, N'SỮA CHUA UỐNG PROBI LỰU ĐỎ ÍT ĐƯỜNG', N'/img/9a806ef4-3d08-40c5-b7c5-7fb0bc3d1f01.jpg', 34500, 60, 5, 1, CAST(N'2024-09-19 00:00:00.0000000' AS DateTime2), CAST(N'2024-05-28 14:36:51.6620315' AS DateTime2), CAST(N'2024-05-28 14:36:51.6620319' AS DateTime2))
INSERT [dbo].[Products] ([Id], [ProductName], [Image], [Prices], [Count], [CategoryId], [SaleId], [EndDate], [CreatedDate], [ModifiedDate]) VALUES (26, N'SỮA CHUA UỐNG PROBI ÍT ĐƯỜNG', N'/img/619f08e6-fb51-42b3-8f9d-2f7822d3019f.jpg', 39200, 100, 5, 1, CAST(N'2024-07-22 00:00:00.0000000' AS DateTime2), CAST(N'2024-05-28 14:39:15.8898725' AS DateTime2), CAST(N'2024-05-28 14:39:15.8898729' AS DateTime2))
INSERT [dbo].[Products] ([Id], [ProductName], [Image], [Prices], [Count], [CategoryId], [SaleId], [EndDate], [CreatedDate], [ModifiedDate]) VALUES (27, N'Sữa Chua Ăn TH true YOGURT Dừa Tự Nhiên', N'/img/8f6ee58c-57d6-4308-a10d-553c263c2e71.jpg', 32000, 40, 4, 4, CAST(N'2024-11-15 00:00:00.0000000' AS DateTime2), CAST(N'2024-05-28 14:41:09.5290384' AS DateTime2), CAST(N'2024-05-28 14:41:09.5290388' AS DateTime2))
INSERT [dbo].[Products] ([Id], [ProductName], [Image], [Prices], [Count], [CategoryId], [SaleId], [EndDate], [CreatedDate], [ModifiedDate]) VALUES (28, N'Sữa Chua Ăn Men Sống TH true YOGURT Trái Cây Tự Nhiên', N'/img/1892d008-2e49-4bb5-ba8c-5ff05e7b0b7e.jpg', 33000, 400, 4, 3, CAST(N'2024-12-31 00:00:00.0000000' AS DateTime2), CAST(N'2024-05-28 14:42:28.6247551' AS DateTime2), CAST(N'2024-05-28 14:42:28.6247557' AS DateTime2))
INSERT [dbo].[Products] ([Id], [ProductName], [Image], [Prices], [Count], [CategoryId], [SaleId], [EndDate], [CreatedDate], [ModifiedDate]) VALUES (29, N'Sữa Chua Xoài – Hạt Chia Tự Nhiên TH true YOGURT', N'/img/96ee78fd-00ef-4b55-91c1-94b9a6a6e7f7.jpg', 34000, 1000, 4, 6, CAST(N'2025-02-14 00:00:00.0000000' AS DateTime2), CAST(N'2024-05-28 14:43:35.9926893' AS DateTime2), CAST(N'2024-05-28 14:43:35.9926897' AS DateTime2))
INSERT [dbo].[Products] ([Id], [ProductName], [Image], [Prices], [Count], [CategoryId], [SaleId], [EndDate], [CreatedDate], [ModifiedDate]) VALUES (30, N'Sữa Chua Nếp Cẩm Tự Nhiên TH true YOGURT', N'/img/79090aca-d1dd-4554-bc56-71d1eb45209e.jpg', 41000, 250, 4, 5, CAST(N'2024-05-02 00:00:00.0000000' AS DateTime2), CAST(N'2024-05-28 14:44:56.5054513' AS DateTime2), CAST(N'2024-05-28 14:44:56.5054516' AS DateTime2))
INSERT [dbo].[Products] ([Id], [ProductName], [Image], [Prices], [Count], [CategoryId], [SaleId], [EndDate], [CreatedDate], [ModifiedDate]) VALUES (31, N'Sữa Chua Uống Men Sống TH true YOGURT Hương Vanilla Tự Nhiên', N'/img/346eb989-d37e-4854-ab73-994c95524259.jpg', 38000, 548, 5, 7, CAST(N'2024-11-26 00:00:00.0000000' AS DateTime2), CAST(N'2024-05-28 14:46:12.6461579' AS DateTime2), CAST(N'2024-05-28 14:46:12.6461585' AS DateTime2))
INSERT [dbo].[Products] ([Id], [ProductName], [Image], [Prices], [Count], [CategoryId], [SaleId], [EndDate], [CreatedDate], [ModifiedDate]) VALUES (32, N'SỮA CHUA UỐNG PROBI DỨA', N'/img/1c45d31e-124b-4989-b8e6-7a606a740dae.jpg', 29500, 199, 5, 2, CAST(N'2024-10-08 00:00:00.0000000' AS DateTime2), CAST(N'2024-05-28 14:59:05.2471876' AS DateTime2), CAST(N'2024-05-28 14:59:05.2471879' AS DateTime2))
INSERT [dbo].[Products] ([Id], [ProductName], [Image], [Prices], [Count], [CategoryId], [SaleId], [EndDate], [CreatedDate], [ModifiedDate]) VALUES (33, N'SỮA CHUA UỐNG PROBI CAM 4 chai', N'/img/70a1a23c-6824-48e9-9d9e-1ad1d97ac192.jpg', 34000, 31, 5, 1, CAST(N'2024-07-01 00:00:00.0000000' AS DateTime2), CAST(N'2024-05-28 15:00:21.3878904' AS DateTime2), CAST(N'2024-05-28 15:00:21.3878906' AS DateTime2))
INSERT [dbo].[Products] ([Id], [ProductName], [Image], [Prices], [Count], [CategoryId], [SaleId], [EndDate], [CreatedDate], [ModifiedDate]) VALUES (34, N'Sản phẩm dinh dưỡng công thức cho trẻ từ 2 đến 6 tuổi TH true Formula 4', N'/img/7cc4fc9d-dbf2-4cbe-acef-0c4b40ee2ad1.jpg', 434000, 276, 3, 1, CAST(N'2024-08-18 00:00:00.0000000' AS DateTime2), CAST(N'2024-05-28 15:01:39.4753396' AS DateTime2), CAST(N'2024-05-28 15:01:39.4753401' AS DateTime2))
INSERT [dbo].[Products] ([Id], [ProductName], [Image], [Prices], [Count], [CategoryId], [SaleId], [EndDate], [CreatedDate], [ModifiedDate]) VALUES (35, N'SỮA BỘT DIELAC ALPHA GOLD 3 - CHO TRẺ TỪ 1 ĐẾN 2 TUỔI', N'/img/0e466c0b-96d1-4021-ab34-de7c3fcfd250.jpg', 542000, 1000, 3, 1, CAST(N'2026-06-08 00:00:00.0000000' AS DateTime2), CAST(N'2024-05-28 15:02:31.6577287' AS DateTime2), CAST(N'2024-05-28 15:02:31.6577294' AS DateTime2))
INSERT [dbo].[Products] ([Id], [ProductName], [Image], [Prices], [Count], [CategoryId], [SaleId], [EndDate], [CreatedDate], [ModifiedDate]) VALUES (36, N'Sản phẩm dinh dưỡng công thức cho trẻ từ 1 đến 2 tuổi TH true Formula 3', N'/img/4041923b-6449-49ea-af5e-ce96ca33184d.jpg', 398000, 500, 3, 1, CAST(N'2026-01-09 00:00:00.0000000' AS DateTime2), CAST(N'2024-05-28 15:03:27.8089480' AS DateTime2), CAST(N'2024-05-28 15:03:27.8089484' AS DateTime2))
INSERT [dbo].[Products] ([Id], [ProductName], [Image], [Prices], [Count], [CategoryId], [SaleId], [EndDate], [CreatedDate], [ModifiedDate]) VALUES (37, N'Sữa Nan Optipro PLUS 1 800g, với 5HMO, sản xuất tại Thụy Sỹ (0-6 tháng)', N'/img/e6226ac2-7b0e-4dd9-a168-671cfc82f73d.jpg', 629000, 58, 3, 1, CAST(N'2027-03-08 00:00:00.0000000' AS DateTime2), CAST(N'2024-05-28 15:04:51.6370707' AS DateTime2), CAST(N'2024-05-28 15:04:51.6370713' AS DateTime2))
INSERT [dbo].[Products] ([Id], [ProductName], [Image], [Prices], [Count], [CategoryId], [SaleId], [EndDate], [CreatedDate], [ModifiedDate]) VALUES (38, N'SỮA BỘT OPTIMUM GOLD 3 - CHO TRẺ TỪ 1 ĐẾN 2 TUỔI', N'/img/b829f84f-367d-45ed-842d-d0ced8cca8c9.jpg', 680300, 467, 3, 1, CAST(N'2026-04-30 00:00:00.0000000' AS DateTime2), CAST(N'2024-05-28 15:05:58.8639922' AS DateTime2), CAST(N'2024-05-28 15:05:58.8639926' AS DateTime2))
INSERT [dbo].[Products] ([Id], [ProductName], [Image], [Prices], [Count], [CategoryId], [SaleId], [EndDate], [CreatedDate], [ModifiedDate]) VALUES (39, N'Sữa Neomil Care 900gr – chuyên dùng cho người ung thư', N'/img/29ba74e0-5747-4723-880c-1c023e437f12.jpg', 806000, 332, 3, 4, CAST(N'2025-12-01 00:00:00.0000000' AS DateTime2), CAST(N'2024-05-28 15:07:01.6611969' AS DateTime2), CAST(N'2024-05-28 15:07:01.6611974' AS DateTime2))
INSERT [dbo].[Products] ([Id], [ProductName], [Image], [Prices], [Count], [CategoryId], [SaleId], [EndDate], [CreatedDate], [ModifiedDate]) VALUES (40, N'Sữa dê Kabrita số 1 800g cho trẻ từ 0-12 tháng', N'/img/3ee65176-efcc-4ce7-b37c-e30fa5e75af6.jpg', 870000, 300, 3, 3, CAST(N'2025-05-05 00:00:00.0000000' AS DateTime2), CAST(N'2024-05-28 15:08:50.0783457' AS DateTime2), CAST(N'2024-05-28 15:08:50.0783470' AS DateTime2))
INSERT [dbo].[Products] ([Id], [ProductName], [Image], [Prices], [Count], [CategoryId], [SaleId], [EndDate], [CreatedDate], [ModifiedDate]) VALUES (41, N'Sữa Neomil Nano 900gr – dinh dưỡng chuyên biệt cho người sau phẫu thuật', N'/img/f927b86d-7722-472f-92de-e45dd3790a35.jpg', 990000, 598, 3, 1, CAST(N'2026-02-15 00:00:00.0000000' AS DateTime2), CAST(N'2024-05-28 15:11:11.7033259' AS DateTime2), CAST(N'2024-05-28 15:11:11.7033263' AS DateTime2))
INSERT [dbo].[Products] ([Id], [ProductName], [Image], [Prices], [Count], [CategoryId], [SaleId], [EndDate], [CreatedDate], [ModifiedDate]) VALUES (42, N'SỮA DINH DƯỠNG VINAMILK FLEX KHÔNG LACTOSE', N'/img/3d771fd1-d620-4820-b51a-aacbded7a87f.jpg', 56000, 47, 1, 6, CAST(N'2025-04-14 00:00:00.0000000' AS DateTime2), CAST(N'2024-05-28 15:13:12.6322725' AS DateTime2), CAST(N'2024-05-28 15:13:12.6322731' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[Sales] ON 

INSERT [dbo].[Sales] ([Id], [percentSale]) VALUES (1, 0)
INSERT [dbo].[Sales] ([Id], [percentSale]) VALUES (2, 20)
INSERT [dbo].[Sales] ([Id], [percentSale]) VALUES (3, 5)
INSERT [dbo].[Sales] ([Id], [percentSale]) VALUES (4, 2)
INSERT [dbo].[Sales] ([Id], [percentSale]) VALUES (5, 50)
INSERT [dbo].[Sales] ([Id], [percentSale]) VALUES (6, 10)
INSERT [dbo].[Sales] ([Id], [percentSale]) VALUES (7, 15)
SET IDENTITY_INSERT [dbo].[Sales] OFF
/****** Object:  Index [IX_ProductOrders_orderId]    Script Date: 28/05/2024 10:18:55 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductOrders_orderId] ON [dbo].[ProductOrders]
(
	[orderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductOrders_productId]    Script Date: 28/05/2024 10:18:55 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductOrders_productId] ON [dbo].[ProductOrders]
(
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_CategoryId]    Script Date: 28/05/2024 10:18:55 PM ******/
CREATE NONCLUSTERED INDEX [IX_Products_CategoryId] ON [dbo].[Products]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_SaleId]    Script Date: 28/05/2024 10:18:55 PM ******/
CREATE NONCLUSTERED INDEX [IX_Products_SaleId] ON [dbo].[Products]
(
	[SaleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProductOrders]  WITH CHECK ADD  CONSTRAINT [FK_ProductOrders_Orders_orderId] FOREIGN KEY([orderId])
REFERENCES [dbo].[Orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductOrders] CHECK CONSTRAINT [FK_ProductOrders_Orders_orderId]
GO
ALTER TABLE [dbo].[ProductOrders]  WITH CHECK ADD  CONSTRAINT [FK_ProductOrders_Products_productId] FOREIGN KEY([productId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductOrders] CHECK CONSTRAINT [FK_ProductOrders_Products_productId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories_CategoryId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Sales_SaleId] FOREIGN KEY([SaleId])
REFERENCES [dbo].[Sales] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Sales_SaleId]
GO
USE [master]
GO
ALTER DATABASE [WebsiteBanSua29DB] SET  READ_WRITE 
GO
