USE [master]
GO
/****** Object:  Database [CountryCityMS]    Script Date: 4/10/2016 6:43:57 PM ******/
CREATE DATABASE [CountryCityMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CountryCityMS', FILENAME = N'C:\Users\Mehedi Mishuk\CountryCityMS.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CountryCityMS_log', FILENAME = N'C:\Users\Mehedi Mishuk\CountryCityMS_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CountryCityMS] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CountryCityMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CountryCityMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CountryCityMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CountryCityMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CountryCityMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CountryCityMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [CountryCityMS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CountryCityMS] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [CountryCityMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CountryCityMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CountryCityMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CountryCityMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CountryCityMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CountryCityMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CountryCityMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CountryCityMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CountryCityMS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CountryCityMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CountryCityMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CountryCityMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CountryCityMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CountryCityMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CountryCityMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CountryCityMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CountryCityMS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CountryCityMS] SET  MULTI_USER 
GO
ALTER DATABASE [CountryCityMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CountryCityMS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CountryCityMS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CountryCityMS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [CountryCityMS]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 4/10/2016 6:43:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](250) NULL,
	[about] [nchar](4000) NULL,
	[no_of_dwellers] [int] NULL,
	[location] [varchar](1000) NULL,
	[weather] [varchar](550) NULL,
	[country_id] [int] NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 4/10/2016 6:43:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Countries](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](550) NULL,
	[about] [text] NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[CountryCityView]    Script Date: 4/10/2016 6:43:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CountryCityView]
AS 
SELECT cities.name as cityName,cities.about AS cityAbout,cities.no_of_dwellers,cities.location,cities.weather,cities.country_id,countries.name as countryName,countries.about AS countryAbout 
FROM cities 
INNER JOIN countries 
ON countries.id=cities.country_id
GO
USE [master]
GO
ALTER DATABASE [CountryCityMS] SET  READ_WRITE 
GO
