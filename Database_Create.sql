USE [DotNetU]
GO

/****** Object:  Table [dbo].[Course]    Script Date: 12/30/2016 12:07:51 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Course](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CourseNum] [int] NOT NULL,
	[CourseTitle] [nvarchar](50) NOT NULL,
	[Instructor_Id] [int] NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Instructor] FOREIGN KEY([Instructor_Id])
REFERENCES [dbo].[Instructor] ([Id])
GO

ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Instructor]
GO

/****** Object:  Table [dbo].[Department]    Script Date: 12/30/2016 12:09:01 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DeptCode] [varchar](10) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Head_Instructor_Id] [int] NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_Instructor] FOREIGN KEY([Head_Instructor_Id])
REFERENCES [dbo].[Instructor] ([Id])
GO

ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_Instructor]
GO

/****** Object:  Table [dbo].[Instructor]    Script Date: 12/30/2016 12:09:51 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Instructor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Department_Id] [int] NOT NULL,
 CONSTRAINT [PK_Instructor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Instructor]  WITH CHECK ADD  CONSTRAINT [FK_Instructor_Department] FOREIGN KEY([Department_Id])
REFERENCES [dbo].[Department] ([Id])
GO

ALTER TABLE [dbo].[Instructor] CHECK CONSTRAINT [FK_Instructor_Department]
GO