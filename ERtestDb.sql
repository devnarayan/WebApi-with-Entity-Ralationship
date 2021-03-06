USE [TestApi_Db]
GO
/****** Object:  Table [dbo].[E1]    Script Date: 4/2/2015 12:45:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[E1](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[E1Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Studenttable] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[E1_E2]    Script Date: 4/2/2015 12:45:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[E1_E2](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[E1ID] [int] NOT NULL,
	[E2ID] [int] NOT NULL,
 CONSTRAINT [PK_SubjectDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[E2]    Script Date: 4/2/2015 12:45:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[E2](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[E1Id] [int] NOT NULL,
	[E2Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Subjecttable] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[E1] ON 

INSERT [dbo].[E1] ([Id], [E1Name]) VALUES (1, N'Neha')
INSERT [dbo].[E1] ([Id], [E1Name]) VALUES (2, N'Rahul')
INSERT [dbo].[E1] ([Id], [E1Name]) VALUES (3, N'Roy')
INSERT [dbo].[E1] ([Id], [E1Name]) VALUES (4, N'Raj')
SET IDENTITY_INSERT [dbo].[E1] OFF
SET IDENTITY_INSERT [dbo].[E1_E2] ON 

INSERT [dbo].[E1_E2] ([Id], [E1ID], [E2ID]) VALUES (13, 1, 2)
SET IDENTITY_INSERT [dbo].[E1_E2] OFF
SET IDENTITY_INSERT [dbo].[E2] ON 

INSERT [dbo].[E2] ([Id], [E1Id], [E2Name]) VALUES (1, 1, N'Maths')
INSERT [dbo].[E2] ([Id], [E1Id], [E2Name]) VALUES (2, 1, N'English')
INSERT [dbo].[E2] ([Id], [E1Id], [E2Name]) VALUES (3, 1, N'Hindi')
INSERT [dbo].[E2] ([Id], [E1Id], [E2Name]) VALUES (4, 2, N'Physics')
INSERT [dbo].[E2] ([Id], [E1Id], [E2Name]) VALUES (5, 2, N'English')
INSERT [dbo].[E2] ([Id], [E1Id], [E2Name]) VALUES (6, 2, N'Maths')
INSERT [dbo].[E2] ([Id], [E1Id], [E2Name]) VALUES (7, 3, N'Chemistry')
INSERT [dbo].[E2] ([Id], [E1Id], [E2Name]) VALUES (8, 3, N'Hindi')
INSERT [dbo].[E2] ([Id], [E1Id], [E2Name]) VALUES (9, 3, N'Physics')
INSERT [dbo].[E2] ([Id], [E1Id], [E2Name]) VALUES (10, 4, N'Hindi')
INSERT [dbo].[E2] ([Id], [E1Id], [E2Name]) VALUES (11, 4, N'English')
INSERT [dbo].[E2] ([Id], [E1Id], [E2Name]) VALUES (12, 4, N'Maths')
INSERT [dbo].[E2] ([Id], [E1Id], [E2Name]) VALUES (13, 4, N'Chemistry')
SET IDENTITY_INSERT [dbo].[E2] OFF
ALTER TABLE [dbo].[E1] ADD  CONSTRAINT [DF_Studenttable_StudentName]  DEFAULT ('') FOR [E1Name]
GO
ALTER TABLE [dbo].[E2] ADD  CONSTRAINT [DF_Subjecttable_SubjectName]  DEFAULT ('') FOR [E2Name]
GO
ALTER TABLE [dbo].[E1_E2]  WITH CHECK ADD  CONSTRAINT [FK_SubjectDetail_Studenttable] FOREIGN KEY([E1ID])
REFERENCES [dbo].[E1] ([Id])
GO
ALTER TABLE [dbo].[E1_E2] CHECK CONSTRAINT [FK_SubjectDetail_Studenttable]
GO
ALTER TABLE [dbo].[E1_E2]  WITH CHECK ADD  CONSTRAINT [FK_SubjectDetail_Subjecttable1] FOREIGN KEY([E2ID])
REFERENCES [dbo].[E2] ([Id])
GO
ALTER TABLE [dbo].[E1_E2] CHECK CONSTRAINT [FK_SubjectDetail_Subjecttable1]
GO
ALTER TABLE [dbo].[E2]  WITH CHECK ADD  CONSTRAINT [FK_Subjecttable_Studenttable] FOREIGN KEY([E1Id])
REFERENCES [dbo].[E1] ([Id])
GO
ALTER TABLE [dbo].[E2] CHECK CONSTRAINT [FK_Subjecttable_Studenttable]
GO
