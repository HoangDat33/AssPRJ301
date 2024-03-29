USE [MyProject]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/27/2024 10:51:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[username] [varchar](150) NOT NULL,
	[password] [varchar](150) NOT NULL,
	[displayname] [varchar](150) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Assessment]    Script Date: 3/27/2024 10:51:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assessment](
	[assid] [int] NOT NULL,
	[suid] [int] NOT NULL,
	[assname] [varchar](50) NOT NULL,
	[weight] [real] NOT NULL,
 CONSTRAINT [PK_Assessment] PRIMARY KEY CLUSTERED 
(
	[assid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attendence]    Script Date: 3/27/2024 10:51:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendence](
	[aid] [int] IDENTITY(1,1) NOT NULL,
	[leid] [int] NOT NULL,
	[sid] [int] NOT NULL,
	[decription] [varchar](150) NOT NULL,
	[ispresent] [bit] NOT NULL,
	[capturetime] [datetime] NOT NULL,
 CONSTRAINT [PK_Attendence] PRIMARY KEY CLUSTERED 
(
	[aid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enrollment]    Script Date: 3/27/2024 10:51:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enrollment](
	[sid] [int] NOT NULL,
	[gid] [int] NOT NULL,
 CONSTRAINT [PK_Enrollment] PRIMARY KEY CLUSTERED 
(
	[sid] ASC,
	[gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 3/27/2024 10:51:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[exid] [int] NOT NULL,
	[assid] [int] NOT NULL,
	[datetime] [date] NOT NULL,
 CONSTRAINT [PK_Exam] PRIMARY KEY CLUSTERED 
(
	[exid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grade]    Script Date: 3/27/2024 10:51:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grade](
	[graid] [int] NOT NULL,
	[exid] [int] NOT NULL,
	[sid] [int] NOT NULL,
	[score] [real] NOT NULL,
 CONSTRAINT [PK_Grade] PRIMARY KEY CLUSTERED 
(
	[graid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 3/27/2024 10:51:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[gid] [int] NOT NULL,
	[gname] [varchar](150) NOT NULL,
	[subid] [int] NOT NULL,
	[lid] [int] NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lecturer]    Script Date: 3/27/2024 10:51:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lecturer](
	[lid] [int] NOT NULL,
	[lcode] [varchar](50) NOT NULL,
	[lgender] [bit] NOT NULL,
	[ldob] [date] NOT NULL,
	[lname] [varchar](150) NOT NULL,
	[lphone] [varchar](10) NOT NULL,
	[lmail] [varchar](50) NOT NULL,
	[laddress] [varchar](50) NOT NULL,
 CONSTRAINT [PK_lecturer] PRIMARY KEY CLUSTERED 
(
	[lid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lession]    Script Date: 3/27/2024 10:51:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lession](
	[leid] [int] NOT NULL,
	[gid] [int] NOT NULL,
	[tid] [int] NOT NULL,
	[rid] [int] NOT NULL,
	[lid] [int] NOT NULL,
	[date] [date] NOT NULL,
	[isattended] [bit] NOT NULL,
 CONSTRAINT [PK_Lession] PRIMARY KEY CLUSTERED 
(
	[leid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 3/27/2024 10:51:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[rid] [int] NOT NULL,
	[rname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 3/27/2024 10:51:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[sid] [int] NOT NULL,
	[scode] [varchar](50) NOT NULL,
	[sname] [varchar](150) NOT NULL,
	[sdob] [date] NOT NULL,
	[sgender] [bit] NOT NULL,
	[sphone] [varchar](10) NOT NULL,
	[smail] [varchar](50) NOT NULL,
	[saddress] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentGroup]    Script Date: 3/27/2024 10:51:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentGroup](
	[gid] [int] NOT NULL,
	[gname] [varchar](150) NOT NULL,
	[subid] [int] NOT NULL,
	[lid] [int] NOT NULL,
 CONSTRAINT [PK_StudentGroup] PRIMARY KEY CLUSTERED 
(
	[gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 3/27/2024 10:51:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[subid] [int] NOT NULL,
	[subname] [varchar](150) NOT NULL,
	[credit] [int] NOT NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[subid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeSlot]    Script Date: 3/27/2024 10:51:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSlot](
	[tid] [int] NOT NULL,
	[tname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_TimeSlot] PRIMARY KEY CLUSTERED 
(
	[tid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'hoangdat', N'hoangdat', N'Hoang Dat')
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'sonnt', N'123', N'Ngo Tung Son')
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'thuyntt', N'123', N'Nguyen Thi Thu Thuy')
GO
INSERT [dbo].[Assessment] ([assid], [suid], [assname], [weight]) VALUES (1, 1, N'PT1', 0.05)
INSERT [dbo].[Assessment] ([assid], [suid], [assname], [weight]) VALUES (2, 1, N'PT2', 0.05)
INSERT [dbo].[Assessment] ([assid], [suid], [assname], [weight]) VALUES (3, 1, N'WS1', 0.05)
INSERT [dbo].[Assessment] ([assid], [suid], [assname], [weight]) VALUES (4, 1, N'WS2', 0.05)
INSERT [dbo].[Assessment] ([assid], [suid], [assname], [weight]) VALUES (5, 1, N'ASS', 0.4)
INSERT [dbo].[Assessment] ([assid], [suid], [assname], [weight]) VALUES (6, 1, N'PE', 0.2)
INSERT [dbo].[Assessment] ([assid], [suid], [assname], [weight]) VALUES (7, 1, N'FE', 0.2)
INSERT [dbo].[Assessment] ([assid], [suid], [assname], [weight]) VALUES (8, 2, N'PRJ', 0.15)
INSERT [dbo].[Assessment] ([assid], [suid], [assname], [weight]) VALUES (9, 2, N'ass1', 0.1)
INSERT [dbo].[Assessment] ([assid], [suid], [assname], [weight]) VALUES (10, 2, N'ass2', 0.1)
INSERT [dbo].[Assessment] ([assid], [suid], [assname], [weight]) VALUES (11, 2, N'pt1', 0.1)
INSERT [dbo].[Assessment] ([assid], [suid], [assname], [weight]) VALUES (12, 2, N'pt2', 0.1)
INSERT [dbo].[Assessment] ([assid], [suid], [assname], [weight]) VALUES (13, 2, N'pt3', 0.1)
INSERT [dbo].[Assessment] ([assid], [suid], [assname], [weight]) VALUES (14, 2, N'fe', 0.35)
INSERT [dbo].[Assessment] ([assid], [suid], [assname], [weight]) VALUES (15, 3, N'pra', 0.1)
INSERT [dbo].[Assessment] ([assid], [suid], [assname], [weight]) VALUES (16, 3, N'pt1', 0.1)
INSERT [dbo].[Assessment] ([assid], [suid], [assname], [weight]) VALUES (17, 3, N'pt2', 0.1)
INSERT [dbo].[Assessment] ([assid], [suid], [assname], [weight]) VALUES (18, 3, N'ME', 0.3)
INSERT [dbo].[Assessment] ([assid], [suid], [assname], [weight]) VALUES (19, 3, N'FE', 0.4)
GO
SET IDENTITY_INSERT [dbo].[Attendence] ON 

INSERT [dbo].[Attendence] ([aid], [leid], [sid], [decription], [ispresent], [capturetime]) VALUES (114, 2, 1, N'', 0, CAST(N'2024-03-14T21:05:38.170' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [decription], [ispresent], [capturetime]) VALUES (115, 2, 2, N'', 0, CAST(N'2024-03-14T21:05:38.170' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [decription], [ispresent], [capturetime]) VALUES (116, 2, 3, N'', 0, CAST(N'2024-03-14T21:05:38.170' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [decription], [ispresent], [capturetime]) VALUES (117, 2, 4, N'', 0, CAST(N'2024-03-14T21:05:38.173' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [decription], [ispresent], [capturetime]) VALUES (118, 2, 5, N'', 0, CAST(N'2024-03-14T21:05:38.173' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [decription], [ispresent], [capturetime]) VALUES (119, 2, 6, N'', 0, CAST(N'2024-03-14T21:05:38.177' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [decription], [ispresent], [capturetime]) VALUES (120, 2, 7, N'not good', 0, CAST(N'2024-03-14T21:05:38.177' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [decription], [ispresent], [capturetime]) VALUES (121, 2, 8, N'good', 1, CAST(N'2024-03-14T21:05:38.177' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [decription], [ispresent], [capturetime]) VALUES (122, 2, 9, N'hihi', 1, CAST(N'2024-03-14T21:05:38.177' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [decription], [ispresent], [capturetime]) VALUES (123, 2, 10, N'', 0, CAST(N'2024-03-14T21:05:38.180' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [decription], [ispresent], [capturetime]) VALUES (144, 3, 1, N'', 0, CAST(N'2024-03-19T20:12:03.753' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [decription], [ispresent], [capturetime]) VALUES (145, 3, 2, N'', 0, CAST(N'2024-03-19T20:12:03.757' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [decription], [ispresent], [capturetime]) VALUES (146, 3, 3, N'', 0, CAST(N'2024-03-19T20:12:03.757' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [decription], [ispresent], [capturetime]) VALUES (147, 3, 4, N'', 0, CAST(N'2024-03-19T20:12:03.757' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [decription], [ispresent], [capturetime]) VALUES (148, 3, 5, N'', 0, CAST(N'2024-03-19T20:12:03.760' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [decription], [ispresent], [capturetime]) VALUES (149, 3, 6, N'', 0, CAST(N'2024-03-19T20:12:03.760' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [decription], [ispresent], [capturetime]) VALUES (150, 3, 7, N'', 0, CAST(N'2024-03-19T20:12:03.760' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [decription], [ispresent], [capturetime]) VALUES (151, 3, 8, N'liii', 0, CAST(N'2024-03-19T20:12:03.760' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [decription], [ispresent], [capturetime]) VALUES (152, 3, 9, N'', 0, CAST(N'2024-03-19T20:12:03.760' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [decription], [ispresent], [capturetime]) VALUES (153, 3, 10, N'', 0, CAST(N'2024-03-19T20:12:03.763' AS DateTime))
SET IDENTITY_INSERT [dbo].[Attendence] OFF
GO
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (1, 1)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (1, 2)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (1, 3)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (2, 1)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (2, 2)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (2, 3)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (3, 1)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (3, 2)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (3, 3)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (4, 1)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (4, 2)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (4, 3)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (5, 1)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (5, 2)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (5, 3)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (6, 1)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (6, 2)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (6, 3)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (7, 1)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (7, 2)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (7, 3)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (8, 1)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (8, 2)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (8, 3)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (9, 1)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (9, 2)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (9, 3)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (10, 1)
GO
INSERT [dbo].[Exam] ([exid], [assid], [datetime]) VALUES (1, 1, CAST(N'2024-01-28' AS Date))
INSERT [dbo].[Exam] ([exid], [assid], [datetime]) VALUES (2, 2, CAST(N'2024-02-28' AS Date))
INSERT [dbo].[Exam] ([exid], [assid], [datetime]) VALUES (3, 3, CAST(N'2024-01-15' AS Date))
INSERT [dbo].[Exam] ([exid], [assid], [datetime]) VALUES (4, 4, CAST(N'2024-02-15' AS Date))
INSERT [dbo].[Exam] ([exid], [assid], [datetime]) VALUES (5, 5, CAST(N'2024-03-18' AS Date))
INSERT [dbo].[Exam] ([exid], [assid], [datetime]) VALUES (6, 6, CAST(N'2024-03-20' AS Date))
INSERT [dbo].[Exam] ([exid], [assid], [datetime]) VALUES (7, 7, CAST(N'2024-03-28' AS Date))
INSERT [dbo].[Exam] ([exid], [assid], [datetime]) VALUES (8, 8, CAST(N'2024-02-01' AS Date))
GO
INSERT [dbo].[Grade] ([graid], [exid], [sid], [score]) VALUES (1, 1, 8, 8)
INSERT [dbo].[Grade] ([graid], [exid], [sid], [score]) VALUES (2, 2, 8, 4)
INSERT [dbo].[Grade] ([graid], [exid], [sid], [score]) VALUES (3, 3, 8, 4)
INSERT [dbo].[Grade] ([graid], [exid], [sid], [score]) VALUES (4, 4, 8, 5)
INSERT [dbo].[Grade] ([graid], [exid], [sid], [score]) VALUES (5, 5, 8, 7)
INSERT [dbo].[Grade] ([graid], [exid], [sid], [score]) VALUES (6, 6, 8, 7)
INSERT [dbo].[Grade] ([graid], [exid], [sid], [score]) VALUES (7, 7, 8, 8)
INSERT [dbo].[Grade] ([graid], [exid], [sid], [score]) VALUES (8, 8, 8, 9)
GO
INSERT [dbo].[Group] ([gid], [gname], [subid], [lid]) VALUES (1, N'Code Class', 1, 1)
INSERT [dbo].[Group] ([gid], [gname], [subid], [lid]) VALUES (2, N'Math Gr', 2, 3)
INSERT [dbo].[Group] ([gid], [gname], [subid], [lid]) VALUES (3, N'Japan Gr', 3, 2)
GO
INSERT [dbo].[Lecturer] ([lid], [lcode], [lgender], [ldob], [lname], [lphone], [lmail], [laddress]) VALUES (1, N'SonNT5', 1, CAST(N'1987-09-01' AS Date), N'Ngo Tung Son', N'0122222222', N'sonnt@gmai.com', N'ha noi')
INSERT [dbo].[Lecturer] ([lid], [lcode], [lgender], [ldob], [lname], [lphone], [lmail], [laddress]) VALUES (2, N'AnhNN', 0, CAST(N'1988-07-03' AS Date), N'Nguyen Ngoc Anh', N'0133333333', N'anhnn@gmail.com', N'ha noi')
INSERT [dbo].[Lecturer] ([lid], [lcode], [lgender], [ldob], [lname], [lphone], [lmail], [laddress]) VALUES (3, N'DungVT', 1, CAST(N'1981-01-09' AS Date), N'Vu Tien Dung', N'0144444444', N'dungvt@gmail.com', N'ha noi')
GO
INSERT [dbo].[Lession] ([leid], [gid], [tid], [rid], [lid], [date], [isattended]) VALUES (1, 1, 1, 1, 1, CAST(N'2024-01-04' AS Date), 0)
INSERT [dbo].[Lession] ([leid], [gid], [tid], [rid], [lid], [date], [isattended]) VALUES (2, 1, 1, 1, 1, CAST(N'2024-02-28' AS Date), 1)
INSERT [dbo].[Lession] ([leid], [gid], [tid], [rid], [lid], [date], [isattended]) VALUES (3, 1, 1, 1, 1, CAST(N'2024-03-06' AS Date), 1)
INSERT [dbo].[Lession] ([leid], [gid], [tid], [rid], [lid], [date], [isattended]) VALUES (4, 2, 1, 1, 3, CAST(N'2024-02-04' AS Date), 0)
INSERT [dbo].[Lession] ([leid], [gid], [tid], [rid], [lid], [date], [isattended]) VALUES (5, 2, 1, 1, 1, CAST(N'2024-02-12' AS Date), 0)
GO
INSERT [dbo].[Room] ([rid], [rname]) VALUES (1, N'BE101')
INSERT [dbo].[Room] ([rid], [rname]) VALUES (2, N'BE102')
INSERT [dbo].[Room] ([rid], [rname]) VALUES (3, N'Al504')
INSERT [dbo].[Room] ([rid], [rname]) VALUES (4, N'DE419')
GO
INSERT [dbo].[Student] ([sid], [scode], [sname], [sdob], [sgender], [sphone], [smail], [saddress]) VALUES (1, N'he160000', N'le lan huong', CAST(N'2002-08-07' AS Date), 0, N'0987654321', N'huong@gmail.com', N'hai phong')
INSERT [dbo].[Student] ([sid], [scode], [sname], [sdob], [sgender], [sphone], [smail], [saddress]) VALUES (2, N'hs181910', N'hoang van tuan', CAST(N'2004-07-12' AS Date), 1, N'0111111111', N'tuan@gmail.com', N'cao bang')
INSERT [dbo].[Student] ([sid], [scode], [sname], [sdob], [sgender], [sphone], [smail], [saddress]) VALUES (3, N'ha173000', N'ma gem minh', CAST(N'2003-08-07' AS Date), 1, N'0222222222', N'minh@gmail.com', N'hai duong')
INSERT [dbo].[Student] ([sid], [scode], [sname], [sdob], [sgender], [sphone], [smail], [saddress]) VALUES (4, N'hs190032', N'nguyen ha na', CAST(N'2005-09-28' AS Date), 0, N'0333333333', N'na@gmail.com', N'ha noi')
INSERT [dbo].[Student] ([sid], [scode], [sname], [sdob], [sgender], [sphone], [smail], [saddress]) VALUES (5, N'he173222', N'tran thai linh', CAST(N'2003-05-18' AS Date), 1, N'0444444444', N'linh@gmail.com', N'nghe an')
INSERT [dbo].[Student] ([sid], [scode], [sname], [sdob], [sgender], [sphone], [smail], [saddress]) VALUES (6, N'hs189032', N'tran dinh heo', CAST(N'2004-12-21' AS Date), 1, N'0555555555', N'heo@gmail.com', N'dien bien')
INSERT [dbo].[Student] ([sid], [scode], [sname], [sdob], [sgender], [sphone], [smail], [saddress]) VALUES (7, N'ha160191', N'lam dinh khoa', CAST(N'2002-03-30' AS Date), 1, N'0666666666', N'khoa@gmail.com', N'da nang')
INSERT [dbo].[Student] ([sid], [scode], [sname], [sdob], [sgender], [sphone], [smail], [saddress]) VALUES (8, N'he173228', N'hoang tien dat', CAST(N'2003-09-20' AS Date), 1, N'0777777777', N'dat@gmail.com', N'ha nam')
INSERT [dbo].[Student] ([sid], [scode], [sname], [sdob], [sgender], [sphone], [smail], [saddress]) VALUES (9, N'hs179876', N'pham hoai thu', CAST(N'2003-09-16' AS Date), 0, N'0888888888', N'thu@gmail.com', N'ha noi')
INSERT [dbo].[Student] ([sid], [scode], [sname], [sdob], [sgender], [sphone], [smail], [saddress]) VALUES (10, N'ha190456', N'bui van ben', CAST(N'2005-04-10' AS Date), 1, N'0999999999', N'ben@gmail.com', N'bac giang')
GO
INSERT [dbo].[StudentGroup] ([gid], [gname], [subid], [lid]) VALUES (1, N'SE1818-PRJ301', 1, 1)
INSERT [dbo].[StudentGroup] ([gid], [gname], [subid], [lid]) VALUES (2, N'SE1818-Math', 2, 2)
GO
INSERT [dbo].[Subject] ([subid], [subname], [credit]) VALUES (1, N'PRJ301', 3)
INSERT [dbo].[Subject] ([subid], [subname], [credit]) VALUES (2, N'MAS291', 3)
INSERT [dbo].[Subject] ([subid], [subname], [credit]) VALUES (3, N'JPD123', 3)
GO
INSERT [dbo].[TimeSlot] ([tid], [tname]) VALUES (1, N'Slot 1')
INSERT [dbo].[TimeSlot] ([tid], [tname]) VALUES (2, N'Slot 2')
INSERT [dbo].[TimeSlot] ([tid], [tname]) VALUES (3, N'Slot 3')
INSERT [dbo].[TimeSlot] ([tid], [tname]) VALUES (4, N'Slot 4')
INSERT [dbo].[TimeSlot] ([tid], [tname]) VALUES (5, N'Slot 5')
INSERT [dbo].[TimeSlot] ([tid], [tname]) VALUES (6, N'Slot 6')
GO
ALTER TABLE [dbo].[Assessment]  WITH CHECK ADD  CONSTRAINT [FK_Assessment_Subject] FOREIGN KEY([suid])
REFERENCES [dbo].[Subject] ([subid])
GO
ALTER TABLE [dbo].[Assessment] CHECK CONSTRAINT [FK_Assessment_Subject]
GO
ALTER TABLE [dbo].[Attendence]  WITH CHECK ADD  CONSTRAINT [FK_Attendence_Lession] FOREIGN KEY([leid])
REFERENCES [dbo].[Lession] ([leid])
GO
ALTER TABLE [dbo].[Attendence] CHECK CONSTRAINT [FK_Attendence_Lession]
GO
ALTER TABLE [dbo].[Attendence]  WITH CHECK ADD  CONSTRAINT [FK_Attendence_Lession1] FOREIGN KEY([leid])
REFERENCES [dbo].[Lession] ([leid])
GO
ALTER TABLE [dbo].[Attendence] CHECK CONSTRAINT [FK_Attendence_Lession1]
GO
ALTER TABLE [dbo].[Attendence]  WITH CHECK ADD  CONSTRAINT [FK_Attendence_Student] FOREIGN KEY([sid])
REFERENCES [dbo].[Student] ([sid])
GO
ALTER TABLE [dbo].[Attendence] CHECK CONSTRAINT [FK_Attendence_Student]
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_Group] FOREIGN KEY([gid])
REFERENCES [dbo].[Group] ([gid])
GO
ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_Enrollment_Group]
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_Student] FOREIGN KEY([sid])
REFERENCES [dbo].[Student] ([sid])
GO
ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_Enrollment_Student]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Assessment] FOREIGN KEY([assid])
REFERENCES [dbo].[Assessment] ([assid])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Assessment]
GO
ALTER TABLE [dbo].[Grade]  WITH CHECK ADD  CONSTRAINT [FK_Grade_Exam] FOREIGN KEY([exid])
REFERENCES [dbo].[Exam] ([exid])
GO
ALTER TABLE [dbo].[Grade] CHECK CONSTRAINT [FK_Grade_Exam]
GO
ALTER TABLE [dbo].[Grade]  WITH CHECK ADD  CONSTRAINT [FK_Grade_Student] FOREIGN KEY([sid])
REFERENCES [dbo].[Student] ([sid])
GO
ALTER TABLE [dbo].[Grade] CHECK CONSTRAINT [FK_Grade_Student]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Lecturer] FOREIGN KEY([lid])
REFERENCES [dbo].[Lecturer] ([lid])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Lecturer]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Subject] FOREIGN KEY([subid])
REFERENCES [dbo].[Subject] ([subid])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Subject]
GO
ALTER TABLE [dbo].[Lession]  WITH CHECK ADD  CONSTRAINT [FK_Lession_Group] FOREIGN KEY([gid])
REFERENCES [dbo].[Group] ([gid])
GO
ALTER TABLE [dbo].[Lession] CHECK CONSTRAINT [FK_Lession_Group]
GO
ALTER TABLE [dbo].[Lession]  WITH CHECK ADD  CONSTRAINT [FK_Lession_Lecturer] FOREIGN KEY([lid])
REFERENCES [dbo].[Lecturer] ([lid])
GO
ALTER TABLE [dbo].[Lession] CHECK CONSTRAINT [FK_Lession_Lecturer]
GO
ALTER TABLE [dbo].[Lession]  WITH CHECK ADD  CONSTRAINT [FK_Lession_Room] FOREIGN KEY([rid])
REFERENCES [dbo].[Room] ([rid])
GO
ALTER TABLE [dbo].[Lession] CHECK CONSTRAINT [FK_Lession_Room]
GO
ALTER TABLE [dbo].[Lession]  WITH CHECK ADD  CONSTRAINT [FK_Lession_StudentGroup] FOREIGN KEY([gid])
REFERENCES [dbo].[StudentGroup] ([gid])
GO
ALTER TABLE [dbo].[Lession] CHECK CONSTRAINT [FK_Lession_StudentGroup]
GO
ALTER TABLE [dbo].[Lession]  WITH CHECK ADD  CONSTRAINT [FK_Lession_TimeSlot] FOREIGN KEY([tid])
REFERENCES [dbo].[TimeSlot] ([tid])
GO
ALTER TABLE [dbo].[Lession] CHECK CONSTRAINT [FK_Lession_TimeSlot]
GO
ALTER TABLE [dbo].[StudentGroup]  WITH CHECK ADD  CONSTRAINT [FK_StudentGroup_Lecturer] FOREIGN KEY([lid])
REFERENCES [dbo].[Lecturer] ([lid])
GO
ALTER TABLE [dbo].[StudentGroup] CHECK CONSTRAINT [FK_StudentGroup_Lecturer]
GO
ALTER TABLE [dbo].[StudentGroup]  WITH CHECK ADD  CONSTRAINT [FK_StudentGroup_Subject] FOREIGN KEY([subid])
REFERENCES [dbo].[Subject] ([subid])
GO
ALTER TABLE [dbo].[StudentGroup] CHECK CONSTRAINT [FK_StudentGroup_Subject]
GO
