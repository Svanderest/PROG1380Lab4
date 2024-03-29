/*
Before you run this script, complete a quick replace operation on the string mbaddeley_ to change it to
yourName_. You should have 48 changes!
*/

USE [master]
GO
/****** Object:  Database [mbaddeley_IronwoodDWStaging]    Script Date: 2019-09-03 9:29:38 AM ******/
CREATE DATABASE [mbaddeley_IronwoodDWStaging]
GO

USE [mbaddeley_IronwoodDWStaging]
GO
/****** Object:  Schema [Dimension]    Script Date: 2019-09-16 3:08:01 PM ******/
CREATE SCHEMA [Dimension]
GO
/****** Object:  Schema [Fact]    Script Date: 2019-09-16 3:08:01 PM ******/
CREATE SCHEMA [Fact]
GO
/****** Object:  Schema [Staging]    Script Date: 2019-09-16 3:08:01 PM ******/
CREATE SCHEMA [Staging]
GO
/****** Object:  Table [Staging].[Course]    Script Date: 2019-09-03 9:29:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[DimCourse](
	[CourseID] [bigint] IDENTITY(1,1) NOT NULL,
	[CourseName] [varchar](10) NOT NULL,
	[CourseTitle] [varchar](200) NOT NULL,
	[CourseCredits] [tinyint] NOT NULL,
	[DepartmentID] [bigint] NOT NULL,
 CONSTRAINT [PK_DimCourse] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[DimDepartment]    Script Date: 2019-09-24 12:36:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[DimDepartment](
	[DepartmentID] [bigint] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [varchar](30) NOT NULL,
 CONSTRAINT [PK_DimDepartment] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[DimensionLaptop]    Script Date: 2019-09-24 12:36:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[DimensionLaptop](
	[LaptopID] [bigint] IDENTITY(1,1) NOT NULL,
	[StudentID] [bigint] NULL,
 CONSTRAINT [PK_DimensionLaptop] PRIMARY KEY CLUSTERED 
(
	[LaptopID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[DimInstructor]    Script Date: 2019-09-24 12:36:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[DimInstructor](
	[InstructorID] [bigint] IDENTITY(1,1) NOT NULL,
	[InstructorFirstName] [varchar](30) NOT NULL,
	[InstructorLastName] [varchar](30) NOT NULL
	CONSTRAINT [PK_DimInstructor] PRIMARY KEY CLUSTERED 
(
	[InstructorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[DimState]    Script Date: 2019-09-24 12:36:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[DimState](
	[StateAbbreviation] [varchar](2) NOT NULL,
	[StateName] [varchar](100) NOT NULL,
 CONSTRAINT [PK_DimState] PRIMARY KEY CLUSTERED 
(
	[StateAbbreviation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[DimStudent]    Script Date: 2019-09-24 12:36:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[DimStudent](
	[StudentID] [bigint] NOT NULL,
	[StudentFirstName] [varchar](30) NOT NULL,
	[StudentLastName] [varchar](30) NOT NULL,
	[StudentDOB] [datetime] NOT NULL,
	[StudentGender] [char](1) NOT NULL,
	[StudentAddress] [varchar](50) NOT NULL,
	[StudentCity] [varchar](50) NOT NULL,
	[StudentPostalCode] [varchar](10) NOT NULL,
	[StudentPhoneNumber] [varchar](10) NOT NULL,
	[StateAbbreviation] [varchar](2) NOT NULL,
 CONSTRAINT [PK_DimStudent] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[FactEnrollment]    Script Date: 2019-09-24 12:36:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[FactEnrollment](
	[SectionID] [bigint] NOT NULL,
	[StudentID] [bigint] NOT NULL,
	[EnrollmentGrade] [varchar](2) NULL,
 CONSTRAINT [PK_FactEnrollment] PRIMARY KEY CLUSTERED 
(
	[SectionID] ASC,
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[FactSection]    Script Date: 2019-09-24 12:36:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[FactSection](
	[SectionID] [bigint] IDENTITY(1,1) NOT NULL,
	[SectionNumber] [varchar](3) NOT NULL,
	[SectionTerm] [varchar](10) NOT NULL,
	[SectionDay] [varchar](8) NOT NULL,
	[SectionTime] [datetime] NOT NULL,
	[SectionMaxEnrollment] [smallint] NOT NULL,
	[SectionCurrentEnrollment] [smallint] NULL,
	[InstructorID] [bigint] NOT NULL,
	[CourseID] [bigint] NOT NULL,
 CONSTRAINT [PK_FactSection] PRIMARY KEY CLUSTERED 
(
	[SectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [Dimension].[Lineage](
	[AuditKey] [int] IDENTITY(1,1) NOT NULL,
	[ParentAuditKey] [int] NOT NULL,
	[TableName] [varchar](50) NOT NULL DEFAULT ('Unknown'),
	[PkgName] [varchar](50) NOT NULL	DEFAULT ('Unknown'),
	[PkgGUID] [uniqueidentifier] NULL,
	[PkgVersionGUID] [uniqueidentifier] NULL,
	[PkgVersionMajor] [smallint] NULL,
	[PkgVersionMinor] [smallint] NULL,
	[ExecStartDT] [datetime] NOT NULL DEFAULT (getdate()),
	[ExecStopDT] [datetime] NULL,
	[ExecutionInstanceGUID] [uniqueidentifier] NULL,
	[ExtractRowCnt] [bigint] NULL,
	[InsertRowCnt] [bigint] NULL,
	[UpdateRowCnt] [bigint] NULL,
	[ErrorRowCnt] [bigint] NULL,
	[TableInitialRowCnt] [bigint] NULL,
	[TableFinalRowCnt] [bigint] NULL,
	[TableMaxDateTime] [datetime] NULL,
	[SuccessfulProcessingInd] [char](1) NOT NULL DEFAULT ('N'),
 CONSTRAINT [PK_dbo.DimAudit] PRIMARY KEY CLUSTERED 
(
	[AuditKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO