USE [master]
GO
/****** Object:  Database [Alkemy]    Script Date: 26/1/2021 10:57:40 ******/
CREATE DATABASE [Alkemy]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Alkemy', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Alkemy.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Alkemy_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Alkemy_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Alkemy] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Alkemy].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Alkemy] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Alkemy] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Alkemy] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Alkemy] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Alkemy] SET ARITHABORT OFF 
GO
ALTER DATABASE [Alkemy] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Alkemy] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Alkemy] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Alkemy] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Alkemy] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Alkemy] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Alkemy] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Alkemy] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Alkemy] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Alkemy] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Alkemy] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Alkemy] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Alkemy] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Alkemy] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Alkemy] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Alkemy] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Alkemy] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Alkemy] SET RECOVERY FULL 
GO
ALTER DATABASE [Alkemy] SET  MULTI_USER 
GO
ALTER DATABASE [Alkemy] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Alkemy] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Alkemy] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Alkemy] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Alkemy] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Alkemy', N'ON'
GO
ALTER DATABASE [Alkemy] SET QUERY_STORE = OFF
GO
USE [Alkemy]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 26/1/2021 10:57:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[State]    Script Date: 26/1/2021 10:57:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 26/1/2021 10:57:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[Name] [nvarchar](50) NOT NULL,
	[Schedule] [datetime] NOT NULL,
	[Teacher] [nvarchar](50) NOT NULL,
	[Max_Quota] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 26/1/2021 10:57:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[Name] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[DNI] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher_Subject]    Script Date: 26/1/2021 10:57:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher_Subject](
	[ID_Subject] [int] NOT NULL,
	[ID_Teacher] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 26/1/2021 10:57:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](200) NULL,
	[id_role] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([ID], [Name]) VALUES (1, N'Administrador')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (2, N'Alumno')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[State] ON 

INSERT [dbo].[State] ([ID], [Name]) VALUES (1, N'Activo')
INSERT [dbo].[State] ([ID], [Name]) VALUES (2, N'Inactivo')
SET IDENTITY_INSERT [dbo].[State] OFF
GO
SET IDENTITY_INSERT [dbo].[Subject] ON 

INSERT [dbo].[Subject] ([Name], [Schedule], [Teacher], [Max_Quota], [ID]) VALUES (N'Matematica', CAST(N'2021-01-26T09:00:00.000' AS DateTime), N'Ricardo', 50, 3)
INSERT [dbo].[Subject] ([Name], [Schedule], [Teacher], [Max_Quota], [ID]) VALUES (N'Ingles', CAST(N'2021-01-26T10:00:00.000' AS DateTime), N'Alejandro', 20, 4)
INSERT [dbo].[Subject] ([Name], [Schedule], [Teacher], [Max_Quota], [ID]) VALUES (N'Literatura', CAST(N'2021-01-26T11:00:00.000' AS DateTime), N'Laura', 15, 5)
INSERT [dbo].[Subject] ([Name], [Schedule], [Teacher], [Max_Quota], [ID]) VALUES (N'Programacion', CAST(N'2021-01-26T12:00:00.000' AS DateTime), N'Ricardo', 10, 6)
SET IDENTITY_INSERT [dbo].[Subject] OFF
GO
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([Name], [LastName], [DNI], [ID]) VALUES (N'Ricardo', N'Darin', 8123812, 1)
INSERT [dbo].[Teacher] ([Name], [LastName], [DNI], [ID]) VALUES (N'Alejandro', N'Paz', 23331123, 2)
INSERT [dbo].[Teacher] ([Name], [LastName], [DNI], [ID]) VALUES (N'Laura', N'Perez', 12341234, 3)
SET IDENTITY_INSERT [dbo].[Teacher] OFF
GO
INSERT [dbo].[Teacher_Subject] ([ID_Subject], [ID_Teacher]) VALUES (3, 1)
INSERT [dbo].[Teacher_Subject] ([ID_Subject], [ID_Teacher]) VALUES (4, 2)
INSERT [dbo].[Teacher_Subject] ([ID_Subject], [ID_Teacher]) VALUES (5, 3)
INSERT [dbo].[Teacher_Subject] ([ID_Subject], [ID_Teacher]) VALUES (6, 1)
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([id], [username], [password], [id_role]) VALUES (1, N'nico', N'1', 1)
INSERT [dbo].[User] ([id], [username], [password], [id_role]) VALUES (2, N'alumno', N'2', 2)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Teacher_Subject]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Subject_Subject] FOREIGN KEY([ID_Subject])
REFERENCES [dbo].[Subject] ([ID])
GO
ALTER TABLE [dbo].[Teacher_Subject] CHECK CONSTRAINT [FK_Teacher_Subject_Subject]
GO
ALTER TABLE [dbo].[Teacher_Subject]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Subject_Teacher] FOREIGN KEY([ID_Teacher])
REFERENCES [dbo].[Teacher] ([ID])
GO
ALTER TABLE [dbo].[Teacher_Subject] CHECK CONSTRAINT [FK_Teacher_Subject_Teacher]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([id_role])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [Alkemy] SET  READ_WRITE 
GO
