USE [master]
GO
/****** Object:  Database [CarPoolingDB]    Script Date: 2023/3/15 14:57:59 ******/
CREATE DATABASE [CarPoolingDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'linshi', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\linshi.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'linshi_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\linshi_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CarPoolingDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CarPoolingDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CarPoolingDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CarPoolingDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CarPoolingDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CarPoolingDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CarPoolingDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CarPoolingDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CarPoolingDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CarPoolingDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CarPoolingDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CarPoolingDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CarPoolingDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CarPoolingDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CarPoolingDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CarPoolingDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CarPoolingDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CarPoolingDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CarPoolingDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CarPoolingDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CarPoolingDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CarPoolingDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CarPoolingDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CarPoolingDB] SET RECOVERY FULL 
GO
ALTER DATABASE [CarPoolingDB] SET  MULTI_USER 
GO
ALTER DATABASE [CarPoolingDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CarPoolingDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CarPoolingDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CarPoolingDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CarPoolingDB', N'ON'
GO
USE [CarPoolingDB]
GO
/****** Object:  Table [dbo].[Follow]    Script Date: 2023/3/15 14:58:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Follow](
	[FollowID] [int] IDENTITY(1,1) NOT NULL,
	[L_ID] [int] NULL,
	[S_ID] [int] NULL,
	[UserID] [int] NOT NULL,
	[AddNumber] [int] NOT NULL,
 CONSTRAINT [PK_Follow] PRIMARY KEY CLUSTERED 
(
	[FollowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LongDistance]    Script Date: 2023/3/15 14:58:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LongDistance](
	[L_ID] [int] IDENTITY(1,1) NOT NULL,
	[L_StartingPlace] [nvarchar](50) NOT NULL,
	[L_Destination] [nvarchar](50) NOT NULL,
	[L_TimeRequired] [nvarchar](50) NOT NULL,
	[L_Number] [int] NOT NULL,
	[L_Kilometers] [decimal](8, 2) NOT NULL,
	[L_Price] [decimal](8, 2) NOT NULL,
	[L_Message] [nvarchar](50) NOT NULL,
	[PublishID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_Driver] PRIMARY KEY CLUSTERED 
(
	[L_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publish]    Script Date: 2023/3/15 14:58:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publish](
	[PublishID] [int] IDENTITY(1,1) NOT NULL,
	[PublishName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Fabu] PRIMARY KEY CLUSTERED 
(
	[PublishID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShortDistance]    Script Date: 2023/3/15 14:58:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShortDistance](
	[S_ID] [int] IDENTITY(1,1) NOT NULL,
	[S_StartingPlace] [nvarchar](50) NOT NULL,
	[S_Approach] [nvarchar](50) NULL,
	[S_Destination] [nvarchar](50) NOT NULL,
	[S_TimeRequired] [nvarchar](50) NOT NULL,
	[S_Number] [int] NOT NULL,
	[S_Kilometers] [decimal](8, 2) NOT NULL,
	[S_Price] [decimal](8, 2) NOT NULL,
	[S_Message] [nvarchar](50) NOT NULL,
	[PublishID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK__Driver_c__F1B1CD246A8E4ACD] PRIMARY KEY CLUSTERED 
(
	[S_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 2023/3/15 14:58:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfo](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[UserAccount] [nvarchar](50) NOT NULL,
	[UserPwd] [nvarchar](50) NOT NULL,
	[UserPhone] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[CarType] [nvarchar](50) NULL,
	[CarID] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserInfo] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Follow] ON 

INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (1, NULL, 16, 10, 4)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (2, 34, NULL, 5, 1)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (3, NULL, 59, 86, 2)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (4, NULL, 100, 7, 4)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (5, NULL, 34, 46, 2)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (6, 32, NULL, 22, 2)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (7, 12, NULL, 41, 3)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (8, 19, NULL, 97, 2)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (9, 46, NULL, 61, 1)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (10, 16, NULL, 47, 1)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (11, 41, NULL, 81, 3)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (12, 20, NULL, 89, 4)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (13, NULL, 95, 81, 1)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (14, NULL, 83, 45, 4)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (15, NULL, 69, 82, 1)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (16, NULL, 52, 24, 4)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (17, 32, NULL, 66, 2)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (18, NULL, 47, 45, 2)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (19, 26, NULL, 61, 2)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (20, NULL, 74, 60, 3)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (21, NULL, 79, 91, 3)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (22, NULL, 58, 91, 3)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (23, 31, NULL, 51, 3)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (24, NULL, 61, 25, 3)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (25, NULL, 55, 12, 1)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (26, NULL, 95, 9, 1)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (27, 20, NULL, 55, 1)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (28, NULL, 8, 53, 1)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (29, NULL, 88, 52, 4)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (30, NULL, 30, 29, 2)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (31, NULL, 95, 75, 2)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (32, NULL, 73, 14, 4)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (33, 44, NULL, 89, 3)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (34, 43, NULL, 61, 1)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (35, NULL, 8, 22, 2)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (36, NULL, 18, 5, 1)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (37, 23, NULL, 52, 1)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (38, NULL, 47, 34, 2)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (39, 22, NULL, 79, 3)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (40, NULL, 11, 12, 2)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (41, 9, NULL, 81, 1)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (42, 33, NULL, 53, 1)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (43, 4, NULL, 40, 2)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (44, NULL, 40, 7, 4)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (45, 50, NULL, 20, 2)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (46, 23, NULL, 54, 1)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (47, NULL, 67, 37, 1)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (48, 8, NULL, 55, 3)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (49, 1, NULL, 79, 3)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (50, NULL, 97, 100, 4)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (51, NULL, 91, 5, 2)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (52, NULL, 36, 15, 4)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (53, 25, NULL, 89, 1)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (54, NULL, 44, 97, 3)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (55, NULL, 98, 94, 3)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (56, 20, NULL, 40, 4)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (57, 39, NULL, 19, 4)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (58, NULL, 96, 3, 3)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (59, 9, NULL, 15, 3)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (60, 11, NULL, 48, 2)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (61, NULL, 51, 7, 1)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (62, NULL, 23, 91, 4)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (63, 18, NULL, 80, 4)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (64, 5, NULL, 13, 2)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (65, NULL, 49, 4, 2)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (66, NULL, 61, 82, 1)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (67, 33, NULL, 51, 3)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (68, NULL, 44, 30, 1)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (69, 23, NULL, 95, 1)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (70, 1, NULL, 10, 4)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (71, NULL, 78, 7, 2)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (72, 33, NULL, 92, 2)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (73, 24, NULL, 70, 3)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (74, 50, NULL, 31, 2)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (75, 41, NULL, 54, 1)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (76, NULL, 66, 4, 1)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (77, 6, NULL, 36, 4)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (78, NULL, 2, 11, 3)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (79, NULL, 7, 96, 2)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (80, NULL, 14, 5, 3)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (81, NULL, 69, 61, 2)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (82, 4, NULL, 74, 1)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (83, NULL, 20, 95, 3)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (84, 10, NULL, 7, 2)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (85, 19, NULL, 22, 4)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (86, NULL, 65, 22, 3)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (87, NULL, 5, 86, 2)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (88, NULL, 7, 6, 3)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (89, NULL, 70, 100, 1)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (90, NULL, 75, 93, 1)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (91, 25, NULL, 9, 2)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (92, NULL, 95, 38, 1)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (93, NULL, 55, 94, 1)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (94, 39, NULL, 23, 3)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (95, 13, NULL, 89, 2)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (96, NULL, 77, 49, 1)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (97, 15, NULL, 79, 4)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (98, NULL, 65, 20, 3)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (99, NULL, 11, 96, 3)
GO
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (100, 47, NULL, 8, 4)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (101, NULL, 56, 97, 1)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (102, 36, NULL, 20, 3)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (103, 7, NULL, 9, 2)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (104, NULL, 29, 9, 3)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (105, 49, NULL, 46, 1)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (106, NULL, 85, 87, 2)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (107, 32, NULL, 45, 3)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (108, NULL, 52, 43, 4)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (109, NULL, 37, 53, 3)
INSERT [dbo].[Follow] ([FollowID], [L_ID], [S_ID], [UserID], [AddNumber]) VALUES (110, NULL, 63, 75, 2)
SET IDENTITY_INSERT [dbo].[Follow] OFF
GO
SET IDENTITY_INSERT [dbo].[LongDistance] ON 

INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (1, N'丽江市', N'重庆市', N'2023-01-01 14:23:00.000', 6, CAST(29.00 AS Decimal(8, 2)), CAST(123.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 29)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (2, N'崇州市', N'仁怀市', N'2023-01-02 10:12:00.000', 3, CAST(197.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 85)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (3, N'仁怀市', N'乐山市', N'2023-01-02 13:40:00.000', 0, CAST(132.00 AS Decimal(8, 2)), CAST(88.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 2, 71)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (4, N'南充市', N'德阳市', N'2023-01-02 20:24:00.000', 5, CAST(36.00 AS Decimal(8, 2)), CAST(52.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 71)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (5, N'宣威市', N'自贡市', N'2023-01-03 08:53:00.000', 0, CAST(71.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 2, 97)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (6, N'遵义市', N'宣威市', N'2023-01-04 12:38:00.000', 2, CAST(60.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 97)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (7, N'华蓥市', N'阆中市', N'2023-01-04 14:58:00.000', 5, CAST(271.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 81)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (8, N'雅安市', N'昆明市', N'2023-01-05 12:50:00.000', 3, CAST(105.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 6)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (9, N'乐山市', N'绵竹市', N'2023-01-05 17:03:00.000', 5, CAST(426.00 AS Decimal(8, 2)), CAST(67.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 5)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (10, N'凯里市', N'遵义市', N'2023-01-06 20:07:00.000', 2, CAST(81.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 64)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (11, N'广元市', N'安顺市', N'2023-01-08 11:54:00.000', 6, CAST(464.00 AS Decimal(8, 2)), CAST(71.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 96)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (12, N'双流县', N'都江堰市', N'2023-01-08 18:09:00.000', 0, CAST(48.00 AS Decimal(8, 2)), CAST(145.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 2, 73)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (13, N'内江市', N'昭通市', N'2023-01-08 19:18:00.000', 4, CAST(254.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 22)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (14, N'宜宾市', N'双流县', N'2023-01-09 12:25:00.000', 1, CAST(379.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 13)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (15, N'彭州市', N'巴中市', N'2023-01-09 15:04:00.000', 6, CAST(195.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 28)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (16, N'都江堰市', N'广元市', N'2023-01-11 14:27:00.000', 3, CAST(394.00 AS Decimal(8, 2)), CAST(89.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 44)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (17, N'安宁市', N'内江市', N'2023-01-13 13:04:00.000', 5, CAST(388.00 AS Decimal(8, 2)), CAST(68.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 68)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (18, N'昆明市', N'南充市', N'2023-01-13 14:39:00.000', 4, CAST(432.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 35)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (19, N'六盘水市', N'彭州市', N'2023-01-13 19:58:00.000', 3, CAST(500.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 95)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (20, N'兴义市', N'资阳市', N'2023-01-14 10:26:00.000', 1, CAST(155.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 21)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (21, N'安宁市', N'乐山市', N'2023-01-15 11:30:00.000', 1, CAST(407.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 9)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (22, N'眉山市', N'双流县', N'2023-01-15 12:47:00.000', 2, CAST(288.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 43)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (23, N'景洪市', N'西昌市', N'2023-01-15 15:08:00.000', 6, CAST(349.00 AS Decimal(8, 2)), CAST(78.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 3)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (24, N'昭通市', N'广汉市', N'2023-01-15 15:09:00.000', 1, CAST(289.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 48)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (25, N'宜宾市', N'大理市', N'2023-01-16 08:32:00.000', 4, CAST(169.00 AS Decimal(8, 2)), CAST(51.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 14)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (26, N'雅安市', N'眉山市', N'2023-01-16 15:31:00.000', 1, CAST(409.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 92)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (27, N'绵竹市', N'攀枝花市', N'2023-01-16 18:06:00.000', 4, CAST(499.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 47)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (28, N'贵阳市', N'内江市', N'2023-01-20 15:37:00.000', 4, CAST(312.00 AS Decimal(8, 2)), CAST(148.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 68)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (29, N'重庆市', N'绵阳市', N'2023-01-22 19:12:00.000', 5, CAST(127.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 22)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (30, N'兴义市', N'贵阳市', N'2023-01-23 15:46:00.000', 2, CAST(269.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 25)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (31, N'简阳市', N'凯里市', N'2023-01-25 08:32:00.000', 6, CAST(386.00 AS Decimal(8, 2)), CAST(71.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 71)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (32, N'曲靖市', N'遵义市', N'2023-01-25 16:23:00.000', 6, CAST(235.00 AS Decimal(8, 2)), CAST(149.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 76)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (33, N'江油市', N'彭州市', N'2023-01-26 19:31:00.000', 0, CAST(39.00 AS Decimal(8, 2)), CAST(67.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 2, 55)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (34, N'赤水市', N'阆中市', N'2023-01-27 08:21:00.000', 2, CAST(203.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 39)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (35, N'昆明市', N'崇州市', N'2023-01-27 09:31:00.000', 6, CAST(486.00 AS Decimal(8, 2)), CAST(52.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 13)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (36, N'遵义市', N'都江堰市', N'2023-01-27 13:21:00.000', 3, CAST(464.00 AS Decimal(8, 2)), CAST(84.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 45)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (37, N'开远市', N'宜宾市', N'2023-01-28 14:08:00.000', 0, CAST(88.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 2, 8)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (38, N'铜仁市', N'成都市', N'2023-01-28 17:12:00.000', 5, CAST(334.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 89)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (39, N'巴中市', N'赤水市', N'2023-01-30 08:44:00.000', 4, CAST(272.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 42)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (40, N'宣威市', N'巴中市', N'2023-01-30 17:14:00.000', 3, CAST(235.00 AS Decimal(8, 2)), CAST(94.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 93)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (41, N'丽江市', N'贵阳市', N'2023-01-31 19:07:00.000', 2, CAST(202.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 71)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (42, N'资阳市', N'绵竹市', N'2023-02-02 18:22:00.000', 5, CAST(68.00 AS Decimal(8, 2)), CAST(150.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 66)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (43, N'邛崃市', N'兴义市', N'2023-02-02 20:28:00.000', 2, CAST(35.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 11)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (44, N'绵竹市', N'毕节市', N'2023-02-03 13:13:00.000', 4, CAST(334.00 AS Decimal(8, 2)), CAST(95.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 80)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (45, N'昭通市', N'都江堰市', N'2023-02-04 09:44:00.000', 1, CAST(271.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 63)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (46, N'楚雄市', N'玉溪市', N'2023-02-04 12:38:00.000', 4, CAST(440.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 18)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (47, N'景洪市', N'大理市', N'2023-02-04 20:53:00.000', 1, CAST(436.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 88)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (48, N'昆明市', N'广汉市', N'2023-02-05 15:54:00.000', 1, CAST(76.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 86)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (49, N'成都市', N'德阳市', N'2023-02-06 14:19:00.000', 2, CAST(267.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 18)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (50, N'都江堰市', N'昭通市', N'2023-02-06 15:33:00.000', 5, CAST(175.00 AS Decimal(8, 2)), CAST(82.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 63)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (51, N'崇州市', N'达州市', N'2023-02-07 11:30:00.000', 5, CAST(250.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 73)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (52, N'仁怀市', N'简阳市', N'2023-02-07 17:39:00.000', 4, CAST(420.00 AS Decimal(8, 2)), CAST(128.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 76)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (53, N'广元市', N'昆明市', N'2023-02-07 20:04:00.000', 2, CAST(399.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 51)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (54, N'万源市', N'遂宁市', N'2023-02-09 18:25:00.000', 2, CAST(228.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 35)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (55, N'安顺市', N'广安市', N'2023-02-10 13:50:00.000', 5, CAST(297.00 AS Decimal(8, 2)), CAST(87.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 82)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (56, N'华蓥市', N'眉山市', N'2023-02-10 20:54:00.000', 2, CAST(246.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 92)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (57, N'宜宾市', N'雅安市', N'2023-02-11 21:37:00.000', 3, CAST(178.00 AS Decimal(8, 2)), CAST(61.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 74)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (58, N'泸州市', N'都匀市', N'2023-02-12 21:56:00.000', 0, CAST(431.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 2, 72)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (59, N'峨眉山市', N'泸州市', N'2023-02-13 14:37:00.000', 1, CAST(150.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 74)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (60, N'广安市', N'昆明市', N'2023-05-31 18:18:00.000', 5, CAST(471.00 AS Decimal(8, 2)), CAST(107.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 76)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (61, N'昆明市', N'宣威市', N'2023-06-01 10:57:00.000', 2, CAST(495.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 65)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (62, N'丽江市', N'江油市', N'2023-06-01 14:02:00.000', 6, CAST(167.00 AS Decimal(8, 2)), CAST(83.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 52)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (63, N'简阳市', N'江油市', N'2023-06-02 13:09:00.000', 1, CAST(424.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 50)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (64, N'宣威市', N'大理市', N'2023-06-02 16:53:00.000', 2, CAST(26.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 98)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (65, N'保山市', N'楚雄市', N'2023-06-03 10:56:00.000', 4, CAST(377.00 AS Decimal(8, 2)), CAST(81.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 84)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (66, N'成都市', N'都匀市', N'2023-06-03 13:49:00.000', 3, CAST(401.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 30)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (67, N'广汉市', N'清镇市', N'2023-06-03 16:23:00.000', 0, CAST(111.00 AS Decimal(8, 2)), CAST(133.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 2, 3)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (68, N'安宁市', N'巴中市', N'2023-06-03 18:30:00.000', 6, CAST(237.00 AS Decimal(8, 2)), CAST(90.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 95)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (69, N'泸州市', N'什邡市', N'2023-06-04 12:49:00.000', 5, CAST(163.00 AS Decimal(8, 2)), CAST(98.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 74)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (70, N'绵竹市', N'成都市', N'2023-06-05 09:48:00.000', 6, CAST(228.00 AS Decimal(8, 2)), CAST(89.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 50)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (71, N'峨眉山市', N'达州市', N'2023-06-06 17:58:00.000', 6, CAST(489.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 90)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (72, N'广元市', N'玉溪市', N'2023-06-06 19:50:00.000', 4, CAST(242.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 71)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (73, N'乐山市', N'凯里市', N'2023-06-07 12:53:00.000', 0, CAST(473.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 2, 73)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (74, N'毕节市', N'毕节市', N'2023-06-07 16:04:00.000', 6, CAST(211.00 AS Decimal(8, 2)), CAST(141.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 83)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (75, N'资阳市', N'宜宾市', N'2023-06-07 20:45:00.000', 3, CAST(37.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 32)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (76, N'都江堰市', N'眉山市', N'2023-06-07 20:45:00.000', 5, CAST(453.00 AS Decimal(8, 2)), CAST(108.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 37)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (77, N'双流县', N'眉山市', N'2023-06-08 15:58:00.000', 4, CAST(126.00 AS Decimal(8, 2)), CAST(83.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 84)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (78, N'福泉市', N'绵阳市', N'2023-06-08 16:16:00.000', 5, CAST(380.00 AS Decimal(8, 2)), CAST(112.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 88)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (79, N'重庆市', N'西昌市', N'2023-06-08 21:43:00.000', 2, CAST(386.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 52)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (80, N'阆中市', N'开远市', N'2023-06-09 09:57:00.000', 3, CAST(499.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 15)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (81, N'昭通市', N'德阳市', N'2023-06-09 19:07:00.000', 0, CAST(454.00 AS Decimal(8, 2)), CAST(117.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 2, 4)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (82, N'都匀市', N'雅安市', N'2023-06-10 11:16:00.000', 2, CAST(310.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 23)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (83, N'铜仁市', N'曲靖市', N'2023-06-10 16:54:00.000', 1, CAST(303.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 61)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (84, N'绵阳市', N'丽江市', N'2023-06-13 09:46:00.000', 4, CAST(435.00 AS Decimal(8, 2)), CAST(127.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 15)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (85, N'仁怀市', N'万源市', N'2023-06-13 18:07:00.000', 0, CAST(331.00 AS Decimal(8, 2)), CAST(67.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 2, 76)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (86, N'内江市', N'临沧市', N'2023-06-15 14:34:00.000', 6, CAST(360.00 AS Decimal(8, 2)), CAST(124.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 60)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (87, N'南充市', N'崇州市', N'2023-06-15 15:19:00.000', 0, CAST(330.00 AS Decimal(8, 2)), CAST(146.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 2, 77)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (88, N'西昌市', N'乐山市', N'2023-06-17 17:20:00.000', 4, CAST(336.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 6)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (89, N'雅安市', N'都江堰市', N'2023-06-17 17:42:00.000', 5, CAST(215.00 AS Decimal(8, 2)), CAST(140.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 53)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (90, N'开远市', N'资阳市', N'2023-06-18 09:18:00.000', 3, CAST(325.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 82)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (91, N'临沧市', N'峨眉山市', N'2023-06-19 15:30:00.000', 6, CAST(129.00 AS Decimal(8, 2)), CAST(97.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 33)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (92, N'六盘水市', N'安宁市', N'2023-06-23 11:17:00.000', 6, CAST(175.00 AS Decimal(8, 2)), CAST(104.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 70)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (93, N'贵阳市', N'广元市', N'2023-06-23 14:30:00.000', 1, CAST(223.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 5)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (94, N'玉溪市', N'自贡市', N'2023-06-23 20:22:00.000', 6, CAST(369.00 AS Decimal(8, 2)), CAST(98.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 57)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (95, N'达州市', N'彭州市', N'2023-06-24 18:28:00.000', 4, CAST(430.00 AS Decimal(8, 2)), CAST(123.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 51)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (96, N'清镇市', N'遂宁市', N'2023-06-24 19:57:00.000', 5, CAST(212.00 AS Decimal(8, 2)), CAST(64.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 88)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (97, N'楚雄市', N'福泉市', N'2023-06-26 08:01:00.000', 5, CAST(355.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 7)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (98, N'大理市', N'邛崃市', N'2023-06-27 10:53:00.000', 1, CAST(450.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 93)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (99, N'彭州市', N'广汉市', N'2023-06-27 12:39:00.000', 6, CAST(382.00 AS Decimal(8, 2)), CAST(92.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 71)
GO
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (100, N'安宁市', N'重庆市', N'2023-06-28 08:33:00.000', 4, CAST(368.00 AS Decimal(8, 2)), CAST(120.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 60)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (101, N'丽江市', N'安顺市', N'2023-06-28 20:46:00.000', 2, CAST(54.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 91)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (102, N'资阳市', N'内江市', N'2023-06-29 09:06:00.000', 3, CAST(346.00 AS Decimal(8, 2)), CAST(52.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 49)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (103, N'六盘水市', N'昭通市', N'2023-06-29 17:36:00.000', 0, CAST(423.00 AS Decimal(8, 2)), CAST(60.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 2, 34)
INSERT [dbo].[LongDistance] ([L_ID], [L_StartingPlace], [L_Destination], [L_TimeRequired], [L_Number], [L_Kilometers], [L_Price], [L_Message], [PublishID], [UserID]) VALUES (104, N'赤水市', N'遵义市', N'2023-06-29 21:29:00.000', 3, CAST(278.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 21)
SET IDENTITY_INSERT [dbo].[LongDistance] OFF
GO
SET IDENTITY_INSERT [dbo].[Publish] ON 

INSERT [dbo].[Publish] ([PublishID], [PublishName]) VALUES (1, N'司机')
INSERT [dbo].[Publish] ([PublishID], [PublishName]) VALUES (2, N'客户')
SET IDENTITY_INSERT [dbo].[Publish] OFF
GO
SET IDENTITY_INSERT [dbo].[ShortDistance] ON 

INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (1, N'长寿区', N'巴南区', N'合川区', N'2023-02-13 15:24:00.000', 0, CAST(30.00 AS Decimal(8, 2)), CAST(141.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 2, 79)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (2, N'江津区', N'渝中区', N'渝北区', N'2023-02-16 18:32:00.000', 1, CAST(109.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 80)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (3, N'璧山区', N'大足区', N'渝北区', N'2023-02-17 13:53:00.000', 5, CAST(16.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 6)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (4, N'渝北区', N'北碚区', N'南川区', N'2023-02-18 17:42:00.000', 2, CAST(188.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 25)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (5, N'长寿区', N'荣昌区', N'南川区', N'2023-02-18 21:13:00.000', 0, CAST(214.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 2, 21)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (6, N'黔江区', N'九龙坡区', N'璧山区', N'2023-02-22 08:20:00.000', 0, CAST(125.00 AS Decimal(8, 2)), CAST(146.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 2, 71)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (7, N'璧山区', N'巴南区', N'巴南区', N'2023-02-22 10:39:00.000', 0, CAST(197.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 2, 59)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (8, N'长寿区', N'永川区', N'黔江区', N'2023-02-23 12:50:00.000', 0, CAST(140.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 2, 22)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (9, N'江津区', N'荣昌区', N'巴南区', N'2023-02-25 20:03:00.000', 4, CAST(108.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 88)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (10, N'合川区', N'铜梁区', N'渝北区', N'2023-02-27 11:02:00.000', 2, CAST(205.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 67)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (11, N'永川区', N'渝北区', N'合川区', N'2023-02-27 14:29:00.000', 6, CAST(198.00 AS Decimal(8, 2)), CAST(118.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 16)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (12, N'南川区', N'长寿区', N'渝北区', N'2023-03-01 11:06:00.000', 6, CAST(167.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 4)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (13, N'南川区', N'江北区', N'长寿区', N'2023-03-01 15:59:00.000', 3, CAST(44.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 71)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (14, N'大足区', N'合川区', N'长寿区', N'2023-03-03 14:01:00.000', 1, CAST(110.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 14)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (15, N'黔江区', N'南川区', N'永川区', N'2023-03-04 16:01:00.000', 1, CAST(114.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 27)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (16, N'大足区', N'铜梁区', N'巴南区', N'2023-03-04 19:54:00.000', 6, CAST(223.00 AS Decimal(8, 2)), CAST(71.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 7)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (17, N'黔江区', N'大渡口区', N'合川区', N'2023-03-05 13:21:00.000', 1, CAST(99.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 20)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (18, N'长寿区', N'大足区', N'黔江区', N'2023-03-09 12:20:00.000', 0, CAST(158.00 AS Decimal(8, 2)), CAST(114.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 2, 21)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (19, N'渝北区', N'北碚区', N'南川区', N'2023-03-11 15:36:00.000', 1, CAST(56.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 79)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (20, N'合川区', N'渝中区', N'巴南区', N'2023-03-12 10:52:00.000', 4, CAST(64.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 81)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (21, N'巴南区', N'渝中区', N'长寿区', N'2023-03-12 14:12:00.000', 3, CAST(166.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 69)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (22, N'南川区', N'渝中区', N'大足区', N'2023-03-12 19:05:00.000', 6, CAST(218.00 AS Decimal(8, 2)), CAST(139.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 63)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (23, N'巴南区', N'大足区', N'璧山区', N'2023-03-13 17:54:00.000', 6, CAST(147.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 86)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (24, N'黔江区', N'北碚区', N'黔江区', N'2023-03-14 17:23:00.000', 2, CAST(124.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 77)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (25, N'巴南区', N'荣昌区', N'大足区', N'2023-03-14 20:53:00.000', 4, CAST(23.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 17)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (26, N'大足区', N'九龙坡区', N'永川区', N'2023-03-14 21:55:00.000', 0, CAST(88.00 AS Decimal(8, 2)), CAST(116.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 2, 54)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (27, N'大足区', N'巴南区', N'南川区', N'2023-03-15 09:49:00.000', 2, CAST(237.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 72)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (28, N'南川区', N'永川区', N'大足区', N'2023-03-15 12:19:00.000', 0, CAST(207.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 2, 12)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (29, N'永川区', N'荣昌区', N'大足区', N'2023-03-15 12:27:00.000', 3, CAST(156.00 AS Decimal(8, 2)), CAST(131.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 93)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (30, N'永川区', N'铜梁区', N'永川区', N'2023-03-15 16:15:00.000', 1, CAST(162.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 48)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (31, N'永川区', N'渝北区', N'南川区', N'2023-03-16 21:28:00.000', 5, CAST(240.00 AS Decimal(8, 2)), CAST(72.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 4)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (32, N'合川区', N'渝北区', N'长寿区', N'2023-03-16 21:37:00.000', 1, CAST(234.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 83)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (33, N'巴南区', N'江北区', N'合川区', N'2023-03-17 10:34:00.000', 3, CAST(75.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 75)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (34, N'江津区', N'江北区', N'合川区', N'2023-03-17 14:03:00.000', 0, CAST(157.00 AS Decimal(8, 2)), CAST(73.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 2, 52)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (35, N'永川区', N'南川区', N'渝北区', N'2023-03-17 14:34:00.000', 0, CAST(6.00 AS Decimal(8, 2)), CAST(95.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 2, 4)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (36, N'璧山区', N'铜梁区', N'江津区', N'2023-03-17 18:51:00.000', 4, CAST(157.00 AS Decimal(8, 2)), CAST(53.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 13)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (37, N'渝北区', N'大渡口区', N'黔江区', N'2023-03-18 08:40:00.000', 2, CAST(205.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 24)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (38, N'渝北区', N'大足区', N'巴南区', N'2023-03-18 08:54:00.000', 2, CAST(139.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 65)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (39, N'巴南区', N'北碚区', N'江津区', N'2023-03-19 13:56:00.000', 6, CAST(12.00 AS Decimal(8, 2)), CAST(109.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 96)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (40, N'江津区', N'渝中区', N'渝北区', N'2023-03-21 08:39:00.000', 2, CAST(231.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 67)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (41, N'郫都区', N'双流区', N'成华区', N'2023-03-21 12:07:00.000', 3, CAST(169.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 43)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (42, N'双流区', N'双流区', N'温江区', N'2023-03-21 12:33:00.000', 1, CAST(230.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 95)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (43, N'新都区', N'青白江区', N'成华区', N'2023-03-21 13:50:00.000', 0, CAST(191.00 AS Decimal(8, 2)), CAST(55.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 2, 54)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (44, N'温江区', N'郫都区', N'青羊区', N'2023-03-21 19:13:00.000', 5, CAST(18.00 AS Decimal(8, 2)), CAST(54.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 100)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (45, N'双流区', N'锦江区', N'青羊区', N'2023-03-21 19:51:00.000', 3, CAST(216.00 AS Decimal(8, 2)), CAST(103.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 12)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (46, N'锦江区', N'郫都区', N'武侯区', N'2023-03-22 19:11:00.000', 1, CAST(42.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 34)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (47, N'青白江区', N'青白江区', N'温江区', N'2023-03-23 18:05:00.000', 1, CAST(166.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 8)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (48, N'龙泉驿区', N'郫都区', N'双流区', N'2023-03-25 12:07:00.000', 4, CAST(102.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 42)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (49, N'武侯区', N'青羊区', N'锦江区', N'2023-03-26 12:11:00.000', 3, CAST(70.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 43)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (50, N'龙泉驿区', N'成华区', N'武侯区', N'2023-03-27 19:45:00.000', 1, CAST(152.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 52)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (51, N'锦江区', N'龙泉驿区', N'成华区', N'2023-03-27 20:40:00.000', 0, CAST(112.00 AS Decimal(8, 2)), CAST(75.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 2, 12)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (52, N'温江区', N'成华区', N'新都区', N'2023-03-28 11:05:00.000', 4, CAST(249.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 35)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (53, N'金牛区', N'郫都区', N'温江区', N'2023-03-28 13:48:00.000', 3, CAST(93.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 35)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (54, N'郫都区', N'双流区', N'成华区', N'2023-03-29 13:58:00.000', 0, CAST(243.00 AS Decimal(8, 2)), CAST(115.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 2, 66)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (55, N'成华区', N'新都区', N'双流区', N'2023-03-29 16:57:00.000', 4, CAST(210.00 AS Decimal(8, 2)), CAST(102.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 95)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (56, N'锦江区', N'新都区', N'龙泉驿区', N'2023-03-30 20:24:00.000', 5, CAST(125.00 AS Decimal(8, 2)), CAST(58.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 13)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (57, N'双流区', N'锦江区', N'龙泉驿区', N'2023-03-30 21:06:00.000', 3, CAST(42.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 67)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (58, N'郫都区', N'武侯区', N'双流区', N'2023-04-01 19:25:00.000', 1, CAST(232.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 43)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (59, N'青白江区', N'青白江区', N'龙泉驿区', N'2023-04-02 09:51:00.000', 4, CAST(132.00 AS Decimal(8, 2)), CAST(101.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 48)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (60, N'新都区', N'金牛区', N'金牛区', N'2023-04-02 12:23:00.000', 2, CAST(97.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 81)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (61, N'金牛区', N'双流区', N'青白江区', N'2023-04-03 08:01:00.000', 6, CAST(193.00 AS Decimal(8, 2)), CAST(149.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 63)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (62, N'温江区', N'双流区', N'武侯区', N'2023-04-03 21:37:00.000', 5, CAST(142.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 16)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (63, N'龙泉驿区', N'青白江区', N'郫都区', N'2023-04-07 09:33:00.000', 3, CAST(201.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 43)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (64, N'青羊区', N'郫都区', N'郫都区', N'2023-04-08 14:42:00.000', 1, CAST(166.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 63)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (65, N'双流区', N'锦江区', N'金牛区', N'2023-04-11 18:59:00.000', 0, CAST(200.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 2, 99)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (66, N'温江区', N'郫都区', N'武侯区', N'2023-04-12 10:46:00.000', 6, CAST(234.00 AS Decimal(8, 2)), CAST(109.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 13)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (67, N'新都区', N'青白江区', N'郫都区', N'2023-04-12 13:52:00.000', 6, CAST(75.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 79)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (68, N'青白江区', N'郫都区', N'锦江区', N'2023-04-12 17:24:00.000', 2, CAST(23.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 24)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (69, N'武侯区', N'青羊区', N'新都区', N'2023-04-12 19:50:00.000', 5, CAST(135.00 AS Decimal(8, 2)), CAST(145.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 93)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (70, N'武侯区', N'成华区', N'锦江区', N'2023-04-13 19:30:00.000', 4, CAST(148.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 29)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (71, N'金牛区', N'龙泉驿区', N'青羊区', N'2023-04-14 08:42:00.000', 5, CAST(63.00 AS Decimal(8, 2)), CAST(62.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 80)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (72, N'郫都区', N'成华区', N'锦江区', N'2023-04-15 18:34:00.000', 5, CAST(112.00 AS Decimal(8, 2)), CAST(104.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 79)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (73, N'成华区', N'郫都区', N'金牛区', N'2023-04-15 20:04:00.000', 6, CAST(71.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 44)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (74, N'武侯区', N'双流区', N'成华区', N'2023-04-16 12:00:00.000', 6, CAST(240.00 AS Decimal(8, 2)), CAST(106.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 92)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (75, N'青白江区', N'新都区', N'龙泉驿区', N'2023-04-16 20:01:00.000', 3, CAST(94.00 AS Decimal(8, 2)), CAST(112.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 90)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (76, N'成华区', N'锦江区', N'青羊区', N'2023-04-17 08:41:00.000', 4, CAST(84.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 26)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (77, N'龙泉驿区', N'锦江区', N'新都区', N'2023-04-19 12:04:00.000', 2, CAST(90.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 22)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (78, N'青羊区', N'武侯区', N'双流区', N'2023-04-20 21:04:00.000', 1, CAST(61.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 43)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (79, N'龙泉驿区', N'青白江区', N'双流区', N'2023-04-22 16:09:00.000', 4, CAST(121.00 AS Decimal(8, 2)), CAST(64.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 79)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (80, N'郫都区', N'金牛区', N'温江区', N'2023-04-22 19:33:00.000', 3, CAST(180.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 60)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (81, N'盘龙区', N'晋宁区', N'度假区', N'2023-04-22 19:46:00.000', 4, CAST(19.00 AS Decimal(8, 2)), CAST(53.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 15)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (82, N'度假区', N'五华区', N'西山区', N'2023-04-23 09:03:00.000', 5, CAST(227.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 36)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (83, N'度假区', N'盘龙区', N'西山区', N'2023-04-23 09:54:00.000', 6, CAST(93.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 69)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (84, N'高新区', N'晋宁区', N'度假区', N'2023-04-24 20:35:00.000', 3, CAST(72.00 AS Decimal(8, 2)), CAST(110.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 11)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (85, N'盘龙区', N'西山区', N'度假区', N'2023-04-26 11:17:00.000', 0, CAST(207.00 AS Decimal(8, 2)), CAST(146.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 2, 74)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (86, N'西山区', N'盘龙区', N'经开区', N'2023-04-26 11:20:00.000', 4, CAST(88.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 37)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (87, N'高新区', N'东川区', N'五华区', N'2023-04-26 12:31:00.000', 2, CAST(200.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 17)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (88, N'度假区', N'东川区', N'呈贡区', N'2023-04-26 19:48:00.000', 5, CAST(4.00 AS Decimal(8, 2)), CAST(118.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 41)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (89, N'五华区', N'官渡区', N'呈贡区', N'2023-04-27 09:37:00.000', 2, CAST(28.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 64)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (90, N'高新区', N'晋宁区', N'高新区', N'2023-04-28 12:25:00.000', 6, CAST(77.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 77)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (91, N'官渡区', N'官渡区', N'高新区', N'2023-04-29 09:58:00.000', 6, CAST(215.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 44)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (92, N'五华区', N'呈贡区', N'五华区', N'2023-05-01 08:27:00.000', 4, CAST(216.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 43)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (93, N'官渡区', N'盘龙区', N'高新区', N'2023-05-02 10:03:00.000', 6, CAST(245.00 AS Decimal(8, 2)), CAST(148.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 82)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (94, N'五华区', N'呈贡区', N'官渡区', N'2023-05-02 16:25:00.000', 0, CAST(117.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 2, 46)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (95, N'盘龙区', N'东川区', N'呈贡区', N'2023-05-03 15:31:00.000', 2, CAST(101.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 98)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (96, N'呈贡区', N'盘龙区', N'高新区', N'2023-05-05 13:20:00.000', 2, CAST(49.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 74)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (97, N'官渡区', N'西山区', N'盘龙区', N'2023-05-06 14:52:00.000', 5, CAST(240.00 AS Decimal(8, 2)), CAST(90.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 3)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (98, N'经开区', N'呈贡区', N'盘龙区', N'2023-05-08 19:34:00.000', 3, CAST(26.00 AS Decimal(8, 2)), CAST(136.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 21)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (99, N'五华区', N'西山区', N'呈贡区', N'2023-05-10 10:08:00.000', 3, CAST(152.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 24)
GO
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (100, N'盘龙区', N'西山区', N'呈贡区', N'2023-05-10 14:01:00.000', 6, CAST(17.00 AS Decimal(8, 2)), CAST(74.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 2)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (101, N'度假区', N'盘龙区', N'呈贡区', N'2023-05-10 15:03:00.000', 0, CAST(207.00 AS Decimal(8, 2)), CAST(72.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 2, 92)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (102, N'度假区', N'呈贡区', N'高新区', N'2023-05-12 10:18:00.000', 3, CAST(59.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 23)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (103, N'西山区', N'东川区', N'官渡区', N'2023-05-12 14:27:00.000', 0, CAST(212.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 2, 58)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (104, N'经开区', N'呈贡区', N'高新区', N'2023-05-12 19:03:00.000', 1, CAST(205.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 71)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (105, N'五华区', N'西山区', N'度假区', N'2023-05-13 09:22:00.000', 0, CAST(108.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 2, 34)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (106, N'呈贡区', N'西山区', N'度假区', N'2023-05-13 17:37:00.000', 6, CAST(32.00 AS Decimal(8, 2)), CAST(68.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 61)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (107, N'西山区', N'呈贡区', N'五华区', N'2023-05-13 21:28:00.000', 0, CAST(12.00 AS Decimal(8, 2)), CAST(63.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 2, 27)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (108, N'呈贡区', N'西山区', N'五华区', N'2023-05-14 09:57:00.000', 0, CAST(57.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 2, 49)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (109, N'度假区', N'西山区', N'官渡区', N'2023-05-17 17:08:00.000', 4, CAST(165.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 17)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (110, N'官渡区', N'呈贡区', N'西山区', N'2023-05-17 19:37:00.000', 5, CAST(246.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 92)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (111, N'五华区', N'西山区', N'西山区', N'2023-05-18 10:37:00.000', 6, CAST(119.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 53)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (112, N'花溪区', N'西山区', N'白云区', N'2023-05-18 12:47:00.000', 6, CAST(236.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 14)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (113, N'南明区', N'花溪区', N'白云区', N'2023-05-18 20:25:00.000', 4, CAST(166.00 AS Decimal(8, 2)), CAST(89.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 79)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (114, N'云岩区', N'乌当区', N'花溪区', N'2023-05-19 19:33:00.000', 3, CAST(236.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 54)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (115, N'观山湖区', N'南明区', N'乌当区', N'2023-05-20 15:21:00.000', 1, CAST(189.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 54)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (116, N'南明区', N'白云区', N'云岩区', N'2023-05-20 19:41:00.000', 0, CAST(223.00 AS Decimal(8, 2)), CAST(124.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 2, 70)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (117, N'观山湖区', N'花溪区', N'南明区', N'2023-05-21 09:44:00.000', 3, CAST(100.00 AS Decimal(8, 2)), CAST(65.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 92)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (118, N'南明区', N'白云区', N'乌当区', N'2023-05-22 17:37:00.000', 0, CAST(5.00 AS Decimal(8, 2)), CAST(117.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 2, 51)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (119, N'花溪区', N'南明区', N'白云区', N'2023-05-24 11:05:00.000', 2, CAST(75.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 49)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (120, N'乌当区', N'云岩区', N'南明区', N'2023-05-25 09:12:00.000', 6, CAST(35.00 AS Decimal(8, 2)), CAST(82.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 95)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (121, N'乌当区', N'白云区', N'南明区', N'2023-05-25 12:12:00.000', 6, CAST(99.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 96)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (122, N'观山湖区', N'花溪区', N'南明区', N'2023-05-25 12:48:00.000', 2, CAST(197.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 28)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (123, N'乌当区', N'云岩区', N'花溪区', N'2023-05-26 18:58:00.000', 4, CAST(5.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 44)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (124, N'南明区', N'云岩区', N'乌当区', N'2023-05-27 11:26:00.000', 0, CAST(44.00 AS Decimal(8, 2)), CAST(53.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 2, 27)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (125, N'云岩区', N'南明区', N'观山湖区', N'2023-05-27 16:22:00.000', 5, CAST(66.00 AS Decimal(8, 2)), CAST(142.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 1)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (126, N'南明区', N'观山湖区', N'白云区', N'2023-05-27 17:43:00.000', 2, CAST(203.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 64)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (127, N'白云区', N'云岩区', N'观山湖区', N'2023-05-27 21:16:00.000', 5, CAST(28.00 AS Decimal(8, 2)), CAST(142.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 18)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (128, N'观山湖区', N'云岩区', N'白云区', N'2023-05-28 16:36:00.000', 6, CAST(17.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 98)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (129, N'云岩区', N'白云区', N'观山湖区', N'2023-05-29 18:14:00.000', 6, CAST(72.00 AS Decimal(8, 2)), CAST(52.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 60)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (130, N'南明区', N'观山湖区', N'云岩区', N'2023-05-30 09:07:00.000', 1, CAST(11.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 85)
INSERT [dbo].[ShortDistance] ([S_ID], [S_StartingPlace], [S_Approach], [S_Destination], [S_TimeRequired], [S_Number], [S_Kilometers], [S_Price], [S_Message], [PublishID], [UserID]) VALUES (131, N'南明区', N'云岩区', N'观山湖区', N'2023-05-30 11:58:00.000', 6, CAST(154.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), N'在搭个顺风车上看到的', 1, 65)
SET IDENTITY_INSERT [dbo].[ShortDistance] OFF
GO
SET IDENTITY_INSERT [dbo].[UserInfo] ON 

INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (1, N'辛采南', N'FordBirrell', N'pYIcimzdA6BZggcS', N'15560102267', N'5wey2p1g6ptvl@163.net', N'轿车', N'川Z·46ROV')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (2, N'朱琼', N'SuzanneYerkes', N'QraDYYf0cgvnsQ7i', N'15708445192', N'23bdc@eyou.com', N'SUV', N'贵F·0P7GB')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (3, N'喜丝琦', N'MyronFranklin', N'cdFzRfstry3yDpYI', N'18531826868', N'6nabbj@265.com', N'SUV', N'川X·9WNZP')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (4, N'用鸿博', N'EstherBen', N'xOmI7gcaafQNOUHK', N'13125123841', N'mmvu@163.com', N'轿车', N'川Y·EXXFA')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (5, N'虢滢渟', N'JeanAntoinette', N'l8jlLmfTnZZzGoS5', N'17361698841', N'yeruvposfudhbm@sina.com', N'SUV', N'川L·3YKDH')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (6, N'禄乐贤', N'SharonCissie', N'SfVcKt8SWxZ0AiL9', N'17537714239', N'xx5cxxx1orc1d@yahoo.com.cn', N'SUV', N'川K·QDP00')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (7, N'书修杰', N'LambertAntonia', N'38aHtSapjyNX7n9J', N'15685051238', N'yljdy@126.com', N'轿车', N'川W·ZI9VY')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (8, N'磨兴庆', N'PrimoAnne', N'M9SQFXwmIFon4H8n', N'15015364466', N'o0ooin50i@xinhuanet', N'SUV', N'渝N·RJO8T')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (9, N'常壮', N'AbigailTitus', N'3VedZh5luYebG5eJ', N'18989376373', N'dv4vzlaoxgdm@56.com', N'SUV', N'贵C·MY6SX')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (10, N'衷星', N'TheobaldMarlowe', N'yjqBEPQGQQO5gL2C', N'17259855726', N'5tm3zibyii@etang.com', N'轿车', N'川S·CJRRY')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (11, N'漆绮南', N'RyanEdward', N'QXciIFR3SdeygJhK', N'19867382717', N'ipj2@eastday.com', N'SUV', N'渝A·D9AS9')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (12, N'乜忻畅', N'ByronLyly', N'wx4WEFrKtiI4cYdQ', N'14518475509', N'lp6scct4ck0@263.net', N'SUV', N'渝M·GZ6GV')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (13, N'御问玉', N'SallyJefferson', N'FreCGo0UmumkPxe1', N'18073914262', N'o16j0t@eyou.com', N'轿车', N'贵L·VUDWP')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (14, N'商嘉年', N'TheresaBrooke', N'g4fLx4sVYRxhfhaP', N'18187856850', N'plmnwrdcse1t1a@xinhuanet', N'SUV', N'川D·SRGQ1')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (15, N'昔晓露', N'BoyceEvelina', N'Dhx5wx6PsJ32ObCQ', N'18274252163', N'mrjk@xinhuanet', N'轿车', N'云D·ICHU4')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (16, N'源凯康', N'DeliaKeats', N'QeaB3Vf7fL3pk7UU', N'18892747476', N'x465x1ifqjx03@163.com', N'SUV', N'云Y·BY75R')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (17, N'黄胜', N'UriahPullan', N'zPUwmEDT1acHSutS', N'15844571328', N'fnrp@tom.com', N'轿车', N'云I·3TRA8')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (18, N'徭语蝶', N'NathanNorton', N'esQT5beMTXL4cS4K', N'15550572061', N'g6wqnwr3jjtwju@china.com', N'轿车', N'贵A·R34HM')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (19, N'王驰', N'SophiaJohn', N'QiKZIMf5KEJhICIl', N'16515237139', N'y1j1mur2@etang.com', N'轿车', N'渝A·VFLYC')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (20, N'愚慨', N'VanessaOnions', N'cJ5hQubFTXGdHFV2', N'18770562973', N'b2h@sohu.com', N'SUV', N'渝S·HSDCT')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (21, N'汝倚云', N'PaulGrey', N'suqNhEULWZA2IRH4', N'15581009994', N'dbp5@163.net', N'轿车', N'贵Q·SIMWQ')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (22, N'庚枫', N'LeoJean', N'kDXGITNt6rY4OD9B', N'13704361819', N'16vr@citiz.com', N'轿车', N'云I·9EAM3')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (23, N'姚子蕙', N'AlvaBob', N'MYVgasfxELM9Ufpx', N'13552537705', N'ojeyihadeuqeywx@263.net', N'SUV', N'川N·SIU6I')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (24, N'滑歌', N'JulietClemens', N'RDlhT7TMMppmh3Zr', N'18712766100', N'esp0p@126.com', N'轿车', N'云K·9COQU')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (25, N'礼痴凝', N'FrancesFunk', N'UEeB41JU6ETNQ979', N'17589178580', N'vwfrzw@eastday.com', N'轿车', N'渝N·DLFXA')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (26, N'展名', N'MonroeJulia', N'qk0pe1XGeumBvLpz', N'13484604113', N'rejrecenry4@sohu.com', N'轿车', N'川L·55T0W')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (27, N'义天睿', N'OsbornUlysses', N'RGZqtSerCBZQmnar', N'15517676044', N'xqoau5r5p@netease.com', N'SUV', N'渝C·X9X24')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (28, N'频兴思', N'AlgerEmma', N'RY702PZD5FHDt6zF', N'17533093312', N'6pctbplo6@enet.com.cn', N'SUV', N'川O·HRETC')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (29, N'冠鸿羽', N'QuintinaBradley', N'O516RGR2O4pJpysR', N'18906408982', N'tmgc4af4@yeah.net', N'轿车', N'渝A·ZFV5K')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (30, N'邢雨安', N'DaisyBruno', N'XoIbVUUKWqnT685T', N'16688182973', N'0d5@netease.com', N'轿车', N'川B·N5HJA')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (31, N'长凝竹', N'FrancisPenn', N'yj8dnpnrQa0CyX3q', N'19846566252', N'qeyde@email.com.cn', N'SUV', N'渝Y·1YFWA')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (32, N'佛曼安', N'BradleyBarrie', N'WMgz8UovUK3l2taD', N'18067508133', N'jsv@eastday.com', N'SUV', N'贵Y·S8OTW')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (33, N'纳喇子欣', N'AugustCrofts', N'ePIroCx4DfVx9tff', N'15220656497', N'lcn@netease.com', N'SUV', N'云X·V1T07')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (34, N'呼延秋月', N'MignonHorace', N'7lgC5F1ICTishGDt', N'18841897688', N'fc3b1saq0@china.com', N'轿车', N'贵V·EKB9M')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (35, N'戏欣美', N'BlitheAugustine', N'2yI6cJAz57s5jOcD', N'13347966009', N'ofmenl5hw3@21cn.com', N'SUV', N'贵J·125I2')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (36, N'隐从冬', N'HumphreyDutt', N'rx7SqtBJ5uO996Wn', N'17868892216', N'4cvn4p@tom.com', N'SUV', N'贵C·G084F')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (37, N'晋念双', N'WebbHerbert', N'ehbGQBgja93yCwvg', N'17271992612', N'vcj52jvwsxtlq@265.com', N'轿车', N'川W·FCHP7')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (38, N'廖千秋', N'HowarMatthew', N'8gwwlHhhEw2WBc1V', N'17735438760', N'mj3ead@265.com', N'SUV', N'渝A·R87EC')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (39, N'亓官安柏', N'WalkerToby', N'MCnrNq8Lid5dRLdb', N'17720418996', N'u4q55@hotmail.com', N'SUV', N'川A·NVHNM')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (40, N'蒉融', N'JonasBruce', N'fd4QUSSWbqW9dVfe', N'18570811281', N'db6wz@qq.com', N'SUV', N'渝B·VRKAX')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (41, N'别芳洁', N'ChristBarton', N'Gt14L2tI5y7BREtd', N'17153619547', N'nidwjv6@265.com', N'SUV', N'云O·ZXKUD')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (42, N'南康泰', N'BroderickGresham', N'eFzxEIUTGkLktIdJ', N'19865068403', N'2w0iy6gja@56.com', N'SUV', N'川V·EYQGK')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (43, N'局新', N'ColbyGilbert', N'8UJTanhfclRODBzd', N'15958401226', N'dwhiea@sogou@com', N'轿车', N'贵E·YN89M')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (44, N'仙霞绮', N'DerrickI.', N'E0DxHtBjIWter8Lk', N'18387495065', N'zpjwbmk@hotmail.com', N'轿车', N'贵C·WI9X6')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (45, N'犹友琴', N'FredericaHoratio', N'QksMll4V70wVcQ8h', N'17320886547', N'nusl0ppq2ubl@xinhuanet', N'SUV', N'渝A·H45QN')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (46, N'愈合瑞', N'HunterMicah', N'3clo0JwMye4iVehG', N'18428011814', N'0kaniy56cxg4j@china.com', N'轿车', N'云H·PNHDW')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (47, N'贸瑛瑶', N'MauriceCharlotte', N'BeXrIiFEyoi5BLIU', N'18479358814', N'm3z5@163.com', N'SUV', N'川A·LJK9B')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (48, N'澄嘉怡', N'MaxwellMacAdam', N'Gzh2zqSHl2OWGUEw', N'15107316511', N'lyrjhyyjnjo55@yahoo.com.cn', N'轿车', N'渝U·6BL27')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (49, N'孛静秀', N'EleanoreSaroyan', N'zu7RZ4LXX8u4TOZc', N'13439526030', N'a6b5ros1f@56.com', N'SUV', N'川D·Z9QXS')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (50, N'召精', N'VitaSurrey', N'wvEjgajqMLEyaIpv', N'15199657483', N'mkpyimajpsqdb6@163.com', N'轿车', N'渝V·5C6FI')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (51, N'谯欣嘉', N'WilburJennings', N'VH2Rue4fQf0l842H', N'13441916049', N'woy5l@email.com.cn', N'SUV', N'云T·BINPX')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (52, N'皇甫文德', N'OscarJoseph', N'RGQtz8EriMupSyJW', N'15572502820', N'm4x6j004lmb@msn.com', N'轿车', N'贵T·ZV6G6')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (53, N'塔弘深', N'MageeGarcia', N'KBMuyqa3FDHk71rh', N'13761743158', N'0vbc5va0@etang.com', N'SUV', N'川S·32WB4')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (54, N'闾丘巧夏', N'GaleBerkeley', N'fh8UxhYPBF7HmRlg', N'17709392634', N'a6lx2no51@265.com', N'轿车', N'渝O·12AA7')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (55, N'逮哲圣', N'JessieKennan', N'G9g6vTJEFSnyn2yS', N'18406741033', N'c1rmxpvveyat@xinhuanet', N'轿车', N'川O·FCK23')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (56, N'宗问薇', N'RitaJohnston(e)', N'KE5N5P9RzZ60W4R5', N'13611585160', N'anv6xub3bxa4@sogou@com', N'轿车', N'川S·IZD3Q')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (57, N'狂元亮', N'LynnStrachey', N'rdIoDWNJvwP30L9j', N'18564038004', N'r4oh@35.com', N'SUV', N'川H·E4MZ6')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (58, N'屈靖巧', N'LydiaChristy', N'nxstDZD5RsC0MIkU', N'15003394083', N'x1qxhfmeld6@35.com', N'SUV', N'贵G·84LQV')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (59, N'那拉博超', N'BishopFitzGerald', N'ZvnkW9q9OoOfe1Ba', N'17615543677', N'016z5dco@netease.com', N'轿车', N'川F·AMD2E')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (60, N'帖星火', N'PandoraWallace', N'JH8cvESYsSDftJly', N'15298576906', N'0m0mx@hotmail.com', N'SUV', N'云D·CK07I')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (61, N'弓箫吟', N'MichellBloomfield', N'2Lsx5l2wBdrMyyUJ', N'18328028047', N'kz41@163.net', N'轿车', N'贵B·UJUNX')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (62, N'席骏祥', N'XeniaMorley', N'0OcMCZHDKpVs4kTt', N'15077567169', N'35zri@163.net', N'轿车', N'川V·V172U')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (63, N'在白风', N'AndrewWollaston', N'eNukP6lgV0DYab45', N'19963617813', N'trp@msn.com', N'SUV', N'川T·7UISY')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (64, N'纳采', N'LionelCook(e)', N'cgbjX7SwCys3viFz', N'18722793181', N'5xtljdrepdtqqb@china.com', N'轿车', N'川Q·CKJ21')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (65, N'诸华荣', N'ChadSusanna', N'8FJa2Oj8PRS8nPUz', N'13858246004', N'o0vae0hqyuvd@eyou.com', N'SUV', N'贵V·JFPCZ')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (66, N'望明洁', N'EdwinaWordsworth', N'HaWiLvpmOKt4T3aI', N'19883638651', N's0rw1dzodttc1@163.com', N'SUV', N'云W·T6VBF')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (67, N'米寻雪', N'AdamThoreau', N'8SoANzPmCpQrUerW', N'17371172817', N'kwfgulyu3me@eyou.com', N'轿车', N'渝V·JJIRJ')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (68, N'力骊艳', N'MichaelTrevelyan', N'JXKKVs82WmiBrzrH', N'17282071880', N'tvpnkkrz6@sohu.com', N'SUV', N'川E·50V6C')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (69, N'旅津', N'ClareSandy', N'4vr306MXkIZXlvgO', N'17699701350', N'ts6xcnc5rfo5p@163.net', N'轿车', N'川J·BSEE1')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (70, N'翦欣畅', N'DeborahMargaret', N'3MnHJNlUMEb4EnQI', N'17535436414', N'11gvkwtw1oefyr@163.net', N'轿车', N'云S·D4AHJ')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (71, N'悟向梦', N'CarrBethune', N't9Bdv5Skefplf02f', N'15615389965', N'l15t@netease.com', N'轿车', N'云L·7WZQM')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (72, N'枝海', N'LorraineChapman', N'FB64SdbXQDD63J6u', N'13047979637', N'bsp@eyou.com', N'轿车', N'渝W·3YK8C')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (73, N'塞良奥', N'SpencerTours', N'Gh13k7Lh67gjsPxB', N'15024929617', N'55fw6re@163.com', N'轿车', N'渝B·KQOX0')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (74, N'令狐安白', N'ArchibaldTaylor', N'cI7XxvWt0s8uZbug', N'15877869692', N'slqra3fi@email.com.cn', N'轿车', N'川U·A57Q8')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (75, N'呼添', N'ChesterLena', N'sjnuYpRCxk31UWfB', N'15112927375', N'kontddrkeqzvf6@yahoo.com.cn', N'轿车', N'渝S·7TY7I')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (76, N'刘恺', N'LouBeck', N'pl0xeK81uXuEJzRk', N'18542787487', N'ywyfvucn6@yeah.net', N'SUV', N'川Z·YFWNT')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (77, N'成志学', N'TristaMarner', N'WQ7Cz49s1dToVzj0', N'14791339782', N'ntf@eyou.com', N'SUV', N'川O·MUW93')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (78, N'裔翰采', N'IngridBaldwin', N'QBMd8d1xfshEZTJ6', N'19823375139', N'uiays@hotmail.com', N'SUV', N'云O·L5SC4')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (79, N'荀清宁', N'SandyWalter', N'oWt5V5vZ3OdNo8w2', N'15564281002', N'toh6553@sina.com', N'轿车', N'川F·D20HV')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (80, N'万俟延', N'BensonO''Casey', N'MBDmOeBdMpyzaeUv', N'17100308128', N'amfpr@china.com', N'轿车', N'贵U·VA2JU')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (81, N'堵弘厚', N'YeddaGiles', N'WCvqUULEYaDwQVDq', N'15162753773', N'wm6tczex6k6b@tom.com', N'SUV', N'渝R·X9O7V')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (82, N'巨景逸', N'ClaudeSara(h)', N'CLaQvNKLwQU76gWU', N'15635164354', N'zbmufxovdpd10n@enet.com.cn', N'SUV', N'渝V·HXBFA')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (83, N'司空森', N'ClarenceRusk', N'urdBg5YofDKQunTO', N'18725802518', N'wi2vk@126.com', N'SUV', N'贵H·A09BA')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (84, N'城希彤', N'AbrahamBernal', N'nOGmCOLExZigglQs', N'18327468294', N'6o36t1ryje@eastday.com', N'SUV', N'贵B·ADA71')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (85, N'门凡', N'JodieHutt', N'2iKMu4HRzhxzYucM', N'13686075451', N'y60kqau@netease.com', N'SUV', N'川E·P3ZIN')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (86, N'濮晴波', N'AnnabelleCrichton', N'ujOeph52sAxnzL7O', N'17310016599', N'ishkz2mbebiqqi6@265.com', N'SUV', N'贵I·MTVGG')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (87, N'宇欣怡', N'ElvisHodgson', N'DJemZFWbYIMUhjMk', N'13740434067', N'5uyfiwnqvumn@china.com', N'SUV', N'川T·N2QF4')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (88, N'郝学民', N'FredericMaud', N'4VjaLX8qnOvL6acf', N'17123818770', N'qrhsif2i030ridb@yeah.net', N'轿车', N'川B·B3US0')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (89, N'西门文彦', N'ValentineSweet', N'e6q4MpfcRwCeGt8R', N'13573297430', N'0t6b6h@citiz.com', N'轿车', N'云R·YNA4K')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (90, N'墨君豪', N'MandelGibbon', N'ChGvwkx6qoLX1UYD', N'19972482085', N'311di6vgoz6j@126.com', N'SUV', N'云M·2WTO4')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (91, N'殷晨轩', N'MarthaHoover', N'eYMJhKGxwj18XCmr', N'13367961706', N'svx01lxnjon@email.com.cn', N'SUV', N'渝I·497GR')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (92, N'荤浦泽', N'MilesLouise', N'LhcyOHBZLeFscSgm', N'13775267949', N'15sqjrsmkaes3f@netease.com', N'轿车', N'川R·GVQ69')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (93, N'性春兰', N'CornellAustin', N'yk13qer2YAAIrIUh', N'17685974536', N'lc5bdal@msn.com', N'轿车', N'川P·INORA')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (94, N'诸葛朝雨', N'InaVeblen', N'GU9IsUdy1ctUynXB', N'17805761140', N'mkjprnx@163.com', N'SUV', N'云A·B8PX0')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (95, N'闪雅艳', N'MiriamWhitehead', N'Yk8IBLRgZaLzajqN', N'17362947649', N'0h2iwyd@etang.com', N'轿车', N'云F·G5APB')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (96, N'邹成礼', N'ReneeViolet', N'A2qRncHPdoPc8fHE', N'15084086041', N'uti4gmt@yahoo.com.cn', N'轿车', N'云N·2N5ZM')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (97, N'柔凌寒', N'MadelineCook', N'Escm6JQWzPDaYn4g', N'13871571702', N'p1o1uhk4gi4zung@56.com', N'轿车', N'贵J·UDSB5')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (98, N'越亦旋', N'TiffanyWarner', N'5QjZM8N9MC2iZX0E', N'15965743020', N'd6cmg5yy@56.com', N'SUV', N'渝C·1FKVJ')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (99, N'拓跋雁露', N'PennyCamilla', N'uDcesYGuq0IENgEf', N'17110204840', N'4oe33tbir66u@citiz.com', N'SUV', N'云O·7Z9HP')
GO
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (100, N'同素怀', N'DanielTout', N'Fkk6UR5RP4hfFnhZ', N'18563176030', N'zs2opafbq1j@35.com', N'SUV', N'贵F·N8TF6')
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (101, N'雍雨', N'PenelopeHarry', N'oTdCyLxt6ienZeO2', N'18530401157', N'6i3wc3pmpb@265.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (102, N'茅令璟', N'JaredHelin(a)', N'dKvSDxyXEHbTanbo', N'18297398911', N'fsfwolq@126.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (103, N'斯易梦', N'ConstanceSamson', N'MHXVyUEIyRaJhzMF', N'15743719470', N'tuckjxt@qq.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (104, N'渠秋柔', N'GloriaDillon', N'KY6m3G6DMMObToIX', N'17588842443', N'jujyb6vk4xfskq@35.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (105, N'佟佳英杰', N'OmarBoswell', N'UU4qdfKS5qgOiIv2', N'18553953941', N'zbq0@qq.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (106, N'蒋夏蓉', N'TomElla', N'Oun5p9RUwJZdTxzS', N'17564722735', N'c3103lvo@sina.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (107, N'赖如曼', N'GailOscar', N'WdZ0ofypQnth2eh5', N'17649898146', N'tth6perkb5a@eastday.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (108, N'韦乐山', N'EricaMcCarthy', N'dPn249wpNvYCheeQ', N'13492652454', N'f5fhbx6y4@email.com.cn', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (109, N'饶云亭', N'KamaDewey', N'e81W6GBQxH6p0vii', N'13588415807', N'2yicmr4zt01byfw@yeah.net', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (110, N'骆雁山', N'MerlinCopperfield', N'gebUhWsNoNzTxKmO', N'15521248141', N'gzobsfv1yeu@china.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (111, N'招惜儿', N'EdwiinJoshua', N'S2Utt5YlMloYE7tt', N'17591656231', N'5vvtdy2p4qai@yeah.net', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (112, N'公西泰平', N'ErinLocke', N'QrrkM3YGwauEXZMg', N'15811088496', N'l4oclcprfpujsu@sogou@com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (113, N'九艳芳', N'ElliotAly', N'tyDIogHQ3ElT7ZFE', N'19901505928', N'nkb52g@yeah.net', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (114, N'鲜于元瑶', N'NortonDaisy', N'gsPgZjaFQtUTdElN', N'15558702598', N'b5zbiioz@qq.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (115, N'梁慧颖', N'MalcolmFowler', N'ygVBSyesgXj7xKZr', N'15867636335', N'k4kbivfnpf6@yahoo.com.cn', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (116, N'管景天', N'ArmstrongYonng', N'RwHM1CEQSg0KoBBj', N'17104934002', N'ihjdxh5cerjan@163.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (117, N'植美曼', N'SimonaGracie', N'FxFJYjiiGY2CVBC3', N'18754171024', N'j4b1ul@21cn.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (118, N'叔紫文', N'TiffanyMansfield', N'MUTHGkLs5uiGczYD', N'17340198605', N'klbmzp@eyou.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (119, N'苟晶辉', N'OliviaIngersoll', N'tSb24T2WIz4WO6fH', N'15153858047', N'fh0q05fxsxff@163.net', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (120, N'崇佁', N'WadeDunbar', N'6IwHHSSIkRWM7SDp', N'19908208597', N'a2mzesee@126.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (121, N'巢航', N'AntonioGeorge', N'olfKd1YH8W7aE7LF', N'18466325039', N'545yv@msn.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (122, N'佴若兰', N'JennyWilhelmina', N'EwnTplhCqWB92NBd', N'14784876680', N'uokd0u0tkzkj4@163.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (123, N'宾和裕', N'YettaThorndike', N'WJDmIlT8IezHZX7d', N'17374812670', N'3kkga@qq.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (124, N'秦梦蕊', N'IraCronin', N'PG0PQy5KP1VX6Bpx', N'13515245472', N'fca@eyou.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (125, N'党雨筠', N'RexSenior', N'4VHxSh3xrrS80xCV', N'18359896098', N'2fupyea@163.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (126, N'宣作', N'CuritisGrant', N'BErMftWqA5y6yx4Y', N'17755762520', N'r3a@enet.com.cn', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (127, N'郑冬梅', N'PhoebeHabakkuk', N'Yu6SliD2sPqHTd0y', N'13662623128', N'xssyc3hh@sina.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (128, N'业安珊', N'GriffithGus', N'6h1MBLvXoqgoKKYA', N'19872377474', N'0002jv1avn@163.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (129, N'伊和璧', N'PageFelix', N'jUoWuTIw5518S8MC', N'13255824464', N'ejihdzvi@msn.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (130, N'平绮梅', N'RupertShakespeare', N'phKxkfTL37BJtkwl', N'15672195988', N'lisltm0nd5o2@263.net', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (131, N'干翠荷', N'StaceyCarrie', N'zPDLlP5TPAxOYXbd', N'15859274864', N'ifyjx2l6u@56.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (132, N'张廖书凝', N'EdgarAckerman(n)', N'ENLwcbJH73EKPeYk', N'18165879441', N'jp20otkpqosj4c@etang.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (133, N'贯梦之', N'ErnestBoyle', N'1CDMoBSIU6ay05Jl', N'15328444240', N'hkqmiy45@163.net', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (134, N'占夏烟', N'BorgFred', N'zuQ1XntmIgbdFGog', N'18219621841', N'ls15muw4k45uwmd@sina.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (135, N'孙沛雯', N'HuldaFrances', N'ea31UE51FSGSrgfl', N'16529888133', N'4x20hiwd@126.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (136, N'秘学海', N'DanaLaurie', N'2JbrocxwcJTqCAJs', N'13457793093', N'qfrs42mhzus@qq.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (137, N'虎浓绮', N'ArleneHarte', N'e75vmxWmOVp28HZV', N'14732052439', N'uazr@35.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (138, N'斋秋彤', N'JaneMaggie', N'yrjdxQnCeMZyZEWE', N'19878608338', N'vdj2y6@yeah.net', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (139, N'鄂幻竹', N'NatBuck', N'IXmhazpRWNy3hYMU', N'15965012886', N'idje1w@sina.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (140, N'示佑运', N'Mortimer', N'eo7gnMDdWOqm4xWU', N'13097463340', N'zzmbyjekz@163.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (141, N'贺凡白', N'NeilBurke', N'dfjZbObE5WpEC6RR', N'14913571631', N'zi0pxoqba@msn.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (142, N'千玛丽', N'IvyBertram', N'1dT3D71U0ahI3zwH', N'14594415123', N'0sv0e@263.net', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (143, N'漆雕理全', N'AgathaDobbin', N'S72GkZ9BWIXMJdGB', N'18535946200', N'pxmo@xinhuanet', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (144, N'能靖荷', N'ZebulonElizabeth', N'lskzE6BMBAxvDpHu', N'17538574246', N'6fg2l55c@yahoo.com.cn', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (145, N'冼夏柳', N'WallisFoster', N'iFiEOZP20QOgiln2', N'13454335619', N'p1pvtx@163.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (146, N'上官清宁', N'MortonWild', N'3KzeSICqpAuRh1HT', N'13703396889', N'5urmhhg1ydm3e@tom.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (147, N'青寒香', N'BowenRobin', N'h1K9AHGTXK6gvMVj', N'18341826988', N'q5p50m5@eastday.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (148, N'板杰', N'AdelaDoyle', N'8LfDNFwDrrEoaMTR', N'15331311837', N'1jyol@126.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (149, N'芮初雪', N'ShirleyMary', N'dVOFiJZo3MZLrEjm', N'18671495694', N'prhuwbihrng5w@netease.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (150, N'独华晖', N'YaleWhit', N'3qObe3a30gErfIkI', N'15040293860', N'zmy4pybl1@sogou@com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (151, N'臧书萱', N'BennettArchibald', N'Ab5RY6Okl6VFnYsF', N'13995622484', N'5dzrxea4fbpy6p@163.net', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (152, N'声含秀', N'Gilbert', N'6KE7va65w6khWme7', N'17803127626', N'ong6qs5rmxnl@yahoo.com.cn', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (153, N'焉凡双', N'WayneHerty', N'5MHoqNKqYgCq5jfp', N'17563409062', N'fnwqdeoawb5zj@etang.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (154, N'泷幼柏', N'JenniferNicholas', N'6JCeYovmUwZlPk1Q', N'17627706265', N'uzpzqt5v4xnfh@263.net', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (155, N'忻新蕾', N'ColbertGuy', N'I92hRJis4nsuteZh', N'15870135076', N'xwdy@enet.com.cn', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (156, N'沈清婉', N'AldrichBenedict', N'nmNcSaj3kfYRQPHB', N'13497327252', N'bpls1oyebyieiy@sohu.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (157, N'太史云', N'CarolMaxwell', N'BqzlSgPyKoUcy2AJ', N'19803019809', N'tk1hzzzx6g2wkjv@35.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (158, N'左丘颖秀', N'BartRhys', N'6nCox4vZqrDv8RY5', N'17596067365', N'gtjdgwfhq3@35.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (159, N'甫景龙', N'KingJonah', N'j3r1LRVE7RXTOpfP', N'18967985006', N'b6nbzd03vkjxvtu@qq.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (160, N'镜锐智', N'ElaineSteinbeck', N'r7hOAutQIEEZL21Y', N'13274947767', N'0zcwfbfw1m@126.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (161, N'钦立群', N'BrandonLaw', N'HfaOZJaC4DQuO6Do', N'18822381046', N'6i30s5govsf@eastday.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (162, N'龙娅玟', N'ViolaToynbee', N'4DEqtiWiC2rh2SFq', N'15361663387', N'j3jtptbtgwd3p2@eastday.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (163, N'浦清', N'GladysAled(k)', N'M12nXaK0pDvXzjd6', N'18565504658', N'l5xfhvcn3dvnemi@yahoo.com.cn', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (164, N'韩舒云', N'ElroyDaniel', N'Z7d7aQkFcPFOQLX6', N'13830937615', N'63e2dm0tc0@163.net', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (165, N'封盼秋', N'MartinMacaulay', N'ybGWxWGA78N0Sncd', N'13877399046', N'3cdhgktpwp@citiz.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (166, N'休慕山', N'CaraBartholomew', N'Cb9gTRxPP2k8iUav', N'14731276742', N'3wl4up0orwp@msn.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (167, N'么惜玉', N'CedricBack', N'SW6cO9euGMELAmmo', N'15236655432', N'ysxo4uveso2k1s@eastday.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (168, N'禹元容', N'GabrielleEvans', N'rqftIV0L7uteHTa7', N'13740804258', N'mit3tf1qv6asf4c@msn.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (169, N'竭鹍', N'PrudenceAldington', N'v6l7UgIJkimS8TgW', N'16692497577', N'srik5na25t6@qq.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (170, N'梁丘成益', N'BertonCongreve', N'cfgnabp0WnKBVjiO', N'13387995934', N'huen@yahoo.com.cn', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (171, N'贾平灵', N'SusanHobbes', N'VzUVrti2aOOEicOK', N'18743602085', N'asdjzkiwlmpsy@sina.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (172, N'乙华池', N'QuinnKatharine', N'nNcEvgTsdRXAOnwo', N'15819252435', N'e4xqo2sbus1m@21cn.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (173, N'蓬梅雪', N'HugoRichards', N'SZw8UMXf3h7WIT26', N'17803201042', N'nozeavso@citiz.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (174, N'姓晓山', N'HaroldZangwill', N'kfktJvHWnsHdFH18', N'18252568280', N'axxwpq@xinhuanet', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (175, N'查碧螺', N'TimWood', N'a1YySv0XNnLy0dXX', N'15733267234', N'm1d@yahoo.com.cn', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (176, N'汤格菲', N'IrmaClark(e)', N'irAfD8Pl9NC70rrU', N'13111522359', N'4mgprpy4424@etang.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (177, N'茹寄波', N'BasilThomson', N'J3MD2JlvS473Bcsu', N'14555996978', N'wnxd1wwhpxe2ser@35.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (178, N'守依白', N'JoyWarren', N'yQBHYRvJM6WDvyF0', N'18933555981', N'svxa1y1gb6@126.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (179, N'解安福', N'RenataBroad', N'zPZBa4cE9pa0R7Wc', N'18471883873', N'c20yr0uri@netease.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (180, N'严经业', N'HymanHill', N'nELiX5FSWeoiHNDe', N'13025448128', N'6gp@etang.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (181, N'笪春桃', N'WandaHouston', N'uZ8Y3wdmPf8bMipl', N'18464805623', N't5kgl4jih52@sina.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (182, N'朴明珠', N'GodferyTracy', N'5GooFFCj17tGUJ4k', N'15741857908', N'4zwgwm2ldal@sogou@com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (183, N'浮溪儿', N'AdolphMoore', N'VZL50pgVZ1unFMjP', N'18349884128', N'zshx0lcztcvkgf@sina.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (184, N'桂希', N'KennedyConstance', N'VFUhL6aAUxE3wKHn', N'18472177119', N'rt45vlhy0r@china.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (185, N'康蕴', N'EugeneGill', N'6Rffr41jRR0DDpOP', N'17285583864', N'xp56@hotmail.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (186, N'延冬', N'DrewBrowne', N'IWQPNl5G3hbQWTzq', N'15584959136', N'fybqer@263.net', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (187, N'公叔力言', N'MyrnaHardy', N'jT2dgEPpKBrBWbhE', N'13787439379', N'kxa2pgj1so@qq.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (188, N'律心慈', N'OttoMadge', N'JEYRMcNdCPOEJEUq', N'13437715404', N'emjcy5oe@etang.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (189, N'却南琴', N'FitchBeerbohm', N'jJZenovtsU24ITTQ', N'19881986458', N'nnlq3iij@enet.com.cn', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (190, N'丹醉易', N'UrsulaHarrod', N'L092pMGsG0KWbFDv', N'13312264192', N'ewa@qq.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (191, N'勇雁卉', N'LeifAlsop(p)', N'fmVfKBrE9ciYIKPG', N'13528086803', N'1qbonlraqx4c3q@126.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (192, N'蛮馨逸', N'CarlWebb', N'no1vhEsS3KHLFURH', N'18191833104', N'qrk2ymrt2ijcgs@sogou@com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (193, N'化芷烟', N'DukeSpencer', N'XMtFqr1avV4pWphu', N'15357462958', N'sgpkr6a@265.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (194, N'信迎天', N'HedyKeynes', N'bi7lFDYmkBsaqcvz', N'18097127163', N'n1z6gm0fgue@sogou@com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (195, N'汗运凡', N'RoyFerdinand', N'wxLTPRvcF8KJYSC4', N'14752178691', N'jo5osebp15mc@sina.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (196, N'都尔冬', N'GustaveLongman', N'rJcl9TyR3yBzvIPK', N'17881371869', N'asmrrw6ls@email.com.cn', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (197, N'花微澜', N'NathanielPetty', N'wRf7RXuLhuGI7cJt', N'18613851685', N'w3q364gfq4am@yeah.net', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (198, N'兰忆彤', N'SusannaMacDonald', N'zWG4vf7G551vSGxK', N'13802331136', N'2sos@21cn.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (199, N'楚雍雅', N'Letitia', N'v0jgk6cb0qnkPQeP', N'18566489503', N'3wwzu1duac53g1@21cn.com', NULL, NULL)
GO
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (200, N'错婉娜', N'VeraKipling', N'XcbmMgBP7lM5YXWX', N'13838229240', N'ss1ag4azafjevd@yahoo.com.cn', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (201, N'卑深', N'SigridRaleign', N'YjwMbnrAly4NTxE5', N'13955631336', N'wlx6gyie1s@citiz.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (202, N'岑半安', N'VivienRobinson', N'01sJoKPgW7pKWqRV', N'17799852895', N'6egi@etang.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (203, N'尤晓筠', N'IdaAlice', N'a4ImQiUd0RhFN1Zj', N'15697584733', N'a2x2g6w3y@tom.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (204, N'李又槐', N'DickWinifred', N'nS61E4sUYcf5EXwZ', N'18556694080', N'653rfg1d@netease.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (205, N'百里春柏', N'VivianSilas', N'AUURW8I8TntJdEeD', N'13930141829', N'0kxfvzs026aubd@sina.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (206, N'山雅洁', N'BrookCarter', N'cdD3Oy5PgidVvKs4', N'13051631933', N'1fxjj60t2ti@126.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (207, N'仲孙宏远', N'HermanRomeo', N'Wy2zb5RTqdnTmNJc', N'19808178198', N'5lftrhrawshed3o@hotmail.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (208, N'答涵梅', N'JosephineRaphael', N'TC3rVnqkPUIpnWJM', N'18261967518', N'401emwmuz@56.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (209, N'蓟凝心', N'SarahWillard', N'SY0NgvpzQpGui3A7', N'15745183339', N'ydbzgaieyjp@163.net', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (210, N'时慧英', N'NellyPeacock', N'Y7YSrcc7E3kCMwM8', N'13453497614', N'wk0qrbjctk@email.com.cn', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (211, N'关娟秀', N'KarenPater', N'h56OLEgxSYHn21xC', N'13972614444', N'dq16pu6t3jx@263.net', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (212, N'蔚娅童', N'RuthAnthony', N'DgbHdc4FEuOySGto', N'18594139355', N'ykhsy6dcferldjf@yeah.net', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (213, N'保笑笑', N'LeopoldBrook', N'Vr3Gpecc7B9Bpri9', N'15035329315', N'fznpcqoe@qq.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (214, N'隽亭', N'KimberleyNico(l)', N'6hfiFDe31SOTKthU', N'13569927703', N'p60mt1@yeah.net', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (215, N'盍耘涛', N'SetllaZephaniah', N'RU8BVQaJnkApntrp', N'13466313707', N'xbq2lqg4ljvml1@hotmail.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (216, N'殳梦', N'SebastianeHicks', N'4K46wIrTX7YSNbyN', N'18976986927', N'e5sev@citiz.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (217, N'陶晓燕', N'AlexanderOccam', N'Mzz4Ze0cdc38yN6K', N'13439732784', N'oplvcmz4rhqol@hotmail.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (218, N'原竹', N'AntoniaMasefield', N'QJlVWHS8HcO05UtO', N'15997797897', N'o4jeeep3ju0@263.net', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (219, N'寿长岳', N'HaydenMat(h)ilda', N'59nLs8rYTdakMwrZ', N'15134125732', N'vjy@yahoo.com.cn', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (220, N'柴泽宇', N'NoraArmstrong', N'NqIfs4ScXg1NrCgt', N'14529321175', N'icm6@265.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (221, N'阎书琴', N'UlaNick', N'zNkeb4KwkaQrXEbd', N'13813976139', N'stmee2n2d1qu2r@qq.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (222, N'轩辕问梅', N'AlfredII.', N'unyJblG8oYvjT2Ry', N'13635512960', N'5sbajjrihpm@eastday.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (223, N'骑灵珊', N'DaveHansen', N'HBV7NG8Z0oGDZ2hr', N'15062348059', N's3obetszlz@sohu.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (224, N'籍晏然', N'AbbottWalsh', N'DYERmJGCVkEcgRzb', N'13632259407', N'45nev3ug@163.net', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (225, N'梅新竹', N'HeloiseJosh', N'myGRGsdNdDLc3gqE', N'19958036478', N'1512icd3wq@qq.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (226, N'矫碧白', N'MerryPowell', N'fwcNWLDUPS6KqIR5', N'13461871176', N's4ctx5d3t0t0l@hotmail.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (227, N'洛翰墨', N'AntonySapir', N'vrFGJjbTzg7yCTVW', N'18340872188', N'ettylqn@sohu.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (228, N'利湛芳', N'JudyKellogg', N'0Ri0V8DECfjTsTGX', N'13390487493', N'hjk@xinhuanet', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (229, N'典又亦', N'BarbaraJim', N'6gbv6oKbWP2R8vaz', N'19979701573', N'opjvso@msn.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (230, N'欧山雁', N'NoviaBunyan', N'NPaNCddiRfebc0jo', N'17557749234', N'pc5nenpcc@eastday.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (231, N'庄昭', N'WoodrowStrong', N'jfRv3DOQU4ZzxYcX', N'13886269975', N'cwrbl@eastday.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (232, N'元家欣', N'LisaFrancis', N'pGjHpRpW0FUZ5WKf', N'15607387176', N'455@china.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (233, N'威夏山', N'BuckLandon', N'jsS3LKDXCRe70Td4', N'15102772184', N'ypje2t@sohu.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (234, N'孝鸿德', N'ClementBertie', N'MhJ2va1QnRmlaUTP', N'18964366439', N'uvhexvn@21cn.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (235, N'妫运虹', N'AthenaCarmen', N'NDk468FtYZlsI8HK', N'13515121527', N'vbrnc@sogou@com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (236, N'顿能', N'VitoFerguson', N'rGNc2n0s0ciCONDi', N'16521249681', N'3bef0m@msn.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (237, N'敏英睿', N'RonaldWill', N'CsDft1G3d2sGzYBf', N'15311672805', N'e6h42jtpx@email.com.cn', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (238, N'苗茗雪', N'GilesHamlet', N'MQ3ZhgewUicQyicx', N'15088698207', N'oonkxvjak4zxv@126.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (239, N'毛绿', N'KeithJessie', N'uW5E4ATDpSyPOshb', N'15853511918', N'i1pgu@etang.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (240, N'蒿乐松', N'ElizabethWaters', N'A0Cxel9Fbg2ipfY5', N'13435137819', N'r6yopk@qq.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (241, N'朋心怡', N'JocelynDeQuincey', N'TKCBfEB2TRf4HLai', N'15823513041', N't0ub1nqxorq@sina.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (242, N'买文耀', N'ZaraHenry', N'Q1vnOT5d2I7p10R4', N'14922622583', N'0mitxob@163.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (243, N'姒翰林', N'Natividad', N'zBEDSzMAWabs2RGK', N'13855777573', N'rfzk3nsjf6nj@126.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (244, N'俎代蓝', N'DominicHarvey', N'IeVPbZnlGhKUcEHt', N'15503228202', N'ctmayea@enet.com.cn', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (245, N'焦彭湃', N'ZoraBenson', N'hVE4uegNiMBDB153', N'13792299931', N'45yup1z3tjs@qq.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (246, N'宗政雅可', N'EarthaMark', N'WXN7iH4UXrTdN2aL', N'18934622413', N'jqrcef@xinhuanet', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (247, N'针修美', N'PerryFlynn', N'3NRlsUenBHUnWMND', N'19893188323', N'53pnfak@china.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (248, N'布梦玉', N'BingHosea', N'tVvoQS2bCFlZGIuf', N'19916387068', N'v62b1mez@263.net', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (249, N'庞雅安', N'TheraKelsen', N'IpaRlJhe3OivCK3b', N'19833596170', N'nc1a@etang.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (250, N'烟淑静', N'RoseRussell', N'sVjvjQwpB3NV2Luu', N'16572362436', N'uj3qw62kt6bjh@eastday.com', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserName], [UserAccount], [UserPwd], [UserPhone], [Email], [CarType], [CarID]) VALUES (251, N'Test', N'1', N'1', N'1', N'3560097099@qq.com', NULL, NULL)
SET IDENTITY_INSERT [dbo].[UserInfo] OFF
GO
ALTER TABLE [dbo].[Follow]  WITH CHECK ADD  CONSTRAINT [FK__Follow__L_ID__6E01572D] FOREIGN KEY([L_ID])
REFERENCES [dbo].[LongDistance] ([L_ID])
GO
ALTER TABLE [dbo].[Follow] CHECK CONSTRAINT [FK__Follow__L_ID__6E01572D]
GO
ALTER TABLE [dbo].[Follow]  WITH CHECK ADD  CONSTRAINT [FK__Follow__S_ID__6EF57B66] FOREIGN KEY([S_ID])
REFERENCES [dbo].[ShortDistance] ([S_ID])
GO
ALTER TABLE [dbo].[Follow] CHECK CONSTRAINT [FK__Follow__S_ID__6EF57B66]
GO
ALTER TABLE [dbo].[Follow]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[UserInfo] ([UserID])
GO
ALTER TABLE [dbo].[LongDistance]  WITH CHECK ADD  CONSTRAINT [FK__LongDista__Publi__72C60C4A] FOREIGN KEY([PublishID])
REFERENCES [dbo].[Publish] ([PublishID])
GO
ALTER TABLE [dbo].[LongDistance] CHECK CONSTRAINT [FK__LongDista__Publi__72C60C4A]
GO
ALTER TABLE [dbo].[LongDistance]  WITH CHECK ADD  CONSTRAINT [FK_Driver_UserInfo] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserInfo] ([UserID])
GO
ALTER TABLE [dbo].[LongDistance] CHECK CONSTRAINT [FK_Driver_UserInfo]
GO
ALTER TABLE [dbo].[ShortDistance]  WITH CHECK ADD  CONSTRAINT [FK__Driver_co__UserI__656C112C] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserInfo] ([UserID])
GO
ALTER TABLE [dbo].[ShortDistance] CHECK CONSTRAINT [FK__Driver_co__UserI__656C112C]
GO
ALTER TABLE [dbo].[ShortDistance]  WITH CHECK ADD  CONSTRAINT [FK__ShortDist__Publi__73BA3083] FOREIGN KEY([PublishID])
REFERENCES [dbo].[Publish] ([PublishID])
GO
ALTER TABLE [dbo].[ShortDistance] CHECK CONSTRAINT [FK__ShortDist__Publi__73BA3083]
GO
USE [master]
GO
ALTER DATABASE [CarPoolingDB] SET  READ_WRITE 
GO
