USE [laba03]
GO
/****** Object:  Table [dbo].[AdditionalServices]    Script Date: 25.10.2021 21:07:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AdditionalServices](
	[AdditionalServices_id] [int] IDENTITY(1,1) NOT NULL,
	[AdditionalServiceName] [varchar](100) NOT NULL,
	[BeginDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[Cost] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AdditionalServices_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AdditionalServicesContract]    Script Date: 25.10.2021 21:07:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AdditionalServicesContract](
	[AdditionalServicesContract_id] [int] IDENTITY(1,1) NOT NULL,
	[AdditionalServices_id] [int] NOT NULL,
	[Contract_id] [int] NOT NULL,
	[Connect] [binary](1) NOT NULL,
	[BeginDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[AdditionalServicesContract_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Client]    Script Date: 25.10.2021 21:07:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Client](
	[Client_id] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [varchar](255) NOT NULL,
	[FirstName] [varchar](255) NOT NULL,
	[Patronymic] [varchar](255) NULL,
	[PassportCode] [int] NOT NULL,
	[PassportNumber] [int] NOT NULL,
	[Address] [varchar](255) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[Sex] [binary](1) NOT NULL,
	[mail] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[PassportCode] ASC,
	[PassportNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ClientActivities]    Script Date: 25.10.2021 21:07:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ClientActivities](
	[Activity_id] [int] IDENTITY(1,1) NOT NULL,
	[TypeofActivity] [int] NOT NULL,
	[Amount] [decimal](10, 2) NOT NULL,
	[Contract_id] [int] NOT NULL,
	[Datetime] [datetime] NOT NULL,
	[PhoneNumberTo] [char](20) NULL,
	[CountryFrom] [int] NOT NULL,
	[CountryTo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Activity_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Contract]    Script Date: 25.10.2021 21:07:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contract](
	[Contract_id] [int] IDENTITY(1,1) NOT NULL,
	[ContractNumber] [varchar](40) NOT NULL,
	[Country_id] [int] NOT NULL,
	[BeginDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[Client_id] [int] NOT NULL,
	[PhoneNumber] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Contract_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ContractTariff]    Script Date: 25.10.2021 21:07:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContractTariff](
	[ContractTariff_id] [int] IDENTITY(1,1) NOT NULL,
	[Contract_id] [int] NOT NULL,
	[Tariff_id] [int] NOT NULL,
	[BeginDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ContractTariff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Country]    Script Date: 25.10.2021 21:07:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Country](
	[Country_id] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RoamingCost]    Script Date: 25.10.2021 21:07:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoamingCost](
	[RoamingCost_id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [decimal](10, 2) NOT NULL,
	[ServiceType] [int] NOT NULL,
	[Tariff_id] [int] NOT NULL,
	[Country_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoamingCost_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tariff]    Script Date: 25.10.2021 21:07:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tariff](
	[Tariff_id] [int] IDENTITY(1,1) NOT NULL,
	[Tariff] [varchar](150) NOT NULL,
	[Cost] [decimal](10, 2) NOT NULL,
	[BeginDate] [date] NOT NULL,
	[EndDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Tariff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TariffCost]    Script Date: 25.10.2021 21:07:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TariffCost](
	[TariffCost_id] [int] IDENTITY(1,1) NOT NULL,
	[Tariff_id] [int] NOT NULL,
	[Value] [decimal](10, 2) NOT NULL,
	[ServiceType] [int] NOT NULL,
	[Limit] [int] NULL,
	[BeginDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[TariffCost_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[AdditionalServicesContract]  WITH CHECK ADD FOREIGN KEY([AdditionalServices_id])
REFERENCES [dbo].[AdditionalServices] ([AdditionalServices_id])
GO
ALTER TABLE [dbo].[AdditionalServicesContract]  WITH CHECK ADD FOREIGN KEY([Contract_id])
REFERENCES [dbo].[Contract] ([Contract_id])
GO
ALTER TABLE [dbo].[ClientActivities]  WITH CHECK ADD FOREIGN KEY([Contract_id])
REFERENCES [dbo].[Contract] ([Contract_id])
GO
ALTER TABLE [dbo].[ClientActivities]  WITH CHECK ADD FOREIGN KEY([CountryTo])
REFERENCES [dbo].[Country] ([Country_id])
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD FOREIGN KEY([Client_id])
REFERENCES [dbo].[Client] ([Client_id])
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD FOREIGN KEY([Country_id])
REFERENCES [dbo].[Country] ([Country_id])
GO
ALTER TABLE [dbo].[ContractTariff]  WITH CHECK ADD FOREIGN KEY([Contract_id])
REFERENCES [dbo].[Contract] ([Contract_id])
GO
ALTER TABLE [dbo].[ContractTariff]  WITH CHECK ADD FOREIGN KEY([Tariff_id])
REFERENCES [dbo].[Tariff] ([Tariff_id])
GO
ALTER TABLE [dbo].[RoamingCost]  WITH CHECK ADD FOREIGN KEY([Country_id])
REFERENCES [dbo].[Country] ([Country_id])
GO
ALTER TABLE [dbo].[RoamingCost]  WITH CHECK ADD FOREIGN KEY([Tariff_id])
REFERENCES [dbo].[Tariff] ([Tariff_id])
GO
ALTER TABLE [dbo].[TariffCost]  WITH CHECK ADD FOREIGN KEY([Tariff_id])
REFERENCES [dbo].[Tariff] ([Tariff_id])
GO
