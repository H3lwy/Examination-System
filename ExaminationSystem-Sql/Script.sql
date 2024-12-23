USE [master]
GO
/****** Object:  Database [ExaminationSystem]    Script Date: 12/23/2024 10:08:22 PM ******/
CREATE DATABASE [ExaminationSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ExaminationSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ExaminationSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ExaminationSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ExaminationSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ExaminationSystem] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ExaminationSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ExaminationSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ExaminationSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ExaminationSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ExaminationSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ExaminationSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [ExaminationSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ExaminationSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ExaminationSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ExaminationSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ExaminationSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ExaminationSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ExaminationSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ExaminationSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ExaminationSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ExaminationSystem] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ExaminationSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ExaminationSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ExaminationSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ExaminationSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ExaminationSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ExaminationSystem] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [ExaminationSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ExaminationSystem] SET RECOVERY FULL 
GO
ALTER DATABASE [ExaminationSystem] SET  MULTI_USER 
GO
ALTER DATABASE [ExaminationSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ExaminationSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ExaminationSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ExaminationSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ExaminationSystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ExaminationSystem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ExaminationSystem', N'ON'
GO
ALTER DATABASE [ExaminationSystem] SET QUERY_STORE = ON
GO
ALTER DATABASE [ExaminationSystem] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ExaminationSystem]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 12/23/2024 10:08:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 12/23/2024 10:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 12/23/2024 10:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 12/23/2024 10:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 12/23/2024 10:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 12/23/2024 10:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 12/23/2024 10:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 12/23/2024 10:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Choices]    Script Date: 12/23/2024 10:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Choices](
	[ChoiceId] [int] IDENTITY(1,1) NOT NULL,
	[QuestionId] [int] NOT NULL,
	[ChoiceText] [nvarchar](max) NOT NULL,
	[IsCorrect] [bit] NOT NULL,
 CONSTRAINT [PK_Choices] PRIMARY KEY CLUSTERED 
(
	[ChoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamQuestions]    Script Date: 12/23/2024 10:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamQuestions](
	[ExamId] [int] NOT NULL,
	[QuestionId] [int] NOT NULL,
 CONSTRAINT [PK_ExamQuestions] PRIMARY KEY CLUSTERED 
(
	[ExamId] ASC,
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exams]    Script Date: 12/23/2024 10:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exams](
	[ExamId] [int] IDENTITY(1,1) NOT NULL,
	[ExamName] [nvarchar](max) NOT NULL,
	[SubjectId] [int] NOT NULL,
	[TimeLimit] [time](7) NOT NULL,
	[PassScore] [int] NOT NULL,
 CONSTRAINT [PK_Exams] PRIMARY KEY CLUSTERED 
(
	[ExamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 12/23/2024 10:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[QuestionId] [int] IDENTITY(1,1) NOT NULL,
	[QuestionText] [nvarchar](max) NOT NULL,
	[SubjectId] [int] NOT NULL,
 CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED 
(
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentExamQuestionAnswers]    Script Date: 12/23/2024 10:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentExamQuestionAnswers](
	[StudentExamQuestionAnswerId] [int] IDENTITY(1,1) NOT NULL,
	[StudentExamId] [int] NOT NULL,
	[QuestionId] [int] NOT NULL,
	[SelectedChoiceId] [int] NOT NULL,
	[IsCorrect] [bit] NOT NULL,
 CONSTRAINT [PK_StudentExamQuestionAnswers] PRIMARY KEY CLUSTERED 
(
	[StudentExamQuestionAnswerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentExams]    Script Date: 12/23/2024 10:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentExams](
	[StudentExamId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [nvarchar](450) NOT NULL,
	[ExamId] [int] NOT NULL,
	[DateTimeTaken] [datetime2](7) NOT NULL,
	[Score] [float] NOT NULL,
	[IsCompleted] [bit] NOT NULL,
	[SubjectId] [int] NOT NULL,
 CONSTRAINT [PK_StudentExams] PRIMARY KEY CLUSTERED 
(
	[StudentExamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 12/23/2024 10:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[SubjectId] [int] IDENTITY(1,1) NOT NULL,
	[SubjectName] [nvarchar](max) NOT NULL,
	[SubjectDescription] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Subjects] PRIMARY KEY CLUSTERED 
(
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241203231204_FirstTry', N'8.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241203232128_secondetry', N'8.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241204211542_fnameandlastname', N'8.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241205113616_smallEdit', N'8.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241205114611_EditRole', N'8.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241205122056_Editexams', N'8.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241205123724_d', N'8.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241205140048_addsubjecttostexam', N'8.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241206140736_smalldit', N'8.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241206143108_smalleditt', N'8.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241214130703_cascade', N'8.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241214131641_cascadforchoices', N'8.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241214141956_CorrectSchema', N'8.0.11')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'edc104a6-7804-42f8-b381-8e9a1dcde28e', N'Student', N'STUDENT', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'f95ff4fd-f7f9-4c0f-94f3-ce95677fb3f2', N'Admin', N'ADMIN', NULL)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'27146a74-2ebb-403f-b8f4-8060e8ffe35c', N'edc104a6-7804-42f8-b381-8e9a1dcde28e')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'71b38f6f-0800-4243-afb1-188c62ca5807', N'f95ff4fd-f7f9-4c0f-94f3-ce95677fb3f2')
GO
INSERT [dbo].[AspNetUsers] ([Id], [IsActive], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName]) VALUES (N'27146a74-2ebb-403f-b8f4-8060e8ffe35c', 1, N'mostafamarwan', N'MOSTAFAMARWAN', N'mostafamarwan@gmail.com', N'MOSTAFAMARWAN@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEARi2rL04Asqb4QWrElN9076Rtc80Rm9NKn9QZjAD1FwPWhCzUtEzV23eACD5poE3g==', N'C4TPAUHMTZO5QIQTMMRYDX6LMEHECKRH', N'7fd8e525-d813-48aa-a83d-de584626b06b', NULL, 0, 0, NULL, 1, 0, N'Mostafa', N'Marwan')
INSERT [dbo].[AspNetUsers] ([Id], [IsActive], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName]) VALUES (N'71b38f6f-0800-4243-afb1-188c62ca5807', 1, N'Hisham', N'HISHAM', N'hisham.3lwy@gmail.com', N'HISHAM.3LWY@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEME74cLJP21GE9fRViQww5KXkjSikHHf1uP6XQt5Z3j839v63CWG1DHyTTkdL8WxDQ==', N'a6e3d236-40ec-4e15-8d85-74c6b5f025c8', N'dccd207a-8a7c-4db3-bb81-3316abc5ac71', NULL, 0, 0, NULL, 0, 0, N'Hisham', N'Alwy')
GO
SET IDENTITY_INSERT [dbo].[Choices] ON 

INSERT [dbo].[Choices] ([ChoiceId], [QuestionId], [ChoiceText], [IsCorrect]) VALUES (5, 2, N'x = 1', 0)
INSERT [dbo].[Choices] ([ChoiceId], [QuestionId], [ChoiceText], [IsCorrect]) VALUES (6, 2, N'x = 2', 1)
INSERT [dbo].[Choices] ([ChoiceId], [QuestionId], [ChoiceText], [IsCorrect]) VALUES (7, 2, N'x = 3', 0)
INSERT [dbo].[Choices] ([ChoiceId], [QuestionId], [ChoiceText], [IsCorrect]) VALUES (8, 2, N'x = 4', 0)
INSERT [dbo].[Choices] ([ChoiceId], [QuestionId], [ChoiceText], [IsCorrect]) VALUES (9, 3, N'2x', 1)
INSERT [dbo].[Choices] ([ChoiceId], [QuestionId], [ChoiceText], [IsCorrect]) VALUES (10, 3, N'x^2', 0)
INSERT [dbo].[Choices] ([ChoiceId], [QuestionId], [ChoiceText], [IsCorrect]) VALUES (11, 3, N'x', 0)
INSERT [dbo].[Choices] ([ChoiceId], [QuestionId], [ChoiceText], [IsCorrect]) VALUES (12, 3, N'None of the above', 0)
INSERT [dbo].[Choices] ([ChoiceId], [QuestionId], [ChoiceText], [IsCorrect]) VALUES (13, 4, N'A number divisible by 2', 0)
INSERT [dbo].[Choices] ([ChoiceId], [QuestionId], [ChoiceText], [IsCorrect]) VALUES (14, 4, N'A number greater than 10', 0)
INSERT [dbo].[Choices] ([ChoiceId], [QuestionId], [ChoiceText], [IsCorrect]) VALUES (15, 4, N'A number divisible only by 1 and itself', 1)
INSERT [dbo].[Choices] ([ChoiceId], [QuestionId], [ChoiceText], [IsCorrect]) VALUES (16, 4, N'None of the above', 0)
INSERT [dbo].[Choices] ([ChoiceId], [QuestionId], [ChoiceText], [IsCorrect]) VALUES (17, 5, N'pr^2', 1)
INSERT [dbo].[Choices] ([ChoiceId], [QuestionId], [ChoiceText], [IsCorrect]) VALUES (18, 5, N'2pr', 0)
INSERT [dbo].[Choices] ([ChoiceId], [QuestionId], [ChoiceText], [IsCorrect]) VALUES (19, 5, N'r^2', 0)
INSERT [dbo].[Choices] ([ChoiceId], [QuestionId], [ChoiceText], [IsCorrect]) VALUES (20, 5, N'None of the above', 0)
INSERT [dbo].[Choices] ([ChoiceId], [QuestionId], [ChoiceText], [IsCorrect]) VALUES (21, 6, N'a^2 + b^2 = c^2', 1)
INSERT [dbo].[Choices] ([ChoiceId], [QuestionId], [ChoiceText], [IsCorrect]) VALUES (22, 6, N'a + b = c', 0)
INSERT [dbo].[Choices] ([ChoiceId], [QuestionId], [ChoiceText], [IsCorrect]) VALUES (23, 6, N'a^2 - b^2 = c^2', 0)
INSERT [dbo].[Choices] ([ChoiceId], [QuestionId], [ChoiceText], [IsCorrect]) VALUES (24, 6, N'None of the above', 0)
INSERT [dbo].[Choices] ([ChoiceId], [QuestionId], [ChoiceText], [IsCorrect]) VALUES (25, 7, N'0', 0)
INSERT [dbo].[Choices] ([ChoiceId], [QuestionId], [ChoiceText], [IsCorrect]) VALUES (26, 7, N'1', 1)
INSERT [dbo].[Choices] ([ChoiceId], [QuestionId], [ChoiceText], [IsCorrect]) VALUES (27, 7, N'2', 0)
INSERT [dbo].[Choices] ([ChoiceId], [QuestionId], [ChoiceText], [IsCorrect]) VALUES (28, 7, N'None of the above', 0)
INSERT [dbo].[Choices] ([ChoiceId], [QuestionId], [ChoiceText], [IsCorrect]) VALUES (29, 8, N'0.25', 1)
INSERT [dbo].[Choices] ([ChoiceId], [QuestionId], [ChoiceText], [IsCorrect]) VALUES (30, 8, N'0.5', 0)
INSERT [dbo].[Choices] ([ChoiceId], [QuestionId], [ChoiceText], [IsCorrect]) VALUES (31, 8, N'0.75', 0)
INSERT [dbo].[Choices] ([ChoiceId], [QuestionId], [ChoiceText], [IsCorrect]) VALUES (32, 8, N'1.0', 0)
INSERT [dbo].[Choices] ([ChoiceId], [QuestionId], [ChoiceText], [IsCorrect]) VALUES (33, 9, N'120', 1)
INSERT [dbo].[Choices] ([ChoiceId], [QuestionId], [ChoiceText], [IsCorrect]) VALUES (34, 9, N'24', 0)
INSERT [dbo].[Choices] ([ChoiceId], [QuestionId], [ChoiceText], [IsCorrect]) VALUES (35, 9, N'720', 0)
INSERT [dbo].[Choices] ([ChoiceId], [QuestionId], [ChoiceText], [IsCorrect]) VALUES (36, 9, N'5', 0)
INSERT [dbo].[Choices] ([ChoiceId], [QuestionId], [ChoiceText], [IsCorrect]) VALUES (37, 10, N'16', 0)
INSERT [dbo].[Choices] ([ChoiceId], [QuestionId], [ChoiceText], [IsCorrect]) VALUES (38, 10, N'11', 1)
INSERT [dbo].[Choices] ([ChoiceId], [QuestionId], [ChoiceText], [IsCorrect]) VALUES (39, 10, N'10', 0)
INSERT [dbo].[Choices] ([ChoiceId], [QuestionId], [ChoiceText], [IsCorrect]) VALUES (40, 10, N'8', 0)
INSERT [dbo].[Choices] ([ChoiceId], [QuestionId], [ChoiceText], [IsCorrect]) VALUES (61, 1, N'3.14', 1)
INSERT [dbo].[Choices] ([ChoiceId], [QuestionId], [ChoiceText], [IsCorrect]) VALUES (62, 1, N'3.15', 0)
INSERT [dbo].[Choices] ([ChoiceId], [QuestionId], [ChoiceText], [IsCorrect]) VALUES (63, 1, N'3.16', 0)
INSERT [dbo].[Choices] ([ChoiceId], [QuestionId], [ChoiceText], [IsCorrect]) VALUES (64, 1, N'3.17', 0)
INSERT [dbo].[Choices] ([ChoiceId], [QuestionId], [ChoiceText], [IsCorrect]) VALUES (69, 32, N'9', 0)
INSERT [dbo].[Choices] ([ChoiceId], [QuestionId], [ChoiceText], [IsCorrect]) VALUES (70, 32, N'10', 1)
INSERT [dbo].[Choices] ([ChoiceId], [QuestionId], [ChoiceText], [IsCorrect]) VALUES (71, 32, N'11', 0)
INSERT [dbo].[Choices] ([ChoiceId], [QuestionId], [ChoiceText], [IsCorrect]) VALUES (72, 32, N'12', 0)
INSERT [dbo].[Choices] ([ChoiceId], [QuestionId], [ChoiceText], [IsCorrect]) VALUES (78, 34, N'12', 0)
INSERT [dbo].[Choices] ([ChoiceId], [QuestionId], [ChoiceText], [IsCorrect]) VALUES (79, 34, N'14', 0)
INSERT [dbo].[Choices] ([ChoiceId], [QuestionId], [ChoiceText], [IsCorrect]) VALUES (80, 34, N'15', 1)
INSERT [dbo].[Choices] ([ChoiceId], [QuestionId], [ChoiceText], [IsCorrect]) VALUES (81, 34, N'9', 0)
SET IDENTITY_INSERT [dbo].[Choices] OFF
GO
INSERT [dbo].[ExamQuestions] ([ExamId], [QuestionId]) VALUES (1, 1)
INSERT [dbo].[ExamQuestions] ([ExamId], [QuestionId]) VALUES (21, 1)
INSERT [dbo].[ExamQuestions] ([ExamId], [QuestionId]) VALUES (22, 1)
INSERT [dbo].[ExamQuestions] ([ExamId], [QuestionId]) VALUES (1, 2)
INSERT [dbo].[ExamQuestions] ([ExamId], [QuestionId]) VALUES (22, 2)
INSERT [dbo].[ExamQuestions] ([ExamId], [QuestionId]) VALUES (1, 3)
INSERT [dbo].[ExamQuestions] ([ExamId], [QuestionId]) VALUES (22, 3)
INSERT [dbo].[ExamQuestions] ([ExamId], [QuestionId]) VALUES (1, 4)
INSERT [dbo].[ExamQuestions] ([ExamId], [QuestionId]) VALUES (1, 5)
INSERT [dbo].[ExamQuestions] ([ExamId], [QuestionId]) VALUES (22, 5)
INSERT [dbo].[ExamQuestions] ([ExamId], [QuestionId]) VALUES (1, 6)
INSERT [dbo].[ExamQuestions] ([ExamId], [QuestionId]) VALUES (1, 7)
INSERT [dbo].[ExamQuestions] ([ExamId], [QuestionId]) VALUES (22, 7)
INSERT [dbo].[ExamQuestions] ([ExamId], [QuestionId]) VALUES (1, 8)
INSERT [dbo].[ExamQuestions] ([ExamId], [QuestionId]) VALUES (1, 9)
INSERT [dbo].[ExamQuestions] ([ExamId], [QuestionId]) VALUES (22, 9)
INSERT [dbo].[ExamQuestions] ([ExamId], [QuestionId]) VALUES (1, 10)
GO
SET IDENTITY_INSERT [dbo].[Exams] ON 

INSERT [dbo].[Exams] ([ExamId], [ExamName], [SubjectId], [TimeLimit], [PassScore]) VALUES (1, N'Mathematics 1', 1, CAST(N'01:30:00' AS Time), 50)
INSERT [dbo].[Exams] ([ExamId], [ExamName], [SubjectId], [TimeLimit], [PassScore]) VALUES (2, N'Mathematics Exam 2', 1, CAST(N'01:30:00' AS Time), 70)
INSERT [dbo].[Exams] ([ExamId], [ExamName], [SubjectId], [TimeLimit], [PassScore]) VALUES (3, N'Physics Exam 1', 2, CAST(N'01:00:00' AS Time), 50)
INSERT [dbo].[Exams] ([ExamId], [ExamName], [SubjectId], [TimeLimit], [PassScore]) VALUES (4, N'Physics Exam 2', 2, CAST(N'01:30:00' AS Time), 70)
INSERT [dbo].[Exams] ([ExamId], [ExamName], [SubjectId], [TimeLimit], [PassScore]) VALUES (5, N'Chemistry Exam 1', 3, CAST(N'01:00:00' AS Time), 50)
INSERT [dbo].[Exams] ([ExamId], [ExamName], [SubjectId], [TimeLimit], [PassScore]) VALUES (6, N'Chemistry Exam 2', 3, CAST(N'01:30:00' AS Time), 70)
INSERT [dbo].[Exams] ([ExamId], [ExamName], [SubjectId], [TimeLimit], [PassScore]) VALUES (7, N'Biology Exam 1', 4, CAST(N'01:00:00' AS Time), 50)
INSERT [dbo].[Exams] ([ExamId], [ExamName], [SubjectId], [TimeLimit], [PassScore]) VALUES (8, N'Biology Exam 2', 4, CAST(N'01:30:00' AS Time), 70)
INSERT [dbo].[Exams] ([ExamId], [ExamName], [SubjectId], [TimeLimit], [PassScore]) VALUES (9, N'English Literature Exam 1', 5, CAST(N'01:00:00' AS Time), 50)
INSERT [dbo].[Exams] ([ExamId], [ExamName], [SubjectId], [TimeLimit], [PassScore]) VALUES (10, N'English Literature Exam 2', 5, CAST(N'01:30:00' AS Time), 70)
INSERT [dbo].[Exams] ([ExamId], [ExamName], [SubjectId], [TimeLimit], [PassScore]) VALUES (11, N'Computer Science Exam 1', 6, CAST(N'01:00:00' AS Time), 50)
INSERT [dbo].[Exams] ([ExamId], [ExamName], [SubjectId], [TimeLimit], [PassScore]) VALUES (12, N'Computer Science Exam 2', 6, CAST(N'01:30:00' AS Time), 70)
INSERT [dbo].[Exams] ([ExamId], [ExamName], [SubjectId], [TimeLimit], [PassScore]) VALUES (13, N'History Exam 1', 7, CAST(N'01:00:00' AS Time), 50)
INSERT [dbo].[Exams] ([ExamId], [ExamName], [SubjectId], [TimeLimit], [PassScore]) VALUES (14, N'History Exam 2', 7, CAST(N'01:30:00' AS Time), 70)
INSERT [dbo].[Exams] ([ExamId], [ExamName], [SubjectId], [TimeLimit], [PassScore]) VALUES (15, N'Geography Exam 1', 8, CAST(N'01:00:00' AS Time), 50)
INSERT [dbo].[Exams] ([ExamId], [ExamName], [SubjectId], [TimeLimit], [PassScore]) VALUES (16, N'Geography Exam 2', 8, CAST(N'01:30:00' AS Time), 70)
INSERT [dbo].[Exams] ([ExamId], [ExamName], [SubjectId], [TimeLimit], [PassScore]) VALUES (17, N'Economics Exam 1', 9, CAST(N'01:00:00' AS Time), 50)
INSERT [dbo].[Exams] ([ExamId], [ExamName], [SubjectId], [TimeLimit], [PassScore]) VALUES (18, N'Economics Exam 2', 9, CAST(N'01:30:00' AS Time), 70)
INSERT [dbo].[Exams] ([ExamId], [ExamName], [SubjectId], [TimeLimit], [PassScore]) VALUES (19, N'Philosophy Exam 1', 10, CAST(N'01:00:00' AS Time), 50)
INSERT [dbo].[Exams] ([ExamId], [ExamName], [SubjectId], [TimeLimit], [PassScore]) VALUES (20, N'Philosophy Exam 2', 10, CAST(N'01:30:00' AS Time), 70)
INSERT [dbo].[Exams] ([ExamId], [ExamName], [SubjectId], [TimeLimit], [PassScore]) VALUES (21, N'Mathematics 3', 1, CAST(N'00:30:00' AS Time), 30)
INSERT [dbo].[Exams] ([ExamId], [ExamName], [SubjectId], [TimeLimit], [PassScore]) VALUES (22, N'Mathematics 4', 1, CAST(N'00:50:00' AS Time), 70)
SET IDENTITY_INSERT [dbo].[Exams] OFF
GO
SET IDENTITY_INSERT [dbo].[Questions] ON 

INSERT [dbo].[Questions] ([QuestionId], [QuestionText], [SubjectId]) VALUES (1, N'What is the value of pi?', 1)
INSERT [dbo].[Questions] ([QuestionId], [QuestionText], [SubjectId]) VALUES (2, N'Solve the equation: 2x + 3 = 7.', 1)
INSERT [dbo].[Questions] ([QuestionId], [QuestionText], [SubjectId]) VALUES (3, N'What is the derivative of x^2?', 1)
INSERT [dbo].[Questions] ([QuestionId], [QuestionText], [SubjectId]) VALUES (4, N'Define a prime number.', 1)
INSERT [dbo].[Questions] ([QuestionId], [QuestionText], [SubjectId]) VALUES (5, N'What is the area of a circle?', 1)
INSERT [dbo].[Questions] ([QuestionId], [QuestionText], [SubjectId]) VALUES (6, N'State Pythagoras’ theorem.', 1)
INSERT [dbo].[Questions] ([QuestionId], [QuestionText], [SubjectId]) VALUES (7, N'What is the value of sin(90°)?', 1)
INSERT [dbo].[Questions] ([QuestionId], [QuestionText], [SubjectId]) VALUES (8, N'Convert 1/4 into a decimal.', 1)
INSERT [dbo].[Questions] ([QuestionId], [QuestionText], [SubjectId]) VALUES (9, N'What is the factorial of 5?', 1)
INSERT [dbo].[Questions] ([QuestionId], [QuestionText], [SubjectId]) VALUES (10, N'Simplify: 5 + 3 × 2.', 1)
INSERT [dbo].[Questions] ([QuestionId], [QuestionText], [SubjectId]) VALUES (11, N'What is Newton\''s second law of motion?', 2)
INSERT [dbo].[Questions] ([QuestionId], [QuestionText], [SubjectId]) VALUES (12, N'Define velocity.', 2)
INSERT [dbo].[Questions] ([QuestionId], [QuestionText], [SubjectId]) VALUES (13, N'What is the unit of force?', 2)
INSERT [dbo].[Questions] ([QuestionId], [QuestionText], [SubjectId]) VALUES (14, N'State the formula for kinetic energy.', 2)
INSERT [dbo].[Questions] ([QuestionId], [QuestionText], [SubjectId]) VALUES (15, N'What is the speed of light in a vacuum?', 2)
INSERT [dbo].[Questions] ([QuestionId], [QuestionText], [SubjectId]) VALUES (16, N'Define acceleration.', 2)
INSERT [dbo].[Questions] ([QuestionId], [QuestionText], [SubjectId]) VALUES (17, N'What is the SI unit of power?', 2)
INSERT [dbo].[Questions] ([QuestionId], [QuestionText], [SubjectId]) VALUES (18, N'What is Ohm\''s Law?', 2)
INSERT [dbo].[Questions] ([QuestionId], [QuestionText], [SubjectId]) VALUES (19, N'What is the gravitational constant?', 2)
INSERT [dbo].[Questions] ([QuestionId], [QuestionText], [SubjectId]) VALUES (20, N'Explain the Doppler effect.', 2)
INSERT [dbo].[Questions] ([QuestionId], [QuestionText], [SubjectId]) VALUES (21, N'What is the atomic number of Hydrogen?', 3)
INSERT [dbo].[Questions] ([QuestionId], [QuestionText], [SubjectId]) VALUES (22, N'Define an ionic bond.', 3)
INSERT [dbo].[Questions] ([QuestionId], [QuestionText], [SubjectId]) VALUES (23, N'What is the molecular formula for water?', 3)
INSERT [dbo].[Questions] ([QuestionId], [QuestionText], [SubjectId]) VALUES (24, N'Name the first element in the periodic table.', 3)
INSERT [dbo].[Questions] ([QuestionId], [QuestionText], [SubjectId]) VALUES (25, N'What is the pH value of a neutral substance?', 3)
INSERT [dbo].[Questions] ([QuestionId], [QuestionText], [SubjectId]) VALUES (26, N'Define a catalyst.', 3)
INSERT [dbo].[Questions] ([QuestionId], [QuestionText], [SubjectId]) VALUES (27, N'What is Avogadro’s number?', 3)
INSERT [dbo].[Questions] ([QuestionId], [QuestionText], [SubjectId]) VALUES (28, N'Name the process of converting a solid to gas.', 3)
INSERT [dbo].[Questions] ([QuestionId], [QuestionText], [SubjectId]) VALUES (29, N'What is an isotope?', 3)
INSERT [dbo].[Questions] ([QuestionId], [QuestionText], [SubjectId]) VALUES (30, N'Explain the law of conservation of mass.', 3)
INSERT [dbo].[Questions] ([QuestionId], [QuestionText], [SubjectId]) VALUES (32, N'5 + 5 = ?', 1)
INSERT [dbo].[Questions] ([QuestionId], [QuestionText], [SubjectId]) VALUES (34, N'5 + 10 = ?', 1)
SET IDENTITY_INSERT [dbo].[Questions] OFF
GO
SET IDENTITY_INSERT [dbo].[StudentExamQuestionAnswers] ON 

INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (2, 1, 10, 39, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (3, 1, 2, 5, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (4, 1, 8, 31, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (5, 1, 9, 33, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (6, 1, 5, 19, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (7, 1, 3, 9, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (8, 1, 4, 15, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (9, 1, 7, 25, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (10, 1, 6, 23, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (11, 2, 4, 13, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (12, 2, 6, 22, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (13, 3, 2, 5, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (14, 3, 1, 63, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (15, 3, 7, 25, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (16, 3, 4, 14, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (17, 3, 10, 38, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (18, 3, 3, 11, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (19, 3, 5, 17, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (20, 3, 8, 30, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (21, 3, 9, 35, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (22, 3, 6, 21, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (23, 4, 10, 38, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (24, 4, 3, 9, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (25, 4, 6, 21, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (26, 4, 4, 15, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (27, 4, 7, 25, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (28, 4, 5, 19, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (29, 4, 8, 29, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (30, 4, 9, 33, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (31, 4, 2, 6, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (32, 4, 1, 61, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (33, 5, 9, 33, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (34, 5, 1, 61, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (35, 5, 7, 26, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (36, 5, 8, 29, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (37, 5, 10, 38, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (38, 5, 5, 17, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (39, 5, 3, 9, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (40, 5, 6, 21, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (41, 5, 2, 6, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (42, 5, 4, 15, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (43, 6, 6, 21, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (44, 6, 4, 15, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (45, 6, 2, 6, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (46, 6, 10, 38, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (47, 6, 7, 26, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (48, 6, 9, 33, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (49, 6, 1, 61, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (50, 6, 3, 9, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (51, 6, 8, 29, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (52, 6, 5, 17, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1043, 1006, 9, 33, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1044, 1006, 8, 29, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1045, 1006, 7, 26, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1046, 1006, 5, 17, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1047, 1006, 3, 9, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1048, 1006, 1, 61, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1049, 1006, 6, 21, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1050, 1006, 10, 37, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1051, 1006, 4, 15, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1052, 1006, 2, 6, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1053, 1007, 7, 25, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1054, 1007, 5, 18, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1055, 1007, 8, 31, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1056, 1007, 1, 63, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1057, 1007, 2, 8, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1058, 1007, 9, 35, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1059, 1007, 6, 22, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1060, 1007, 4, 15, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1061, 1007, 10, 39, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1062, 1007, 3, 10, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1063, 1008, 3, 9, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1064, 1008, 5, 18, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1065, 1008, 10, 40, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1066, 1008, 6, 22, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1067, 1008, 2, 6, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1068, 1008, 9, 33, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1069, 1008, 8, 29, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1070, 1008, 1, 62, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1071, 1008, 4, 15, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1072, 1008, 7, 27, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1073, 1009, 7, 25, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1074, 1009, 10, 37, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1075, 1009, 8, 30, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1076, 1009, 6, 21, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1077, 1009, 2, 7, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1078, 1009, 9, 34, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1079, 1009, 5, 17, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1080, 1009, 1, 62, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1081, 1009, 3, 11, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1082, 1009, 4, 13, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1083, 1010, 7, 25, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1084, 1010, 9, 34, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1085, 1010, 8, 32, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1086, 1010, 1, 62, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1087, 1010, 6, 22, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1088, 1010, 4, 14, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1089, 1010, 10, 38, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1090, 1010, 2, 7, 0)
GO
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1091, 1010, 3, 10, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1092, 1010, 5, 18, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1093, 1011, 4, 13, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1094, 1011, 10, 39, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1095, 1011, 8, 32, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1096, 1011, 7, 27, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1097, 1011, 1, 63, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1098, 1011, 3, 11, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1099, 1011, 5, 19, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1100, 1011, 6, 22, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1101, 1011, 9, 34, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1102, 1011, 2, 5, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1103, 1012, 10, 37, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1104, 1012, 3, 11, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1105, 1012, 9, 35, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1106, 1012, 7, 26, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1107, 1012, 2, 6, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1108, 1012, 8, 29, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1109, 1012, 4, 13, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1110, 1012, 6, 22, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1111, 1012, 5, 20, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1112, 1012, 1, 63, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1113, 1013, 4, 13, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1114, 1013, 5, 19, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1115, 1013, 7, 27, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1116, 1013, 1, 63, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1117, 1013, 8, 30, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1118, 1013, 3, 9, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1119, 1013, 6, 21, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1120, 1013, 2, 5, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1121, 1013, 10, 39, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1122, 1013, 9, 33, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1123, 1014, 9, 33, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1124, 1014, 8, 31, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1125, 1014, 1, 64, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1126, 1014, 3, 11, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1127, 1014, 6, 22, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1128, 1014, 7, 25, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1129, 1014, 10, 37, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1130, 1014, 5, 17, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1131, 1014, 4, 13, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1132, 1014, 2, 6, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1133, 1015, 4, 15, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1134, 1015, 10, 38, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1135, 1015, 9, 34, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1136, 1015, 6, 23, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1137, 1015, 7, 26, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1138, 1015, 3, 10, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1139, 1015, 1, 61, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1140, 1015, 8, 30, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1141, 1015, 2, 8, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1142, 1015, 5, 18, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1143, 1016, 2, 5, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1144, 1016, 4, 14, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1145, 1016, 7, 25, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1146, 1016, 8, 29, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1147, 1016, 3, 9, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1148, 1016, 5, 17, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1149, 1016, 1, 61, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1150, 1016, 9, 33, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1151, 1016, 10, 37, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1152, 1016, 6, 22, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1153, 1017, 5, 17, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1154, 1017, 7, 25, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1155, 1017, 8, 29, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1156, 1017, 4, 14, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1157, 1017, 9, 35, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1158, 1017, 1, 63, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1159, 1017, 2, 8, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1160, 1017, 10, 39, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1161, 1017, 3, 11, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1162, 1017, 6, 21, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1163, 1018, 7, 27, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1164, 1018, 8, 30, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1165, 1018, 6, 21, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1166, 1018, 10, 37, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1167, 1018, 4, 15, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1168, 1018, 1, 61, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1169, 1018, 2, 5, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1170, 1018, 3, 9, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1171, 1018, 5, 19, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1172, 1018, 9, 34, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1173, 1019, 2, 6, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1174, 1019, 7, 27, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1175, 1019, 9, 34, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1176, 1019, 1, 62, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1177, 1019, 6, 21, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1178, 1019, 5, 18, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1179, 1019, 4, 14, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1180, 1019, 3, 10, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1181, 1019, 8, 30, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1182, 1019, 10, 38, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1183, 1020, 10, 37, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1184, 1020, 6, 22, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1185, 1020, 9, 36, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1186, 1020, 4, 16, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1187, 1020, 2, 8, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1188, 1020, 3, 12, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1189, 1020, 5, 18, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1190, 1020, 1, 62, 0)
GO
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1191, 1020, 8, 29, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1192, 1020, 7, 26, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1193, 1021, 6, 22, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1194, 1021, 2, 7, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1195, 1021, 8, 30, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1196, 1021, 3, 11, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1197, 1021, 7, 26, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1198, 1021, 5, 17, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1199, 1021, 10, 37, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1200, 1021, 9, 34, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1201, 1021, 1, 62, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1202, 1021, 4, 15, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1203, 1022, 4, 15, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1204, 1022, 8, 29, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1205, 1022, 1, 61, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1206, 1022, 2, 6, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1207, 1022, 7, 26, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1208, 1022, 6, 21, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1209, 1022, 9, 33, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1210, 1022, 10, 38, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1211, 1022, 5, 17, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1212, 1022, 3, 9, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1213, 1023, 4, 13, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1214, 1023, 1, 62, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1215, 1023, 5, 20, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1216, 1023, 9, 36, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1217, 1023, 7, 25, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1218, 1023, 10, 38, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1219, 1023, 6, 23, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1220, 1023, 2, 8, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1221, 1023, 8, 32, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1222, 1023, 3, 10, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1223, 1024, 5, 17, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1224, 1024, 4, 15, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1225, 1024, 9, 33, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1226, 1024, 8, 29, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1227, 1024, 10, 38, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1228, 1024, 6, 21, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1229, 1024, 2, 6, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1230, 1024, 3, 9, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1231, 1024, 1, 61, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1232, 1024, 7, 26, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1233, 1025, 9, 34, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1234, 1025, 10, 39, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1235, 1025, 7, 27, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1236, 1026, 5, 17, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1237, 1026, 6, 23, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1238, 1026, 4, 15, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1239, 1026, 7, 26, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1240, 1026, 1, 64, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1241, 1026, 9, 33, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1242, 1026, 2, 5, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1243, 1026, 8, 29, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1244, 1026, 3, 12, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1245, 1026, 10, 37, 0)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1246, 1027, 1, 61, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1247, 1027, 6, 21, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1248, 1027, 4, 15, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1249, 1027, 9, 33, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1250, 1027, 7, 26, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1251, 1027, 2, 6, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1252, 1027, 8, 29, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1253, 1027, 3, 9, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1254, 1027, 10, 38, 1)
INSERT [dbo].[StudentExamQuestionAnswers] ([StudentExamQuestionAnswerId], [StudentExamId], [QuestionId], [SelectedChoiceId], [IsCorrect]) VALUES (1255, 1027, 5, 17, 1)
SET IDENTITY_INSERT [dbo].[StudentExamQuestionAnswers] OFF
GO
SET IDENTITY_INSERT [dbo].[StudentExams] ON 

INSERT [dbo].[StudentExams] ([StudentExamId], [StudentId], [ExamId], [DateTimeTaken], [Score], [IsCompleted], [SubjectId]) VALUES (1, N'27146a74-2ebb-403f-b8f4-8060e8ffe35c', 1, CAST(N'2024-12-14T20:28:16.9942346' AS DateTime2), 40, 1, 1)
INSERT [dbo].[StudentExams] ([StudentExamId], [StudentId], [ExamId], [DateTimeTaken], [Score], [IsCompleted], [SubjectId]) VALUES (2, N'27146a74-2ebb-403f-b8f4-8060e8ffe35c', 1, CAST(N'2024-12-15T20:28:20.9728131' AS DateTime2), 0, 1, 1)
INSERT [dbo].[StudentExams] ([StudentExamId], [StudentId], [ExamId], [DateTimeTaken], [Score], [IsCompleted], [SubjectId]) VALUES (3, N'27146a74-2ebb-403f-b8f4-8060e8ffe35c', 1, CAST(N'2024-12-16T20:18:25.0067361' AS DateTime2), 30, 1, 1)
INSERT [dbo].[StudentExams] ([StudentExamId], [StudentId], [ExamId], [DateTimeTaken], [Score], [IsCompleted], [SubjectId]) VALUES (4, N'27146a74-2ebb-403f-b8f4-8060e8ffe35c', 1, CAST(N'2024-12-16T20:30:34.9201311' AS DateTime2), 80, 1, 1)
INSERT [dbo].[StudentExams] ([StudentExamId], [StudentId], [ExamId], [DateTimeTaken], [Score], [IsCompleted], [SubjectId]) VALUES (5, N'27146a74-2ebb-403f-b8f4-8060e8ffe35c', 1, CAST(N'2024-12-16T20:32:17.1288539' AS DateTime2), 100, 1, 1)
INSERT [dbo].[StudentExams] ([StudentExamId], [StudentId], [ExamId], [DateTimeTaken], [Score], [IsCompleted], [SubjectId]) VALUES (6, N'27146a74-2ebb-403f-b8f4-8060e8ffe35c', 1, CAST(N'2024-12-16T21:08:53.8468908' AS DateTime2), 100, 1, 1)
INSERT [dbo].[StudentExams] ([StudentExamId], [StudentId], [ExamId], [DateTimeTaken], [Score], [IsCompleted], [SubjectId]) VALUES (7, N'27146a74-2ebb-403f-b8f4-8060e8ffe35c', 1, CAST(N'2024-12-17T11:32:48.3366892' AS DateTime2), 0, 1, 1)
INSERT [dbo].[StudentExams] ([StudentExamId], [StudentId], [ExamId], [DateTimeTaken], [Score], [IsCompleted], [SubjectId]) VALUES (1006, N'27146a74-2ebb-403f-b8f4-8060e8ffe35c', 1, CAST(N'2024-12-17T13:21:38.6323127' AS DateTime2), 90, 1, 1)
INSERT [dbo].[StudentExams] ([StudentExamId], [StudentId], [ExamId], [DateTimeTaken], [Score], [IsCompleted], [SubjectId]) VALUES (1007, N'27146a74-2ebb-403f-b8f4-8060e8ffe35c', 1, CAST(N'2024-12-17T13:46:34.2056414' AS DateTime2), 10, 1, 1)
INSERT [dbo].[StudentExams] ([StudentExamId], [StudentId], [ExamId], [DateTimeTaken], [Score], [IsCompleted], [SubjectId]) VALUES (1008, N'27146a74-2ebb-403f-b8f4-8060e8ffe35c', 1, CAST(N'2024-12-17T15:39:20.7918148' AS DateTime2), 50, 1, 1)
INSERT [dbo].[StudentExams] ([StudentExamId], [StudentId], [ExamId], [DateTimeTaken], [Score], [IsCompleted], [SubjectId]) VALUES (1009, N'27146a74-2ebb-403f-b8f4-8060e8ffe35c', 1, CAST(N'2024-12-17T15:43:59.7487892' AS DateTime2), 20, 1, 1)
INSERT [dbo].[StudentExams] ([StudentExamId], [StudentId], [ExamId], [DateTimeTaken], [Score], [IsCompleted], [SubjectId]) VALUES (1010, N'27146a74-2ebb-403f-b8f4-8060e8ffe35c', 1, CAST(N'2024-12-17T15:47:05.3465501' AS DateTime2), 10, 1, 1)
INSERT [dbo].[StudentExams] ([StudentExamId], [StudentId], [ExamId], [DateTimeTaken], [Score], [IsCompleted], [SubjectId]) VALUES (1011, N'27146a74-2ebb-403f-b8f4-8060e8ffe35c', 1, CAST(N'2024-12-17T15:53:29.0383298' AS DateTime2), 0, 1, 1)
INSERT [dbo].[StudentExams] ([StudentExamId], [StudentId], [ExamId], [DateTimeTaken], [Score], [IsCompleted], [SubjectId]) VALUES (1012, N'27146a74-2ebb-403f-b8f4-8060e8ffe35c', 1, CAST(N'2024-12-17T16:04:10.8654419' AS DateTime2), 30, 1, 1)
INSERT [dbo].[StudentExams] ([StudentExamId], [StudentId], [ExamId], [DateTimeTaken], [Score], [IsCompleted], [SubjectId]) VALUES (1013, N'27146a74-2ebb-403f-b8f4-8060e8ffe35c', 1, CAST(N'2024-12-17T16:14:52.3574591' AS DateTime2), 30, 1, 1)
INSERT [dbo].[StudentExams] ([StudentExamId], [StudentId], [ExamId], [DateTimeTaken], [Score], [IsCompleted], [SubjectId]) VALUES (1014, N'27146a74-2ebb-403f-b8f4-8060e8ffe35c', 1, CAST(N'2024-12-17T16:16:18.5350804' AS DateTime2), 30, 1, 1)
INSERT [dbo].[StudentExams] ([StudentExamId], [StudentId], [ExamId], [DateTimeTaken], [Score], [IsCompleted], [SubjectId]) VALUES (1015, N'27146a74-2ebb-403f-b8f4-8060e8ffe35c', 1, CAST(N'2024-12-17T16:27:58.1530537' AS DateTime2), 40, 1, 1)
INSERT [dbo].[StudentExams] ([StudentExamId], [StudentId], [ExamId], [DateTimeTaken], [Score], [IsCompleted], [SubjectId]) VALUES (1016, N'27146a74-2ebb-403f-b8f4-8060e8ffe35c', 1, CAST(N'2024-12-17T16:30:29.0733854' AS DateTime2), 50, 1, 1)
INSERT [dbo].[StudentExams] ([StudentExamId], [StudentId], [ExamId], [DateTimeTaken], [Score], [IsCompleted], [SubjectId]) VALUES (1017, N'27146a74-2ebb-403f-b8f4-8060e8ffe35c', 1, CAST(N'2024-12-17T16:31:34.4175085' AS DateTime2), 30, 1, 1)
INSERT [dbo].[StudentExams] ([StudentExamId], [StudentId], [ExamId], [DateTimeTaken], [Score], [IsCompleted], [SubjectId]) VALUES (1018, N'27146a74-2ebb-403f-b8f4-8060e8ffe35c', 1, CAST(N'2024-12-17T16:36:34.5897312' AS DateTime2), 40, 1, 1)
INSERT [dbo].[StudentExams] ([StudentExamId], [StudentId], [ExamId], [DateTimeTaken], [Score], [IsCompleted], [SubjectId]) VALUES (1019, N'27146a74-2ebb-403f-b8f4-8060e8ffe35c', 1, CAST(N'2024-12-17T16:55:15.8851125' AS DateTime2), 30, 1, 1)
INSERT [dbo].[StudentExams] ([StudentExamId], [StudentId], [ExamId], [DateTimeTaken], [Score], [IsCompleted], [SubjectId]) VALUES (1020, N'27146a74-2ebb-403f-b8f4-8060e8ffe35c', 1, CAST(N'2024-12-17T16:59:34.5111369' AS DateTime2), 20, 1, 1)
INSERT [dbo].[StudentExams] ([StudentExamId], [StudentId], [ExamId], [DateTimeTaken], [Score], [IsCompleted], [SubjectId]) VALUES (1021, N'27146a74-2ebb-403f-b8f4-8060e8ffe35c', 1, CAST(N'2024-12-17T17:01:20.5059378' AS DateTime2), 30, 1, 1)
INSERT [dbo].[StudentExams] ([StudentExamId], [StudentId], [ExamId], [DateTimeTaken], [Score], [IsCompleted], [SubjectId]) VALUES (1022, N'27146a74-2ebb-403f-b8f4-8060e8ffe35c', 1, CAST(N'2024-12-17T19:01:25.4797372' AS DateTime2), 100, 1, 1)
INSERT [dbo].[StudentExams] ([StudentExamId], [StudentId], [ExamId], [DateTimeTaken], [Score], [IsCompleted], [SubjectId]) VALUES (1023, N'27146a74-2ebb-403f-b8f4-8060e8ffe35c', 1, CAST(N'2024-12-17T19:02:26.8738435' AS DateTime2), 10, 1, 1)
INSERT [dbo].[StudentExams] ([StudentExamId], [StudentId], [ExamId], [DateTimeTaken], [Score], [IsCompleted], [SubjectId]) VALUES (1024, N'27146a74-2ebb-403f-b8f4-8060e8ffe35c', 1, CAST(N'2024-12-17T19:03:44.7044819' AS DateTime2), 100, 1, 1)
INSERT [dbo].[StudentExams] ([StudentExamId], [StudentId], [ExamId], [DateTimeTaken], [Score], [IsCompleted], [SubjectId]) VALUES (1025, N'27146a74-2ebb-403f-b8f4-8060e8ffe35c', 1, CAST(N'2024-12-17T19:20:19.5481490' AS DateTime2), 0, 1, 1)
INSERT [dbo].[StudentExams] ([StudentExamId], [StudentId], [ExamId], [DateTimeTaken], [Score], [IsCompleted], [SubjectId]) VALUES (1026, N'27146a74-2ebb-403f-b8f4-8060e8ffe35c', 1, CAST(N'2024-12-17T19:21:19.4141594' AS DateTime2), 50, 1, 1)
INSERT [dbo].[StudentExams] ([StudentExamId], [StudentId], [ExamId], [DateTimeTaken], [Score], [IsCompleted], [SubjectId]) VALUES (1027, N'27146a74-2ebb-403f-b8f4-8060e8ffe35c', 1, CAST(N'2024-12-18T10:08:41.4224948' AS DateTime2), 100, 1, 1)
SET IDENTITY_INSERT [dbo].[StudentExams] OFF
GO
SET IDENTITY_INSERT [dbo].[Subjects] ON 

INSERT [dbo].[Subjects] ([SubjectId], [SubjectName], [SubjectDescription]) VALUES (1, N'Mathematics', N'Study of numbers, equations, and geometries.')
INSERT [dbo].[Subjects] ([SubjectId], [SubjectName], [SubjectDescription]) VALUES (2, N'Physics', N'Exploration of matter, energy, and the forces of nature.')
INSERT [dbo].[Subjects] ([SubjectId], [SubjectName], [SubjectDescription]) VALUES (3, N'Chemistry', N'Study of substances, their properties, and reactions.')
INSERT [dbo].[Subjects] ([SubjectId], [SubjectName], [SubjectDescription]) VALUES (4, N'Biology', N'Examination of living organisms and life processes.')
INSERT [dbo].[Subjects] ([SubjectId], [SubjectName], [SubjectDescription]) VALUES (5, N'English Literature', N'Analysis and appreciation of English literary works.')
INSERT [dbo].[Subjects] ([SubjectId], [SubjectName], [SubjectDescription]) VALUES (6, N'Computer Science', N'Study of computing systems, algorithms, and programming.')
INSERT [dbo].[Subjects] ([SubjectId], [SubjectName], [SubjectDescription]) VALUES (7, N'History', N'Review of past events and their impact on the present.')
INSERT [dbo].[Subjects] ([SubjectId], [SubjectName], [SubjectDescription]) VALUES (8, N'Geography', N'Study of the Earth''s landscapes, environments, and inhabitants.')
INSERT [dbo].[Subjects] ([SubjectId], [SubjectName], [SubjectDescription]) VALUES (9, N'Economics', N'Analysis of resource allocation, production, and consumption.')
INSERT [dbo].[Subjects] ([SubjectId], [SubjectName], [SubjectDescription]) VALUES (10, N'Philosophy', N'Exploration of fundamental questions about existence and knowledge.')
INSERT [dbo].[Subjects] ([SubjectId], [SubjectName], [SubjectDescription]) VALUES (12, N'Law', N'------')
SET IDENTITY_INSERT [dbo].[Subjects] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 12/23/2024 10:08:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 12/23/2024 10:08:23 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 12/23/2024 10:08:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 12/23/2024 10:08:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 12/23/2024 10:08:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 12/23/2024 10:08:23 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 12/23/2024 10:08:23 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Choices_QuestionId]    Script Date: 12/23/2024 10:08:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Choices_QuestionId] ON [dbo].[Choices]
(
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExamQuestions_QuestionId]    Script Date: 12/23/2024 10:08:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_ExamQuestions_QuestionId] ON [dbo].[ExamQuestions]
(
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Exams_SubjectId]    Script Date: 12/23/2024 10:08:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Exams_SubjectId] ON [dbo].[Exams]
(
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Questions_SubjectId]    Script Date: 12/23/2024 10:08:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Questions_SubjectId] ON [dbo].[Questions]
(
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StudentExamQuestionAnswers_QuestionId]    Script Date: 12/23/2024 10:08:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_StudentExamQuestionAnswers_QuestionId] ON [dbo].[StudentExamQuestionAnswers]
(
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StudentExamQuestionAnswers_SelectedChoiceId]    Script Date: 12/23/2024 10:08:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_StudentExamQuestionAnswers_SelectedChoiceId] ON [dbo].[StudentExamQuestionAnswers]
(
	[SelectedChoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StudentExamQuestionAnswers_StudentExamId]    Script Date: 12/23/2024 10:08:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_StudentExamQuestionAnswers_StudentExamId] ON [dbo].[StudentExamQuestionAnswers]
(
	[StudentExamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StudentExams_ExamId]    Script Date: 12/23/2024 10:08:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_StudentExams_ExamId] ON [dbo].[StudentExams]
(
	[ExamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_StudentExams_StudentId]    Script Date: 12/23/2024 10:08:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_StudentExams_StudentId] ON [dbo].[StudentExams]
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StudentExams_SubjectId]    Script Date: 12/23/2024 10:08:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_StudentExams_SubjectId] ON [dbo].[StudentExams]
(
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT (N'') FOR [FirstName]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT (N'') FOR [LastName]
GO
ALTER TABLE [dbo].[Exams] ADD  DEFAULT ('00:00:00') FOR [TimeLimit]
GO
ALTER TABLE [dbo].[Exams] ADD  DEFAULT ((0)) FOR [PassScore]
GO
ALTER TABLE [dbo].[Questions] ADD  DEFAULT ((0)) FOR [SubjectId]
GO
ALTER TABLE [dbo].[StudentExams] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsCompleted]
GO
ALTER TABLE [dbo].[StudentExams] ADD  DEFAULT ((0)) FOR [SubjectId]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Choices]  WITH CHECK ADD  CONSTRAINT [FK_Choices_Questions_QuestionId] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Questions] ([QuestionId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Choices] CHECK CONSTRAINT [FK_Choices_Questions_QuestionId]
GO
ALTER TABLE [dbo].[ExamQuestions]  WITH CHECK ADD  CONSTRAINT [FK_ExamQuestions_Exams_ExamId] FOREIGN KEY([ExamId])
REFERENCES [dbo].[Exams] ([ExamId])
GO
ALTER TABLE [dbo].[ExamQuestions] CHECK CONSTRAINT [FK_ExamQuestions_Exams_ExamId]
GO
ALTER TABLE [dbo].[ExamQuestions]  WITH CHECK ADD  CONSTRAINT [FK_ExamQuestions_Questions_QuestionId] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Questions] ([QuestionId])
GO
ALTER TABLE [dbo].[ExamQuestions] CHECK CONSTRAINT [FK_ExamQuestions_Questions_QuestionId]
GO
ALTER TABLE [dbo].[Exams]  WITH CHECK ADD  CONSTRAINT [FK_Exams_Subjects_SubjectId] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subjects] ([SubjectId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Exams] CHECK CONSTRAINT [FK_Exams_Subjects_SubjectId]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_Questions_Subjects_SubjectId] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subjects] ([SubjectId])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_Questions_Subjects_SubjectId]
GO
ALTER TABLE [dbo].[StudentExamQuestionAnswers]  WITH CHECK ADD  CONSTRAINT [FK_StudentExamQuestionAnswers_Choices_SelectedChoiceId] FOREIGN KEY([SelectedChoiceId])
REFERENCES [dbo].[Choices] ([ChoiceId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentExamQuestionAnswers] CHECK CONSTRAINT [FK_StudentExamQuestionAnswers_Choices_SelectedChoiceId]
GO
ALTER TABLE [dbo].[StudentExamQuestionAnswers]  WITH CHECK ADD  CONSTRAINT [FK_StudentExamQuestionAnswers_Questions_QuestionId] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Questions] ([QuestionId])
GO
ALTER TABLE [dbo].[StudentExamQuestionAnswers] CHECK CONSTRAINT [FK_StudentExamQuestionAnswers_Questions_QuestionId]
GO
ALTER TABLE [dbo].[StudentExamQuestionAnswers]  WITH CHECK ADD  CONSTRAINT [FK_StudentExamQuestionAnswers_StudentExams_StudentExamId] FOREIGN KEY([StudentExamId])
REFERENCES [dbo].[StudentExams] ([StudentExamId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentExamQuestionAnswers] CHECK CONSTRAINT [FK_StudentExamQuestionAnswers_StudentExams_StudentExamId]
GO
ALTER TABLE [dbo].[StudentExams]  WITH CHECK ADD  CONSTRAINT [FK_StudentExams_AspNetUsers_StudentId] FOREIGN KEY([StudentId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentExams] CHECK CONSTRAINT [FK_StudentExams_AspNetUsers_StudentId]
GO
ALTER TABLE [dbo].[StudentExams]  WITH CHECK ADD  CONSTRAINT [FK_StudentExams_Exams_ExamId] FOREIGN KEY([ExamId])
REFERENCES [dbo].[Exams] ([ExamId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentExams] CHECK CONSTRAINT [FK_StudentExams_Exams_ExamId]
GO
ALTER TABLE [dbo].[StudentExams]  WITH CHECK ADD  CONSTRAINT [FK_StudentExams_Subjects_SubjectId] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subjects] ([SubjectId])
GO
ALTER TABLE [dbo].[StudentExams] CHECK CONSTRAINT [FK_StudentExams_Subjects_SubjectId]
GO
USE [master]
GO
ALTER DATABASE [ExaminationSystem] SET  READ_WRITE 
GO
