
/* Nombre: Adams Del Rosario Matricula: 17-EIIT-1-055	Seccion: 0541*/



USE [master]
GO
/****** Object:  Database [HotelADR]    Script Date: 13/08/2018 23:00:39 ******/
CREATE DATABASE [HotelADR]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HotelADR', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\HotelADR.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HotelADR_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\HotelADR_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [HotelADR] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HotelADR].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HotelADR] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HotelADR] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HotelADR] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HotelADR] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HotelADR] SET ARITHABORT OFF 
GO
ALTER DATABASE [HotelADR] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HotelADR] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HotelADR] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HotelADR] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HotelADR] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HotelADR] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HotelADR] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HotelADR] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HotelADR] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HotelADR] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HotelADR] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HotelADR] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HotelADR] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HotelADR] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HotelADR] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HotelADR] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HotelADR] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HotelADR] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HotelADR] SET  MULTI_USER 
GO
ALTER DATABASE [HotelADR] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HotelADR] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HotelADR] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HotelADR] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HotelADR] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HotelADR] SET QUERY_STORE = OFF
GO
USE [HotelADR]
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
USE [HotelADR]
GO
/****** Object:  Table [dbo].[Alquiler]    Script Date: 13/08/2018 23:00:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alquiler](
	[Alquilerid] [int] NOT NULL,
	[Precio] [nchar](50) NULL,
	[FechaEntrada] [nchar](50) NULL,
	[FechaSalida] [nchar](50) NULL,
	[Clienteid] [int] NULL,
	[Habitacionid] [int] NULL,
	[Hotelid] [int] NULL,
 CONSTRAINT [PK_Alquiler] PRIMARY KEY CLUSTERED 
(
	[Alquilerid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bloque]    Script Date: 13/08/2018 23:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bloque](
	[Bloqueid] [int] NOT NULL,
	[Nombre] [nchar](40) NULL,
 CONSTRAINT [PK_Bloque] PRIMARY KEY CLUSTERED 
(
	[Bloqueid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 13/08/2018 23:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[Clienteid] [int] NOT NULL,
	[Nombre] [nchar](50) NULL,
	[Apellido] [nchar](50) NULL,
	[Cedula] [nchar](11) NULL,
	[Telefono] [nchar](10) NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[Clienteid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Habitacion]    Script Date: 13/08/2018 23:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Habitacion](
	[Habitacionid] [int] NOT NULL,
	[Numero] [nchar](50) NULL,
	[Tipo] [nchar](50) NULL,
	[Bloqueid] [int] NULL,
 CONSTRAINT [PK_Habitacion] PRIMARY KEY CLUSTERED 
(
	[Habitacionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 13/08/2018 23:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[Hotelid] [int] NOT NULL,
	[Nombre] [nchar](50) NULL,
	[Direccion] [nchar](50) NULL,
	[Estrellas] [nchar](30) NULL,
	[Telefono] [nchar](10) NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[Hotelid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Alquiler] ([Alquilerid], [Precio], [FechaEntrada], [FechaSalida], [Clienteid], [Habitacionid], [Hotelid]) VALUES (1, N'6000                                              ', N'13/08/2018                                        ', N'15/08/2018                                        ', 1, 1, 1)
INSERT [dbo].[Alquiler] ([Alquilerid], [Precio], [FechaEntrada], [FechaSalida], [Clienteid], [Habitacionid], [Hotelid]) VALUES (2, N'6000                                              ', N'14/08/2018                                        ', N'16/08/2018                                        ', 3, 2, 1)
INSERT [dbo].[Alquiler] ([Alquilerid], [Precio], [FechaEntrada], [FechaSalida], [Clienteid], [Habitacionid], [Hotelid]) VALUES (3, N'6000                                              ', N'15/08/2018                                        ', N'17/08/2018                                        ', 2, 3, 1)
INSERT [dbo].[Alquiler] ([Alquilerid], [Precio], [FechaEntrada], [FechaSalida], [Clienteid], [Habitacionid], [Hotelid]) VALUES (4, N'9000                                              ', N'13/08/2018                                        ', N'15/08/2018                                        ', 5, 4, 1)
INSERT [dbo].[Alquiler] ([Alquilerid], [Precio], [FechaEntrada], [FechaSalida], [Clienteid], [Habitacionid], [Hotelid]) VALUES (5, N'9000                                              ', N'13/08/2018                                        ', N'15/08/2018                                        ', 4, 5, 1)
INSERT [dbo].[Alquiler] ([Alquilerid], [Precio], [FechaEntrada], [FechaSalida], [Clienteid], [Habitacionid], [Hotelid]) VALUES (6, N'9000                                              ', N'16/08/2018                                        ', N'18/08/2018                                        ', 6, 6, 1)
INSERT [dbo].[Alquiler] ([Alquilerid], [Precio], [FechaEntrada], [FechaSalida], [Clienteid], [Habitacionid], [Hotelid]) VALUES (7, N'3000                                              ', N'16/08/2018                                        ', N'18/08/2018                                        ', 7, 7, 1)
INSERT [dbo].[Alquiler] ([Alquilerid], [Precio], [FechaEntrada], [FechaSalida], [Clienteid], [Habitacionid], [Hotelid]) VALUES (8, N'3000                                              ', N'17/08/2018                                        ', N'19/08/2018                                        ', 10, 8, 1)
INSERT [dbo].[Alquiler] ([Alquilerid], [Precio], [FechaEntrada], [FechaSalida], [Clienteid], [Habitacionid], [Hotelid]) VALUES (9, N'3000                                              ', N'13/08/2018                                        ', N'15/08/2018                                        ', 9, 9, 1)
INSERT [dbo].[Alquiler] ([Alquilerid], [Precio], [FechaEntrada], [FechaSalida], [Clienteid], [Habitacionid], [Hotelid]) VALUES (10, N'3000                                              ', N'13/08/2018                                        ', N'15/08/2018                                        ', 10, 10, 1)
INSERT [dbo].[Bloque] ([Bloqueid], [Nombre]) VALUES (1, N'A                                       ')
INSERT [dbo].[Bloque] ([Bloqueid], [Nombre]) VALUES (2, N'B                                       ')
INSERT [dbo].[Bloque] ([Bloqueid], [Nombre]) VALUES (3, N'C                                       ')
INSERT [dbo].[Bloque] ([Bloqueid], [Nombre]) VALUES (4, N'D                                       ')
INSERT [dbo].[Bloque] ([Bloqueid], [Nombre]) VALUES (5, N'E                                       ')
INSERT [dbo].[Bloque] ([Bloqueid], [Nombre]) VALUES (6, N'F                                       ')
INSERT [dbo].[Bloque] ([Bloqueid], [Nombre]) VALUES (7, N'G                                       ')
INSERT [dbo].[Bloque] ([Bloqueid], [Nombre]) VALUES (8, N'H                                       ')
INSERT [dbo].[Bloque] ([Bloqueid], [Nombre]) VALUES (9, N'I                                       ')
INSERT [dbo].[Bloque] ([Bloqueid], [Nombre]) VALUES (10, NULL)
INSERT [dbo].[Cliente] ([Clienteid], [Nombre], [Apellido], [Cedula], [Telefono]) VALUES (1, N'Adams Alberto                                     ', N'Del Rosario Ramirez                               ', N'40238756759', N'8299668392')
INSERT [dbo].[Cliente] ([Clienteid], [Nombre], [Apellido], [Cedula], [Telefono]) VALUES (2, N'Corban Ernesto                                    ', N'Feliz                                             ', N'40238765789', N'8294567892')
INSERT [dbo].[Cliente] ([Clienteid], [Nombre], [Apellido], [Cedula], [Telefono]) VALUES (3, N'Dilenia                                           ', N'Ruiz                                              ', N'40285969213', N'8092458293')
INSERT [dbo].[Cliente] ([Clienteid], [Nombre], [Apellido], [Cedula], [Telefono]) VALUES (4, N'Amelia                                            ', N'Vega                                              ', N'40293849581', N'8493412351')
INSERT [dbo].[Cliente] ([Clienteid], [Nombre], [Apellido], [Cedula], [Telefono]) VALUES (5, N'Linnete                                           ', N'Melo                                              ', N'40271238912', N'8092312341')
INSERT [dbo].[Cliente] ([Clienteid], [Nombre], [Apellido], [Cedula], [Telefono]) VALUES (6, N'Luis                                              ', N'Calderon                                          ', N'40212345678', N'8092345555')
INSERT [dbo].[Cliente] ([Clienteid], [Nombre], [Apellido], [Cedula], [Telefono]) VALUES (7, N'Carlos                                            ', N'Jimenez Matos                                     ', N'40234762891', N'8093412562')
INSERT [dbo].[Cliente] ([Clienteid], [Nombre], [Apellido], [Cedula], [Telefono]) VALUES (8, N'Adalberto                                         ', N'Del Rosario                                       ', N'40262316834', N'8297988989')
INSERT [dbo].[Cliente] ([Clienteid], [Nombre], [Apellido], [Cedula], [Telefono]) VALUES (9, N'Rosanna                                           ', N'Castro                                            ', N'40231245262', N'8498829312')
INSERT [dbo].[Cliente] ([Clienteid], [Nombre], [Apellido], [Cedula], [Telefono]) VALUES (10, N'Oscar                                             ', N'Abreu                                             ', N'40263241234', N'8096545654')
INSERT [dbo].[Habitacion] ([Habitacionid], [Numero], [Tipo], [Bloqueid]) VALUES (1, N'1                                                 ', N'2ble                                              ', 1)
INSERT [dbo].[Habitacion] ([Habitacionid], [Numero], [Tipo], [Bloqueid]) VALUES (2, N'2                                                 ', N'2ble                                              ', 2)
INSERT [dbo].[Habitacion] ([Habitacionid], [Numero], [Tipo], [Bloqueid]) VALUES (3, N'3                                                 ', N'2ble                                              ', 3)
INSERT [dbo].[Habitacion] ([Habitacionid], [Numero], [Tipo], [Bloqueid]) VALUES (4, N'4                                                 ', N'3ple                                              ', 4)
INSERT [dbo].[Habitacion] ([Habitacionid], [Numero], [Tipo], [Bloqueid]) VALUES (5, N'5                                                 ', N'3ple                                              ', 5)
INSERT [dbo].[Habitacion] ([Habitacionid], [Numero], [Tipo], [Bloqueid]) VALUES (6, N'6                                                 ', N'3ple                                              ', 6)
INSERT [dbo].[Habitacion] ([Habitacionid], [Numero], [Tipo], [Bloqueid]) VALUES (7, N'7                                                 ', N'Individual                                        ', 7)
INSERT [dbo].[Habitacion] ([Habitacionid], [Numero], [Tipo], [Bloqueid]) VALUES (8, N'8                                                 ', N'Individual                                        ', 8)
INSERT [dbo].[Habitacion] ([Habitacionid], [Numero], [Tipo], [Bloqueid]) VALUES (9, N'9                                                 ', N'Individual                                        ', 9)
INSERT [dbo].[Habitacion] ([Habitacionid], [Numero], [Tipo], [Bloqueid]) VALUES (10, N'10                                                ', N'Individual                                        ', 10)
INSERT [dbo].[Hotel] ([Hotelid], [Nombre], [Direccion], [Estrellas], [Telefono]) VALUES (1, N'HotelADR                                          ', N'Higuey Anamelia                                   ', N'5                             ', N'8095540732')
ALTER TABLE [dbo].[Alquiler]  WITH CHECK ADD  CONSTRAINT [FK_Alquiler_Cliente] FOREIGN KEY([Clienteid])
REFERENCES [dbo].[Cliente] ([Clienteid])
GO
ALTER TABLE [dbo].[Alquiler] CHECK CONSTRAINT [FK_Alquiler_Cliente]
GO
ALTER TABLE [dbo].[Alquiler]  WITH CHECK ADD  CONSTRAINT [FK_Alquiler_Habitacion] FOREIGN KEY([Habitacionid])
REFERENCES [dbo].[Habitacion] ([Habitacionid])
GO
ALTER TABLE [dbo].[Alquiler] CHECK CONSTRAINT [FK_Alquiler_Habitacion]
GO
ALTER TABLE [dbo].[Alquiler]  WITH CHECK ADD  CONSTRAINT [FK_Alquiler_Hotel] FOREIGN KEY([Hotelid])
REFERENCES [dbo].[Hotel] ([Hotelid])
GO
ALTER TABLE [dbo].[Alquiler] CHECK CONSTRAINT [FK_Alquiler_Hotel]
GO
ALTER TABLE [dbo].[Habitacion]  WITH CHECK ADD  CONSTRAINT [FK_Habitacion_Bloque] FOREIGN KEY([Bloqueid])
REFERENCES [dbo].[Bloque] ([Bloqueid])
GO
ALTER TABLE [dbo].[Habitacion] CHECK CONSTRAINT [FK_Habitacion_Bloque]
GO
USE [master]
GO
ALTER DATABASE [HotelADR] SET  READ_WRITE 
GO
