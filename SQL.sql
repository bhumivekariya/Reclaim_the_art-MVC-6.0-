USE [master]
GO
/****** Object:  Database [Reclaim_The_Art]    Script Date: 18/04/2023 21:06:19 ******/
CREATE DATABASE [Reclaim_The_Art]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Reclaim The Art', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Reclaim The Art.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Reclaim The Art_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Reclaim The Art_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Reclaim_The_Art] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Reclaim_The_Art].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Reclaim_The_Art] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Reclaim_The_Art] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Reclaim_The_Art] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Reclaim_The_Art] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Reclaim_The_Art] SET ARITHABORT OFF 
GO
ALTER DATABASE [Reclaim_The_Art] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Reclaim_The_Art] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Reclaim_The_Art] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Reclaim_The_Art] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Reclaim_The_Art] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Reclaim_The_Art] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Reclaim_The_Art] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Reclaim_The_Art] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Reclaim_The_Art] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Reclaim_The_Art] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Reclaim_The_Art] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Reclaim_The_Art] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Reclaim_The_Art] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Reclaim_The_Art] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Reclaim_The_Art] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Reclaim_The_Art] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Reclaim_The_Art] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Reclaim_The_Art] SET RECOVERY FULL 
GO
ALTER DATABASE [Reclaim_The_Art] SET  MULTI_USER 
GO
ALTER DATABASE [Reclaim_The_Art] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Reclaim_The_Art] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Reclaim_The_Art] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Reclaim_The_Art] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Reclaim_The_Art] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Reclaim_The_Art] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Reclaim_The_Art', N'ON'
GO
ALTER DATABASE [Reclaim_The_Art] SET QUERY_STORE = OFF
GO
USE [Reclaim_The_Art]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[AdminName] [nvarchar](50) NOT NULL,
	[AdminUserName] [nvarchar](50) NOT NULL,
	[AdminPassWord] [nvarchar](50) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModificationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[BillID] [int] IDENTITY(1,1) NOT NULL,
	[BillAmount] [int] NOT NULL,
	[BillStatus] [nvarchar](50) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModificationDate] [datetime] NOT NULL,
	[CountryID] [int] NOT NULL,
	[StateID] [int] NOT NULL,
	[CityID] [int] NOT NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[BillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillWiseProduct]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillWiseProduct](
	[BillIWiseProductID] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [nvarchar](50) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModificationDate] [datetime] NOT NULL,
	[BillID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
 CONSTRAINT [PK_BillWiseProduct] PRIMARY KEY CLUSTERED 
(
	[BillIWiseProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](50) NOT NULL,
	[Pincode] [nvarchar](50) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModificationDate] [datetime] NOT NULL,
	[CountryID] [int] NOT NULL,
	[StateID] [int] NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [nvarchar](50) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModificationDate] [datetime] NOT NULL,
	[CountryCode] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](50) NOT NULL,
	[CustomerPassword] [nvarchar](50) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModificationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[ProductDiscription] [nvarchar](max) NOT NULL,
	[ProductPrice] [int] NOT NULL,
	[ProductDiscount] [nvarchar](50) NOT NULL,
	[ProductTypeID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModificationDate] [datetime] NOT NULL,
	[ProductPicture] [nvarchar](max) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[ProductTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ProductType] [nvarchar](50) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModificationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[ProductTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[State]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[StateID] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [nvarchar](50) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModificationDate] [datetime] NOT NULL,
	[CountryID] [int] NOT NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([AdminID], [AdminName], [AdminUserName], [AdminPassWord], [CreationDate], [ModificationDate]) VALUES (5, N'BhumiVekariya', N'Bhumi', N'Bhumi123', CAST(N'2022-10-10T00:00:00.000' AS DateTime), CAST(N'2022-12-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Admin] ([AdminID], [AdminName], [AdminUserName], [AdminPassWord], [CreationDate], [ModificationDate]) VALUES (8, N'KhushJaviya', N'Khushi', N'Khushi1121', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Admin] ([AdminID], [AdminName], [AdminUserName], [AdminPassWord], [CreationDate], [ModificationDate]) VALUES (9, N'ManshiBanderi', N'Manshi', N'Manshi@123', CAST(N'2023-04-12T18:39:06.627' AS DateTime), CAST(N'2023-04-12T18:40:58.150' AS DateTime))
INSERT [dbo].[Admin] ([AdminID], [AdminName], [AdminUserName], [AdminPassWord], [CreationDate], [ModificationDate]) VALUES (10, N'AarzooMeghpara', N'Aarzoo', N'Aarzoo@987', CAST(N'2023-04-12T18:44:47.880' AS DateTime), CAST(N'2023-04-12T18:45:18.203' AS DateTime))
INSERT [dbo].[Admin] ([AdminID], [AdminName], [AdminUserName], [AdminPassWord], [CreationDate], [ModificationDate]) VALUES (11, N'YashviKhunt', N'Yashvi', N'Yashvi#$', CAST(N'2023-04-12T19:02:42.257' AS DateTime), CAST(N'2023-04-12T19:02:42.257' AS DateTime))
INSERT [dbo].[Admin] ([AdminID], [AdminName], [AdminUserName], [AdminPassWord], [CreationDate], [ModificationDate]) VALUES (12, N'ArwaSabuwala', N'Arwa', N'Arwa345', CAST(N'2023-04-13T17:31:46.413' AS DateTime), CAST(N'2023-04-13T17:31:46.413' AS DateTime))
INSERT [dbo].[Admin] ([AdminID], [AdminName], [AdminUserName], [AdminPassWord], [CreationDate], [ModificationDate]) VALUES (16, N'RiyaParmar', N'Riya145', N'riya45', CAST(N'2023-04-15T12:45:36.933' AS DateTime), CAST(N'2023-04-15T12:45:36.933' AS DateTime))
SET IDENTITY_INSERT [dbo].[Admin] OFF
GO
SET IDENTITY_INSERT [dbo].[Bill] ON 

INSERT [dbo].[Bill] ([BillID], [BillAmount], [BillStatus], [CustomerID], [CreationDate], [ModificationDate], [CountryID], [StateID], [CityID]) VALUES (3, 5000, N'paid', 2, CAST(N'2023-04-14T09:46:53.243' AS DateTime), CAST(N'2023-04-14T09:46:53.243' AS DateTime), 4, 12, 20)
INSERT [dbo].[Bill] ([BillID], [BillAmount], [BillStatus], [CustomerID], [CreationDate], [ModificationDate], [CountryID], [StateID], [CityID]) VALUES (5, 2050, N'paid', 3, CAST(N'2023-04-14T09:50:48.900' AS DateTime), CAST(N'2023-04-14T12:15:44.193' AS DateTime), 6, 15, 24)
INSERT [dbo].[Bill] ([BillID], [BillAmount], [BillStatus], [CustomerID], [CreationDate], [ModificationDate], [CountryID], [StateID], [CityID]) VALUES (8, 1050, N'paid', 3, CAST(N'2023-04-14T12:15:59.467' AS DateTime), CAST(N'2023-04-14T12:15:59.467' AS DateTime), 4, 12, 20)
SET IDENTITY_INSERT [dbo].[Bill] OFF
GO
SET IDENTITY_INSERT [dbo].[BillWiseProduct] ON 

INSERT [dbo].[BillWiseProduct] ([BillIWiseProductID], [Quantity], [CreationDate], [ModificationDate], [BillID], [ProductID]) VALUES (1, N'2', CAST(N'2023-04-14T11:35:27.953' AS DateTime), CAST(N'2023-04-14T11:35:27.953' AS DateTime), 3, 1)
INSERT [dbo].[BillWiseProduct] ([BillIWiseProductID], [Quantity], [CreationDate], [ModificationDate], [BillID], [ProductID]) VALUES (2, N'4', CAST(N'2023-04-14T12:23:35.263' AS DateTime), CAST(N'2023-04-14T12:23:35.263' AS DateTime), 3, 1)
SET IDENTITY_INSERT [dbo].[BillWiseProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([CityID], [CityName], [Pincode], [CreationDate], [ModificationDate], [CountryID], [StateID]) VALUES (5, N'Bagrami', N'	1053', CAST(N'2022-12-12T00:00:00.000' AS DateTime), CAST(N'2023-10-12T00:00:00.000' AS DateTime), 1, 6)
INSERT [dbo].[City] ([CityID], [CityName], [Pincode], [CreationDate], [ModificationDate], [CountryID], [StateID]) VALUES (9, N'Ajristan', N'2367', CAST(N'2020-12-10T00:00:00.000' AS DateTime), CAST(N'2022-02-02T00:00:00.000' AS DateTime), 1, 5)
INSERT [dbo].[City] ([CityID], [CityName], [Pincode], [CreationDate], [ModificationDate], [CountryID], [StateID]) VALUES (10, N'Andar', N'2357', CAST(N'2023-04-13T20:11:12.107' AS DateTime), CAST(N'2023-04-13T20:11:12.107' AS DateTime), 1, 5)
INSERT [dbo].[City] ([CityID], [CityName], [Pincode], [CreationDate], [ModificationDate], [CountryID], [StateID]) VALUES (11, N'Haymarket', N'2000', CAST(N'2023-04-13T20:13:40.710' AS DateTime), CAST(N'2023-04-17T08:59:04.890' AS DateTime), 2, 7)
INSERT [dbo].[City] ([CityID], [CityName], [Pincode], [CreationDate], [ModificationDate], [CountryID], [StateID]) VALUES (12, N'Ultimo', N'	2007', CAST(N'2023-04-13T21:05:05.303' AS DateTime), CAST(N'2023-04-13T21:05:05.303' AS DateTime), 2, 7)
INSERT [dbo].[City] ([CityID], [CityName], [Pincode], [CreationDate], [ModificationDate], [CountryID], [StateID]) VALUES (14, N'1	Perth', N'6000', CAST(N'2023-04-13T21:06:37.897' AS DateTime), CAST(N'2023-04-13T21:06:37.897' AS DateTime), 2, 8)
INSERT [dbo].[City] ([CityID], [CityName], [Pincode], [CreationDate], [ModificationDate], [CountryID], [StateID]) VALUES (15, N'	Scarborough', N'6091', CAST(N'2023-04-13T21:06:59.470' AS DateTime), CAST(N'2023-04-13T21:06:59.470' AS DateTime), 2, 8)
INSERT [dbo].[City] ([CityID], [CityName], [Pincode], [CreationDate], [ModificationDate], [CountryID], [StateID]) VALUES (16, N'Areal', N'25845', CAST(N'2023-04-13T21:09:47.417' AS DateTime), CAST(N'2023-04-13T21:09:47.417' AS DateTime), 3, 9)
INSERT [dbo].[City] ([CityID], [CityName], [Pincode], [CreationDate], [ModificationDate], [CountryID], [StateID]) VALUES (17, N'Feijo', N'69960', CAST(N'2023-04-13T21:10:49.090' AS DateTime), CAST(N'2023-04-13T21:10:49.090' AS DateTime), 3, 10)
INSERT [dbo].[City] ([CityID], [CityName], [Pincode], [CreationDate], [ModificationDate], [CountryID], [StateID]) VALUES (19, N'Acton', N'L7J', CAST(N'2023-04-13T21:12:19.470' AS DateTime), CAST(N'2023-04-13T21:12:19.470' AS DateTime), 4, 11)
INSERT [dbo].[City] ([CityID], [CityName], [Pincode], [CreationDate], [ModificationDate], [CountryID], [StateID]) VALUES (20, N'Southwestern Northwest Territories', N'X0G', CAST(N'2023-04-13T21:13:18.923' AS DateTime), CAST(N'2023-04-13T21:13:18.923' AS DateTime), 4, 12)
INSERT [dbo].[City] ([CityID], [CityName], [Pincode], [CreationDate], [ModificationDate], [CountryID], [StateID]) VALUES (21, N'Changning', N'200000', CAST(N'2023-04-13T21:16:21.457' AS DateTime), CAST(N'2023-04-13T21:16:21.457' AS DateTime), 5, 14)
INSERT [dbo].[City] ([CityID], [CityName], [Pincode], [CreationDate], [ModificationDate], [CountryID], [StateID]) VALUES (22, N'Miaoli', N' 360', CAST(N'2023-04-13T21:17:06.687' AS DateTime), CAST(N'2023-04-13T21:17:06.687' AS DateTime), 5, 13)
INSERT [dbo].[City] ([CityID], [CityName], [Pincode], [CreationDate], [ModificationDate], [CountryID], [StateID]) VALUES (23, N'rajkot', N'03', CAST(N'2023-04-13T21:17:39.180' AS DateTime), CAST(N'2023-04-13T21:17:39.180' AS DateTime), 6, 15)
INSERT [dbo].[City] ([CityID], [CityName], [Pincode], [CreationDate], [ModificationDate], [CountryID], [StateID]) VALUES (24, N'surat', N'05', CAST(N'2023-04-13T21:18:07.203' AS DateTime), CAST(N'2023-04-13T21:18:07.203' AS DateTime), 6, 15)
INSERT [dbo].[City] ([CityID], [CityName], [Pincode], [CreationDate], [ModificationDate], [CountryID], [StateID]) VALUES (25, N'Gandhinagar', N'01', CAST(N'2023-04-13T21:18:20.840' AS DateTime), CAST(N'2023-04-13T21:18:20.840' AS DateTime), 6, 15)
INSERT [dbo].[City] ([CityID], [CityName], [Pincode], [CreationDate], [ModificationDate], [CountryID], [StateID]) VALUES (26, N'	Ludhiana', N'300', CAST(N'2023-04-13T21:21:33.510' AS DateTime), CAST(N'2023-04-13T21:21:33.510' AS DateTime), 6, 16)
INSERT [dbo].[City] ([CityID], [CityName], [Pincode], [CreationDate], [ModificationDate], [CountryID], [StateID]) VALUES (27, N'	Amritsar', N'303', CAST(N'2023-04-13T21:21:55.367' AS DateTime), CAST(N'2023-04-13T21:21:55.367' AS DateTime), 6, 16)
INSERT [dbo].[City] ([CityID], [CityName], [Pincode], [CreationDate], [ModificationDate], [CountryID], [StateID]) VALUES (28, N'Jalandhar', N'304', CAST(N'2023-04-13T21:22:13.020' AS DateTime), CAST(N'2023-04-13T21:22:13.020' AS DateTime), 6, 16)
INSERT [dbo].[City] ([CityID], [CityName], [Pincode], [CreationDate], [ModificationDate], [CountryID], [StateID]) VALUES (29, N'	Hermosillo', N'641,791', CAST(N'2023-04-13T21:24:05.403' AS DateTime), CAST(N'2023-04-13T21:24:05.403' AS DateTime), 7, 17)
INSERT [dbo].[City] ([CityID], [CityName], [Pincode], [CreationDate], [ModificationDate], [CountryID], [StateID]) VALUES (30, N'	Tehuacán', N'238,229', CAST(N'2023-04-13T21:24:51.230' AS DateTime), CAST(N'2023-04-13T21:24:51.230' AS DateTime), 7, 18)
INSERT [dbo].[City] ([CityID], [CityName], [Pincode], [CreationDate], [ModificationDate], [CountryID], [StateID]) VALUES (31, N'Islamabad', N'529,180	', CAST(N'2023-04-13T21:27:02.980' AS DateTime), CAST(N'2023-04-13T21:27:02.980' AS DateTime), 8, 19)
INSERT [dbo].[City] ([CityID], [CityName], [Pincode], [CreationDate], [ModificationDate], [CountryID], [StateID]) VALUES (32, N'	Kasur', N'245,321', CAST(N'2023-04-13T21:27:28.130' AS DateTime), CAST(N'2023-04-13T21:27:28.130' AS DateTime), 8, 20)
INSERT [dbo].[City] ([CityID], [CityName], [Pincode], [CreationDate], [ModificationDate], [CountryID], [StateID]) VALUES (33, N'Al Khawr', N'3600', CAST(N'2023-04-13T21:29:20.407' AS DateTime), CAST(N'2023-04-13T21:29:20.407' AS DateTime), 9, 21)
INSERT [dbo].[City] ([CityID], [CityName], [Pincode], [CreationDate], [ModificationDate], [CountryID], [StateID]) VALUES (35, N'Umm al Afā‘ī', N'3502', CAST(N'2023-04-13T21:31:16.113' AS DateTime), CAST(N'2023-04-13T21:31:16.113' AS DateTime), 9, 22)
INSERT [dbo].[City] ([CityID], [CityName], [Pincode], [CreationDate], [ModificationDate], [CountryID], [StateID]) VALUES (36, N'Nam-gu', N'400', CAST(N'2023-04-13T21:32:45.733' AS DateTime), CAST(N'2023-04-13T21:32:45.733' AS DateTime), 10, 23)
INSERT [dbo].[City] ([CityID], [CityName], [Pincode], [CreationDate], [ModificationDate], [CountryID], [StateID]) VALUES (37, N'Han-gang', N'403', CAST(N'2023-04-13T21:33:49.700' AS DateTime), CAST(N'2023-04-13T21:33:49.700' AS DateTime), 10, 24)
INSERT [dbo].[City] ([CityID], [CityName], [Pincode], [CreationDate], [ModificationDate], [CountryID], [StateID]) VALUES (38, N'Mabane', N'798', CAST(N'2023-04-13T21:35:31.730' AS DateTime), CAST(N'2023-04-13T21:35:31.730' AS DateTime), 11, 25)
INSERT [dbo].[City] ([CityID], [CityName], [Pincode], [CreationDate], [ModificationDate], [CountryID], [StateID]) VALUES (39, N' Eswatini', N'678', CAST(N'2023-04-13T21:36:21.690' AS DateTime), CAST(N'2023-04-13T21:36:21.690' AS DateTime), 11, 26)
SET IDENTITY_INSERT [dbo].[City] OFF
GO
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([CountryID], [CountryName], [CreationDate], [ModificationDate], [CountryCode]) VALUES (1, N'Afghanistan', CAST(N'2023-04-12T19:14:45.657' AS DateTime), CAST(N'2023-04-12T19:14:45.657' AS DateTime), N'AFG')
INSERT [dbo].[Country] ([CountryID], [CountryName], [CreationDate], [ModificationDate], [CountryCode]) VALUES (2, N'Australia', CAST(N'2023-04-13T17:42:24.830' AS DateTime), CAST(N'2023-04-13T17:42:24.830' AS DateTime), N'AUS')
INSERT [dbo].[Country] ([CountryID], [CountryName], [CreationDate], [ModificationDate], [CountryCode]) VALUES (3, N'Brazil', CAST(N'2023-04-13T17:42:56.877' AS DateTime), CAST(N'2023-04-13T17:42:56.877' AS DateTime), N'BRA')
INSERT [dbo].[Country] ([CountryID], [CountryName], [CreationDate], [ModificationDate], [CountryCode]) VALUES (4, N'Canada', CAST(N'2023-04-13T17:43:56.837' AS DateTime), CAST(N'2023-04-13T17:43:56.837' AS DateTime), N'CAN')
INSERT [dbo].[Country] ([CountryID], [CountryName], [CreationDate], [ModificationDate], [CountryCode]) VALUES (5, N'China', CAST(N'2023-04-13T17:44:17.763' AS DateTime), CAST(N'2023-04-13T17:44:17.763' AS DateTime), N'CHN')
INSERT [dbo].[Country] ([CountryID], [CountryName], [CreationDate], [ModificationDate], [CountryCode]) VALUES (6, N'India', CAST(N'2023-04-13T17:44:57.337' AS DateTime), CAST(N'2023-04-13T17:44:57.337' AS DateTime), N'IND')
INSERT [dbo].[Country] ([CountryID], [CountryName], [CreationDate], [ModificationDate], [CountryCode]) VALUES (7, N'Mexico', CAST(N'2023-04-13T17:45:29.437' AS DateTime), CAST(N'2023-04-13T17:45:29.437' AS DateTime), N'MEX')
INSERT [dbo].[Country] ([CountryID], [CountryName], [CreationDate], [ModificationDate], [CountryCode]) VALUES (8, N'Pakistan', CAST(N'2023-04-13T17:45:55.140' AS DateTime), CAST(N'2023-04-13T17:45:55.140' AS DateTime), N'PAK')
INSERT [dbo].[Country] ([CountryID], [CountryName], [CreationDate], [ModificationDate], [CountryCode]) VALUES (9, N'Qatar', CAST(N'2023-04-13T17:46:18.710' AS DateTime), CAST(N'2023-04-13T17:46:18.710' AS DateTime), N'QAT')
INSERT [dbo].[Country] ([CountryID], [CountryName], [CreationDate], [ModificationDate], [CountryCode]) VALUES (10, N'South Korea', CAST(N'2023-04-13T17:46:51.640' AS DateTime), CAST(N'2023-04-13T17:46:51.640' AS DateTime), N'KOR')
INSERT [dbo].[Country] ([CountryID], [CountryName], [CreationDate], [ModificationDate], [CountryCode]) VALUES (11, N'Switzerland', CAST(N'2023-04-13T17:47:21.360' AS DateTime), CAST(N'2023-04-15T15:48:35.170' AS DateTime), N'CHE123')
SET IDENTITY_INSERT [dbo].[Country] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [CustomerPassword], [CreationDate], [ModificationDate]) VALUES (2, N'Ram', N'Ram123', CAST(N'2023-04-13T18:28:45.453' AS DateTime), CAST(N'2023-04-13T18:28:45.453' AS DateTime))
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [CustomerPassword], [CreationDate], [ModificationDate]) VALUES (3, N'Sita', N'Sita@123', CAST(N'2023-04-13T18:29:03.647' AS DateTime), CAST(N'2023-04-13T18:29:03.647' AS DateTime))
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [CustomerPassword], [CreationDate], [ModificationDate]) VALUES (4, N'Gita', N'gita123', CAST(N'2023-04-13T18:29:16.210' AS DateTime), CAST(N'2023-04-13T18:29:16.210' AS DateTime))
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [CustomerPassword], [CreationDate], [ModificationDate]) VALUES (5, N'Rima', N'Rima456', CAST(N'2023-04-13T18:29:37.810' AS DateTime), CAST(N'2023-04-13T18:29:37.810' AS DateTime))
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [CustomerPassword], [CreationDate], [ModificationDate]) VALUES (6, N'raj', N'raj123', CAST(N'2023-04-13T19:29:58.753' AS DateTime), CAST(N'2023-04-13T19:34:53.890' AS DateTime))
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductDiscription], [ProductPrice], [ProductDiscount], [ProductTypeID], [CustomerID], [CreationDate], [ModificationDate], [ProductPicture]) VALUES (1, N'FlowerPoat', N'Charcha Business Card holder box', 795, N'20%', 2, 3, CAST(N'2023-04-14T11:34:00.537' AS DateTime), CAST(N'2023-04-17T19:41:25.797' AS DateTime), N'/upload/Home Decor Ideas - 6 Ways To Include Ceramic In Your Interior.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductDiscription], [ProductPrice], [ProductDiscount], [ProductTypeID], [CustomerID], [CreationDate], [ModificationDate], [ProductPicture]) VALUES (14, N'Chamkila Runner', N'single use plastic wrappers and cotton textile', 1174, N'10%', 2, 4, CAST(N'2023-04-17T19:11:19.253' AS DateTime), CAST(N'2023-04-17T19:41:36.650' AS DateTime), N'/upload/Amazon_com_ Fashriend FAZ Washable Runner Rug Boho….png')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductDiscription], [ProductPrice], [ProductDiscount], [ProductTypeID], [CustomerID], [CreationDate], [ModificationDate], [ProductPicture]) VALUES (15, N'
Foldable Wooden Table Placement - Walnut', N'Reclaimed pine wood', 675, N'2%', 2, 5, CAST(N'2023-04-17T19:13:42.057' AS DateTime), CAST(N'2023-04-17T19:13:42.057' AS DateTime), N'https://img1.wsimg.com/isteam/ip/f51fb6b7-56e5-4f5a-96e9-2dd91437ba7a/ols/Untitled-12.jpg/:/rs=w:499,h:665')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductDiscription], [ProductPrice], [ProductDiscount], [ProductTypeID], [CustomerID], [CreationDate], [ModificationDate], [ProductPicture]) VALUES (19, N'Ghats of Varanasi teapot set for family', N'glass and reclaimed pine wood

', 3245, N'5%', 2, 2, CAST(N'2023-04-17T19:16:51.290' AS DateTime), CAST(N'2023-04-17T19:16:51.290' AS DateTime), N'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcS_Z3K73TY9xnidCP5uMzx9SpsNJ8faTPpqhHg-Hz6cB_h1cgRd')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductDiscription], [ProductPrice], [ProductDiscount], [ProductTypeID], [CustomerID], [CreationDate], [ModificationDate], [ProductPicture]) VALUES (20, N'Love grows wooden wall platter', N'handpainted wooden wall platter is an elegant piec', 1275, N'10%', 2, 3, CAST(N'2023-04-17T19:28:12.843' AS DateTime), CAST(N'2023-04-17T19:42:19.337' AS DateTime), N'/upload/Mini Personalized Decorative Charcuterie Board, Tiered Tray Decor, Custom Engraved Wood Serving Tray.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductDiscription], [ProductPrice], [ProductDiscount], [ProductTypeID], [CustomerID], [CreationDate], [ModificationDate], [ProductPicture]) VALUES (25, N'tic tac toe', N'Motu Patlu cartoon show inspired tic-tac-toe is a ', 1600, N'10%', 3, 2, CAST(N'2023-04-17T19:48:24.140' AS DateTime), CAST(N'2023-04-17T19:54:19.067' AS DateTime), N'/upload/217e3486-a99b-46d1-aa6a-3e3d22148c81.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductDiscription], [ProductPrice], [ProductDiscount], [ProductTypeID], [CustomerID], [CreationDate], [ModificationDate], [ProductPicture]) VALUES (26, N'Superman wooden puzzle game', N'The Superman cartoon show inspired puzzle game is ', 1625, N'3%', 3, 2, CAST(N'2023-04-17T19:50:59.810' AS DateTime), CAST(N'2023-04-17T19:54:30.790' AS DateTime), N'/upload/Batman and Robin 3D Jigsaw Puzzle.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductDiscription], [ProductPrice], [ProductDiscount], [ProductTypeID], [CustomerID], [CreationDate], [ModificationDate], [ProductPicture]) VALUES (27, N' Wooden number counting game', N' Wooden number counting game ?1,745.00?1,700.00 Yo', 1700, N'5%', 3, 4, CAST(N'2023-04-17T19:56:36.530' AS DateTime), CAST(N'2023-04-17T19:56:36.530' AS DateTime), N'/upload/Montessori Toys for Toddlers, Wooden Math Number Blocks Counting and Manipulative Toys, Basic Math Game Preschool Learning Educational Materials for Toddlers Kids 2 3 4 5 Years.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductDiscription], [ProductPrice], [ProductDiscount], [ProductTypeID], [CustomerID], [CreationDate], [ModificationDate], [ProductPicture]) VALUES (28, N' Ludo Board Game', N'The wooden ludo game is timeless game to play with', 1575, N'2%', 3, 4, CAST(N'2023-04-17T19:58:40.477' AS DateTime), CAST(N'2023-04-17T19:58:40.477' AS DateTime), N'/upload/Wood game, ''Around the World''.png')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductType] ON 

INSERT [dbo].[ProductType] ([ProductTypeID], [ProductType], [CreationDate], [ModificationDate]) VALUES (2, N'Home Decore', CAST(N'2023-04-14T11:33:01.040' AS DateTime), CAST(N'2023-04-14T11:33:01.040' AS DateTime))
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductType], [CreationDate], [ModificationDate]) VALUES (3, N'Toys And Tools', CAST(N'2023-04-14T11:33:23.857' AS DateTime), CAST(N'2023-04-14T11:33:23.857' AS DateTime))
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductType], [CreationDate], [ModificationDate]) VALUES (4, N'Lifestyle Products', CAST(N'2023-04-14T11:33:35.757' AS DateTime), CAST(N'2023-04-14T11:33:35.757' AS DateTime))
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductType], [CreationDate], [ModificationDate]) VALUES (5, N'Stationary', CAST(N'2023-04-14T11:33:49.887' AS DateTime), CAST(N'2023-04-14T22:07:41.420' AS DateTime))
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductType], [CreationDate], [ModificationDate]) VALUES (6, N'Event Decor', CAST(N'2023-04-14T22:10:31.533' AS DateTime), CAST(N'2023-04-14T22:10:31.533' AS DateTime))
SET IDENTITY_INSERT [dbo].[ProductType] OFF
GO
SET IDENTITY_INSERT [dbo].[State] ON 

INSERT [dbo].[State] ([StateID], [StateName], [CreationDate], [ModificationDate], [CountryID]) VALUES (5, N'Ghazni', CAST(N'2022-12-12T00:00:00.000' AS DateTime), CAST(N'2023-12-13T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[State] ([StateID], [StateName], [CreationDate], [ModificationDate], [CountryID]) VALUES (6, N'Kabul', CAST(N'2023-04-13T17:52:30.860' AS DateTime), CAST(N'2023-04-13T17:52:30.860' AS DateTime), 1)
INSERT [dbo].[State] ([StateID], [StateName], [CreationDate], [ModificationDate], [CountryID]) VALUES (7, N'New South Wales', CAST(N'2023-04-13T17:53:27.540' AS DateTime), CAST(N'2023-04-13T17:53:27.540' AS DateTime), 2)
INSERT [dbo].[State] ([StateID], [StateName], [CreationDate], [ModificationDate], [CountryID]) VALUES (8, N'Westen Australia', CAST(N'2023-04-13T17:53:40.663' AS DateTime), CAST(N'2023-04-13T17:53:40.663' AS DateTime), 2)
INSERT [dbo].[State] ([StateID], [StateName], [CreationDate], [ModificationDate], [CountryID]) VALUES (9, N'Rio de Janeiro', CAST(N'2023-04-13T17:54:25.803' AS DateTime), CAST(N'2023-04-13T17:54:25.803' AS DateTime), 3)
INSERT [dbo].[State] ([StateID], [StateName], [CreationDate], [ModificationDate], [CountryID]) VALUES (10, N'Acre', CAST(N'2023-04-13T17:54:52.930' AS DateTime), CAST(N'2023-04-13T17:54:52.930' AS DateTime), 3)
INSERT [dbo].[State] ([StateID], [StateName], [CreationDate], [ModificationDate], [CountryID]) VALUES (11, N'Ontario', CAST(N'2023-04-13T17:55:33.280' AS DateTime), CAST(N'2023-04-13T17:55:33.280' AS DateTime), 4)
INSERT [dbo].[State] ([StateID], [StateName], [CreationDate], [ModificationDate], [CountryID]) VALUES (12, N'Northwest Territories', CAST(N'2023-04-13T17:56:09.360' AS DateTime), CAST(N'2023-04-13T17:56:09.360' AS DateTime), 4)
INSERT [dbo].[State] ([StateID], [StateName], [CreationDate], [ModificationDate], [CountryID]) VALUES (13, N'Taiwan', CAST(N'2023-04-13T17:56:35.833' AS DateTime), CAST(N'2023-04-13T17:56:35.833' AS DateTime), 5)
INSERT [dbo].[State] ([StateID], [StateName], [CreationDate], [ModificationDate], [CountryID]) VALUES (14, N'Shanghai', CAST(N'2023-04-13T17:56:55.210' AS DateTime), CAST(N'2023-04-13T17:56:55.210' AS DateTime), 5)
INSERT [dbo].[State] ([StateID], [StateName], [CreationDate], [ModificationDate], [CountryID]) VALUES (15, N'Gujarat', CAST(N'2023-04-13T17:57:31.970' AS DateTime), CAST(N'2023-04-13T17:57:31.970' AS DateTime), 6)
INSERT [dbo].[State] ([StateID], [StateName], [CreationDate], [ModificationDate], [CountryID]) VALUES (16, N'Punjab', CAST(N'2023-04-13T17:57:54.630' AS DateTime), CAST(N'2023-04-13T17:57:54.630' AS DateTime), 6)
INSERT [dbo].[State] ([StateID], [StateName], [CreationDate], [ModificationDate], [CountryID]) VALUES (17, N'Sonora', CAST(N'2023-04-13T17:59:00.020' AS DateTime), CAST(N'2023-04-13T17:59:00.020' AS DateTime), 7)
INSERT [dbo].[State] ([StateID], [StateName], [CreationDate], [ModificationDate], [CountryID]) VALUES (18, N'Puebla', CAST(N'2023-04-13T17:59:23.577' AS DateTime), CAST(N'2023-04-13T17:59:23.577' AS DateTime), 7)
INSERT [dbo].[State] ([StateID], [StateName], [CreationDate], [ModificationDate], [CountryID]) VALUES (19, N'Islamabad Capital Territory', CAST(N'2023-04-13T18:00:07.713' AS DateTime), CAST(N'2023-04-13T18:00:07.713' AS DateTime), 8)
INSERT [dbo].[State] ([StateID], [StateName], [CreationDate], [ModificationDate], [CountryID]) VALUES (20, N'Balochistan', CAST(N'2023-04-13T18:00:19.790' AS DateTime), CAST(N'2023-04-15T16:33:43.333' AS DateTime), 8)
INSERT [dbo].[State] ([StateID], [StateName], [CreationDate], [ModificationDate], [CountryID]) VALUES (21, N'Doha', CAST(N'2023-04-13T18:00:59.750' AS DateTime), CAST(N'2023-04-13T18:00:59.750' AS DateTime), 9)
INSERT [dbo].[State] ([StateID], [StateName], [CreationDate], [ModificationDate], [CountryID]) VALUES (22, N'Madinat ash Shamal', CAST(N'2023-04-13T18:01:11.720' AS DateTime), CAST(N'2023-04-13T18:01:11.720' AS DateTime), 9)
INSERT [dbo].[State] ([StateID], [StateName], [CreationDate], [ModificationDate], [CountryID]) VALUES (23, N'Busan', CAST(N'2023-04-13T18:02:00.793' AS DateTime), CAST(N'2023-04-15T16:33:36.483' AS DateTime), 10)
INSERT [dbo].[State] ([StateID], [StateName], [CreationDate], [ModificationDate], [CountryID]) VALUES (24, N'Seoul', CAST(N'2023-04-13T18:02:12.983' AS DateTime), CAST(N'2023-04-13T18:02:12.983' AS DateTime), 10)
INSERT [dbo].[State] ([StateID], [StateName], [CreationDate], [ModificationDate], [CountryID]) VALUES (25, N'Hhohho ', CAST(N'2023-04-13T18:02:51.897' AS DateTime), CAST(N'2023-04-13T18:02:51.897' AS DateTime), 11)
INSERT [dbo].[State] ([StateID], [StateName], [CreationDate], [ModificationDate], [CountryID]) VALUES (26, N'Manzini', CAST(N'2023-04-13T18:03:07.530' AS DateTime), CAST(N'2023-04-13T18:03:07.530' AS DateTime), 11)
INSERT [dbo].[State] ([StateID], [StateName], [CreationDate], [ModificationDate], [CountryID]) VALUES (27, N'Madhya Pradesh ', CAST(N'2023-04-15T16:34:27.277' AS DateTime), CAST(N'2023-04-15T16:34:27.277' AS DateTime), 6)
SET IDENTITY_INSERT [dbo].[State] OFF
GO
ALTER TABLE [dbo].[Admin] ADD  CONSTRAINT [DF_Admin_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Admin] ADD  CONSTRAINT [DF_Admin_ModificationDate]  DEFAULT (getdate()) FOR [ModificationDate]
GO
ALTER TABLE [dbo].[Bill] ADD  CONSTRAINT [DF_Bill_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Bill] ADD  CONSTRAINT [DF_Bill_ModificationDate]  DEFAULT (getdate()) FOR [ModificationDate]
GO
ALTER TABLE [dbo].[BillWiseProduct] ADD  CONSTRAINT [DF_BillWiseProduct_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[BillWiseProduct] ADD  CONSTRAINT [DF_BillWiseProduct_ModificationDate]  DEFAULT (getdate()) FOR [ModificationDate]
GO
ALTER TABLE [dbo].[City] ADD  CONSTRAINT [DF_City_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[City] ADD  CONSTRAINT [DF_City_ModificationDate]  DEFAULT (getdate()) FOR [ModificationDate]
GO
ALTER TABLE [dbo].[Country] ADD  CONSTRAINT [DF_Country_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Country] ADD  CONSTRAINT [DF_Country_ModificationDate]  DEFAULT (getdate()) FOR [ModificationDate]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_ModificationDate]  DEFAULT (getdate()) FOR [ModificationDate]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_ModificationDate]  DEFAULT (getdate()) FOR [ModificationDate]
GO
ALTER TABLE [dbo].[ProductType] ADD  CONSTRAINT [DF_ProductType_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ProductType] ADD  CONSTRAINT [DF_ProductType_ModificationDate]  DEFAULT (getdate()) FOR [ModificationDate]
GO
ALTER TABLE [dbo].[State] ADD  CONSTRAINT [DF_State_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[State] ADD  CONSTRAINT [DF_State_ModificationDate]  DEFAULT (getdate()) FOR [ModificationDate]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Bill] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Bill]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_City]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Customer]
GO
ALTER TABLE [dbo].[BillWiseProduct]  WITH CHECK ADD  CONSTRAINT [FK_BillWiseProduct_Bill] FOREIGN KEY([BillID])
REFERENCES [dbo].[Bill] ([BillID])
GO
ALTER TABLE [dbo].[BillWiseProduct] CHECK CONSTRAINT [FK_BillWiseProduct_Bill]
GO
ALTER TABLE [dbo].[BillWiseProduct]  WITH CHECK ADD  CONSTRAINT [FK_BillWiseProduct_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[BillWiseProduct] CHECK CONSTRAINT [FK_BillWiseProduct_Product]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_Country]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_State] FOREIGN KEY([StateID])
REFERENCES [dbo].[State] ([StateID])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_State]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Customer]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductType1] FOREIGN KEY([ProductTypeID])
REFERENCES [dbo].[ProductType] ([ProductTypeID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductType1]
GO
ALTER TABLE [dbo].[State]  WITH CHECK ADD  CONSTRAINT [FK_State_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[State] CHECK CONSTRAINT [FK_State_Country]
GO
/****** Object:  StoredProcedure [dbo].[PR_Admin_DeleteByPK]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_Admin_DeleteByPK]
  @AdminID int
AS
  DELETE 
FROM [dbo].[Admin]
WHERE  [dbo].[Admin].[AdminID] = @AdminID
GO
/****** Object:  StoredProcedure [dbo].[PR_Admin_Insert]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_Admin_Insert]
 @AdminName          nvarchar(50),
 @AdminUserName      nvarchar(50),
 @AdminPassWord      nvarchar(50),
 @CreationDate       datetime,
 @ModificationDate   datetime
 AS
 INSERT INTO [dbo].[Admin]
 (
	AdminName      ,     
	AdminUserName  ,  
	AdminPassWord  ,  
	CreationDate   ,  
	ModificationDate 
 )
 VALUES
 (
	@AdminName                           ,
	@AdminUserName						, 
	@AdminPassWord						,
	Isnull(@CreationDate,getdate())    ,
	Isnull(@ModificationDate,getdate())
 )
GO
/****** Object:  StoredProcedure [dbo].[PR_Admin_SelectAll]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Admin_SelectAll]
AS
SELECT
     [dbo].[Admin].[AdminID],
     [dbo].[Admin].[AdminName],
	 [dbo].[Admin].[AdminPassWord],
	 [dbo].[Admin].[AdminUserName],
	 [dbo].[Admin].[CreationDate],
	 [dbo].[Admin].[ModificationDate]
FROM 
	[dbo].[Admin]

GO
/****** Object:  StoredProcedure [dbo].[PR_Admin_SelectByPK]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--[dbo].[PR_Admin_SelectByPK] @AdminID = 2
CREATE PROCEDURE [dbo].[PR_Admin_SelectByPK] 
  @AdminID int
AS
SELECT
     [dbo].[Admin].[AdminID],
     [dbo].[Admin].[AdminName],
	 [dbo].[Admin].[AdminPassWord],
	 [dbo].[Admin].[AdminUserName],
	 [dbo].[Admin].[CreationDate],
	 [dbo].[Admin].[ModificationDate]
FROM 
	[dbo].[Admin]
WHERE 
  [dbo].[Admin].[AdminID] = @AdminID

GO
/****** Object:  StoredProcedure [dbo].[PR_Admin_UpdateByPK]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--[dbo].[PR_Admin_UpdateByPK] @AdminID = 2, @AdminName = "bhumi" , @AdminUserName = "admin",  @AdminPassWord = "admin123"
CREATE PROC [dbo].[PR_Admin_UpdateByPK]
 @AdminID int,
 @AdminName nvarchar(50),
 @AdminUserName nvarchar(50),
 @AdminPassWord nvarchar(50),
 @ModificationDate datetime
 AS
 UPDATE [dbo].[Admin]
 SET 
    [dbo].[Admin].[AdminName] = @AdminName,
	[dbo].[Admin].[AdminPassWord] = @AdminPassWord,
	[dbo].[Admin].[AdminUserName] = @AdminUserName,
	[dbo].[Admin].[ModificationDate] =  Isnull(@ModificationDate,getdate())	
WHERE 
   [dbo].[Admin].[AdminID] = @AdminID
GO
/****** Object:  StoredProcedure [dbo].[PR_Bill_DeleteByPK]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_Bill_DeleteByPK]
  @BillID int
AS
  DELETE 
FROM [dbo].[Bill]
WHERE  [dbo].[Bill].[BillID] = @BillID
GO
/****** Object:  StoredProcedure [dbo].[PR_Bill_Insert]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_Bill_Insert]
@BillAmount       int,
@BillStatus			nvarchar(50),
@CustomerID			int,
@CreationDate       datetime,
@ModificationDate	datetime,
@CountryID         int,
@StateID     int,
@CityID       int
AS 
INSERT INTO [dbo].[Bill]
(
   BillAmount      ,
   BillStatus		,
   CustomerID	,
   CreationDate ,
   ModificationDate,
   CountryID ,
   StateID   ,
   CityID    

)
VALUES(
	  @BillAmount      ,
	  @BillStatus		,
	  @CustomerID		,
	  Isnull(@CreationDate,getdate())    ,
	Isnull(@ModificationDate,getdate()) ,
	@CountryID ,
	@StateID   ,
	@CityID    
)
GO
/****** Object:  StoredProcedure [dbo].[PR_Bill_SelectAll]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_Bill_SelectAll]
AS
SELECT
    [dbo].[Bill].[BillID],
	[dbo].[Bill].[BillAmount],
	[dbo].[Bill].[BillStatus],
	[dbo].[Bill].[CustomerID],
	[dbo].[Bill].[CreationDate],
	[dbo].[Bill].[ModificationDate],
	[dbo].[Bill].[CountryID],
	[dbo].[Bill].[StateID],
	[dbo].[Bill].[CityID]
	
FROM
		[dbo].[Bill]
INNER JOIN [dbo].[Customer]
on    [dbo].[Customer].[CustomerID] = [dbo].[Bill].[CustomerID]
GO
/****** Object:  StoredProcedure [dbo].[PR_Bill_SelectByPK]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[PR_Bill_SelectByPK]
    @BillID int
as
SELECT
    [dbo].[Bill].[BillID],
	[dbo].[Bill].[BillAmount],
	[dbo].[Bill].[BillStatus],
	[dbo].[Bill].[CustomerID],
	[dbo].[Bill].[CreationDate],
	[dbo].[Bill].[ModificationDate],
	[dbo].[Bill].[CountryID],
	[dbo].[Bill].[StateID],
	[dbo].[Bill].[CityID]
	
FROM
		[dbo].[Bill]
Where [dbo].[Bill].[BillID] = @BillID
GO
/****** Object:  StoredProcedure [dbo].[PR_Bill_UpdateByPK]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_Bill_UpdateByPK]
   @BillID int,
   @BillAmount int,
   @BillStatus nvarchar(50),
   @CustomerID int,
   @ModificationDate datetime,
   @CountryID int,
   @StateID int,
   @CityID int
AS
 UPDATE [dbo].[Bill]
SET
 [dbo].[Bill].[BillAmount] = @BillAmount,
 [dbo].[Bill].[BillStatus] = @BillStatus,
 [dbo].[Bill].[CustomerID] = @CustomerID,
 [dbo].[Bill].[ModificationDate] =  Isnull(@ModificationDate,getdate())	,
 [dbo].[Bill].[CountryID] = @CountryID,
 [dbo].[Bill].[StateID] = @StateID,
 [dbo].[Bill].[CityID] = @CityID
WHERE 
  [dbo].[Bill].[BillID] = @BillID
GO
/****** Object:  StoredProcedure [dbo].[PR_BillWiseProduct_Insert]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_BillWiseProduct_Insert]
   @Quantity              nvarchar(50),
   @CreationDate			datetime,
   @ModificationDate		datetime,
   @BillID					int,
   @ProductID			int
AS
INSERT INTO [dbo].[BillWiseProduct]
 ( 
     Quantity         
	 ,CreationDate	
	 ,ModificationDate
	 ,BillID			
	 ,ProductID		     
 )
 VALUES(
    @Quantity    ,    
	  Isnull(@CreationDate,getdate())    ,
	Isnull(@ModificationDate,getdate())  ,
	@BillID		 ,	
	@ProductID		     
 )
GO
/****** Object:  StoredProcedure [dbo].[PR_BillWiseProduct_SelectAll]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_BillWiseProduct_SelectAll]
AS
SELECT
   [dbo].[BillWiseProduct].[BillIWiseProductID],
   [dbo].[BillWiseProduct].[ProductID],
   [dbo].[BillWiseProduct].[BillID],
   [dbo].[BillWiseProduct].[Quantity],
   [dbo].[BillWiseProduct].[CreationDate],
   [dbo].[BillWiseProduct].[ModificationDate]
   
FROM
   [dbo].[BillWiseProduct]
GO
/****** Object:  StoredProcedure [dbo].[PR_City_DeleteByPK]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--[dbo].[PR_LOC_City_DeleteByPK] @CityID = 6

CREATE procedure [dbo].[PR_City_DeleteByPK]
	@CityID int
as
delete
from  [dbo].[City]
where [dbo].[City].[CityID]=@CityID
GO
/****** Object:  StoredProcedure [dbo].[PR_City_Insert]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- [dbo].[PR_City_Insert] @CityID=12, @CityName = 'africa' ,@CityCode = 12 ,@CreationDate ='2022-10-10',@ModificationDate ='2023-10-10',@countryID= 6,@StateID=12
CREATE PROC [dbo].[PR_City_Insert]
 	@CityName           nvarchar(50),
	@Pincode           nvarchar(50),
	@CreationDate        datetime,
	@ModificationDate    datetime,
	@CountryID           int,
	@StateID             int
AS
 
 INSERT INTO [dbo].[City]
 (
		CityName         
		,Pincode         
		,CreationDate     
		,ModificationDate    
		,CountryID        
  		,StateID 
 )
VALUES
(
		  @CityName         
		 ,@Pincode         
		 ,Isnull(@CreationDate,getdate())     
		 ,Isnull(@ModificationDate,getdate())  
		 ,@CountryID        
		 ,@StateID  
	)
GO
/****** Object:  StoredProcedure [dbo].[PR_City_SelectAll]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_City_SelectAll]
AS
SELECT
     [dbo].[City].[CityID],
     [dbo].[City].[CityName],
	 [dbo].[City].[Pincode],
	 [dbo].[City].[CreationDate],
	 [dbo].[City].[ModificationDate],
	 [dbo].[State].[StateName],
	 [dbo].[Country].[CountryName]

FROM 
	[dbo].[City]
inner join  [dbo].[State]
on [dbo].[State].[StateID] = [dbo].[City].[StateID]
inner join  [dbo].[Country]
 on [dbo].[Country].[CountryID] = [dbo].[City].[CountryID]

 order by [dbo].[Country].[CountryName],
          [dbo].[State].[StateName],
		  [dbo].[City].[CityName]

GO
/****** Object:  StoredProcedure [dbo].[PR_City_SelectByPK]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_City_SelectByPK]
		@CityID		int
as
select 
		[dbo].[City].[CityID],
		[dbo].[City].[CityName],
		[dbo].[City].[Pincode],
		[dbo].[City].[CreationDate],
		[dbo].[City].[ModificationDate],
		[dbo].[City].[CountryID],
		[dbo].[City].[StateID]		
from	[dbo].[City]
where	[dbo].[City].[CityID] = @CityID
GO
/****** Object:  StoredProcedure [dbo].[PR_City_SelectForDropDown]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_City_SelectForDropDown]
as
select 
		[dbo].[City].[CityID],
		[dbo].[City].[CityName]
from	[dbo].[City]
GO
/****** Object:  StoredProcedure [dbo].[PR_City_SelectForDropDownByStateID]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[PR_City_SelectForDropDownByStateID]
 @StateID int
 as
select 
		[dbo].[City].[CityID],
		[dbo].[City].[CityName]
from	[dbo].[City]

where [dbo].[City].[StateID] = @StateID
GO
/****** Object:  StoredProcedure [dbo].[PR_City_UpdateByPK]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_City_UpdateByPK]
	@CityID				int,
	@CityName			nvarchar(50),
	@Pincode			nvarchar(50),
	@ModificationDate	datetime,
	@CountryID			int,
	@StateID			int
as


update	[dbo].[City]
set		[dbo].[City].[CityName] = @CityName,
		[dbo].[City].[Pincode] = @Pincode,
		[dbo].[City].[ModificationDate] = Isnull(@ModificationDate,getdate()),
		[dbo].[City].[CountryID] = @CountryID,
		[dbo].[City].[StateID] = @StateID
where	[dbo].[City].[CityID] = @CityID
GO
/****** Object:  StoredProcedure [dbo].[PR_Country_DeleteByPK]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_Country_DeleteByPK]
  @CountryID int
AS
  DELETE 
FROM [dbo].[Country]
WHERE  [dbo].[Country].[CountryID] = @CountryID
GO
/****** Object:  StoredProcedure [dbo].[PR_Country_Insert]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- [dbo].[PR_Country_Insert] @CountryName = 'africa' ,@CountryCode = 12 ,@CreationDate ='2022-10-10',@ModificationDate ='2023-10-10'
CREATE PROC [dbo].[PR_Country_Insert]
 	@CountryName         nvarchar(50),
	@CountryCode         nvarchar(50),
	@CreationDate        datetime,
	@ModificationDate    datetime
AS
 
 INSERT INTO [dbo].[Country]
 (
		CountryName,
		CountryCode,
		CreationDate,
		ModificationDate
 )
VALUES
(
		 @CountryName,     
		 @CountryCode,     
		 Isnull(@CreationDate,getdate()),    
		 Isnull(@ModificationDate,getdate())
)
GO
/****** Object:  StoredProcedure [dbo].[PR_Country_SelectAll]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PR_LOC_Country_SelectAll

CREATE PROCEDURE [dbo].[PR_Country_SelectAll]
AS
SELECT
     [dbo].[Country].[CountryID],
     [dbo].[Country].[CountryName],
	 [dbo].[Country].[CountryCode],
	 [dbo].[Country].[CreationDate],
	[dbo].[Country].[ModificationDate]
FROM 
	[dbo].[Country]


GO
/****** Object:  StoredProcedure [dbo].[PR_Country_SelectByPK]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_Country_SelectByPK]
		@CountryID		int
as
select 
		[dbo].[Country].[CountryID],
		[dbo].[Country].[CountryName],
		[dbo].[Country].[CountryCode],
		[dbo].[Country].[CreationDate],
		[dbo].[Country].[ModificationDate]
		
from	[dbo].[Country]
where	[dbo].[Country].[CountryID] = @CountryID
GO
/****** Object:  StoredProcedure [dbo].[PR_Country_SelectForDropDown]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_Country_SelectForDropDown]
as
select 
		[dbo].[Country].[CountryID],
		[dbo].[Country].[CountryName]
from	[dbo].[Country]
GO
/****** Object:  StoredProcedure [dbo].[PR_Country_UpdateByPK]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_Country_UpdateByPK]
	@CountryID				int,
	@CountryName			nvarchar(50),
	@CountryCode			nvarchar(50),
	@ModificationDate	datetime
as


update	[dbo].[Country]
set		[dbo].[Country].[CountryName] = @CountryName,
		[dbo].[Country].[CountryCode] = @CountryCode,
		[dbo].[Country].[ModificationDate] = Isnull(@ModificationDate,getdate())
where	[dbo].[Country].[CountryID] = @CountryID
GO
/****** Object:  StoredProcedure [dbo].[PR_Customer_DeleteByPK]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_Customer_DeleteByPK]
  @CustomerID int
AS
  DELETE 
FROM [dbo].[Customer]
WHERE  [dbo].[Customer].[CustomerID] = @CustomerID
GO
/****** Object:  StoredProcedure [dbo].[PR_Customer_Insert]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_Customer_Insert]
 @CustomerName          nvarchar(50),
 @CustomerPassword      nvarchar(50),
 @CreationDate       datetime,
 @ModificationDate   datetime
 AS
 INSERT INTO [dbo].[Customer]
 (
	CustomerName      ,     
	CustomerPassword  , 
	CreationDate   ,  
	ModificationDate 
 )
 VALUES
 (
	 @CustomerName                          ,
	 @CustomerPassword 					, 						
	Isnull(@CreationDate,getdate())    ,
	Isnull(@ModificationDate,getdate())
 )
GO
/****** Object:  StoredProcedure [dbo].[PR_Customer_SelectAll]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_Customer_SelectAll]
AS
SELECT
   [dbo].[Customer].[CustomerID],
   [dbo].[Customer].[CustomerName],
   [dbo].[Customer].[CustomerPassword],
   [dbo].[Customer].[CreationDate],
   [dbo].[Customer].[ModificationDate]
FROM
	[dbo].[Customer]
GO
/****** Object:  StoredProcedure [dbo].[PR_Customer_SelectByPK]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[PR_Customer_SelectByPK]
@CustomerID int
AS
SELECT
   [dbo].[Customer].[CustomerID],
   [dbo].[Customer].[CustomerName],
   [dbo].[Customer].[CustomerPassword],
   [dbo].[Customer].[CreationDate],
   [dbo].[Customer].[ModificationDate]
FROM
	[dbo].[Customer]
WHERE
 [dbo].[Customer].[CustomerID] = @CustomerID
GO
/****** Object:  StoredProcedure [dbo].[PR_Customer_UpdateByPK]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_Customer_UpdateByPK]
 @CustomerID            int,
  @CustomerName          nvarchar(50),
 @CustomerPassword      nvarchar(50),
 @ModificationDate   datetime
AS
 UPDATE [dbo].[Customer]
SET
 [dbo].[Customer].[CustomerName] = @CustomerName,
 [dbo].[Customer].[CustomerPassword] = @CustomerPassword,
 [dbo].[Customer].[ModificationDate] =  Isnull(@ModificationDate,getdate())	
WHERE 
  [dbo].[Customer].[CustomerID] = @CustomerID
GO
/****** Object:  StoredProcedure [dbo].[PR_Product_DeleteByPK]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_Product_DeleteByPK]
  @ProductID int
AS
  DELETE 
FROM [dbo].[Product]
WHERE  [dbo].[Product].[ProductID] = @ProductID
GO
/****** Object:  StoredProcedure [dbo].[PR_Product_Insert]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_Product_Insert]
 @ProductName          nvarchar(50),
 @ProductPicture      nvarchar(MAX),
 @ProductDiscription      nvarchar(50),
 @ProductPrice       int,
 @ProductDiscount     nvarchar(50),
 @ProductTypeID     int,
 @CustomerID int,
 @CreationDate      datetime,
 @ModificationDate   datetime
 AS
 INSERT INTO [dbo].[Product]
 (
	ProductName        ,
	ProductPicture    ,
	ProductDiscription ,
	ProductPrice       ,
	ProductDiscount   ,
	ProductTypeID     ,
	CustomerID        ,
	CreationDate      ,
	ModificationDate  
 )
 VALUES
 (
	@ProductName ,
	@ProductPicture     			, 
	@ProductDiscription 			,
	@ProductPrice       ,
	@ProductDiscount    ,
	@ProductTypeID    ,
	 @CustomerID,
	Isnull(@CreationDate,getdate())    ,
	Isnull(@ModificationDate,getdate())
 )
GO
/****** Object:  StoredProcedure [dbo].[PR_Product_SelectAll]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_Product_SelectAll]
AS
SELECT
  [dbo].[Product].[ProductID],
  [dbo].[Product].[ProductName],
  [dbo].[Product].[ProductPicture],
  [dbo].[Product].[ProductDiscription],
  [dbo].[Product].[ProductPrice],
  [dbo].[Product].[ProductDiscount],
  [dbo].[Product].[ProductTypeID],
  [dbo].[Product].[CustomerID],
  [dbo].[Product].[CreationDate],
  [dbo].[Product].[ModificationDate]
FROM
 [dbo].[Product]

GO
/****** Object:  StoredProcedure [dbo].[PR_Product_SelectByPK]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_Product_SelectByPK]
@ProductID int
AS
SELECT
  [dbo].[Product].[ProductID],
  [dbo].[Product].[ProductName],
  [dbo].[Product].[ProductPicture],
  [dbo].[Product].[ProductDiscription],
  [dbo].[Product].[ProductPrice],
  [dbo].[Product].[ProductDiscount],
  [dbo].[Product].[ProductTypeID],
  [dbo].[Product].[CustomerID],
  [dbo].[Product].[CreationDate],
  [dbo].[Product].[ModificationDate]
FROM
 [dbo].[Product]
WHERE
  [dbo].[Product].[ProductID] = @ProductID
GO
/****** Object:  StoredProcedure [dbo].[PR_Product_UpdateByPK]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_Product_UpdateByPK]
@ProductID        int,
 @ProductName          nvarchar(50),
 @ProductPicture      nvarchar(500),
 @ProductDiscription      nvarchar(50),
 @ProductPrice       int,
 @ProductDiscount     nvarchar(50),
 @ProductTypeID     int,
 @CustomerID        int,
 @ModificationDate   datetime
 AS
 UPDATE [dbo].[Product]
 SET 
    [dbo].[Product].[ProductName] = @ProductName,
	[dbo].[Product].[ProductPicture] = @ProductPicture,
	[dbo].[Product].[ProductDiscription] = @ProductDiscription,
	[dbo].[Product].[ProductPrice] = @ProductPrice,
	[dbo].[Product].[ProductDiscount] = @ProductDiscount,
	[dbo].[Product].[ProductTypeID] = @ProductTypeID,
	[dbo].[Product].[CustomerID]  = @CustomerID,
	[dbo].[Product].[ModificationDate] =  Isnull(@ModificationDate,getdate())	
WHERE 
   [dbo].[Product].[ProductID] = @ProductID
GO
/****** Object:  StoredProcedure [dbo].[PR_ProductType_DeleteByPK]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_ProductType_DeleteByPK]
  @ProductTypeID int
AS
  DELETE 
FROM [dbo].[ProductType]
WHERE  [dbo].[ProductType].[ProductTypeID] = @ProductTypeID
GO
/****** Object:  StoredProcedure [dbo].[PR_ProductType_Insert]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_ProductType_Insert]
 @ProductType          nvarchar(50),
 @CreationDate       datetime,
 @ModificationDate   datetime
 AS
 INSERT INTO [dbo].[ProductType]
 (
	ProductType  ,     
	CreationDate   ,  
	ModificationDate 
 )
 VALUES
 (
	@ProductType                           ,
	Isnull(@CreationDate,getdate())    ,
	Isnull(@ModificationDate,getdate())
 )
GO
/****** Object:  StoredProcedure [dbo].[PR_ProductType_SelectAll]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_ProductType_SelectAll]
AS
SELECT
  [dbo].[ProductType].[ProductTypeID],
  [dbo].[ProductType].[ProductType],
  [dbo].[ProductType].[CreationDate],
  [dbo].[ProductType].[ModificationDate]
FROM
  [dbo].[ProductType]
GO
/****** Object:  StoredProcedure [dbo].[PR_ProductType_SelectByPK]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_ProductType_SelectByPK]
 @ProductTypeID int
AS
SELECT
  [dbo].[ProductType].[ProductTypeID],
  [dbo].[ProductType].[ProductType],
  [dbo].[ProductType].[CreationDate],
  [dbo].[ProductType].[ModificationDate]
FROM
  [dbo].[ProductType]
WHERE 
 [dbo].[ProductType].[ProductTypeID] = @ProductTypeID
GO
/****** Object:  StoredProcedure [dbo].[PR_ProductType_UpdateByPK]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_ProductType_UpdateByPK]
 @ProductTypeID int,
 @ProductType nvarchar(50),
 @ModificationDate datetime
 AS
 UPDATE [dbo].[ProductType]
 SET 
    [dbo].[ProductType].[ProductType] = @ProductType,
	[dbo].[ProductType].[ModificationDate] =  Isnull(@ModificationDate,getdate())	
WHERE 
   [dbo].[ProductType].[ProductTypeID] = @ProductTypeID
GO
/****** Object:  StoredProcedure [dbo].[PR_State_DeleteByPK]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--[dbo].[PR_LOC_State_DeleteByPK] @StateID = 6

create procedure [dbo].[PR_State_DeleteByPK]
	@StateID int
as
delete
from  [dbo].[State]
where [dbo].[State].[StateID]=@StateID
GO
/****** Object:  StoredProcedure [dbo].[PR_State_Insert]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PR_State_Insert]
 	@StateName           nvarchar(50),
	@CreationDate        datetime,
	@ModificationDate    datetime,
	@CountryID           int
AS
 
 INSERT INTO [dbo].[State]
 (
		 StateName           
		,CreationDate    
		,ModificationDate
		,CountryID
 )  
VALUES
(
		  @StateName           
		 ,Isnull(@CreationDate,getdate())    
		 ,Isnull(@ModificationDate,getdate())  
         ,@CountryID
)		
GO
/****** Object:  StoredProcedure [dbo].[PR_State_SelectAll]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_State_SelectAll]
AS
SELECT
     [dbo].[State].[StateID],
     [dbo].[State].[StateName],
	 [dbo].[State].[CreationDate],
	 [dbo].[State].[ModificationDate],
	 [dbo].[Country].[CountryName]

FROM 
	[dbo].[State]inner join [dbo].[Country]
On [dbo].[Country].[CountryID]=[dbo].[State].[CountryID]
order by [dbo].[Country].[CountryName],
         [dbo].[State].[StateName]
GO
/****** Object:  StoredProcedure [dbo].[PR_State_SelectByPK]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_State_SelectByPK]
		@StateID		int
as
select 
		[dbo].[State].[StateID],
		[dbo].[State].[StateName],
		[dbo].[State].[CreationDate],
		[dbo].[State].[ModificationDate],
		[dbo].[State].[CountryID]
		
from	[dbo].[State]
where	[dbo].[State].[StateID] = @StateID
GO
/****** Object:  StoredProcedure [dbo].[PR_State_SelectForDropDownByCountryID]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[PR_State_SelectForDropDownByCountryID]

 @CountryID int
 as
select 
		[dbo].[State].[StateID],
		[dbo].[State].[StateName]
from	[dbo].[State]

where [dbo].[State].[CountryID] = @CountryID
GO
/****** Object:  StoredProcedure [dbo].[PR_State_UpdateByPK]    Script Date: 18/04/2023 21:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_State_UpdateByPK]
	@StateID				int,
	@StateName			nvarchar(50),
	@ModificationDate	datetime,
	@CountryID			int
as


update	[dbo].[State]
set		[dbo].[State].[StateName] = @StateName,
		[dbo].[State].[ModificationDate] =ISNULL( @ModificationDate,getdate()),
		[dbo].[State].[CountryID] = @CountryID
where	[dbo].[State].[StateID] = @StateID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Admin', @level2type=N'COLUMN',@level2name=N'CreationDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Admin', @level2type=N'COLUMN',@level2name=N'ModificationDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'CreationDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'ModificationDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductType', @level2type=N'COLUMN',@level2name=N'CreationDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductType', @level2type=N'COLUMN',@level2name=N'ModificationDate'
GO
USE [master]
GO
ALTER DATABASE [Reclaim_The_Art] SET  READ_WRITE 
GO
