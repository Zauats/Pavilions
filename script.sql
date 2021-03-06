USE [master]
GO
/****** Object:  Database [Pavilions]    Script Date: 25.06.2020 19:33:31 ******/
CREATE DATABASE [Pavilions]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Pavilions', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Pavilions.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Pavilions_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Pavilions_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Pavilions] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Pavilions].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Pavilions] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Pavilions] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Pavilions] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Pavilions] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Pavilions] SET ARITHABORT OFF 
GO
ALTER DATABASE [Pavilions] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Pavilions] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Pavilions] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Pavilions] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Pavilions] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Pavilions] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Pavilions] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Pavilions] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Pavilions] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Pavilions] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Pavilions] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Pavilions] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Pavilions] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Pavilions] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Pavilions] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Pavilions] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Pavilions] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Pavilions] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Pavilions] SET  MULTI_USER 
GO
ALTER DATABASE [Pavilions] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Pavilions] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Pavilions] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Pavilions] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Pavilions] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Pavilions] SET QUERY_STORE = OFF
GO
USE [Pavilions]
GO
/****** Object:  Table [dbo].[Pavilions]    Script Date: 25.06.2020 19:33:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pavilions](
	[centerName] [nvarchar](100) NOT NULL,
	[pavilionNum] [nvarchar](30) NOT NULL,
	[floor] [float] NOT NULL,
	[state] [nvarchar](30) NOT NULL,
	[square] [float] NULL,
	[meterPrice] [float] NULL,
	[priceCoefficient] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rent]    Script Date: 25.06.2020 19:33:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rent](
	[rentID] [int] NOT NULL,
	[tenantID] [int] NOT NULL,
	[centerName] [nvarchar](100) NOT NULL,
	[staffId] [int] NOT NULL,
	[pavilionNum] [nvarchar](30) NOT NULL,
	[state] [nvarchar](50) NOT NULL,
	[rentStart] [date] NOT NULL,
	[rentEnd] [date] NOT NULL,
 CONSTRAINT [PK_Rent] PRIMARY KEY CLUSTERED 
(
	[rentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCenter]    Script Date: 25.06.2020 19:33:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCenter](
	[centerName] [nvarchar](100) NOT NULL,
	[state] [nvarchar](255) NOT NULL,
	[pavilionsQuantity] [float] NOT NULL,
	[city] [nvarchar](255) NOT NULL,
	[price] [float] NOT NULL,
	[priceCoefficient] [float] NULL,
	[floors] [float] NOT NULL,
	[image] [image] NULL,
 CONSTRAINT [PK_ShoppingCenter] PRIMARY KEY CLUSTERED 
(
	[centerName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 25.06.2020 19:33:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[name] [nvarchar](255) NOT NULL,
	[login] [nvarchar](255) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[role] [nvarchar](255) NOT NULL,
	[phone] [nvarchar](255) NOT NULL,
	[sex] [nvarchar](255) NOT NULL,
	[id] [int] NOT NULL,
	[avatar] [nvarchar](255) NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[login] ASC,
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tenant]    Script Date: 25.06.2020 19:33:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tenant](
	[tenantId] [int] NOT NULL,
	[rentId] [int] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[number] [nvarchar](30) NOT NULL,
	[address] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Tenant] PRIMARY KEY CLUSTERED 
(
	[tenantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Pavilions] ([centerName], [pavilionNum], [floor], [state], [square], [meterPrice], [priceCoefficient]) VALUES (N'Мега Белая Дача', N'88А', 1, N'Свободен', 75, 3307.7, 0.1)
INSERT [dbo].[Pavilions] ([centerName], [pavilionNum], [floor], [state], [square], [meterPrice], [priceCoefficient]) VALUES (N'Авиапарк', N'40А', 3, N'Забронировано', 96, 690, 1.1)
INSERT [dbo].[Pavilions] ([centerName], [pavilionNum], [floor], [state], [square], [meterPrice], [priceCoefficient]) VALUES (N'Мега Белая Дача', N'76Б', 2, N'Удален', 199, 4938, 0.9)
INSERT [dbo].[Pavilions] ([centerName], [pavilionNum], [floor], [state], [square], [meterPrice], [priceCoefficient]) VALUES (N'Рио', N'61А', 1, N'Арендован', 186, 2115, 0.9)
INSERT [dbo].[Pavilions] ([centerName], [pavilionNum], [floor], [state], [square], [meterPrice], [priceCoefficient]) VALUES (N'Гранд', N'58В', 4, N'Арендован', 98, 1306, 1.9)
INSERT [dbo].[Pavilions] ([centerName], [pavilionNum], [floor], [state], [square], [meterPrice], [priceCoefficient]) VALUES (N'Лужайка', N'7А', 2, N'Забронировано', 187, 2046, 1)
INSERT [dbo].[Pavilions] ([centerName], [pavilionNum], [floor], [state], [square], [meterPrice], [priceCoefficient]) VALUES (N'Кунцево Плаза', N'13Б', 1, N'Забронировано', 141, 1131, 0.1)
INSERT [dbo].[Pavilions] ([centerName], [pavilionNum], [floor], [state], [square], [meterPrice], [priceCoefficient]) VALUES (N'Мозаика', N'60В', 2, N'Забронировано', 94, 361, 0.3)
INSERT [dbo].[Pavilions] ([centerName], [pavilionNum], [floor], [state], [square], [meterPrice], [priceCoefficient]) VALUES (N'Гранд', N'56А', 1, N'Арендован', 148, 1163, 0.6)
INSERT [dbo].[Pavilions] ([centerName], [pavilionNum], [floor], [state], [square], [meterPrice], [priceCoefficient]) VALUES (N'Гранд', N'63Г', 2, N'Забронировано', 153, 3486, 0.7)
INSERT [dbo].[Pavilions] ([centerName], [pavilionNum], [floor], [state], [square], [meterPrice], [priceCoefficient]) VALUES (N'Бутово Молл', N'8Г', 1, N'Арендован', 122, 2451, 1.5)
INSERT [dbo].[Pavilions] ([centerName], [pavilionNum], [floor], [state], [square], [meterPrice], [priceCoefficient]) VALUES (N'Гранд', N'94В', 3, N'Свободен', 132, 4825, 2)
INSERT [dbo].[Pavilions] ([centerName], [pavilionNum], [floor], [state], [square], [meterPrice], [priceCoefficient]) VALUES (N'Шоколад', N'87Г', 1, N'Забронировано', 174, 793, 1.5)
INSERT [dbo].[Pavilions] ([centerName], [pavilionNum], [floor], [state], [square], [meterPrice], [priceCoefficient]) VALUES (N'АфиМолл Сити', N'93В', 1, N'Арендован', 165, 4937, 0.8)
INSERT [dbo].[Pavilions] ([centerName], [pavilionNum], [floor], [state], [square], [meterPrice], [priceCoefficient]) VALUES (N'Европейский', N'10А', 3, N'Забронировано', 168, 1353, 1.7)
INSERT [dbo].[Pavilions] ([centerName], [pavilionNum], [floor], [state], [square], [meterPrice], [priceCoefficient]) VALUES (N'Шереметьевский', N'53Г', 1, N'Арендован', 99, 3924, 1)
INSERT [dbo].[Pavilions] ([centerName], [pavilionNum], [floor], [state], [square], [meterPrice], [priceCoefficient]) VALUES (N'Шереметьевский', N'73В', 2, N'Свободен', 116, 3418, 0)
INSERT [dbo].[Pavilions] ([centerName], [pavilionNum], [floor], [state], [square], [meterPrice], [priceCoefficient]) VALUES (N'Мега Химки', N'89Б', 1, N'Свободен', 92, 562, 0.4)
INSERT [dbo].[Pavilions] ([centerName], [pavilionNum], [floor], [state], [square], [meterPrice], [priceCoefficient]) VALUES (N'Москва', N'44Г', 2, N'Забронирован', 66.6, NULL, 1)
INSERT [dbo].[Pavilions] ([centerName], [pavilionNum], [floor], [state], [square], [meterPrice], [priceCoefficient]) VALUES (N'Вегас Кунцево', N'65А', 2, N'Забронирован', 95, 1381, 1.7)
INSERT [dbo].[Pavilions] ([centerName], [pavilionNum], [floor], [state], [square], [meterPrice], [priceCoefficient]) VALUES (N'Город Лефортово', N'16Г', 2, N'Удален', 150, 747, 0.8)
INSERT [dbo].[Pavilions] ([centerName], [pavilionNum], [floor], [state], [square], [meterPrice], [priceCoefficient]) VALUES (N'Золотой Вавилон Ростокино', N'61Б', 1, N'Свободен', 58, 1032, 1.7)
INSERT [dbo].[Pavilions] ([centerName], [pavilionNum], [floor], [state], [square], [meterPrice], [priceCoefficient]) VALUES (N'Шереметьевский', N'34Б', 4, N'Забронировано', 102, 4715, 0.3)
INSERT [dbo].[Pavilions] ([centerName], [pavilionNum], [floor], [state], [square], [meterPrice], [priceCoefficient]) VALUES (N'Шереметьевский', N'91Г', 3, N'Арендован', 171, 1021, 1.2)
INSERT [dbo].[Pavilions] ([centerName], [pavilionNum], [floor], [state], [square], [meterPrice], [priceCoefficient]) VALUES (N'Ашан Сити Капитолий', N'70Г', 1, N'Забронировано', 83, 2246, 1.4)
INSERT [dbo].[Pavilions] ([centerName], [pavilionNum], [floor], [state], [square], [meterPrice], [priceCoefficient]) VALUES (N'Черемушки', N'10А', 1, N'Забронирован', 187, 2067, 0)
INSERT [dbo].[Pavilions] ([centerName], [pavilionNum], [floor], [state], [square], [meterPrice], [priceCoefficient]) VALUES (N'Филион', N'80Г', 1, N'Забронировано', 117, 1049, 1.3)
INSERT [dbo].[Pavilions] ([centerName], [pavilionNum], [floor], [state], [square], [meterPrice], [priceCoefficient]) VALUES (N'Весна', N'2Б', 1, N'Удален', 176, 1673, 1.7)
INSERT [dbo].[Pavilions] ([centerName], [pavilionNum], [floor], [state], [square], [meterPrice], [priceCoefficient]) VALUES (N'Гудзон', N'41А', 1, N'Свободен', 108, 344, 0)
INSERT [dbo].[Pavilions] ([centerName], [pavilionNum], [floor], [state], [square], [meterPrice], [priceCoefficient]) VALUES (N'Калейдоскоп', N'16Г', 2, N'Арендован', 125, 1037, 1.3)
INSERT [dbo].[Pavilions] ([centerName], [pavilionNum], [floor], [state], [square], [meterPrice], [priceCoefficient]) VALUES (N'Золотой Вавилон Ростокино', N'13Б', 2, N'Свободен', NULL, NULL, 0.4)
INSERT [dbo].[Pavilions] ([centerName], [pavilionNum], [floor], [state], [square], [meterPrice], [priceCoefficient]) VALUES (N'Хорошо', N'83Г', 2, N'Арендован', NULL, 4584, 0.3)
INSERT [dbo].[Pavilions] ([centerName], [pavilionNum], [floor], [state], [square], [meterPrice], [priceCoefficient]) VALUES (N'Щука', N'9Г', 1, N'Забронировано', 131, 2477, 1.5)
INSERT [dbo].[Pavilions] ([centerName], [pavilionNum], [floor], [state], [square], [meterPrice], [priceCoefficient]) VALUES (N'Атриум', N'49Г', 1, N'Арендован', 164, 2728, 0.9)
INSERT [dbo].[Pavilions] ([centerName], [pavilionNum], [floor], [state], [square], [meterPrice], [priceCoefficient]) VALUES (N'Принц Плаза', N'1Г', 1, N'Удален', 157, 1963, 1.6)
INSERT [dbo].[Pavilions] ([centerName], [pavilionNum], [floor], [state], [square], [meterPrice], [priceCoefficient]) VALUES (N'Золотой Вавилон Ростокино', N'37A', 3, N'Арендован', 187, 3173, 0.3)
INSERT [dbo].[Rent] ([rentID], [tenantID], [centerName], [staffId], [pavilionNum], [state], [rentStart], [rentEnd]) VALUES (1, 2, N'Мега Белая Дача', 2, N'88А', N'Открыт', CAST(N'2019-01-24' AS Date), CAST(N'2020-11-17' AS Date))
INSERT [dbo].[Rent] ([rentID], [tenantID], [centerName], [staffId], [pavilionNum], [state], [rentStart], [rentEnd]) VALUES (2, 2, N'Авиапарк', 7, N'40А', N'Ожидание', CAST(N'2019-11-21' AS Date), CAST(N'2020-04-18' AS Date))
INSERT [dbo].[Rent] ([rentID], [tenantID], [centerName], [staffId], [pavilionNum], [state], [rentStart], [rentEnd]) VALUES (3, 5, N'Рио', 11, N'61А', N'Закрыт', CAST(N'2018-11-12' AS Date), CAST(N'2019-06-28' AS Date))
INSERT [dbo].[Rent] ([rentID], [tenantID], [centerName], [staffId], [pavilionNum], [state], [rentStart], [rentEnd]) VALUES (4, 1, N'Гранд', 2, N'58В', N'Закрыт', CAST(N'2018-10-18' AS Date), CAST(N'2019-09-16' AS Date))
INSERT [dbo].[Rent] ([rentID], [tenantID], [centerName], [staffId], [pavilionNum], [state], [rentStart], [rentEnd]) VALUES (5, 5, N'Лужайка', 7, N'7А', N'Ожидание', CAST(N'2019-12-19' AS Date), CAST(N'2020-06-26' AS Date))
INSERT [dbo].[Rent] ([rentID], [tenantID], [centerName], [staffId], [pavilionNum], [state], [rentStart], [rentEnd]) VALUES (6, 2, N'Кунцево Плаза', 11, N'13Б', N'Ожидание', CAST(N'2019-12-16' AS Date), CAST(N'2020-05-12' AS Date))
INSERT [dbo].[Rent] ([rentID], [tenantID], [centerName], [staffId], [pavilionNum], [state], [rentStart], [rentEnd]) VALUES (7, 4, N'Мозаика', 2, N'60В', N'Ожидание', CAST(N'2019-12-06' AS Date), CAST(N'2020-10-16' AS Date))
INSERT [dbo].[Rent] ([rentID], [tenantID], [centerName], [staffId], [pavilionNum], [state], [rentStart], [rentEnd]) VALUES (8, 2, N'Гранд', 11, N'56А', N'Закрыт', CAST(N'2018-09-03' AS Date), CAST(N'2019-02-10' AS Date))
INSERT [dbo].[Rent] ([rentID], [tenantID], [centerName], [staffId], [pavilionNum], [state], [rentStart], [rentEnd]) VALUES (9, 2, N'Гранд', 2, N'63Г', N'Ожидание', CAST(N'2019-11-04' AS Date), CAST(N'2020-06-27' AS Date))
INSERT [dbo].[Rent] ([rentID], [tenantID], [centerName], [staffId], [pavilionNum], [state], [rentStart], [rentEnd]) VALUES (10, 4, N'Бутово Молл', 7, N'8Г', N'Закрыт', CAST(N'2018-11-08' AS Date), CAST(N'2019-01-16' AS Date))
INSERT [dbo].[Rent] ([rentID], [tenantID], [centerName], [staffId], [pavilionNum], [state], [rentStart], [rentEnd]) VALUES (11, 1, N'Гранд', 2, N'94В', N'Открыт', CAST(N'2019-06-07' AS Date), CAST(N'2020-03-18' AS Date))
INSERT [dbo].[Rent] ([rentID], [tenantID], [centerName], [staffId], [pavilionNum], [state], [rentStart], [rentEnd]) VALUES (12, 1, N'Шоколад', 2, N'87Г', N'Ожидание', CAST(N'2019-11-15' AS Date), CAST(N'2020-06-20' AS Date))
INSERT [dbo].[Rent] ([rentID], [tenantID], [centerName], [staffId], [pavilionNum], [state], [rentStart], [rentEnd]) VALUES (13, 5, N'АфиМолл Сити', 11, N'93В', N'Закрыт', CAST(N'2018-10-09' AS Date), CAST(N'2019-09-22' AS Date))
INSERT [dbo].[Rent] ([rentID], [tenantID], [centerName], [staffId], [pavilionNum], [state], [rentStart], [rentEnd]) VALUES (14, 5, N'Европейский', 7, N'10А', N'Ожидание', CAST(N'2019-11-24' AS Date), CAST(N'2020-07-17' AS Date))
INSERT [dbo].[Rent] ([rentID], [tenantID], [centerName], [staffId], [pavilionNum], [state], [rentStart], [rentEnd]) VALUES (15, 1, N'Шереметьевский', 7, N'53Г', N'Закрыт', CAST(N'2018-07-20' AS Date), CAST(N'2019-06-07' AS Date))
INSERT [dbo].[Rent] ([rentID], [tenantID], [centerName], [staffId], [pavilionNum], [state], [rentStart], [rentEnd]) VALUES (16, 3, N'Шереметьевский', 11, N'73В', N'Открыт', CAST(N'2019-02-04' AS Date), CAST(N'2019-03-05' AS Date))
INSERT [dbo].[Rent] ([rentID], [tenantID], [centerName], [staffId], [pavilionNum], [state], [rentStart], [rentEnd]) VALUES (17, 2, N'Мега Химки', 2, N'89Б', N'Открыт', CAST(N'2019-08-06' AS Date), CAST(N'2020-08-20' AS Date))
INSERT [dbo].[Rent] ([rentID], [tenantID], [centerName], [staffId], [pavilionNum], [state], [rentStart], [rentEnd]) VALUES (18, 1, N'Золотой Вавилон Ростокино', 7, N'61Б', N'Открыт', CAST(N'2019-05-23' AS Date), CAST(N'2020-05-13' AS Date))
INSERT [dbo].[Rent] ([rentID], [tenantID], [centerName], [staffId], [pavilionNum], [state], [rentStart], [rentEnd]) VALUES (19, 3, N'Шереметьевский', 2, N'34Б', N'Ожидание', CAST(N'2019-12-16' AS Date), CAST(N'2020-03-16' AS Date))
INSERT [dbo].[Rent] ([rentID], [tenantID], [centerName], [staffId], [pavilionNum], [state], [rentStart], [rentEnd]) VALUES (20, 3, N'Шереметьевский', 11, N'91Г', N'Закрыт', CAST(N'2018-08-24' AS Date), CAST(N'2019-08-04' AS Date))
INSERT [dbo].[Rent] ([rentID], [tenantID], [centerName], [staffId], [pavilionNum], [state], [rentStart], [rentEnd]) VALUES (21, 5, N'Ашан Сити Капитолий', 2, N'70Г', N'Ожидание', CAST(N'2019-11-09' AS Date), CAST(N'2020-08-17' AS Date))
INSERT [dbo].[Rent] ([rentID], [tenantID], [centerName], [staffId], [pavilionNum], [state], [rentStart], [rentEnd]) VALUES (22, 4, N'Европейский', 7, N'10А', N'Ожидание', CAST(N'2019-12-02' AS Date), CAST(N'2020-07-24' AS Date))
INSERT [dbo].[Rent] ([rentID], [tenantID], [centerName], [staffId], [pavilionNum], [state], [rentStart], [rentEnd]) VALUES (23, 2, N'Филион', 11, N'80Г', N'Ожидание', CAST(N'2019-11-23' AS Date), CAST(N'2020-08-06' AS Date))
INSERT [dbo].[Rent] ([rentID], [tenantID], [centerName], [staffId], [pavilionNum], [state], [rentStart], [rentEnd]) VALUES (24, 4, N'Гудзон', 7, N'41А', N'Открыт', CAST(N'2019-05-02' AS Date), CAST(N'2020-06-24' AS Date))
INSERT [dbo].[Rent] ([rentID], [tenantID], [centerName], [staffId], [pavilionNum], [state], [rentStart], [rentEnd]) VALUES (25, 3, N'Кунцево Плаза', 2, N'13Б', N'Ожидание', CAST(N'2019-12-08' AS Date), CAST(N'2020-08-17' AS Date))
INSERT [dbo].[Rent] ([rentID], [tenantID], [centerName], [staffId], [pavilionNum], [state], [rentStart], [rentEnd]) VALUES (26, 3, N'Хорошо', 7, N'83Г', N'Закрыт', CAST(N'2018-11-14' AS Date), CAST(N'2019-04-19' AS Date))
INSERT [dbo].[Rent] ([rentID], [tenantID], [centerName], [staffId], [pavilionNum], [state], [rentStart], [rentEnd]) VALUES (28, 1, N'Атриум', 2, N'49Г', N'Закрыт', CAST(N'2018-09-16' AS Date), CAST(N'2019-02-12' AS Date))
INSERT [dbo].[Rent] ([rentID], [tenantID], [centerName], [staffId], [pavilionNum], [state], [rentStart], [rentEnd]) VALUES (29, 3, N'Золотой Вавилон Ростокино', 2, N'37А', N'Закрыт', CAST(N'2018-10-18' AS Date), CAST(N'2019-06-22' AS Date))
INSERT [dbo].[Rent] ([rentID], [tenantID], [centerName], [staffId], [pavilionNum], [state], [rentStart], [rentEnd]) VALUES (30, 4, N'Золотой Вавилон Ростокино', 2, N'38Г', N'Закрыт', CAST(N'2018-06-23' AS Date), CAST(N'2019-08-26' AS Date))
INSERT [dbo].[Rent] ([rentID], [tenantID], [centerName], [staffId], [pavilionNum], [state], [rentStart], [rentEnd]) VALUES (31, 3, N'Реутов', 11, N'27В', N'Ожидание', CAST(N'2019-12-18' AS Date), CAST(N'2020-05-23' AS Date))
INSERT [dbo].[Rent] ([rentID], [tenantID], [centerName], [staffId], [pavilionNum], [state], [rentStart], [rentEnd]) VALUES (32, 5, N'ГУМ', 7, N'86Г', N'Открыт', CAST(N'2019-04-01' AS Date), CAST(N'2020-12-19' AS Date))
INSERT [dbo].[Rent] ([rentID], [tenantID], [centerName], [staffId], [pavilionNum], [state], [rentStart], [rentEnd]) VALUES (33, 4, N'Райкин Плаза', 11, N'98А', N'Ожидание', CAST(N'2019-11-22' AS Date), CAST(N'2020-08-15' AS Date))
INSERT [dbo].[Rent] ([rentID], [tenantID], [centerName], [staffId], [pavilionNum], [state], [rentStart], [rentEnd]) VALUES (34, 3, N'Новинский пассаж', 11, N'11Г', N'Закрыт', CAST(N'2018-10-08' AS Date), CAST(N'2019-07-21' AS Date))
INSERT [dbo].[Rent] ([rentID], [tenantID], [centerName], [staffId], [pavilionNum], [state], [rentStart], [rentEnd]) VALUES (35, 2, N'Фестиваль', 2, N'42В', N'Открыт', CAST(N'2019-04-07' AS Date), CAST(N'2020-03-05' AS Date))
INSERT [dbo].[Rent] ([rentID], [tenantID], [centerName], [staffId], [pavilionNum], [state], [rentStart], [rentEnd]) VALUES (36, 1, N'Красный Кит', 7, N'55А', N'Ожидание', CAST(N'2019-11-07' AS Date), CAST(N'2020-03-08' AS Date))
INSERT [dbo].[Rent] ([rentID], [tenantID], [centerName], [staffId], [pavilionNum], [state], [rentStart], [rentEnd]) VALUES (37, 3, N'Фестиваль', 2, N'6Б', N'Открыт', CAST(N'2019-07-15' AS Date), CAST(N'2020-04-25' AS Date))
INSERT [dbo].[Rent] ([rentID], [tenantID], [centerName], [staffId], [pavilionNum], [state], [rentStart], [rentEnd]) VALUES (38, 1, N'Отрада', 2, N'15А', N'Ожидание', CAST(N'2019-01-05' AS Date), CAST(N'2020-12-02' AS Date))
INSERT [dbo].[Rent] ([rentID], [tenantID], [centerName], [staffId], [pavilionNum], [state], [rentStart], [rentEnd]) VALUES (39, 4, N'Фестиваль', 11, N'27Б', N'Закрыт', CAST(N'2018-08-05' AS Date), CAST(N'2019-06-14' AS Date))
INSERT [dbo].[Rent] ([rentID], [tenantID], [centerName], [staffId], [pavilionNum], [state], [rentStart], [rentEnd]) VALUES (40, 2, N'Времена Года', 11, N'26А', N'Открыт', CAST(N'2019-08-19' AS Date), CAST(N'2020-09-02' AS Date))
INSERT [dbo].[Rent] ([rentID], [tenantID], [centerName], [staffId], [pavilionNum], [state], [rentStart], [rentEnd]) VALUES (41, 4, N'Времена Года', 7, N'53В', N'Закрыт', CAST(N'2018-09-20' AS Date), CAST(N'2019-02-12' AS Date))
INSERT [dbo].[ShoppingCenter] ([centerName], [state], [pavilionsQuantity], [city], [price], [priceCoefficient], [floors], [image]) VALUES (N'Авиапарк', N'Строительство', 9, N'Санкт-Петербург', 3297976, 0.1, 3, NULL)
INSERT [dbo].[ShoppingCenter] ([centerName], [state], [pavilionsQuantity], [city], [price], [priceCoefficient], [floors], [image]) VALUES (N'Армада', N'План', 0, N'Ростов-на-Дону ', 9172489, 0.9, 1, NULL)
INSERT [dbo].[ShoppingCenter] ([centerName], [state], [pavilionsQuantity], [city], [price], [priceCoefficient], [floors], [image]) VALUES (N'Атриум', N'Реализация', 4, N'Казань', 5059779, 0.2, 1, NULL)
INSERT [dbo].[ShoppingCenter] ([centerName], [state], [pavilionsQuantity], [city], [price], [priceCoefficient], [floors], [image]) VALUES (N'АфиМолл Сити', N'Реализация', 9, N'Санкт-Петербург', 8729160, 0.9, 3, NULL)
INSERT [dbo].[ShoppingCenter] ([centerName], [state], [pavilionsQuantity], [city], [price], [priceCoefficient], [floors], [image]) VALUES (N'Ашан Сити Капитолий', N'Строительство', 4, N'Екатеринбург', 5309117, 1.9, 1, NULL)
INSERT [dbo].[ShoppingCenter] ([centerName], [state], [pavilionsQuantity], [city], [price], [priceCoefficient], [floors], [image]) VALUES (N'Бутово Молл', N'План', 0, N'Москва', 5327641, 1.7, 1, NULL)
INSERT [dbo].[ShoppingCenter] ([centerName], [state], [pavilionsQuantity], [city], [price], [priceCoefficient], [floors], [image]) VALUES (N'Вегас', N'План', 0, N'Нижний Новгород', 7567411, NULL, 3, NULL)
INSERT [dbo].[ShoppingCenter] ([centerName], [state], [pavilionsQuantity], [city], [price], [priceCoefficient], [floors], [image]) VALUES (N'Вегас Кунцево', N'Реализация', 12, N'Москва', 3878254, 0.2, 4, NULL)
INSERT [dbo].[ShoppingCenter] ([centerName], [state], [pavilionsQuantity], [city], [price], [priceCoefficient], [floors], [image]) VALUES (N'Весна', N'Удален', 3, N'Нижний Новгород', 4687701, 0.8, 1, NULL)
INSERT [dbo].[ShoppingCenter] ([centerName], [state], [pavilionsQuantity], [city], [price], [priceCoefficient], [floors], [image]) VALUES (N'Город Лефортово', N'Удален', 12, N'Новосибирск', 1966214, 1.7, 4, NULL)
INSERT [dbo].[ShoppingCenter] ([centerName], [state], [pavilionsQuantity], [city], [price], [priceCoefficient], [floors], [image]) VALUES (N'Гранд', N'Строительство', 20, N'Ростов-на-Дону ', 2573981, 0.1, 4, NULL)
INSERT [dbo].[ShoppingCenter] ([centerName], [state], [pavilionsQuantity], [city], [price], [priceCoefficient], [floors], [image]) VALUES (N'Гудзон', N'Реализация', 3, N'Екатеринбург', 7414468, 0.1, 1, 0x4749463839614006B0048700000000000000330000660000990000CC0000FF002B00002B33002B66002B99002BCC002BFF0055000055330055660055990055CC0055FF0080000080330080660080990080CC0080FF00AA0000AA3300AA6600AA9900AACC00AAFF00D50000D53300D56600D59900D5CC00D5FF00FF0000FF3300FF6600FF9900FFCC00FFFF3300003300333300663300993300CC3300FF332B00332B33332B66332B99332BCC332BFF3355003355333355663355993355CC3355FF3380003380333380663380993380CC3380FF33AA0033AA3333AA6633AA9933AACC33AAFF33D50033D53333D56633D59933D5CC33D5FF33FF0033FF3333FF6633FF9933FFCC33FFFF6600006600336600666600996600CC6600FF662B00662B33662B66662B99662BCC662BFF6655006655336655666655996655CC6655FF6680006680336680666680996680CC6680FF66AA0066AA3366AA6666AA9966AACC66AAFF66D50066D53366D56666D59966D5CC66D5FF66FF0066FF3366FF6666FF9966FFCC66FFFF9900009900339900669900999900CC9900FF992B00992B33992B66992B99992BCC992BFF9955009955339955669955999955CC9955FF9980009980339980669980999980CC9980FF99AA0099AA3399AA6699AA9999AACC99AAFF99D50099D53399D56699D59999D5CC99D5FF99FF0099FF3399FF6699FF9999FFCC99FFFFCC0000CC0033CC0066CC0099CC00CCCC00FFCC2B00CC2B33CC2B66CC2B99CC2BCCCC2BFFCC5500CC5533CC5566CC5599CC55CCCC55FFCC8000CC8033CC8066CC8099CC80CCCC80FFCCAA00CCAA33CCAA66CCAA99CCAACCCCAAFFCCD500CCD533CCD566CCD599CCD5CCCCD5FFCCFF00CCFF33CCFF66CCFF99CCFFCCCCFFFFFF0000FF0033FF0066FF0099FF00CCFF00FFFF2B00FF2B33FF2B66FF2B99FF2BCCFF2BFFFF5500FF5533FF5566FF5599FF55CCFF55FFFF8000FF8033FF8066FF8099FF80CCFF80FFFFAA00FFAA33FFAA66FFAA99FFAACCFFAAFFFFD500FFD533FFD566FFD599FFD5CCFFD5FFFFFF00FFFF33FFFF66FFFF99FFFFCCFFFFFF00000000000000000000000021FF0B4E45545343415045322E30030101000021F904010000FC002C000000004006B004000821F904010000FC002C000000004006B0040008A80001081C48B0A0C18308132A5CC8B0A1C38710234A9C48B1A2C58B18336ADCC8B1A3C78F20438A1C49B2A4C9932853AA5CC9B2A5CB973063CA9C49B3A6CD9B3873EADCC9B3A7CF9F40830A1D4AB4A8D1A348932A5DCAB4A9D3A750A34A9D4AB5AAD5AB58B36ADDCAB5ABD7AF60C38A1D4BB6ACD9B368D3AA5DCBB6ADDBB770E3CA9D4BB7AEDDBB78F3EADDCBB7AFDFBF80030B1E4CB8B0E1C388132B5ECCB8B1E3C790234B9E4CB946B2E5CB98336BDECCB9B3E7CFA0438B1E4DBAB4E9D3A853AB5ECDBAB5EBD7B063CB9E4DBBB6EDDBB873EBDECDBBB7EFDFC0830B1F4EBCB8F1E3C8932B5FCEBCB9F3E7D0A34B9F354EBDBAF5EBD8B36BDFCEBDBBF7EFE0C38B1F4FBEBCF9F3E8D3AB5FCFBEBDFBF7F0E3CB9F4FBFBEFDFBF8F3EBDFCFBFBFFFFF00062832E080041668E0810826A8E0820C36E8E083104628E184145668E1851866A8E1861C76E8E187208628E288249668E28928A6A82DE28A2CB6E8E28B30C628E38C34D668E38D38E6A8E38E3CF6E8E38F400629E490441669E4914826A9E4924C36E928E493504629E594545669E5955866A9E5965C76E9E597608629E698649669E69968A6A9E69A6CB6E925E69B70C629E79C74D669E79D78E6A9E79E7CF6E9E79F80062AE8A084166AE8A18826AAE8A2218C36EAE8A390462AE9A494566AE9A59866AAE9A69C76EAE9A7A0862AEAA8A4966A21EAA9A8A6AAEAAAACB6EAEAABB0C62AEBACB4D66AEBADB8E6AAEBAEBCF6EAEBAFC01E062BECB0C4166BECB1C826ABECB2CC36EBECB3D0462BEDB4D4566BEDB5D81D66ABEDB6DC76EBEDB7E0862BEEB8E4966BEEB9E8A6ABEEBAECB6EBEEBB1BF0C62BEFBCF4D66BEFBDF8E6ABEFBEFCF6EBEFBF00072CF0C004171C6CF0C10827ACF0C20C37ECF0C310472CF1C414576CF1C51867ACF1C6191C77ECF1C720872CF2C824976CF2C928A7ACF2CA2CB7ECF2CB1930C72CF3CC34D76CF3CD38E7ACF3CE3CF7ECF3CF40072DF4D01744176DF4D14827ADF4D24C37EDF4D350472DF5D454576D17F5D55867ADF5D65C77EDF5D760872DF6D864976DF6D96816A7ADF6DA6CB7EDF6DB70C72DF7DC74D76DF7DD78E7AD16F7DE7CF7EDF7DF80072EF8E084176EF8E18827AEF8E2158C37EEF8E390472EF9E494576EF9E59867AEF9E69C1577EEF9E7A0872EFAE8A4976EFAE9A8A7AEFAEAACB714EEFAEBB0C72EFBECB4D76EFBEDB8E7AEFBEEBCF714EEFBEFC0072FFCF0C4176FFCF1C827AFFCF2CC3713EFFCF3D0472FFDF4D4576FFDF5D867AFFDF6DC1377EFFDF7E0872FFEF8E4976FFEF9E8A7AFFEFA12ECB7EFFEFBF0C72FFFFCF4D76FFFFDF8E7AF14FFFEFCF7EFFFFF000CA0000748C0021AF080084C14A00217C8C0063AF081108CA0042748C10A5AF0821318CCA00637C8C10E7AF083200CA1084748C212139AF084284CA10A57C8C216BAF085308CA10C671248C31ADAF08638CCA10E77C8C31EFAF08740130CA2108748C4221AF188484CA21297C8C4263A12F189508CA214A748C52A5AF18A58CCA216B712C8C52E7AF18B600CA318C748C6329AF18C68104CA31AD7C8C636BAF18D708CA31CE74812C73ADAF18E78CCA31EF7C8C73EFAF18F800C11A4200749C8421AF290884CA42217C9C846123AF291908CA4242749C94A5AF29298CCA4261037C9C94E7AF293A00CA5284749CA529A11F294A84CA52A57C9CA56BAF295B08CA52C0F6749CB5ADAF296B8CCA52E77C9CB5E10FAF297C00CA6308749CC621AF398C84C0FA63297C9CC663AF399D08CA634A74911CD6A5AF39AD8CCA636B7C9CD6E7AF39BE00F0CA738C749CE729AF39CE84CA73AD70FC9CE76BAF39DF08CA73CE749CF7ADA0FF39EF8CCA73EF7C9CF7EFAF39F000D0FA840074AD0821AF4A0084DA84217CA10D0863AF4A1108DA844274AD18A5AF4A20D18CDA84637CAD18E7AF4A3200D0FA948474AD2929AF4A4284DA94A57CA0ED296BAF4A5308DA94C674AD39ADA0FF4A638CDA94E77CAD39EFAF4A7400D0EAA50874AD4A21AF5A8484DAA52970ECAD4A63AF5A9508DAA54A74AD5AA0E5AF5AA58CDAA56B7CAD5AE7AF5AB0D600DAB58C74AD6B29AF5AC684D0EAB5AD7CAD6B6BAF5AD708DAB5CE70E4AD7BADAF5AE78CDAB5EF7CAD7BE0CFAF5AF800DAC60074BD8C21A0EF6B0884DAC6217CBD8C63AF6B1900C8DAC64274BD9CA5AF6B298CD0EAC6637CBD9CE7AF6B3A00DAD68470C4BDAD29AF6B4A84DAD6A57CB0EDAD6BAF6B5B08DAD6C674BDBDADA0DF6B6B8CDAD6E77CBDBDEFAF6B70CC00DAE70874BDCE21AF7B8C80C4DAE7297CBDCE63AF7B9D08D0DAE74A74BDDEA5AF7BAD8CDAE760CB7CBDDEE7AF7BBE00DAF78C70C4BDEF29AF7BCE84DAF7AD7CB0DDEF6BAF7BDF08DAF7CE74BDFFA0CDAF7BEF8CDAF7EF7CBDFFEFA0BF7BF000EB080074CE0021B0DF8C0084EB08217CCE0063BF8C10C108EB084274CE10A5BF8C2180BCEB08637CCE10E7BF8C3200C0EB188474CE2129BF8C4284E0BB18A57CCE216BBF8C5308E0DB18C674CE31ADBF8C638CEB18E0B77CCE31EFBF8C7400EB2900B874CE4221BF9C8484EB2920C97CCE4263BF9C9508EB294A70B4CE52A5BF9CA58CEB296B70BCCE52E7BF9CB600EB398C70B4CE6329BF9CC684EB39AD70BCCE636BBF9CD708EB39CE70B4CE73ADBF9CE78CEB39EF70BCCE73EFBF9CF800EB4A0070B4DE8421BFAD0884EB4A2170BCDE8463BFAD1908EB4A4270B4DE94A5BFAD298CEB4A6370ACDE94E7BFAD3A00EB5A80B474DEA529BFAD4A84EB5AA0B57CDEA56BBFAD5B08EB5AC09674DEB5ADBFAD6B8CE0BB5AE77CDEB5EFBFAD7C00E0BB6B0874DEC621BFBD8C84E0AB6B297CDEC663BFBD9D00B8EB6B4A74DED6A5BFBDAD80ACEB6B6B7CDED6E7BFBDB0BE00EB7B8C74DEE729BFBDC09E84EB7BAD7CDEE76BB0AFBDDF08EB7BCE74DEF7A0BDBFBDEF8CEB7BEF7CDEF7E09FBFBDF000FB8C0074E0AF0821BFCE0084FB8C2170ACEF0863BFCE1108FB8C40B274EF18A5BFCE218CFB8C60937CEF18E7BFCE3200F0AB9C8474EF2929BFCE4280A4FB9CA57CEF296BBFCE509308FB9CC674EF39ADB0AFCE638CFB9CE77CEF39E09FBFCE7400FBAD0874E0AF4A21BFDE8484FBAD2970ACEF4A63BFDE9508FBAD409A74EF5AA5BFDEA58CF0ABAD6B7CEF5AE7BFDEB600A0FBBD8C74EF6B29BFDEC08684FBBDAD7CEF6B609BBFDED708FBBDCE74E0AF7BADBFDEE78CFBBDEF70ACEF7BEFBFDEF800FBCE008074FF8C21BFEF0880A4FBCE217CFF8C63BFEF109908FBCE4274FF9CA5B08FEF298CFBCE637CF0AF9CE7BFEF3A00FBDE847084FFAD29BFEF4A84F0ABDEA57CFFAD6BBFEF5B00A8FBDEC674FFBDADBFEF608B8CFBDEE77CFFBDE09FBFEF7C00FBEF0874F09FCE21BFFF8C84FBEF20897CFFCE63BFFF9D00A8FBEF4A74FFDEA5BFFFA08D8CFBEF6B7CFFDEE097BFFFBE00FBFF8C74F09FEF29BFFFCE84FBFFA08D7CFFEF6BBFFFDF0088FBFFCE74FFFFADB0AFFFEF8CFBFFEF7CFFFFE09FBFFFF00188002388009045880067880089880090AB8800CD8800EF8800A101881123881145881160978811898811AB8811C09D8811EF88120188222093882245882267882280998822AB8822CD8822E09F882301883323883340958833678833898833A09B8833CD8833EF88340091884423884445884460978844898844AB8844C09D8844EF88450188552093885545885567885580998855AB8855CD8855E09F885601886623886640958866678866898866A09B8866CD8866EF88670091887723887745887760978877898877AB8877C08D8877EF88780188809823888845888867888098898888AB8888CD888098EF88890188992388909945889967889989889079AB8899CD8899E09F889A0188AA2388AA408588AA6788AB41110003B)
INSERT [dbo].[ShoppingCenter] ([centerName], [state], [pavilionsQuantity], [city], [price], [priceCoefficient], [floors], [image]) VALUES (N'ГУМ', N'Реализация', 5, N'Санкт-Петербург', 6731491, 1.9, 1, NULL)
INSERT [dbo].[ShoppingCenter] ([centerName], [state], [pavilionsQuantity], [city], [price], [priceCoefficient], [floors], [image]) VALUES (N'ЕвроПарк', N'Удален', 20, N'Новосибирск', 9391338, 0.7, 4, NULL)
INSERT [dbo].[ShoppingCenter] ([centerName], [state], [pavilionsQuantity], [city], [price], [priceCoefficient], [floors], [image]) VALUES (N'Европейский', N'Строительство', 9, N'Москва', 5690500, 0.7, 3, NULL)
INSERT [dbo].[ShoppingCenter] ([centerName], [state], [pavilionsQuantity], [city], [price], [priceCoefficient], [floors], [image]) VALUES (N'Золотой Вавилон Ростокино', N'Реализация', 16, N'Екатеринбург', 1632702, 1.8, 4, NULL)
INSERT [dbo].[ShoppingCenter] ([centerName], [state], [pavilionsQuantity], [city], [price], [priceCoefficient], [floors], [image]) VALUES (N'Калейдоскоп', N'Реализация', 10, N'Новосибирск', 7847659, 0.7, 2, NULL)
INSERT [dbo].[ShoppingCenter] ([centerName], [state], [pavilionsQuantity], [city], [price], [priceCoefficient], [floors], [image]) VALUES (N'Красный Кит', N'Строительство', 9, N'Казань', 1912149, 1.1, 3, NULL)
INSERT [dbo].[ShoppingCenter] ([centerName], [state], [pavilionsQuantity], [city], [price], [priceCoefficient], [floors], [image]) VALUES (N'Кунцево Плаза', N'Строительство', 8, N'Челябинск', 6797653, 1.1, 2, NULL)
INSERT [dbo].[ShoppingCenter] ([centerName], [state], [pavilionsQuantity], [city], [price], [priceCoefficient], [floors], [image]) VALUES (N'Лужайка', N'Строительство', 10, N'Казань', 4603336, 0.8, 2, NULL)
INSERT [dbo].[ShoppingCenter] ([centerName], [state], [pavilionsQuantity], [city], [price], [priceCoefficient], [floors], [image]) VALUES (N'Мега Белая Дача', N'Удален', 16, N'Новосибирск', 9006645, 1.7, 4, NULL)
INSERT [dbo].[ShoppingCenter] ([centerName], [state], [pavilionsQuantity], [city], [price], [priceCoefficient], [floors], [image]) VALUES (N'Мега Химки', N'Реализация', 3, N'Нижний Новгород', 3373234, 0.4, 1, NULL)
INSERT [dbo].[ShoppingCenter] ([centerName], [state], [pavilionsQuantity], [city], [price], [priceCoefficient], [floors], [image]) VALUES (N'Мегаполис', N'План', 0, N'Челябинск', 2175218.5, 0.5, 2, NULL)
INSERT [dbo].[ShoppingCenter] ([centerName], [state], [pavilionsQuantity], [city], [price], [priceCoefficient], [floors], [image]) VALUES (N'Метрополис', N'План', 0, N'Санкт-Петербург', 8117913, 0, 2, NULL)
INSERT [dbo].[ShoppingCenter] ([centerName], [state], [pavilionsQuantity], [city], [price], [priceCoefficient], [floors], [image]) VALUES (N'Мозаика', N'Строительство', 20, N'Самара', 1429419, 0, 4, NULL)
INSERT [dbo].[ShoppingCenter] ([centerName], [state], [pavilionsQuantity], [city], [price], [priceCoefficient], [floors], [image]) VALUES (N'Москва', N'Реализация', 12, N'Москва', 4226505, 0.3, 3, NULL)
INSERT [dbo].[ShoppingCenter] ([centerName], [state], [pavilionsQuantity], [city], [price], [priceCoefficient], [floors], [image]) VALUES (N'Наш Гипермаркет', N'План', 0, N'Ростов-на-Дону ', 1088735, 1.2, 4, NULL)
INSERT [dbo].[ShoppingCenter] ([centerName], [state], [pavilionsQuantity], [city], [price], [priceCoefficient], [floors], [image]) VALUES (N'Новинский пассаж', N'Реализация', 8, N'Екатеринбург', 3158957, 1.7, 2, NULL)
INSERT [dbo].[ShoppingCenter] ([centerName], [state], [pavilionsQuantity], [city], [price], [priceCoefficient], [floors], [image]) VALUES (N'Новомосковский', N'План', 0, N'Казань', 7161962.85, 0.4, 1, NULL)
INSERT [dbo].[ShoppingCenter] ([centerName], [state], [pavilionsQuantity], [city], [price], [priceCoefficient], [floors], [image]) VALUES (N'Облака', N'План', 0, N'Санкт-Петербург', 1688905, 0.6, 3, NULL)
INSERT [dbo].[ShoppingCenter] ([centerName], [state], [pavilionsQuantity], [city], [price], [priceCoefficient], [floors], [image]) VALUES (N'Океания', N'План', 0, N'Самара', 5192089, 1.8, 2, NULL)
INSERT [dbo].[ShoppingCenter] ([centerName], [state], [pavilionsQuantity], [city], [price], [priceCoefficient], [floors], [image]) VALUES (N'Отрада', N'Строительство', 4, N'Санкт-Петербург', 6760316, 0.9, 1, NULL)
INSERT [dbo].[ShoppingCenter] ([centerName], [state], [pavilionsQuantity], [city], [price], [priceCoefficient], [floors], [image]) VALUES (N'Принц Плаза', N'Реализация', 8, N'Самара', 1786688, 1.5, 2, NULL)
INSERT [dbo].[ShoppingCenter] ([centerName], [state], [pavilionsQuantity], [city], [price], [priceCoefficient], [floors], [image]) VALUES (N'Райкин Плаза', N'Строительство', 12, N'Санкт-Петербург', 8498470, 1.8, 3, NULL)
INSERT [dbo].[ShoppingCenter] ([centerName], [state], [pavilionsQuantity], [city], [price], [priceCoefficient], [floors], [image]) VALUES (N'Реутов Парк', N'Строительство', 4, N'Ростов-на-Дону ', 1995904, 1.5, 1, NULL)
INSERT [dbo].[ShoppingCenter] ([centerName], [state], [pavilionsQuantity], [city], [price], [priceCoefficient], [floors], [image]) VALUES (N'Ривьера', N'План', 0, N'Москва', 8260042, 0.5, 4, NULL)
INSERT [dbo].[ShoppingCenter] ([centerName], [state], [pavilionsQuantity], [city], [price], [priceCoefficient], [floors], [image]) VALUES (N'Рига Молл', N'План', 0, N'Ростов-на-Дону ', 9788316, NULL, 3, NULL)
INSERT [dbo].[ShoppingCenter] ([centerName], [state], [pavilionsQuantity], [city], [price], [priceCoefficient], [floors], [image]) VALUES (N'Рио', N'Реализация', 5, N'Екатеринбург', 1888653, 0.5, 1, NULL)
INSERT [dbo].[ShoppingCenter] ([centerName], [state], [pavilionsQuantity], [city], [price], [priceCoefficient], [floors], [image]) VALUES (N'Твой дом', N'План', 0, N'Челябинск', 6810865, 1.7, 4, NULL)
INSERT [dbo].[ShoppingCenter] ([centerName], [state], [pavilionsQuantity], [city], [price], [priceCoefficient], [floors], [image]) VALUES (N'Три Кита', N'План', 0, N'Казань', 3089700, 1.7, 1, NULL)
INSERT [dbo].[ShoppingCenter] ([centerName], [state], [pavilionsQuantity], [city], [price], [priceCoefficient], [floors], [image]) VALUES (N'Фестиваль', N'Удален', 16, N'Новосибирск', 1828013, NULL, 4, NULL)
INSERT [dbo].[ShoppingCenter] ([centerName], [state], [pavilionsQuantity], [city], [price], [priceCoefficient], [floors], [image]) VALUES (N'Филион', N'Строительство', 8, N'Москва', 5343904, 0.3, 2, NULL)
INSERT [dbo].[ShoppingCenter] ([centerName], [state], [pavilionsQuantity], [city], [price], [priceCoefficient], [floors], [image]) VALUES (N'Ханой-Москва', N'План', 0, N'Самара', 9580221, 0.3, 4, NULL)
INSERT [dbo].[ShoppingCenter] ([centerName], [state], [pavilionsQuantity], [city], [price], [priceCoefficient], [floors], [image]) VALUES (N'Хорошо', N'Реализация', -20, N'Ростов-на-Дону ', 8306576, 1.9, 4, NULL)
INSERT [dbo].[ShoppingCenter] ([centerName], [state], [pavilionsQuantity], [city], [price], [priceCoefficient], [floors], [image]) VALUES (N'Черемушки', N'Реализация', 15, N'Новосибирск', 7344604, 1, 3, NULL)
INSERT [dbo].[ShoppingCenter] ([centerName], [state], [pavilionsQuantity], [city], [price], [priceCoefficient], [floors], [image]) VALUES (N'Шереметьевский', N'Строительство', 16, N'Новосибирск', 2941379, 1, 4, NULL)
INSERT [dbo].[ShoppingCenter] ([centerName], [state], [pavilionsQuantity], [city], [price], [priceCoefficient], [floors], [image]) VALUES (N'Шоколад', N'Строительство', 12, N'Челябинск', 2217279, 1.1, 3, NULL)
INSERT [dbo].[ShoppingCenter] ([centerName], [state], [pavilionsQuantity], [city], [price], [priceCoefficient], [floors], [image]) VALUES (N'Щука', N'Строительство', 5, N'Нижний Новгород', 5428485, 0.4, 1, NULL)
INSERT [dbo].[Staff] ([name], [login], [password], [role], [phone], [sex], [id], [avatar]) VALUES (N'Ломовцев*Адам*Владимирович', N'Adam@gmai.com', N'7SP9CV', N'Менеджер С', N'+7(8560)519-32-99', N'Male', 3, NULL)
INSERT [dbo].[Staff] ([name], [login], [password], [role], [phone], [sex], [id], [avatar]) VALUES (N'Федотов*Леон#Фёдорович', N'Anisa@gmai.com', N'Wh4OYm', N'Менеджер А', N' +7(22)3264959', N'М', 11, NULL)
INSERT [dbo].[Staff] ([name], [login], [password], [role], [phone], [sex], [id], [avatar]) VALUES (N'Чашин*Елизар*Михеевич', N'Elizor@gmai,com', N'yntiRS', N'Администратор', N' +7(1070)628 29 16', N'Мужской', 1, NULL)
INSERT [dbo].[Staff] ([name], [login], [password], [role], [phone], [sex], [id], [avatar]) VALUES (N'Шарапов*Феофан*Кириллович', N'Feafan@@gmai,com', N'Kc1PeS', N'Менеджер С', N'+7(789)762-30-28', N'М', 12, NULL)
INSERT [dbo].[Staff] ([name], [login], [password], [role], [phone], [sex], [id], [avatar]) VALUES (N'Панькива*Галина*Якововна', N'Galina@gmai.com', N'8KC7wJ', N'Менеджер А', N' +7 (405) 088 73 89', N'Female', 7, NULL)
INSERT [dbo].[Staff] ([name], [login], [password], [role], [phone], [sex], [id], [avatar]) VALUES (N'Тепляков*Кир*Федосиевич', N'Kar@gmai.com', N'6QF1WB', N'Удален', N'+7(824)893-24-03', N'Male', 4, NULL)
INSERT [dbo].[Staff] ([name], [login], [password], [role], [phone], [sex], [id], [avatar]) VALUES (N'Зарубин*Мирон*Мечиславович', N'Miron@@gmai,com', N'x58OAN', N'Администратор', N'+7(6010)195-02-09', N'М', 8, NULL)
INSERT [dbo].[Staff] ([name], [login], [password], [role], [phone], [sex], [id], [avatar]) VALUES (N'Беломестина*Василиса*Тимофеевна', N'Vasilisa@gmai.com', N'd7iKKV', N'Администратор', N'+7(92)920-74-47', N'Ж', 6, NULL)
INSERT [dbo].[Staff] ([name], [login], [password], [role], [phone], [sex], [id], [avatar]) VALUES (N'Рябова*Виктория*Елизаровна', N'Victoria@gmai.com', N'9mlPQJ', N'Удален', N'+7(6394)904-01-61', N'Female', 10, NULL)
INSERT [dbo].[Staff] ([name], [login], [password], [role], [phone], [sex], [id], [avatar]) VALUES (N'Филенкова*Владлена*Олеговна', N'Vladlena@gmai.com', N'07i7Lb', N'Менеджер А', N' +7(334)1460151', N'Женский', 2, NULL)
INSERT [dbo].[Staff] ([name], [login], [password], [role], [phone], [sex], [id], [avatar]) VALUES (N'Веточкина*Всеслава*Андрияновна', N'Vseslava@gmai.com', N'fhDSBf', N'Менеджер С', N'+7(078)429-57-86', N'Женский', 9, NULL)
INSERT [dbo].[Staff] ([name], [login], [password], [role], [phone], [sex], [id], [avatar]) VALUES (N'Рюриков*Юлий*Глебович', N'Yli@gmai.com', N'GwffgE', N'Администратор', N'+7(6402)701-31-09', N'Мужской', 5, NULL)
INSERT [dbo].[Tenant] ([tenantId], [rentId], [name], [number], [address]) VALUES (1, 1, N'AG Marine', N'+7(495)526-14-53', N'Москва, Бабаевская улица д.16')
INSERT [dbo].[Tenant] ([tenantId], [rentId], [name], [number], [address]) VALUES (2, 2, N'Art-elle', N'+7(495)250-58-94', N'Санкт-Петербург, Амбарная улица д.25 корп.1')
INSERT [dbo].[Tenant] ([tenantId], [rentId], [name], [number], [address]) VALUES (3, 3, N'Atlantis', N'+7(495)424-11-65', N'Новосибирск, Улица Каменская д.16')
INSERT [dbo].[Tenant] ([tenantId], [rentId], [name], [number], [address]) VALUES (4, 4, N'Corporate Travel', N'+7(495)245-39-05', N'Екатеринбург, Улица Антона Валека д.56')
INSERT [dbo].[Tenant] ([tenantId], [rentId], [name], [number], [address]) VALUES (5, 5, N'GallaDance', N'+7(495)316-77-94', N'Нижний Новгород, Улица Ларина д. 34')
ALTER TABLE [dbo].[Pavilions]  WITH CHECK ADD  CONSTRAINT [FK_Pavilions_ShoppingCenter] FOREIGN KEY([centerName])
REFERENCES [dbo].[ShoppingCenter] ([centerName])
GO
ALTER TABLE [dbo].[Pavilions] CHECK CONSTRAINT [FK_Pavilions_ShoppingCenter]
GO
USE [master]
GO
ALTER DATABASE [Pavilions] SET  READ_WRITE 
GO
