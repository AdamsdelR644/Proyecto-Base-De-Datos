
/* Nombre: Adams Del Rosario Matricula: 17-EIIT-1-055	Seccion: 0541*/



USE [master]
GO
/****** Object:  Database [Hospital]    Script Date: 13/08/2018 13:35:48 ******/
CREATE DATABASE [Hospital]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hospital', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Hospital.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Hospital_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Hospital_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Hospital] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hospital].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hospital] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hospital] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hospital] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hospital] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hospital] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hospital] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Hospital] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hospital] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hospital] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hospital] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hospital] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hospital] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hospital] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hospital] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hospital] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Hospital] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hospital] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hospital] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hospital] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hospital] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hospital] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hospital] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hospital] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Hospital] SET  MULTI_USER 
GO
ALTER DATABASE [Hospital] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hospital] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hospital] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hospital] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Hospital] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Hospital] SET QUERY_STORE = OFF
GO
USE [Hospital]
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
USE [Hospital]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 13/08/2018 13:35:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[Doctorid] [int] NOT NULL,
	[Nombre] [nchar](50) NULL,
	[Apellido] [nchar](50) NULL,
	[Especialidad] [nchar](50) NULL,
	[Salaid] [int] NULL,
	[Hospitalid] [int] NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[Doctorid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hospital]    Script Date: 13/08/2018 13:35:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hospital](
	[Hospitalid] [int] NOT NULL,
	[Nombre] [nchar](50) NULL,
	[Direccion] [nchar](50) NULL,
	[Telefono] [nchar](13) NULL,
 CONSTRAINT [PK_Hospital] PRIMARY KEY CLUSTERED 
(
	[Hospitalid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pacientes]    Script Date: 13/08/2018 13:35:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pacientes](
	[Pacientesid] [int] NOT NULL,
	[Nombre] [nchar](50) NULL,
	[Apellido] [nchar](50) NULL,
	[Cedula] [nchar](11) NULL,
	[Telefono] [nchar](13) NULL,
	[Hospitalid] [int] NULL,
	[Doctorid] [int] NULL,
	[Salaid] [int] NULL,
 CONSTRAINT [PK_Pacientes] PRIMARY KEY CLUSTERED 
(
	[Pacientesid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sala]    Script Date: 13/08/2018 13:35:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sala](
	[Salaid] [int] NOT NULL,
	[no.camas] [nchar](5) NULL,
	[Nombre] [nchar](50) NULL,
 CONSTRAINT [PK_Cama] PRIMARY KEY CLUSTERED 
(
	[Salaid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Doctor] ([Doctorid], [Nombre], [Apellido], [Especialidad], [Salaid], [Hospitalid]) VALUES (1, N'Leonardo                                          ', N'Cabrera                                           ', N'Ginecologo                                        ', 1, 1)
INSERT [dbo].[Doctor] ([Doctorid], [Nombre], [Apellido], [Especialidad], [Salaid], [Hospitalid]) VALUES (2, N'Amelia                                            ', N'Santos                                            ', N'Dermatologo                                       ', 2, 1)
INSERT [dbo].[Doctor] ([Doctorid], [Nombre], [Apellido], [Especialidad], [Salaid], [Hospitalid]) VALUES (3, N'Adalberto                                         ', N'Rosario                                           ', N'Ortopeda                                          ', 3, 1)
INSERT [dbo].[Doctor] ([Doctorid], [Nombre], [Apellido], [Especialidad], [Salaid], [Hospitalid]) VALUES (4, N'Pedro                                             ', N'Ramirez                                           ', N'Oftalmologo                                       ', 4, 1)
INSERT [dbo].[Doctor] ([Doctorid], [Nombre], [Apellido], [Especialidad], [Salaid], [Hospitalid]) VALUES (5, N'Rodolfo                                           ', N'Rondon                                            ', N'Pediatra                                          ', 5, 1)
INSERT [dbo].[Doctor] ([Doctorid], [Nombre], [Apellido], [Especialidad], [Salaid], [Hospitalid]) VALUES (6, N'Girbert                                           ', N'Caminero                                          ', N'Psicologo                                         ', 6, 1)
INSERT [dbo].[Doctor] ([Doctorid], [Nombre], [Apellido], [Especialidad], [Salaid], [Hospitalid]) VALUES (7, N'Antony                                            ', N'Valdez                                            ', N'Urologo                                           ', 7, 1)
INSERT [dbo].[Doctor] ([Doctorid], [Nombre], [Apellido], [Especialidad], [Salaid], [Hospitalid]) VALUES (8, N'Deisy                                             ', N'Soto                                              ', N'Traumatologo                                      ', 8, 1)
INSERT [dbo].[Doctor] ([Doctorid], [Nombre], [Apellido], [Especialidad], [Salaid], [Hospitalid]) VALUES (9, N'Teo                                               ', N'Calderon                                          ', N'Radiologo                                         ', 9, 1)
INSERT [dbo].[Doctor] ([Doctorid], [Nombre], [Apellido], [Especialidad], [Salaid], [Hospitalid]) VALUES (10, N'Tony                                              ', N'Rodriguez                                         ', N'Psiquiatra                                        ', 10, NULL)
INSERT [dbo].[Hospital] ([Hospitalid], [Nombre], [Direccion], [Telefono]) VALUES (1, N'Casi Te Mueres                                    ', N'Avenida Caonabo sector Renacimiento               ', N'8093341004   ')
INSERT [dbo].[Pacientes] ([Pacientesid], [Nombre], [Apellido], [Cedula], [Telefono], [Hospitalid], [Doctorid], [Salaid]) VALUES (1, N'Adams Alberto                                     ', N'Del Rosario Ramirez                               ', N'40233412341', N'8299668392   ', 1, 1, 1)
INSERT [dbo].[Pacientes] ([Pacientesid], [Nombre], [Apellido], [Cedula], [Telefono], [Hospitalid], [Doctorid], [Salaid]) VALUES (2, N'Samuel                                            ', N'Jackson                                           ', N'40233412342', N'8094567821   ', 1, 2, 2)
INSERT [dbo].[Pacientes] ([Pacientesid], [Nombre], [Apellido], [Cedula], [Telefono], [Hospitalid], [Doctorid], [Salaid]) VALUES (3, N'Jorge                                             ', N'Calderon                                          ', N'40233412343', N'8093456124   ', 1, 2, 2)
INSERT [dbo].[Pacientes] ([Pacientesid], [Nombre], [Apellido], [Cedula], [Telefono], [Hospitalid], [Doctorid], [Salaid]) VALUES (4, N'Steven                                            ', N'Muñoz Batista                                     ', N'40233412344', N'8095673454   ', 1, 2, 2)
INSERT [dbo].[Pacientes] ([Pacientesid], [Nombre], [Apellido], [Cedula], [Telefono], [Hospitalid], [Doctorid], [Salaid]) VALUES (5, N'Tony                                              ', N'Santana                                           ', N'40233412345', N'8291234567   ', 1, 1, 1)
INSERT [dbo].[Pacientes] ([Pacientesid], [Nombre], [Apellido], [Cedula], [Telefono], [Hospitalid], [Doctorid], [Salaid]) VALUES (6, N'Luis                                              ', N'Jimenez                                           ', N'40233412346', N'8294930245   ', 1, 4, 4)
INSERT [dbo].[Pacientes] ([Pacientesid], [Nombre], [Apellido], [Cedula], [Telefono], [Hospitalid], [Doctorid], [Salaid]) VALUES (7, N'Brayner                                           ', N'Encarnacion                                       ', N'40233412347', N'8094563256   ', 1, 3, 3)
INSERT [dbo].[Pacientes] ([Pacientesid], [Nombre], [Apellido], [Cedula], [Telefono], [Hospitalid], [Doctorid], [Salaid]) VALUES (8, N'Camila                                            ', N'Polanco                                           ', N'40233412349', N'8098952345   ', 1, 5, 5)
INSERT [dbo].[Pacientes] ([Pacientesid], [Nombre], [Apellido], [Cedula], [Telefono], [Hospitalid], [Doctorid], [Salaid]) VALUES (9, N'Cesar                                             ', N'Encarnacion                                       ', N'40233412348', N'8092412356   ', 1, 6, 6)
INSERT [dbo].[Pacientes] ([Pacientesid], [Nombre], [Apellido], [Cedula], [Telefono], [Hospitalid], [Doctorid], [Salaid]) VALUES (10, N'Juan Carlos                                       ', NULL, N'40233412340', N'8493412566   ', 1, 7, 7)
INSERT [dbo].[Sala] ([Salaid], [no.camas], [Nombre]) VALUES (1, N'5    ', N'Ginecologia                                       ')
INSERT [dbo].[Sala] ([Salaid], [no.camas], [Nombre]) VALUES (2, N'10   ', N'Dermatologia                                      ')
INSERT [dbo].[Sala] ([Salaid], [no.camas], [Nombre]) VALUES (3, N'10   ', N'Ortopedia                                         ')
INSERT [dbo].[Sala] ([Salaid], [no.camas], [Nombre]) VALUES (4, N'10   ', N'Oftalmologia                                      ')
INSERT [dbo].[Sala] ([Salaid], [no.camas], [Nombre]) VALUES (5, N'15   ', N'Pediatria                                         ')
INSERT [dbo].[Sala] ([Salaid], [no.camas], [Nombre]) VALUES (6, N'10   ', N'Psicologia                                        ')
INSERT [dbo].[Sala] ([Salaid], [no.camas], [Nombre]) VALUES (7, N'5    ', N'Urologia                                          ')
INSERT [dbo].[Sala] ([Salaid], [no.camas], [Nombre]) VALUES (8, N'5    ', N'Traumatologia                                     ')
INSERT [dbo].[Sala] ([Salaid], [no.camas], [Nombre]) VALUES (9, N'15   ', N'Radiologia                                        ')
INSERT [dbo].[Sala] ([Salaid], [no.camas], [Nombre]) VALUES (10, N'10   ', NULL)
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Doctor_Hospital] FOREIGN KEY([Hospitalid])
REFERENCES [dbo].[Hospital] ([Hospitalid])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FK_Doctor_Hospital]
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Doctor_Sala] FOREIGN KEY([Salaid])
REFERENCES [dbo].[Sala] ([Salaid])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FK_Doctor_Sala]
GO
ALTER TABLE [dbo].[Pacientes]  WITH CHECK ADD  CONSTRAINT [FK_Pacientes_Doctor] FOREIGN KEY([Doctorid])
REFERENCES [dbo].[Doctor] ([Doctorid])
GO
ALTER TABLE [dbo].[Pacientes] CHECK CONSTRAINT [FK_Pacientes_Doctor]
GO
ALTER TABLE [dbo].[Pacientes]  WITH CHECK ADD  CONSTRAINT [FK_Pacientes_Hospital] FOREIGN KEY([Hospitalid])
REFERENCES [dbo].[Hospital] ([Hospitalid])
GO
ALTER TABLE [dbo].[Pacientes] CHECK CONSTRAINT [FK_Pacientes_Hospital]
GO
ALTER TABLE [dbo].[Pacientes]  WITH CHECK ADD  CONSTRAINT [FK_Pacientes_Sala] FOREIGN KEY([Salaid])
REFERENCES [dbo].[Sala] ([Salaid])
GO
ALTER TABLE [dbo].[Pacientes] CHECK CONSTRAINT [FK_Pacientes_Sala]
GO
USE [master]
GO
ALTER DATABASE [Hospital] SET  READ_WRITE 
GO
