
/* Nombre: Adams Del Rosario Matricula: 17-EIIT-1-055	Seccion: 0541*/




USE [master]
GO
/****** Object:  Database [Farmacia]    Script Date: 14/08/2018 0:04:43 ******/
CREATE DATABASE [Farmacia]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Farmacia', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Farmacia.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Farmacia_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Farmacia_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Farmacia] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Farmacia].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Farmacia] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Farmacia] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Farmacia] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Farmacia] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Farmacia] SET ARITHABORT OFF 
GO
ALTER DATABASE [Farmacia] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Farmacia] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Farmacia] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Farmacia] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Farmacia] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Farmacia] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Farmacia] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Farmacia] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Farmacia] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Farmacia] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Farmacia] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Farmacia] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Farmacia] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Farmacia] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Farmacia] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Farmacia] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Farmacia] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Farmacia] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Farmacia] SET  MULTI_USER 
GO
ALTER DATABASE [Farmacia] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Farmacia] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Farmacia] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Farmacia] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Farmacia] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Farmacia] SET QUERY_STORE = OFF
GO
USE [Farmacia]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
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
USE [Farmacia]
GO
/****** Object:  Table [dbo].[Accion]    Script Date: 14/08/2018 0:04:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accion](
	[Accionid] [int] NOT NULL,
	[Descripcion] [nchar](50) NULL,
 CONSTRAINT [PK_Accion] PRIMARY KEY CLUSTERED 
(
	[Accionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 14/08/2018 0:04:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[Clienteid] [int] NOT NULL,
	[Nombre] [nchar](50) NULL,
	[Telefono] [nchar](50) NULL,
	[Direccion] [nchar](50) NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[Clienteid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Farmacia]    Script Date: 14/08/2018 0:04:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Farmacia](
	[Farmaciaid] [int] NOT NULL,
	[Nombre] [nchar](50) NULL,
	[Direccion] [nchar](50) NULL,
	[Telefono] [nchar](50) NULL,
 CONSTRAINT [PK_Farmacia] PRIMARY KEY CLUSTERED 
(
	[Farmaciaid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Farmaco]    Script Date: 14/08/2018 0:04:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Farmaco](
	[Farmacoid] [int] NOT NULL,
	[Nombre] [nchar](50) NULL,
	[Accionid] [int] NULL,
	[Laboratorioid] [int] NULL,
 CONSTRAINT [PK_Farmaco] PRIMARY KEY CLUSTERED 
(
	[Farmacoid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Laboratorio]    Script Date: 14/08/2018 0:04:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Laboratorio](
	[Laboratorioid] [int] NOT NULL,
	[Nombre] [nchar](50) NULL,
	[Direccion] [nchar](50) NULL,
	[Telefono] [nchar](50) NULL,
 CONSTRAINT [PK_Laboratorio] PRIMARY KEY CLUSTERED 
(
	[Laboratorioid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 14/08/2018 0:04:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[Ventaid] [int] NOT NULL,
	[Precio] [nchar](50) NULL,
	[Cantidad] [nchar](20) NULL,
	[Clienteid] [int] NULL,
	[Farmacoid] [int] NULL,
	[Farmaciaid] [int] NULL,
 CONSTRAINT [PK_Venta] PRIMARY KEY CLUSTERED 
(
	[Ventaid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Accion] ([Accionid], [Descripcion]) VALUES (1, N'Antiflamatorio                                    ')
INSERT [dbo].[Accion] ([Accionid], [Descripcion]) VALUES (2, N'Para la acidez de estomago                        ')
INSERT [dbo].[Accion] ([Accionid], [Descripcion]) VALUES (3, N'Para la hipertension                              ')
INSERT [dbo].[Accion] ([Accionid], [Descripcion]) VALUES (4, N'Para reemplazar la tiroxina                       ')
INSERT [dbo].[Accion] ([Accionid], [Descripcion]) VALUES (5, N'Para aliviar el dolor                             ')
INSERT [dbo].[Accion] ([Accionid], [Descripcion]) VALUES (6, N'Para controlar el colesterol                      ')
INSERT [dbo].[Accion] ([Accionid], [Descripcion]) VALUES (7, N'Para el Asma                                      ')
INSERT [dbo].[Accion] ([Accionid], [Descripcion]) VALUES (8, N'Antibiotico                                       ')
INSERT [dbo].[Accion] ([Accionid], [Descripcion]) VALUES (9, N'Contra la depresion                               ')
INSERT [dbo].[Accion] ([Accionid], [Descripcion]) VALUES (10, N'Un diuretico                                      ')
INSERT [dbo].[Cliente] ([Clienteid], [Nombre], [Telefono], [Direccion]) VALUES (1, N'Pepito                                            ', N'8095672424                                        ', N'Herrera Josue                                     ')
INSERT [dbo].[Cliente] ([Clienteid], [Nombre], [Telefono], [Direccion]) VALUES (2, N'Adams                                             ', N'8096784231                                        ', N'Herrera Josue                                     ')
INSERT [dbo].[Cliente] ([Clienteid], [Nombre], [Telefono], [Direccion]) VALUES (3, N'Beato                                             ', N'8299786555                                        ', N'Pantoja                                           ')
INSERT [dbo].[Cliente] ([Clienteid], [Nombre], [Telefono], [Direccion]) VALUES (4, N'Caterin                                           ', N'8298884452                                        ', N'Carmen Renata III                                 ')
INSERT [dbo].[Cliente] ([Clienteid], [Nombre], [Telefono], [Direccion]) VALUES (5, N'Carolina                                          ', N'8494928549                                        ', N'Los Girasoles                                     ')
INSERT [dbo].[Cliente] ([Clienteid], [Nombre], [Telefono], [Direccion]) VALUES (6, N'Carlos                                            ', N'8492567834                                        ', N'Los Girasoles                                     ')
INSERT [dbo].[Cliente] ([Clienteid], [Nombre], [Telefono], [Direccion]) VALUES (7, N'Jose                                              ', N'8098985989                                        ', N'Los Minas                                         ')
INSERT [dbo].[Cliente] ([Clienteid], [Nombre], [Telefono], [Direccion]) VALUES (8, N'Girbert                                           ', N'8092494422                                        ', N'Herrera La Palmar                                 ')
INSERT [dbo].[Cliente] ([Clienteid], [Nombre], [Telefono], [Direccion]) VALUES (9, N'Sebastian                                         ', N'8295555343                                        ', N'Herrera Paraiso                                   ')
INSERT [dbo].[Cliente] ([Clienteid], [Nombre], [Telefono], [Direccion]) VALUES (10, N'Jeremy                                            ', N'8093344040                                        ', N'Pantoja                                           ')
INSERT [dbo].[Farmacia] ([Farmaciaid], [Nombre], [Direccion], [Telefono]) VALUES (1, N'Farmacia Michel                                   ', N'Herrera Josue                                     ', N'8093341004                                        ')
INSERT [dbo].[Farmaco] ([Farmacoid], [Nombre], [Accionid], [Laboratorioid]) VALUES (1, N'Aspirina                                          ', 1, 1)
INSERT [dbo].[Farmaco] ([Farmacoid], [Nombre], [Accionid], [Laboratorioid]) VALUES (2, N'Omeprazol                                         ', 2, 2)
INSERT [dbo].[Farmaco] ([Farmacoid], [Nombre], [Accionid], [Laboratorioid]) VALUES (3, N'Ramipril                                          ', 3, 3)
INSERT [dbo].[Farmaco] ([Farmacoid], [Nombre], [Accionid], [Laboratorioid]) VALUES (4, N'Leoxotiroxina                                     ', 4, 4)
INSERT [dbo].[Farmaco] ([Farmacoid], [Nombre], [Accionid], [Laboratorioid]) VALUES (5, N'Paracetamol                                       ', 5, 5)
INSERT [dbo].[Farmaco] ([Farmacoid], [Nombre], [Accionid], [Laboratorioid]) VALUES (6, N'Atorvastatina                                     ', 6, 4)
INSERT [dbo].[Farmaco] ([Farmacoid], [Nombre], [Accionid], [Laboratorioid]) VALUES (7, N'Salbutamlo                                        ', 7, 6)
INSERT [dbo].[Farmaco] ([Farmacoid], [Nombre], [Accionid], [Laboratorioid]) VALUES (8, N'Amoxicilina                                       ', 8, 7)
INSERT [dbo].[Farmaco] ([Farmacoid], [Nombre], [Accionid], [Laboratorioid]) VALUES (9, N'Amitriptilina                                     ', 9, 2)
INSERT [dbo].[Farmaco] ([Farmacoid], [Nombre], [Accionid], [Laboratorioid]) VALUES (10, N'Furosemida                                        ', 10, NULL)
INSERT [dbo].[Laboratorio] ([Laboratorioid], [Nombre], [Direccion], [Telefono]) VALUES (1, N'Alfa                                              ', N'Av.Charles Summer,SD                              ', N'809554022                                         ')
INSERT [dbo].[Laboratorio] ([Laboratorioid], [Nombre], [Direccion], [Telefono]) VALUES (2, N'Ethical                                           ', N'Av.27 de Febrero 1501                             ', N'8095543360                                        ')
INSERT [dbo].[Laboratorio] ([Laboratorioid], [Nombre], [Direccion], [Telefono]) VALUES (3, N'Sued                                              ', N'Pantoja                                           ', N'8095615001                                        ')
INSERT [dbo].[Laboratorio] ([Laboratorioid], [Nombre], [Direccion], [Telefono]) VALUES (4, N'Rowe                                              ', N'Calle Moises Garcia SD                            ', N'8096872701                                        ')
INSERT [dbo].[Laboratorio] ([Laboratorioid], [Nombre], [Direccion], [Telefono]) VALUES (5, N'Rangel, SRL                                       ', N'Maria Trinidad S Concepcion                       ', N'8095733885                                        ')
INSERT [dbo].[Laboratorio] ([Laboratorioid], [Nombre], [Direccion], [Telefono]) VALUES (6, N'Bayer RD                                          ', N'Apartado 962 SD                                   ', N'8095308086                                        ')
INSERT [dbo].[Laboratorio] ([Laboratorioid], [Nombre], [Direccion], [Telefono]) VALUES (7, N'Pharmatec                                         ', N'Jose Desiderio Valverde 103 SD                    ', N'8096208000                                        ')
INSERT [dbo].[Laboratorio] ([Laboratorioid], [Nombre], [Direccion], [Telefono]) VALUES (8, N'Abbott RD                                         ', N'Av.Monumental SD                                  ', N'8095427181                                        ')
INSERT [dbo].[Laboratorio] ([Laboratorioid], [Nombre], [Direccion], [Telefono]) VALUES (9, N'Suiphar                                           ', N'Av.John F. Kennedy SD                             ', N'8093338888                                        ')
INSERT [dbo].[Laboratorio] ([Laboratorioid], [Nombre], [Direccion], [Telefono]) VALUES (10, N'Ibero Farmacos                                    ', N'Av.Wiston Churchill SD                            ', N'8095707273                                        ')
INSERT [dbo].[Venta] ([Ventaid], [Precio], [Cantidad], [Clienteid], [Farmacoid], [Farmaciaid]) VALUES (1, N'500                                               ', N'5                   ', 1, 1, 1)
INSERT [dbo].[Venta] ([Ventaid], [Precio], [Cantidad], [Clienteid], [Farmacoid], [Farmaciaid]) VALUES (2, N'100                                               ', N'2                   ', 2, 2, 1)
INSERT [dbo].[Venta] ([Ventaid], [Precio], [Cantidad], [Clienteid], [Farmacoid], [Farmaciaid]) VALUES (3, N'50                                                ', N'1                   ', 3, 3, 1)
INSERT [dbo].[Venta] ([Ventaid], [Precio], [Cantidad], [Clienteid], [Farmacoid], [Farmaciaid]) VALUES (4, N'200                                               ', N'3                   ', 4, 4, 1)
INSERT [dbo].[Venta] ([Ventaid], [Precio], [Cantidad], [Clienteid], [Farmacoid], [Farmaciaid]) VALUES (5, N'25                                                ', N'1                   ', 5, 5, 1)
INSERT [dbo].[Venta] ([Ventaid], [Precio], [Cantidad], [Clienteid], [Farmacoid], [Farmaciaid]) VALUES (6, N'100                                               ', N'2                   ', 6, 8, 1)
INSERT [dbo].[Venta] ([Ventaid], [Precio], [Cantidad], [Clienteid], [Farmacoid], [Farmaciaid]) VALUES (7, N'150                                               ', N'3                   ', 7, 9, 1)
INSERT [dbo].[Venta] ([Ventaid], [Precio], [Cantidad], [Clienteid], [Farmacoid], [Farmaciaid]) VALUES (8, N'400                                               ', N'4                   ', 8, 10, 1)
INSERT [dbo].[Venta] ([Ventaid], [Precio], [Cantidad], [Clienteid], [Farmacoid], [Farmaciaid]) VALUES (9, N'50                                                ', N'2                   ', 9, 6, 1)
INSERT [dbo].[Venta] ([Ventaid], [Precio], [Cantidad], [Clienteid], [Farmacoid], [Farmaciaid]) VALUES (10, N'200                                               ', N'4                   ', 10, 7, 1)
ALTER TABLE [dbo].[Farmaco]  WITH CHECK ADD  CONSTRAINT [FK_Farmaco_Accion] FOREIGN KEY([Accionid])
REFERENCES [dbo].[Accion] ([Accionid])
GO
ALTER TABLE [dbo].[Farmaco] CHECK CONSTRAINT [FK_Farmaco_Accion]
GO
ALTER TABLE [dbo].[Farmaco]  WITH CHECK ADD  CONSTRAINT [FK_Farmaco_Laboratorio] FOREIGN KEY([Laboratorioid])
REFERENCES [dbo].[Laboratorio] ([Laboratorioid])
GO
ALTER TABLE [dbo].[Farmaco] CHECK CONSTRAINT [FK_Farmaco_Laboratorio]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Cliente] FOREIGN KEY([Clienteid])
REFERENCES [dbo].[Cliente] ([Clienteid])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Cliente]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Farmacia] FOREIGN KEY([Farmaciaid])
REFERENCES [dbo].[Farmacia] ([Farmaciaid])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Farmacia]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Farmaco] FOREIGN KEY([Farmacoid])
REFERENCES [dbo].[Farmaco] ([Farmacoid])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Farmaco]
GO
USE [master]
GO
ALTER DATABASE [Farmacia] SET  READ_WRITE 
GO
