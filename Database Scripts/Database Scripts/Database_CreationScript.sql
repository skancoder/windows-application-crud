USE [Student]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 11/19/2022 5:13:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[StudentID] [char](8) NOT NULL,
	[Password] [char](8) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentSubject]    Script Date: 11/19/2022 5:13:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentSubject](
	[StudentSubjectID] [int] IDENTITY(1,1) NOT NULL,
	[SubjectID] [int] NOT NULL,
	[StudentID] [char](8) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentSubjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 11/19/2022 5:13:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[SubjectID] [int] IDENTITY(1,1) NOT NULL,
	[SubjectName] [varchar](100) NOT NULL,
	[SubjectCode] [varchar](10) NOT NULL,
	[SubjectType] [varchar](50) NOT NULL,
	[Credit] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SubjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Login] ([StudentID], [Password]) VALUES (N'admin   ', N'admin   ')
GO
SET IDENTITY_INSERT [dbo].[StudentSubject] ON 

INSERT [dbo].[StudentSubject] ([StudentSubjectID], [SubjectID], [StudentID]) VALUES (11, 1, N'admin   ')
INSERT [dbo].[StudentSubject] ([StudentSubjectID], [SubjectID], [StudentID]) VALUES (12, 5, N'admin   ')
INSERT [dbo].[StudentSubject] ([StudentSubjectID], [SubjectID], [StudentID]) VALUES (13, 2, N'admin   ')
SET IDENTITY_INSERT [dbo].[StudentSubject] OFF
GO
SET IDENTITY_INSERT [dbo].[Subjects] ON 

INSERT [dbo].[Subjects] ([SubjectID], [SubjectName], [SubjectCode], [SubjectType], [Credit]) VALUES (1, N'Advance programming C#', N'CS5001', N'Computer Science', 3)
INSERT [dbo].[Subjects] ([SubjectID], [SubjectName], [SubjectCode], [SubjectType], [Credit]) VALUES (2, N'Complier Design', N'CS5002', N'Computer Science', 3)
INSERT [dbo].[Subjects] ([SubjectID], [SubjectName], [SubjectCode], [SubjectType], [Credit]) VALUES (3, N'Advance programming java', N'CS5003', N'Computer Science', 3)
INSERT [dbo].[Subjects] ([SubjectID], [SubjectName], [SubjectCode], [SubjectType], [Credit]) VALUES (4, N'Ethical Hacking', N'Cy5005', N'Cyber Security', 3)
INSERT [dbo].[Subjects] ([SubjectID], [SubjectName], [SubjectCode], [SubjectType], [Credit]) VALUES (5, N'Advance Operating System', N'CS5004', N'Computer Science', 3)
INSERT [dbo].[Subjects] ([SubjectID], [SubjectName], [SubjectCode], [SubjectType], [Credit]) VALUES (6, N'Software Enginnering', N'SE5004', N'Software Engineering', 3)
SET IDENTITY_INSERT [dbo].[Subjects] OFF
GO
/****** Object:  StoredProcedure [dbo].[GetStudentSubject]    Script Date: 11/19/2022 5:13:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetStudentSubject] 
----@StudentID char(8)
AS 
Begin
select sub.SubjectName,s.StudentSubjectID, sub.SubjectCode, sub.SubjectType, sub.Credit
from dbo.StudentSubject s inner join
     dbo.Subjects sub on sub.subjectID  = s.subjectID
	 inner join Login st on st.studentID = s.studentID
   where s.StudentID='admin'
end







GO
