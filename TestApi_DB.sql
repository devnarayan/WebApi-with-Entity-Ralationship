USE [TestApi_Db]
GO
/****** Object:  Table [dbo].[Studenttable]    Script Date: 3/31/2015 9:17:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Studenttable](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[StudentName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Studenttable] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubjectDetail]    Script Date: 3/31/2015 9:17:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubjectDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NULL,
	[SubjectId] [int] NULL,
 CONSTRAINT [PK_SubjectDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Subjecttable]    Script Date: 3/31/2015 9:17:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjecttable](
	[SubjectId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NULL,
	[SubjectName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Subjecttable] PRIMARY KEY CLUSTERED 
(
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Studenttable] ON 

INSERT [dbo].[Studenttable] ([StudentId], [StudentName]) VALUES (1, N'Neha')
INSERT [dbo].[Studenttable] ([StudentId], [StudentName]) VALUES (2, N'Rahul')
INSERT [dbo].[Studenttable] ([StudentId], [StudentName]) VALUES (3, N'Roy')
INSERT [dbo].[Studenttable] ([StudentId], [StudentName]) VALUES (4, N'Raj')
SET IDENTITY_INSERT [dbo].[Studenttable] OFF
SET IDENTITY_INSERT [dbo].[Subjecttable] ON 

INSERT [dbo].[Subjecttable] ([SubjectId], [StudentId], [SubjectName]) VALUES (1, 1, N'Maths')
INSERT [dbo].[Subjecttable] ([SubjectId], [StudentId], [SubjectName]) VALUES (2, 1, N'English')
INSERT [dbo].[Subjecttable] ([SubjectId], [StudentId], [SubjectName]) VALUES (3, 1, N'Hindi')
INSERT [dbo].[Subjecttable] ([SubjectId], [StudentId], [SubjectName]) VALUES (4, 2, N'Physics')
INSERT [dbo].[Subjecttable] ([SubjectId], [StudentId], [SubjectName]) VALUES (5, 2, N'English')
INSERT [dbo].[Subjecttable] ([SubjectId], [StudentId], [SubjectName]) VALUES (6, 2, N'Maths')
INSERT [dbo].[Subjecttable] ([SubjectId], [StudentId], [SubjectName]) VALUES (7, 3, N'Chemistry')
INSERT [dbo].[Subjecttable] ([SubjectId], [StudentId], [SubjectName]) VALUES (8, 3, N'Hindi')
INSERT [dbo].[Subjecttable] ([SubjectId], [StudentId], [SubjectName]) VALUES (9, 3, N'Physics')
INSERT [dbo].[Subjecttable] ([SubjectId], [StudentId], [SubjectName]) VALUES (10, 4, N'Hindi')
INSERT [dbo].[Subjecttable] ([SubjectId], [StudentId], [SubjectName]) VALUES (11, 4, N'English')
INSERT [dbo].[Subjecttable] ([SubjectId], [StudentId], [SubjectName]) VALUES (12, 4, N'Maths')
INSERT [dbo].[Subjecttable] ([SubjectId], [StudentId], [SubjectName]) VALUES (13, 4, N'Chemistry')
SET IDENTITY_INSERT [dbo].[Subjecttable] OFF
ALTER TABLE [dbo].[Studenttable] ADD  CONSTRAINT [DF_Studenttable_StudentName]  DEFAULT ('') FOR [StudentName]
GO
ALTER TABLE [dbo].[Subjecttable] ADD  CONSTRAINT [DF_Subjecttable_SubjectName]  DEFAULT ('') FOR [SubjectName]
GO
ALTER TABLE [dbo].[SubjectDetail]  WITH CHECK ADD  CONSTRAINT [FK_SubjectDetail_Studenttable] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Studenttable] ([StudentId])
GO
ALTER TABLE [dbo].[SubjectDetail] CHECK CONSTRAINT [FK_SubjectDetail_Studenttable]
GO
ALTER TABLE [dbo].[SubjectDetail]  WITH CHECK ADD  CONSTRAINT [FK_SubjectDetail_Subjecttable1] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subjecttable] ([SubjectId])
GO
ALTER TABLE [dbo].[SubjectDetail] CHECK CONSTRAINT [FK_SubjectDetail_Subjecttable1]
GO
ALTER TABLE [dbo].[Subjecttable]  WITH CHECK ADD  CONSTRAINT [FK_Subjecttable_Studenttable] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Studenttable] ([StudentId])
GO
ALTER TABLE [dbo].[Subjecttable] CHECK CONSTRAINT [FK_Subjecttable_Studenttable]
GO
