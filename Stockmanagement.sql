USE [master]
GO
/****** Object:  Database [StockManagemnet]    Script Date: 6/22/2023 11:25:14 AM ******/
CREATE DATABASE [StockManagemnet]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StockManagemnet', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.FANNABY\MSSQL\DATA\StockManagemnet.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StockManagemnet_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.FANNABY\MSSQL\DATA\StockManagemnet_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [StockManagemnet] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StockManagemnet].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StockManagemnet] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StockManagemnet] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StockManagemnet] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StockManagemnet] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StockManagemnet] SET ARITHABORT OFF 
GO
ALTER DATABASE [StockManagemnet] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [StockManagemnet] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StockManagemnet] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StockManagemnet] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StockManagemnet] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StockManagemnet] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StockManagemnet] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StockManagemnet] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StockManagemnet] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StockManagemnet] SET  ENABLE_BROKER 
GO
ALTER DATABASE [StockManagemnet] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StockManagemnet] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StockManagemnet] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StockManagemnet] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StockManagemnet] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StockManagemnet] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StockManagemnet] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StockManagemnet] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StockManagemnet] SET  MULTI_USER 
GO
ALTER DATABASE [StockManagemnet] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StockManagemnet] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StockManagemnet] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StockManagemnet] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StockManagemnet] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [StockManagemnet] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'StockManagemnet', N'ON'
GO
ALTER DATABASE [StockManagemnet] SET QUERY_STORE = ON
GO
ALTER DATABASE [StockManagemnet] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [StockManagemnet]
GO
/****** Object:  Table [dbo].[Assets]    Script Date: 6/22/2023 11:25:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[AssetName] [nvarchar](250) NULL,
	[Status] [bit] NULL,
	[image] [nvarchar](250) NULL,
	[Specification] [nvarchar](250) NULL,
 CONSTRAINT [PK__Assets__3214EC0777F6477E] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BorrowingAsset]    Script Date: 6/22/2023 11:25:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BorrowingAsset](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BorrowDate] [date] NULL,
	[AssetId] [int] NULL,
	[Status] [bit] NULL,
	[Amount] [int] NULL,
	[DueDate] [date] NULL,
	[BorrowerId] [int] NULL,
	[RetrurnDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 6/22/2023 11:25:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 6/22/2023 11:25:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/22/2023 11:25:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](250) NULL,
	[Password] [nvarchar](250) NULL,
	[FirstName] [nvarchar](250) NULL,
	[LastName] [nvarchar](250) NULL,
	[PhoneNumber] [int] NULL,
	[Addrress] [nvarchar](max) NULL,
	[Status] [bit] NULL,
	[Gender] [bit] NULL,
	[RoleId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Assets] ON 

INSERT [dbo].[Assets] ([Id], [CategoryId], [AssetName], [Status], [image], [Specification]) VALUES (1, 1, N'Laptop Dell', 0, N'/laptopDell.jpg', N'Laptop dell gaming')
INSERT [dbo].[Assets] ([Id], [CategoryId], [AssetName], [Status], [image], [Specification]) VALUES (2, 1, N'Laptop Asus', 0, N'/laptopAsus.jpg', N'Laptop asus gaming')
INSERT [dbo].[Assets] ([Id], [CategoryId], [AssetName], [Status], [image], [Specification]) VALUES (4, 2, N'Samsung galaxy Y', 0, N'/samsungY.jpg', N'Samsung Galaxy Y S5360 Android smartphone. Announced Aug 2011. Features 3.0? display, 2 MP primary camera, 1200 mAh battery, 180 MB storage.')
INSERT [dbo].[Assets] ([Id], [CategoryId], [AssetName], [Status], [image], [Specification]) VALUES (5, 3, N'Logitech M186', 0, N'/mouseM186.jpg', N'Mouse gaming')
INSERT [dbo].[Assets] ([Id], [CategoryId], [AssetName], [Status], [image], [Specification]) VALUES (7, 4, N'Philips H8506 ', 0, N'/headphonePhilip.jpg', N'Philips H8506 Over-Ear Wireless Headphones with Noise Canceling Pro (ANC) and Multipoint Bluetooth Connection, 60 Hours Playtime, (TAH8506BK/00)')
INSERT [dbo].[Assets] ([Id], [CategoryId], [AssetName], [Status], [image], [Specification]) VALUES (10, 5, N'Sony Alpha 7', 0, N'/cameraSony.jpg', N'Sony Alpha 7 IV Full-frame Mirrorless Interchangeable Lens Camera with 28-70mm Zoom Lens Kit')
INSERT [dbo].[Assets] ([Id], [CategoryId], [AssetName], [Status], [image], [Specification]) VALUES (13, 15, N'Logitech', 0, N'341515681_1608536579644024_6380405029560073124_n.png', N'vip')
SET IDENTITY_INSERT [dbo].[Assets] OFF
GO
SET IDENTITY_INSERT [dbo].[BorrowingAsset] ON 

INSERT [dbo].[BorrowingAsset] ([Id], [BorrowDate], [AssetId], [Status], [Amount], [DueDate], [BorrowerId], [RetrurnDate]) VALUES (35, CAST(N'2023-04-25' AS Date), 2, 0, 1, CAST(N'2023-04-28' AS Date), 10, CAST(N'2023-04-26' AS Date))
INSERT [dbo].[BorrowingAsset] ([Id], [BorrowDate], [AssetId], [Status], [Amount], [DueDate], [BorrowerId], [RetrurnDate]) VALUES (36, CAST(N'2023-04-25' AS Date), 1, 0, 1, CAST(N'2023-04-29' AS Date), 12, CAST(N'2023-04-25' AS Date))
INSERT [dbo].[BorrowingAsset] ([Id], [BorrowDate], [AssetId], [Status], [Amount], [DueDate], [BorrowerId], [RetrurnDate]) VALUES (37, CAST(N'2023-04-26' AS Date), 2, 1, 1, CAST(N'2023-04-28' AS Date), 13, NULL)
SET IDENTITY_INSERT [dbo].[BorrowingAsset] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [CategoryName]) VALUES (1, N'Laptop')
INSERT [dbo].[Categories] ([Id], [CategoryName]) VALUES (2, N'Smartphone')
INSERT [dbo].[Categories] ([Id], [CategoryName]) VALUES (3, N'Mouse')
INSERT [dbo].[Categories] ([Id], [CategoryName]) VALUES (4, N'Keyboard')
INSERT [dbo].[Categories] ([Id], [CategoryName]) VALUES (5, N'Headphone')
INSERT [dbo].[Categories] ([Id], [CategoryName]) VALUES (6, N'Camera')
INSERT [dbo].[Categories] ([Id], [CategoryName]) VALUES (7, N'Laptop')
INSERT [dbo].[Categories] ([Id], [CategoryName]) VALUES (8, N'Smartphone')
INSERT [dbo].[Categories] ([Id], [CategoryName]) VALUES (15, N'Mouse')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([Id], [RoleName]) VALUES (2, N'User')
INSERT [dbo].[Roles] ([Id], [RoleName]) VALUES (7, N'User')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Username], [Password], [FirstName], [LastName], [PhoneNumber], [Addrress], [Status], [Gender], [RoleId]) VALUES (10, N'fanna', N'1', N'Fannaby', N'Nam', 93912313, N'qweqweqwe', 1, 1, 2)
INSERT [dbo].[Users] ([Id], [Username], [Password], [FirstName], [LastName], [PhoneNumber], [Addrress], [Status], [Gender], [RoleId]) VALUES (11, N'kiki', N'1', N'fanna', N'kiki', 424234, N'adawd', 1, 0, 1)
INSERT [dbo].[Users] ([Id], [Username], [Password], [FirstName], [LastName], [PhoneNumber], [Addrress], [Status], [Gender], [RoleId]) VALUES (12, N'fpt', N'1', N'fpt', N'univer', 93123, N'Hola', 1, 0, 7)
INSERT [dbo].[Users] ([Id], [Username], [Password], [FirstName], [LastName], [PhoneNumber], [Addrress], [Status], [Gender], [RoleId]) VALUES (13, N'user', N'1', N'Arturo', N'Nam', 23123213, N'Hola', 1, 1, 2)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Assets]  WITH CHECK ADD  CONSTRAINT [FK__Assets__Category__398D8EEE] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Assets] CHECK CONSTRAINT [FK__Assets__Category__398D8EEE]
GO
ALTER TABLE [dbo].[BorrowingAsset]  WITH CHECK ADD  CONSTRAINT [FK__Borrowing__Asset__2C3393D0] FOREIGN KEY([AssetId])
REFERENCES [dbo].[Assets] ([Id])
GO
ALTER TABLE [dbo].[BorrowingAsset] CHECK CONSTRAINT [FK__Borrowing__Asset__2C3393D0]
GO
ALTER TABLE [dbo].[BorrowingAsset]  WITH CHECK ADD FOREIGN KEY([BorrowerId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
USE [master]
GO
ALTER DATABASE [StockManagemnet] SET  READ_WRITE 
GO
