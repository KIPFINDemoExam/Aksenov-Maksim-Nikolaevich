USE [master]
GO
/****** Object:  Database [DriveUrselfProductsDB]    Script Date: 24.06.2020 13:20:47 ******/
CREATE DATABASE [DriveUrselfProductsDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DriveUrselfProductsDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSRV\MSSQL\DATA\DriveUrselfProductsDB.mdf' , SIZE = 7168KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DriveUrselfProductsDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSRV\MSSQL\DATA\DriveUrselfProductsDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DriveUrselfProductsDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DriveUrselfProductsDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DriveUrselfProductsDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DriveUrselfProductsDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DriveUrselfProductsDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DriveUrselfProductsDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DriveUrselfProductsDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [DriveUrselfProductsDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DriveUrselfProductsDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DriveUrselfProductsDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DriveUrselfProductsDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DriveUrselfProductsDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DriveUrselfProductsDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DriveUrselfProductsDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DriveUrselfProductsDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DriveUrselfProductsDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DriveUrselfProductsDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DriveUrselfProductsDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DriveUrselfProductsDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DriveUrselfProductsDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DriveUrselfProductsDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DriveUrselfProductsDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DriveUrselfProductsDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DriveUrselfProductsDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DriveUrselfProductsDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DriveUrselfProductsDB] SET  MULTI_USER 
GO
ALTER DATABASE [DriveUrselfProductsDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DriveUrselfProductsDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DriveUrselfProductsDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DriveUrselfProductsDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DriveUrselfProductsDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [DriveUrselfProductsDB]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 24.06.2020 13:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[id] [int] NULL,
	[Название производителя] [nvarchar](255) NULL,
	[ Дата начала работы] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[product]    Script Date: 24.06.2020 13:20:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] NOT NULL,
	[Наименование товара] [nvarchar](255) NULL,
	[ Главное изображение] [nvarchar](255) NULL,
	[ Производитель] [nvarchar](255) NULL,
	[ Активен?] [nvarchar](255) NULL,
	[ Цена] [nvarchar](255) NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Productsale]    Script Date: 24.06.2020 13:20:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productsale](
	[Товар] [nvarchar](255) NULL,
	[Количество] [float] NULL,
	[Дата и время продажи] [datetime] NULL
) ON [PRIMARY]

GO
USE [master]
GO
ALTER DATABASE [DriveUrselfProductsDB] SET  READ_WRITE 
GO
