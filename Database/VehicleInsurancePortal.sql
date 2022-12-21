USE [master]
GO
/****** Object:  Database [VIP_DB]    Script Date: 14-Dec-22 11:56:59 PM ******/
CREATE DATABASE [VIP_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VIP_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\VIP_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VIP_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\VIP_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [VIP_DB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VIP_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VIP_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VIP_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VIP_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VIP_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VIP_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [VIP_DB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [VIP_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VIP_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VIP_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VIP_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VIP_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VIP_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VIP_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VIP_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VIP_DB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [VIP_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VIP_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VIP_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VIP_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VIP_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VIP_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VIP_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VIP_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [VIP_DB] SET  MULTI_USER 
GO
ALTER DATABASE [VIP_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VIP_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VIP_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VIP_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VIP_DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [VIP_DB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [VIP_DB] SET QUERY_STORE = OFF
GO
USE [VIP_DB]
GO
/****** Object:  Table [dbo].[Certificate]    Script Date: 14-Dec-22 11:56:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Certificate](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PolicyNo] [int] NOT NULL,
	[BillID] [int] NOT NULL,
	[PolicyDate] [date] NOT NULL,
	[PolicyDuration] [int] NOT NULL,
	[VehicleWarranty] [varchar](50) NULL,
	[Prove] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Claim]    Script Date: 14-Dec-22 11:56:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Claim](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClaimNumber] [int] NOT NULL,
	[CertificateID] [int] NOT NULL,
	[CustomerName] [varchar](50) NOT NULL,
	[PlaceOfAccident] [varchar](100) NOT NULL,
	[DateOfAccident] [varchar](50) NOT NULL,
	[InsuredAmount] [money] NOT NULL,
	[ClaimableAmount] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company_Expense]    Script Date: 14-Dec-22 11:56:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company_Expense](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DateOfExpense] [varchar](50) NOT NULL,
	[TypeOfExpense] [varchar](50) NOT NULL,
	[AmountOfExpense] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 14-Dec-22 11:56:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Role] [varchar](15) NOT NULL,
	[CustomerName] [varchar](50) NOT NULL,
	[CustomerAddress] [varchar](100) NULL,
	[CustomerPhone] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerBill]    Script Date: 14-Dec-22 11:56:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerBill](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BillNo] [int] NOT NULL,
	[EstimateID] [int] NOT NULL,
	[CustomerAddProve] [varchar](200) NULL,
	[Date] [date] NULL,
	[Amount] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estimate]    Script Date: 14-Dec-22 11:56:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estimate](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EstimateNo] [int] NOT NULL,
	[CustomerID] [int] NULL,
	[VehicleID] [int] NULL,
	[VehicleWarranty] [varchar](50) NOT NULL,
	[VehiclePolicyID] [int] NOT NULL,
	[Premium] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Policy]    Script Date: 14-Dec-22 11:56:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Policy](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PolicyType] [varchar](50) NOT NULL,
	[Description] [varchar](500) NOT NULL,
	[Coverage] [varchar](8000) NOT NULL,
	[Annually] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicle]    Script Date: 14-Dec-22 11:56:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicle](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[VehicleName] [varchar](50) NOT NULL,
	[VehicleOwnerName] [varchar](50) NOT NULL,
	[VehicleModel] [varchar](50) NOT NULL,
	[VehicleVersion] [varchar](50) NOT NULL,
	[VehicleRate] [money] NOT NULL,
	[VehicleBodyNumber] [varchar](50) NOT NULL,
	[VehicleEngineNumber] [varchar](50) NOT NULL,
	[VehicleNumber] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Certificate] ON 

INSERT [dbo].[Certificate] ([ID], [PolicyNo], [BillID], [PolicyDate], [PolicyDuration], [VehicleWarranty], [Prove]) VALUES (1, 5555, 1, CAST(N'2022-12-24' AS Date), 12, NULL, NULL)
INSERT [dbo].[Certificate] ([ID], [PolicyNo], [BillID], [PolicyDate], [PolicyDuration], [VehicleWarranty], [Prove]) VALUES (2, 5556, 2, CAST(N'2023-01-14' AS Date), 12, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Certificate] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([ID], [Username], [Password], [Role], [CustomerName], [CustomerAddress], [CustomerPhone]) VALUES (1, N'toann', N'toann', N'Customer', N'Nguyen Toan', N'PTH', 123123)
INSERT [dbo].[Customer] ([ID], [Username], [Password], [Role], [CustomerName], [CustomerAddress], [CustomerPhone]) VALUES (2, N'toann1', N'toann1', N'Customer', N'Nguyen Toan1', N'PTH1', 1231232)
INSERT [dbo].[Customer] ([ID], [Username], [Password], [Role], [CustomerName], [CustomerAddress], [CustomerPhone]) VALUES (3, N'admin', N'admin', N'Employee', N'Nguyen Admin', N'Admin address', 2222)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[CustomerBill] ON 

INSERT [dbo].[CustomerBill] ([ID], [BillNo], [EstimateID], [CustomerAddProve], [Date], [Amount]) VALUES (1, 4444, 1, NULL, NULL, 900.0000)
INSERT [dbo].[CustomerBill] ([ID], [BillNo], [EstimateID], [CustomerAddProve], [Date], [Amount]) VALUES (2, 4445, 2, NULL, NULL, 3000.0000)
SET IDENTITY_INSERT [dbo].[CustomerBill] OFF
GO
SET IDENTITY_INSERT [dbo].[Estimate] ON 

INSERT [dbo].[Estimate] ([ID], [EstimateNo], [CustomerID], [VehicleID], [VehicleWarranty], [VehiclePolicyID], [Premium]) VALUES (1, 3333, 1, 1, N'Not Available', 2, 900.0000)
INSERT [dbo].[Estimate] ([ID], [EstimateNo], [CustomerID], [VehicleID], [VehicleWarranty], [VehiclePolicyID], [Premium]) VALUES (2, 3334, 2, 2, N'Not Available', 4, 3000.0000)
SET IDENTITY_INSERT [dbo].[Estimate] OFF
GO
SET IDENTITY_INSERT [dbo].[Policy] ON 

INSERT [dbo].[Policy] ([ID], [PolicyType], [Description], [Coverage], [Annually]) VALUES (1, N'Third Party Fire and Theft', N'Get great value cover with RACV Third Party Fire and Theft Insurance. You’ll be covered for unintentional damage you cause to other people’s property. And you can rest at ease knowing you’re also covered for up to $10,000 if your car is stolen or damaged by a fire.', N'<div class="tab-component" id="inclusions">
<h4>What does Third Party Fire and Theft Car Insurance cover? </h4>
<div class="tabs">
<ul class="nav nav-tabs yellow-tab">
<li class=""><a class="tab-links" id="inclusions0" data-toggle="tab" href="javascript:void(0);" data-tabid="#tabmenuinclusions0">Inclusions</a></li>
<li class="active in"><a class="tab-links" id="inclusions1" data-toggle="tab" href="javascript:void(0);" data-tabid="#tabmenuinclusions1">Exclusions</a></li>
</ul>
</div>
<div class="tab-content">
<div id="tabmenuinclusions0" class="tab-pane fade in u-hide">
<section class="u-spacing-top-small none u-spacing-bottom-small none " id="tabbedcontent_child0_canvas">
<div class="o-grid">
<div class="o-content-wrap">
<div id="canvas_365535739_cop_392723712_canvas_par_rte" class="rte ">
<div>With an RACV Third Party Property Fire and Theft Insurance policy, you’ll be covered for a range of events. Here’s a summary of what’s included:<br>
<br>
</div>
</div><div class="gridColumn parbase section">
<div class="form_row clearfix" id="canvas_365535739_cop_392723712_canvas_par_gridcolumn">
<form><input type="hidden" disabled="" name="gridcolumn"></form>
<div class="u-1/2 u-padding-base-LR@small u-spacing-bottom-zero@xsmall u-container-form-builder">
<div id="canvas_365535739_canvas_par_rte" class="rte c-list c-list--tick ">
<ul style="list-style-position: inside;">
<li><b>Liability cover up to $20 million</b> for unintentional damage to someone else’s vehicle or property.</li>
<li><b>Up to $10,000 in cover for loss or damage</b> to your vehicle caused by fire, theft or attempted theft.</li>
<li><b>Hire car after a theft or attempted theft</b> where your vehicle can’t be driven, for up to 21 days.<br>
</li>
</ul>
</div>
</div>
<form><input type="hidden" disabled="" name="gridcolumn"></form>
<div class="u-1/2 u-padding-base-LR@small  u-container-form-builder">
<div id="canvas_365535739_canvas_par_rte" class="rte c-list c-list--tick ">
<ul style="list-style-position: inside;">
<li><b>Up to $5000 in limited cover</b> for damage to your vehicle if you’re not at fault in the collision, the other driver is uninsured and you can provide their details.<br>
</li>
<li><b>One tow</b> from an incident to a safe place or repairer.<br>
</li>
<li><b>Any licenced driver (including learners)</b> with permission to drive your vehicle will be covered. Additional excess may apply to inexperienced drivers or drivers under 25.</li>
</ul>
</div>
</div>
</div>
</div>
<div id="canvas_365535739_cop_1798917204_canvas_par_rte" class="rte ">
<p><sub><i>This is only a summary of the inclusions for RACV Third Party Fire and Theft Insurance. For more information, such as conditions, limits and exclusions, please read the <a href="/insurance/policy-documents/motor.html#pds" target="_self">Product Disclosure Statement</a>.</i></sub><br>
</p>
</div>
</div>
</div>
</section>
</div>
<div id="tabmenuinclusions1" class="tab-pane fade active">
<section class="u-spacing-top-small none u-spacing-bottom-small none " id="tabbedcontent_child1_canvas">
<div class="o-grid">
<div class="o-content-wrap">
<div class="gridColumn parbase section">
<div class="form_row clearfix" id="canvas_365535739_cop_canvas_par_gridcolumn">
<form><input type="hidden" disabled="" name="gridcolumn"></form>
<div class="u-1/2 u-padding-base-LR@small u-spacing-bottom-zero@xsmall u-container-form-builder">
<div id="canvas_365535739_canvas_par_rte" class="rte c-list c-list--cross ">
<ul style="list-style-position: inside;">
<li>Cover for repairs to your vehicle where you are at fault in the collision.</li>
<li>Running costs of a hire car, such as petrol or tolls.</li>
<li>Loss or damage to a hire car.<br>
</li>
</ul>
</div>
</div>
<form><input type="hidden" disabled="" name="gridcolumn"></form>
<div class="u-1/2 u-padding-base-LR@small  u-container-form-builder">
<div id="canvas_365535739_canvas_par_rte" class="rte c-list c-list--cross ">
<ul style="list-style-position: inside;">
<li style="text-align: left;">Liability from the use of a hire car.</li>
<li style="text-align: left;">A hire car arranged by you, unless RACV Insurance&nbsp;approved it beforehand.<br>
</li>
</ul>
</div>
</div>
</div>
</div>
<div id="canvas_365535739_cop_1798917204_canvas_par_rte" class="rte ">
<p><sub><i>For more information on General Exclusions and items not included in your cover, refer to the <a href="/insurance/policy-documents/motor.html#pds">Product Disclosure Statement</a>.</i></sub></p>
</div>
</div>
</div>
</section>
</div>
</div>
</div>', 500.0000)
INSERT [dbo].[Policy] ([ID], [PolicyType], [Description], [Coverage], [Annually]) VALUES (2, N'Third-Party Property Damage', N'Third Party Property Damage insurance is the most affordable, basic cover offered by RACV for unintentional damage you cause to another person’s vehicle or property, such as colliding with another car or hitting someone’s fence.', N'<div class="tab-component" id="inclusions">
<h4>What does Third Party Property Damage Car Insurance cover? </h4>
<div class="tabs">
<ul class="nav nav-tabs yellow-tab">
<li class="active in"><a class="tab-links" id="inclusions0" data-toggle="tab" href="javascript:void(0);" data-tabid="#tabmenuinclusions0">Inclusions</a></li>
<li class=""><a class="tab-links" id="inclusions1" data-toggle="tab" href="javascript:void(0);" data-tabid="#tabmenuinclusions1">Exclusions</a></li>
</ul>
</div>
<div class="tab-content">
<div id="tabmenuinclusions0" class="tab-pane fade in active">
<section class="u-spacing-top-small none u-spacing-bottom-small none " id="tabbedcontent_child0_canvas">
<div class="o-grid">
<div class="o-content-wrap">
<div id="canvas_365535739_cop_392723712_canvas_par_rte" class="rte ">
<div>With an RACV Third Party Property Damage car insurance policy, you’ll be covered for a range of events. Here’s a summary of what’s included:<br>
<br>
</div>
</div><div class="gridColumn parbase section">
<div class="form_row clearfix" id="canvas_365535739_cop_392723712_canvas_par_gridcolumn">
<form><input type="hidden" disabled="" name="gridcolumn"></form>
<div class="u-1/2 u-padding-base-LR@small u-spacing-bottom-zero@xsmall u-container-form-builder">
<div id="canvas_365535739_canvas_par_rte" class="rte c-list c-list--tick ">
<ul style="list-style-position: inside;">
<li><b>Liability cover up to $20 million </b>for unintentional damage to someone else’s vehicle or property.</li>
<li><b>Up to $5000 in limited cover</b> for damage to your vehicle if you’re not at fault in the collision, the other driver is uninsured and you can provide their details.</li>
</ul>
</div>
</div>
<form><input type="hidden" disabled="" name="gridcolumn"></form>
<div class="u-1/2 u-padding-base-LR@small  u-container-form-builder">
<div id="canvas_365535739_canvas_par_rte" class="rte c-list c-list--tick ">
<ul style="list-style-position: inside;">
<li><b>One tow</b> from an incident to a safe place or repairer.<br>
</li>
<li><b>Any licenced driver (including learners)</b> with permission to drive your vehicle will be covered. Additional excess may apply to inexperienced drivers or drivers under 25.</li>
</ul>
</div>
</div>
</div>
</div>
<div id="canvas_365535739_cop_1798917204_canvas_par_rte" class="rte ">
<p><sub><i>This is only a summary of the inclusions for RACV Third Party Property Damage Insurance. For more information, such as conditions, limits and exclusions, please read the <a href="/insurance/policy-documents/motor.html#pds" target="_self">Product Disclosure Statement</a>.</i></sub><br>
</p>
</div>
</div>
</div>
</section>
</div>
<div id="tabmenuinclusions1" class="tab-pane fade u-hide">
<section class="u-spacing-top-small none u-spacing-bottom-small none " id="tabbedcontent_child1_canvas">
<div class="o-grid">
<div class="o-content-wrap">
<div class="gridColumn parbase section">
<div class="form_row clearfix" id="canvas_365535739_cop_canvas_par_gridcolumn">
<form><input type="hidden" disabled="" name="gridcolumn"></form>
<div class="u-1/2 u-padding-base-LR@small u-spacing-bottom-zero@xsmall u-container-form-builder">
<div id="canvas_365535739_canvas_par_rte" class="rte c-list c-list--cross ">
<ul style="list-style-position: inside;">
<li>Cover for repairs to your vehicle where you are at fault in the collision.</li>
<li>Financial protection if your car is stolen or is damaged as a result of an attempted theft.</li>
<li>Hire car after an accident, theft or attempted theft.<br>
</li>
</ul>
</div>
</div>
<form><input type="hidden" disabled="" name="gridcolumn"></form>
<div class="u-1/2 u-padding-base-LR@small  u-container-form-builder">
<div id="canvas_365535739_canvas_par_rte" class="rte c-list c-list--cross ">
<ul style="list-style-position: inside;">
<li style="text-align: left;">Cover for windscreen, sunroof and glass damage as a result of an incident.</li>
<li style="text-align: left;">New replacement vehicle if RACV Insurance considers your vehicle to be a total loss.<br>
</li>
</ul>
</div>
</div>
</div>
</div>
<div id="canvas_365535739_cop_1798917204_canvas_par_rte" class="rte ">
<p><sub><i>For more information on General Exclusions and items not included in your cover, refer to the <a href="/insurance/policy-documents/motor.html#pds">Product Disclosure Statement</a>.</i></sub></p>
</div>
</div>
</div>
</section>
</div>
</div>
</div>', 490.0000)
INSERT [dbo].[Policy] ([ID], [PolicyType], [Description], [Coverage], [Annually]) VALUES (3, N'Comprehensive', N'Comprehensive car insurance protects you from potentially hefty bills when an accident occurs. No matter who’s at fault, you and anyone permitted to drive your vehicle1 , will be covered for collision damage to your vehicle and other people’s property.

Go with the standard inclusions, or add optional extras to suit your needs and budget — like hire car cover, windscreen cover with no excess or pick your own licensed repairer.*', N'<div class="tab-component" id="inclusions">
<h4>What does RACV Comprehensive Car Insurance cover? </h4>
<div class="tabs">
<ul class="nav nav-tabs yellow-tab">
<li class="active in"><a class="tab-links" id="inclusions0" data-toggle="tab" href="javascript:void(0);" data-tabid="#tabmenuinclusions0">Inclusions</a></li>
<li class=""><a class="tab-links" id="inclusions1" data-toggle="tab" href="javascript:void(0);" data-tabid="#tabmenuinclusions1">Exclusions</a></li>
<li class=""><a class="tab-links" id="inclusions2" data-toggle="tab" href="javascript:void(0);" data-tabid="#tabmenuinclusions2">Optional extras</a></li>
</ul>
</div>
<div class="tab-content">
<div id="tabmenuinclusions0" class="tab-pane fade in active">
<section class="u-spacing-top-small none u-spacing-bottom-small none " id="tabbedcontent_child0_canvas">
<div class="o-grid">
<div class="o-content-wrap">
<div id="canvas_365535739_cop_392723712_canvas_par_rte" class="rte ">
<div>With an RACV Comprehensive Car Insurance policy, you’ll be covered for a range of events. Here’s a summary of what’s included:<br>
<br>
</div>
</div><div class="gridColumn parbase section">
<div class="form_row clearfix" id="canvas_365535739_cop_392723712_canvas_par_gridcolumn">
<form><input type="hidden" disabled="" name="gridcolumn_copy"></form>
<div class="u-1/2 u-padding-base-LR@small u-spacing-bottom-zero@xsmall u-container-form-builder">
<div id="canvas_365535739_canvas_par_rte" class="rte c-list c-list--tick ">
<ul style="list-style-position: inside;">
<li><b>Loss or damage to your vehicle</b> caused by an accident, flood, fire, malicious act, storm, theft or attempted theft.</li>
<li><b>Hire car after a not-at-fault collision</b> if your car is unsafe to drive or is in for repairs. The at-fault driver’s details must be provided.<br>
</li>
<li><b>Liability cover up to $20 million</b> for damage to someone else’s vehicle or property.<br>
</li>
</ul>
</div>
</div>
<form><input type="hidden" disabled="" name="gridcolumn_copy"></form>
<div class="u-1/2 u-padding-base-LR@small  u-container-form-builder">
<div id="canvas_365535739_canvas_par_rte" class="rte c-list c-list--tick ">
<ul style="list-style-position: inside;">
<li><b>Up to $500 for personal items</b> if they’re stolen with your vehicle or damaged in an incident. Some exclusions apply.<br>
</li>
<li><b>New replacement vehicle</b>&nbsp;where available if your vehicle is up to 2 years old and RACV Insurance considers it to be a total loss and agrees to pay your claim.<br>
</li>
<li><b>Any licenced driver (including learners) </b>with permission to drive your vehicle will be covered. Additional excess may apply to inexperienced drivers or drivers under 25.</li>
</ul>
</div>
</div>
</div>
</div>
<div id="canvas_365535739_cop_1798917204_canvas_par_rte" class="rte ">
<p><sub><i>This is only a summary of the inclusions for RACV Comprehensive&nbsp;Insurance. For more information, such as conditions, limits and exclusions, please read the&nbsp;<a href="/insurance/policy-documents/motor.html#pds" target="_self">Product Disclosure Statement</a>.&nbsp;</i></sub></p>
</div>
</div>
</div>
</section>
</div>
<div id="tabmenuinclusions1" class="tab-pane fade u-hide">
<section class="u-spacing-top-small none u-spacing-bottom-small none " id="tabbedcontent_child1_canvas">
<div class="o-grid">
<div class="o-content-wrap">
<div class="gridColumn parbase section">
<div class="form_row clearfix" id="canvas_365535739_cop_canvas_par_gridcolumn">
<form><input type="hidden" disabled="" name="gridcolumn"></form>
<div class="u-1/2 u-padding-base-LR@small u-spacing-bottom-zero@xsmall u-container-form-builder">
<div id="canvas_365535739_canvas_par_rte" class="rte c-list c-list--cross ">
<ul style="list-style-position: inside;">
<li>Running costs of a hire car, such as petrol or tolls.</li>
<li>Loss or damage to a hire car.<br>
</li>
</ul>
</div>
</div>
<form><input type="hidden" disabled="" name="gridcolumn"></form>
<div class="u-1/2 u-padding-base-LR@small  u-container-form-builder">
<div id="canvas_365535739_canvas_par_rte" class="rte c-list c-list--cross ">
<ul style="list-style-position: inside;">
<li style="text-align: left;">Liability from the use of a hire car.</li>
<li style="text-align: left;">A hire car arranged by you, unless RACV Insurance&nbsp;approved it beforehand.<br>
</li>
</ul>
</div>
</div>
</div>
</div>
<div id="canvas_365535739_cop_607911654_canvas_par_rte" class="rte ">
<p><sub><i>For more information on General Exclusions and items not included in your cover, refer to the <a href="/insurance/policy-documents/motor.html#pds">Product Disclosure Statement</a>.&nbsp;</i></sub></p>
</div>
</div>
</div>
</section>
</div>
<div id="tabmenuinclusions2" class="tab-pane fade u-hide">
<section class="u-spacing-top-small none u-spacing-bottom-small none " id="tabbedcontent_child2_canvas">
<div class="o-grid">
<div class="o-content-wrap">
<div id="canvas_1819562518_canvas_par_rte" class="rte ">
<p>For added peace of mind, you can choose to boost your cover with optional extras. If you do this, you’ll need to pay more on your premium.<br>
</p>
</div><div class="gridColumn parbase section">
<div class="form_row clearfix" id="canvas_1819562518_canvas_par_gridcolumn">
<form><input type="hidden" disabled="" name="gridcolumn"></form>
<div class="u-1/2  u-spacing-bottom-small@xsmall u-container-form-builder">
<div id="gridcolumn_0_rte" class="rte ">
<p><b>Hire Car regardless of who is at fault</b><br>
Under Comprehensive Insurance, you’re covered for a hire car for not-at-fault collisions if you can provide the details of the at-fault driver, as well as theft or attempted theft of your vehicle. By adding this option, you’ll be covered for a hire car regardless of who is at fault.<br>
</p>
<p><b>Windscreen cover with no excess</b><br>
If you add this option, you won’t need to pay any excess when only your vehicle’s windscreen, sunroof or window glass is damaged as a result of an incident.</p>
</div>
</div>
<form><input type="hidden" disabled="" name="gridcolumn"></form>
<div class="u-1/2   u-container-form-builder">
<div id="gridcolumn_0_rte" class="rte ">
<p><b>Any repairer<br>
</b>Under Comprehensive Insurance, RACV Insurance will arrange for an <a href="https://www.racv.com.au/on-the-road/insurance/car-insurance/repairer-map.html" style="background-color: rgb(255,255,255);">RACV Partner Repairer</a> to&nbsp;fix your vehicle.&nbsp;If you choose this option, you can pick any licensed repairer&nbsp;to fix your vehicle.</p>
</div>
</div>
</div>
</div>
<div id="canvas_589014929_canvas_par_rte" class="rte ">
<p><sub><i>For associated conditions, see the <a href="/insurance/policy-documents/motor.html#pds">Product Disclosure Statement</a>.</i></sub></p>
</div>
</div>
</div>
</section>
</div>
</div>
</div>', 2000.0000)
INSERT [dbo].[Policy] ([ID], [PolicyType], [Description], [Coverage], [Annually]) VALUES (4, N'Complete Care®', N'Complete Care® Car Insurance covers all the things you’d expect from comprehensive cover, plus extra inclusions like emergency accommodation, pet assistance, and no excess for windscreen, sunroof and window glass repairs. Drive with confidence when you choose the highest level of RACV Motor Insurance available.', N'<div class="tab-component" id="inclusions">
<h4>What does Complete Care® Car Insurance cover? </h4>
<div class="tabs">
<ul class="nav nav-tabs yellow-tab">
<li class="active in"><a class="tab-links" id="inclusions0" data-toggle="tab" href="javascript:void(0);" data-tabid="#tabmenuinclusions0">Inclusions</a></li>
<li class=""><a class="tab-links" id="inclusions1" data-toggle="tab" href="javascript:void(0);" data-tabid="#tabmenuinclusions1">Exclusions</a></li>
</ul>
</div>
<div class="tab-content">
<div id="tabmenuinclusions0" class="tab-pane fade in active">
<section class="u-spacing-top-small none u-spacing-bottom-small none " id="tabbedcontent_child0_canvas">
<div class="o-grid">
<div class="o-content-wrap">
<div id="canvas_365535739_cop_392723712_canvas_par_rte" class="rte ">
<div>With an RACV Complete Care® Car Insurance policy, you’ll be covered for a range of events. Here’s a summary of what’s included:<br>
</div>
</div><div class="gridColumn parbase section">
<div class="form_row clearfix" id="canvas_365535739_cop_392723712_canvas_par_gridcolumn">
<form><input type="hidden" disabled="" name="gridcolumn"></form>
<div class="u-1/2 u-padding-base-LR@small u-spacing-bottom-zero@xsmall u-container-form-builder">
<div id="canvas_365535739_canvas_par_rte" class="rte c-list c-list--tick ">
<ul style="list-style-position: inside;">
<li><b>Loss or damage to your vehicle</b> caused by an accident, flood, fire, malicious act, storm, theft or attempted theft.</li>
<li><b>Hire car after an incident or theft</b> until your vehicle is repaired and returned to you.</li>
<li><b>Pet assistance</b> in the event you’re involved in an incident more that 100km from home and need to stay in pet-friendly accommodation.</li>
<li><b>Cover for windscreen, sunroof and window glass damage</b> as a result of an incident, without any excess payment.<br>
</li>
</ul>
</div>
</div>
<form><input type="hidden" disabled="" name="gridcolumn"></form>
<div class="u-1/2 u-padding-base-LR@small  u-container-form-builder">
<div id="canvas_365535739_canvas_par_rte" class="rte c-list c-list--tick ">
<ul style="list-style-position: inside;">
<li><b>Vehicle towing, pickup and return</b> if you’re involved in an incident.</li>
<li><b>Liability cover up to $20 million</b> for unintentional collision damage to someone else’s vehicle or property.</li>
<li><b>New replacement vehicle</b>&nbsp;if RACV Insurance considers your vehicle to be a total loss and agrees to pay your claim. Conditions apply.<br>
</li>
<li><b>Any licenced driver (including learners) </b>with permission to drive your vehicle will be covered. Additional excess may apply to inexperienced drivers or drivers under 25.</li>
</ul>
</div>
</div>
</div>
</div>
<div id="canvas_365535739_cop_1798917204_canvas_par_rte" class="rte ">
<p><sub><i>This is only a summary of the inclusions&nbsp;for&nbsp;Complete Care® Motor Insurance. For more information, such as conditions, limits and exclusions, please read the&nbsp;<a href="/insurance/policy-documents/motor.html#pds" target="_self">Product Disclosure Statement</a>.</i></sub></p>
</div>
</div>
</div>
</section>
</div>
<div id="tabmenuinclusions1" class="tab-pane fade u-hide">
<section class="u-spacing-top-small none u-spacing-bottom-small none " id="tabbedcontent_child1_canvas">
<div class="o-grid">
<div class="o-content-wrap">
<div class="gridColumn parbase section">
<div class="form_row clearfix" id="canvas_365535739_cop_canvas_par_gridcolumn">
<form><input type="hidden" disabled="" name="gridcolumn"></form>
<div class="u-1/2 u-padding-base-LR@small u-spacing-bottom-zero@xsmall u-container-form-builder">
<div id="canvas_365535739_canvas_par_rte" class="rte c-list c-list--cross ">
<ul style="list-style-position: inside;">
<li>Accommodation rates beyond the cost of the room (such as mini bar costs)</li>
<li>Veterinary costs if your pet is injured.</li>
<li>Running costs of a hire car, such as petrol or tolls.<br>
</li>
</ul>
</div>
</div>
<form><input type="hidden" disabled="" name="gridcolumn"></form>
<div class="u-1/2 u-padding-base-LR@small  u-container-form-builder">
<div id="canvas_365535739_canvas_par_rte" class="rte c-list c-list--cross ">
<ul style="list-style-position: inside;">
<li style="text-align: left;">Loss or damage to a hire car.</li>
<li style="text-align: left;">Liability from the use of a hire car.</li>
<li style="text-align: left;">A hire car arranged by you, unless RACV Insurance approved it beforehand.<br>
</li>
</ul>
</div>
</div>
</div>
</div>
<div id="canvas_365535739_cop_1798917204_canvas_par_rte" class="rte ">
<p><sub><i>For more information on General Exclusions and items not included in your cover, refer to the <a href="/insurance/policy-documents/motor.html#pds">Product Disclosure Statement</a>.</i></sub></p>
</div>
</div>
</div>
</section>
</div>
</div>
</div>', 2800.0000)
SET IDENTITY_INSERT [dbo].[Policy] OFF
GO
SET IDENTITY_INSERT [dbo].[Vehicle] ON 

INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (1, N'Honda', N'Owner', N'Accord', N'VTi-L', 29000.0000, N'VB5566778891MZ', N'EG-178899-INE', 1111)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (2, N'Honda', N'Owner', N'Accord', N'V6-L', 25000.0000, N'VB5566778872MZ', N'EG-278866-INE', 1112)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (3, N'Honda', N'Owner', N'City', N'VTi-L', 21000.0000, N'VB5566778893MZ', N'EG-378899-INE', 1113)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (4, N'Honda', N'Owner', N'City', N'VTi-LM (LE)', 20000.0000, N'VB5566778874MZ', N'EG-478866-INE', 1114)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (5, N'Honda', N'Owner', N'City', N'VTi-L GM', 21000.0000, N'VB5566778895MZ', N'EG-578899-INE', 1115)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (6, N'Honda', N'Owner', N'Civic', N'VTi-X', 22000.0000, N'VB5566778876MZ', N'EG-678866-INE', 1116)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (7, N'Honda', N'Owner', N'Civic', N'VTi-S', 21000.0000, N'VB5566778897MZ', N'EG-888899-INE', 1117)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (8, N'Honda', N'Owner', N'Civic', N'RS', 19800.0000, N'VB5566778878MZ', N'EG-878866-INE', 1118)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (9, N'Honda', N'Owner', N'CR-V', N'VTi-S (4x4)', 28000.0000, N'VB5566778889MZ', N'EG-978899-INE', 1119)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (10, N'Honda', N'Owner', N'CR-V', N'VTi-L7 (2WD)', 28900.0000, N'VB5566778879MZ', N'EG-108866-INE', 1200)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (11, N'Honda', N'Owner', N'CR-V', N'LE (4x2)', 21000.0000, N'VB5566778810MZ', N'EG-118899-INE', 1201)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (12, N'Honda', N'Owner', N'CR-V', N'VTi-LM', 20000.0000, N'VB5566778811MZ', N'EG-128866-INE', 1202)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (13, N'BMW', N'Owner', N'M5', N'LAUNCH EDITION F90', 21000.0000, N'VB5566778899MZ', N'EG-7788996-INE', 1203)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (14, N'BMW', N'Owner', N'M5', N'F10', 52700.0000, N'VB5566778877MZ', N'EG-778866678-INE', 1204)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (15, N'BMW', N'Owner', N'M5', N'LAUNCH EDITION F90', 119000.0000, N'VB5566778899MZ', N'EG-7788992-INE', 1205)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (16, N'BMW', N'Owner', N'M5', N'NIGHTHAWK F10', 92000.0000, N'VB5566778823MZ', N'EG-77886645-INE', 1206)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (17, N'BMW', N'Owner', N'M5', N'LAUNCH EDITION F90', 21000.0000, N'VB5566778832MZ', N'EG-77889912-INE', 1207)
INSERT [dbo].[Vehicle] ([ID], [VehicleName], [VehicleOwnerName], [VehicleModel], [VehicleVersion], [VehicleRate], [VehicleBodyNumber], [VehicleEngineNumber], [VehicleNumber]) VALUES (18, N'BMW', N'Owner', N'M5', N'SHADOW F10', 59000.0000, N'VB5566778811MZ', N'EG-778866223-INE', 1208)
SET IDENTITY_INSERT [dbo].[Vehicle] OFF
GO
/****** Object:  Index [UQ__Certific__11F2FC4BA4A197A3]    Script Date: 14-Dec-22 11:56:59 PM ******/
ALTER TABLE [dbo].[Certificate] ADD UNIQUE NONCLUSTERED 
(
	[BillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Customer__390618B339AAFBD7]    Script Date: 14-Dec-22 11:56:59 PM ******/
ALTER TABLE [dbo].[Customer] ADD UNIQUE NONCLUSTERED 
(
	[CustomerPhone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__536C85E45C68A2B2]    Script Date: 14-Dec-22 11:56:59 PM ******/
ALTER TABLE [dbo].[Customer] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Estimate__ABEB835BEF83EC6A]    Script Date: 14-Dec-22 11:56:59 PM ******/
ALTER TABLE [dbo].[Estimate] ADD UNIQUE NONCLUSTERED 
(
	[EstimateNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Vehicle__ABAD8859FDCF8276]    Script Date: 14-Dec-22 11:56:59 PM ******/
ALTER TABLE [dbo].[Vehicle] ADD UNIQUE NONCLUSTERED 
(
	[VehicleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Certificate] ADD  DEFAULT ('Not Available') FOR [VehicleWarranty]
GO
ALTER TABLE [dbo].[CustomerBill] ADD  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[Certificate]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Certificate] FOREIGN KEY([BillID])
REFERENCES [dbo].[CustomerBill] ([ID])
GO
ALTER TABLE [dbo].[Certificate] CHECK CONSTRAINT [FK_Bill_Certificate]
GO
ALTER TABLE [dbo].[Claim]  WITH CHECK ADD  CONSTRAINT [FK_Claim_Certificate] FOREIGN KEY([CertificateID])
REFERENCES [dbo].[Certificate] ([ID])
GO
ALTER TABLE [dbo].[Claim] CHECK CONSTRAINT [FK_Claim_Certificate]
GO
ALTER TABLE [dbo].[CustomerBill]  WITH CHECK ADD  CONSTRAINT [FK_Estimate_Bill] FOREIGN KEY([EstimateID])
REFERENCES [dbo].[Estimate] ([ID])
GO
ALTER TABLE [dbo].[CustomerBill] CHECK CONSTRAINT [FK_Estimate_Bill]
GO
ALTER TABLE [dbo].[Estimate]  WITH CHECK ADD  CONSTRAINT [FK_Estimate_Policy] FOREIGN KEY([VehiclePolicyID])
REFERENCES [dbo].[Policy] ([ID])
GO
ALTER TABLE [dbo].[Estimate] CHECK CONSTRAINT [FK_Estimate_Policy]
GO
ALTER TABLE [dbo].[Certificate]  WITH CHECK ADD CHECK  (([BillID]>(0)))
GO
ALTER TABLE [dbo].[Certificate]  WITH CHECK ADD CHECK  (([VehicleWarranty]='Pending' OR [VehicleWarranty]='Available' OR [VehicleWarranty]='Not Available'))
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD CHECK  (([Role]='Employee' OR [Role]='Customer'))
GO
ALTER TABLE [dbo].[Policy]  WITH CHECK ADD CHECK  (([PolicyType]='Complete Care®' OR [PolicyType]='Comprehensive' OR [PolicyType]='Third-Party Property Damage' OR [PolicyType]='Third Party Fire and Theft'))
GO
USE [master]
GO
ALTER DATABASE [VIP_DB] SET  READ_WRITE 
GO
