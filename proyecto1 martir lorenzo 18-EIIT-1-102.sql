/*MARTIR JUAN LORENZO QUEZADA MATRICULA: 18-EIIT-1-102 SECCION:O541 */



USE [master]
GO
/****** Object:  Database [dealer de autos]    Script Date: 30/11/2018 10:44:34 ******/
CREATE DATABASE [dealer de autos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dealer de autos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\dealer de autos.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dealer de autos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\dealer de autos_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [dealer de autos] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dealer de autos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dealer de autos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dealer de autos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dealer de autos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dealer de autos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dealer de autos] SET ARITHABORT OFF 
GO
ALTER DATABASE [dealer de autos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dealer de autos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dealer de autos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dealer de autos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dealer de autos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dealer de autos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dealer de autos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dealer de autos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dealer de autos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dealer de autos] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dealer de autos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dealer de autos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dealer de autos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dealer de autos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dealer de autos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dealer de autos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dealer de autos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dealer de autos] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dealer de autos] SET  MULTI_USER 
GO
ALTER DATABASE [dealer de autos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dealer de autos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dealer de autos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dealer de autos] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dealer de autos] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dealer de autos] SET QUERY_STORE = OFF
GO
USE [dealer de autos]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [dealer de autos]
GO
/****** Object:  Table [dbo].[carros]    Script Date: 30/11/2018 10:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[carros](
	[carroId] [int] NOT NULL,
	[color] [varchar](50) NOT NULL,
	[marcaId] [int] NOT NULL,
	[transmision] [varchar](50) NULL,
 CONSTRAINT [PK_carros] PRIMARY KEY CLUSTERED 
(
	[carroId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[compra]    Script Date: 30/11/2018 10:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[compra](
	[compraId] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio] [money] NOT NULL,
	[proveedorId] [int] NULL,
 CONSTRAINT [PK_compra] PRIMARY KEY CLUSTERED 
(
	[compraId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[marca]    Script Date: 30/11/2018 10:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[marca](
	[marcaId] [int] NOT NULL,
	[nombre] [varchar](50) NULL,
	[modeloId] [int] NULL,
	[año] [int] NULL,
 CONSTRAINT [PK_marca] PRIMARY KEY CLUSTERED 
(
	[marcaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[modelo]    Script Date: 30/11/2018 10:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[modelo](
	[modeloId] [int] NOT NULL,
	[nombre] [varchar](50) NULL,
	[descripcion] [varchar](250) NULL,
 CONSTRAINT [PK_modelo] PRIMARY KEY CLUSTERED 
(
	[modeloId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[proveedor]    Script Date: 30/11/2018 10:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[proveedor](
	[proveedorId] [int] NOT NULL,
	[nombreempresa] [varchar](250) NOT NULL,
	[cedula] [varchar](15) NOT NULL,
	[telefono] [varchar](13) NOT NULL,
 CONSTRAINT [PK_proveedor] PRIMARY KEY CLUSTERED 
(
	[proveedorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[carros] ([carroId], [color], [marcaId], [transmision]) VALUES (1, N'negro', 1, N'automatica')
INSERT [dbo].[carros] ([carroId], [color], [marcaId], [transmision]) VALUES (2, N'azul', 2, N'mecanica')
INSERT [dbo].[carros] ([carroId], [color], [marcaId], [transmision]) VALUES (3, N'blanco', 3, N'mecanica')
INSERT [dbo].[carros] ([carroId], [color], [marcaId], [transmision]) VALUES (4, N'verde', 4, N'automatica')
INSERT [dbo].[carros] ([carroId], [color], [marcaId], [transmision]) VALUES (5, N'gris', 5, N'mecanica')
INSERT [dbo].[carros] ([carroId], [color], [marcaId], [transmision]) VALUES (6, N'morado', 6, N'automatica')
INSERT [dbo].[carros] ([carroId], [color], [marcaId], [transmision]) VALUES (7, N'rojo', 7, N'mecanica')
INSERT [dbo].[carros] ([carroId], [color], [marcaId], [transmision]) VALUES (8, N'amarillo', 8, N'mecanica')
INSERT [dbo].[carros] ([carroId], [color], [marcaId], [transmision]) VALUES (9, N'blanco', 9, N'automatica')
INSERT [dbo].[carros] ([carroId], [color], [marcaId], [transmision]) VALUES (10, N'negro', 10, N'mecanica')
INSERT [dbo].[compra] ([compraId], [cantidad], [precio], [proveedorId]) VALUES (1, 20, 500.0000, 1)
INSERT [dbo].[compra] ([compraId], [cantidad], [precio], [proveedorId]) VALUES (2, 34, 400.0000, 2)
INSERT [dbo].[compra] ([compraId], [cantidad], [precio], [proveedorId]) VALUES (3, 8, 450.0000, 3)
INSERT [dbo].[compra] ([compraId], [cantidad], [precio], [proveedorId]) VALUES (4, 5, 675.0000, 4)
INSERT [dbo].[compra] ([compraId], [cantidad], [precio], [proveedorId]) VALUES (5, 2, 300.0000, 5)
INSERT [dbo].[compra] ([compraId], [cantidad], [precio], [proveedorId]) VALUES (6, 3, 365.0000, 6)
INSERT [dbo].[compra] ([compraId], [cantidad], [precio], [proveedorId]) VALUES (7, 1, 999.0000, 7)
INSERT [dbo].[compra] ([compraId], [cantidad], [precio], [proveedorId]) VALUES (8, 2, 550.0000, 8)
INSERT [dbo].[compra] ([compraId], [cantidad], [precio], [proveedorId]) VALUES (9, 7, 250.0000, 9)
INSERT [dbo].[compra] ([compraId], [cantidad], [precio], [proveedorId]) VALUES (10, 1, 990.0000, 10)
INSERT [dbo].[marca] ([marcaId], [nombre], [modeloId], [año]) VALUES (1, N'toyota', 1, 2015)
INSERT [dbo].[marca] ([marcaId], [nombre], [modeloId], [año]) VALUES (2, N'toyota', 2, 2010)
INSERT [dbo].[marca] ([marcaId], [nombre], [modeloId], [año]) VALUES (3, N'honda', 3, 2009)
INSERT [dbo].[marca] ([marcaId], [nombre], [modeloId], [año]) VALUES (4, N'honda', 4, 2017)
INSERT [dbo].[marca] ([marcaId], [nombre], [modeloId], [año]) VALUES (5, N'nissan', 5, 2015)
INSERT [dbo].[marca] ([marcaId], [nombre], [modeloId], [año]) VALUES (6, N'sonata', 6, 2005)
INSERT [dbo].[marca] ([marcaId], [nombre], [modeloId], [año]) VALUES (7, N'Lamborghini', 7, 2018)
INSERT [dbo].[marca] ([marcaId], [nombre], [modeloId], [año]) VALUES (8, N'toyota', 8, 2003)
INSERT [dbo].[marca] ([marcaId], [nombre], [modeloId], [año]) VALUES (9, N'Isuzu', 9, 2005)
INSERT [dbo].[marca] ([marcaId], [nombre], [modeloId], [año]) VALUES (10, N'Lamborghini', 10, NULL)
INSERT [dbo].[modelo] ([modeloId], [nombre], [descripcion]) VALUES (1, N'camry', N'nuevo')
INSERT [dbo].[modelo] ([modeloId], [nombre], [descripcion]) VALUES (2, N'corolla', N'semi´-nuevo')
INSERT [dbo].[modelo] ([modeloId], [nombre], [descripcion]) VALUES (3, N'civic', N'usado')
INSERT [dbo].[modelo] ([modeloId], [nombre], [descripcion]) VALUES (4, N'corolla', N'nuevo')
INSERT [dbo].[modelo] ([modeloId], [nombre], [descripcion]) VALUES (5, N'sentra', N'usado')
INSERT [dbo].[modelo] ([modeloId], [nombre], [descripcion]) VALUES (6, N'N20', N'semi-nuevo')
INSERT [dbo].[modelo] ([modeloId], [nombre], [descripcion]) VALUES (7, N'huracan', N'nuevo')
INSERT [dbo].[modelo] ([modeloId], [nombre], [descripcion]) VALUES (8, N'hilux', N'semi-nuevo')
INSERT [dbo].[modelo] ([modeloId], [nombre], [descripcion]) VALUES (9, N'Dimax', N'nuevo')
INSERT [dbo].[modelo] ([modeloId], [nombre], [descripcion]) VALUES (10, N'aventador', N'nuevo')
INSERT [dbo].[proveedor] ([proveedorId], [nombreempresa], [cedula], [telefono]) VALUES (1, N'electrom', N'40209955844', N'8095270083')
INSERT [dbo].[proveedor] ([proveedorId], [nombreempresa], [cedula], [telefono]) VALUES (2, N'autozama', N'01609956523', N'8093234242')
INSERT [dbo].[proveedor] ([proveedorId], [nombreempresa], [cedula], [telefono]) VALUES (3, N'electromega', N'40298283039', N'8299829282')
INSERT [dbo].[proveedor] ([proveedorId], [nombreempresa], [cedula], [telefono]) VALUES (4, N'hartemania', N'01681839012', N'8098191428')
INSERT [dbo].[proveedor] ([proveedorId], [nombreempresa], [cedula], [telefono]) VALUES (5, N'power', N'01781190838', N'8099181918')
INSERT [dbo].[proveedor] ([proveedorId], [nombreempresa], [cedula], [telefono]) VALUES (6, N'JyH', N'00209109293', N'8490110192')
INSERT [dbo].[proveedor] ([proveedorId], [nombreempresa], [cedula], [telefono]) VALUES (7, N'odebrech', N'01909229229', N'8099183883')
INSERT [dbo].[proveedor] ([proveedorId], [nombreempresa], [cedula], [telefono]) VALUES (8, N'estrella', N'01801911928', N'8290901220')
INSERT [dbo].[proveedor] ([proveedorId], [nombreempresa], [cedula], [telefono]) VALUES (9, N'corripio', N'01609019209', N'8490191848')
INSERT [dbo].[proveedor] ([proveedorId], [nombreempresa], [cedula], [telefono]) VALUES (10, N'autotrom', N'01910985839', N'8299480384')
ALTER TABLE [dbo].[carros]  WITH CHECK ADD  CONSTRAINT [FK_carros_marca] FOREIGN KEY([marcaId])
REFERENCES [dbo].[marca] ([marcaId])
GO
ALTER TABLE [dbo].[carros] CHECK CONSTRAINT [FK_carros_marca]
GO
ALTER TABLE [dbo].[compra]  WITH CHECK ADD  CONSTRAINT [FK_compra_proveedor] FOREIGN KEY([proveedorId])
REFERENCES [dbo].[proveedor] ([proveedorId])
GO
ALTER TABLE [dbo].[compra] CHECK CONSTRAINT [FK_compra_proveedor]
GO
ALTER TABLE [dbo].[marca]  WITH CHECK ADD  CONSTRAINT [FK_marca_modelo] FOREIGN KEY([modeloId])
REFERENCES [dbo].[modelo] ([modeloId])
GO
ALTER TABLE [dbo].[marca] CHECK CONSTRAINT [FK_marca_modelo]
GO
USE [master]
GO
ALTER DATABASE [dealer de autos] SET  READ_WRITE 
GO
