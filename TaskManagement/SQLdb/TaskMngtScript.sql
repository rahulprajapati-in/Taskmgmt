/****** Object:  Database [testdb]    Script Date: 20-07-2024 18:27:43 ******/
CREATE DATABASE [testdb]  (EDITION = 'GeneralPurpose', SERVICE_OBJECTIVE = 'GP_S_Gen5_1', MAXSIZE = 32 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS, LEDGER = OFF;
GO
ALTER DATABASE [testdb] SET COMPATIBILITY_LEVEL = 160
GO
ALTER DATABASE [testdb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [testdb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [testdb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [testdb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [testdb] SET ARITHABORT OFF 
GO
ALTER DATABASE [testdb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [testdb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [testdb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [testdb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [testdb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [testdb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [testdb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [testdb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [testdb] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [testdb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [testdb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [testdb] SET  MULTI_USER 
GO
ALTER DATABASE [testdb] SET ENCRYPTION ON
GO
ALTER DATABASE [testdb] SET QUERY_STORE = ON
GO
ALTER DATABASE [testdb] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/*** The scripts of database scoped configurations in Azure should be executed inside the target database connection. ***/
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 20-07-2024 18:27:43 ******/
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
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 20-07-2024 18:27:43 ******/
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
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 20-07-2024 18:27:43 ******/
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
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 20-07-2024 18:27:43 ******/
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
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 20-07-2024 18:27:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 20-07-2024 18:27:43 ******/
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
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 20-07-2024 18:27:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
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
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 20-07-2024 18:27:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaskMgnt]    Script Date: 20-07-2024 18:27:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskMgnt](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TaskName] [nvarchar](max) NOT NULL,
	[EmployeeId] [nvarchar](max) NOT NULL,
	[Notes] [nvarchar](max) NULL,
	[Attechment] [varbinary](max) NULL,
	[TaskStartDate] [datetime2](7) NOT NULL,
	[TaskEndDate] [datetime2](7) NOT NULL,
	[TaskStatus] [bit] NOT NULL,
	[CreatedBy] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [nvarchar](max) NULL,
	[ModifiedDate] [datetime2](7) NULL,
	[FileName] [nvarchar](max) NULL,
 CONSTRAINT [PK_TaskMgnt] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersMap]    Script Date: 20-07-2024 18:27:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersMap](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [nvarchar](max) NOT NULL,
	[ManagerId] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_UsersMap] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'00000000000000_CreateIdentitySchema', N'8.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240718143935_InitialCreate', N'8.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240719052714_removeColumn', N'8.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240719055137_AddTasktbl', N'8.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240719055432_AddTaskMgnt', N'8.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240720115716_addColumns-FileName', N'8.0.7')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'0eeeac2d-0280-4167-acb5-06df67f2fe30', N'Employees', N'EMPLOYEES', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'2afbc5ab-7184-4c1a-94bf-430521da4368', N'Managers', N'MANAGERS', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'769bf206-8979-45e8-938e-d29839392bf3', N'Admin', N'ADMIN', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'cf772034-6d07-48ed-a4e8-b192402b2b89', N'TeamLeaders', N'TEAMLEADERS', NULL)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'173d6068-985b-4a75-ab81-c113b1b57935', N'0eeeac2d-0280-4167-acb5-06df67f2fe30')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3ed74dd0-3853-4c35-b860-fdf908fff141', N'0eeeac2d-0280-4167-acb5-06df67f2fe30')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'6bbeb334-887e-4f5a-b471-36600378ee71', N'0eeeac2d-0280-4167-acb5-06df67f2fe30')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8816f871-ed40-4cef-bf58-ac29ebe0f550', N'0eeeac2d-0280-4167-acb5-06df67f2fe30')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'cc7198b2-dc63-403e-b92a-b10c685bf82e', N'0eeeac2d-0280-4167-acb5-06df67f2fe30')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0b4bb3c5-509e-4082-908c-f63f12d97537', N'2afbc5ab-7184-4c1a-94bf-430521da4368')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0d840b19-0a37-4da4-a974-14abeda7416a', N'2afbc5ab-7184-4c1a-94bf-430521da4368')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'5993cf78-c065-41e9-97b7-da4cafa28a55', N'2afbc5ab-7184-4c1a-94bf-430521da4368')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd4199c37-558a-48de-9da7-a00f55fd6488', N'2afbc5ab-7184-4c1a-94bf-430521da4368')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1baaa65f-ba22-4c71-a74b-eea42d5e5058', N'769bf206-8979-45e8-938e-d29839392bf3')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'0b4bb3c5-509e-4082-908c-f63f12d97537', N'Manager1@gmail.com', N'MANAGER1@GMAIL.COM', N'Manager1@gmail.com', N'MANAGER1@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEFi80ji3EOKV6eUXS3wtwX6qnR41tn0JBZpMGSd6vr75W4yQQxOpYr9RKv9/jl2//w==', N'PZXDCEIPX6GUZ2B5ZJQ6ON35DPPLBZZL', N'135a83e9-ddce-4934-94a3-4154a791ef0b', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'0d840b19-0a37-4da4-a974-14abeda7416a', N'TeamLeaders1@gmail.com', N'TEAMLEADERS1@GMAIL.COM', N'TeamLeaders1@gmail.com', N'TEAMLEADERS1@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEIRlZ918g2o2qVi6W9TU/inUfyHIU9xcbsWDt33NZ0zU7qVyoSwsf2Qolhnkc3cfwg==', N'WZQT5U62P4PHMK2GCVOAPOI2OYD6HT4H', N'cf4f505d-a468-4240-8e88-d1a52419f859', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'173d6068-985b-4a75-ab81-c113b1b57935', N'rahul@gmail.com', N'RAHUL@GMAIL.COM', N'rahul@gmail.com', N'RAHUL@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEN4Y3fb19hI/RpVnkumHiXvn7X0bJbXLXy5ZCSguYTEtVozlzZlquO8VFSaZM4OjIg==', N'RI2A6UPKV5QYW7XEKCG5C3LIYNRMH6BV', N'751dd006-ad24-4531-91ad-5d19bda3636f', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'1baaa65f-ba22-4c71-a74b-eea42d5e5058', N'Admin@gmail.com', N'ADMIN@GMAIL.COM', N'Admin@gmail.com', N'ADMIN@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAELRErZ+a2dCvqD5V3vX/5/tQh/kbENkJSFExfdpLeHB/+lmCgNmcpksK82nVGbOVIw==', N'UCGIXULCNCFQXLGSL62B2P34DRCP3TO3', N'049e03d5-84cb-402c-bf37-d292fd6f75d0', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'3ed74dd0-3853-4c35-b860-fdf908fff141', N'Employee3@gmail.com', N'EMPLOYEE3@GMAIL.COM', N'Employee3@gmail.com', N'EMPLOYEE3@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEEyCAglyM7MdIBCtUDppm32sOIUUVNlL9K3jW1/o3T6faxQCx/UMFwKryFpDb2QBTA==', N'LPZ4KGSOSCSCRSZIBBQR6ZX6EEA6ESWP', N'a25d8047-a31c-4957-81e9-b947e4314da0', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'5993cf78-c065-41e9-97b7-da4cafa28a55', N'Manager2@gmail.com', N'MANAGER2@GMAIL.COM', N'Manager2@gmail.com', N'MANAGER2@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEChJnlFaxpWE9s4bc4YCWwKxU0ssG38H6KwAWR4cx81gXDjYLr6WzYTbPcT3CGGRRw==', N'OYQXFEH7GPNKAHSP6BYQNQEWYN73J4RE', N'b145a176-91db-4bca-bc52-d0f9d85fff50', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'6bbeb334-887e-4f5a-b471-36600378ee71', N'Employee2@gmail.com', N'EMPLOYEE2@GMAIL.COM', N'Employee2@gmail.com', N'EMPLOYEE2@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEBqikf+CFhanaejiaLdbgSe1dVsfdUHakjzQGQegzgxW2iM8hzaoto/6xa03MY3aqQ==', N'FV3BS2F36LYJ7XQD7VCP3HCK7XDLM5I3', N'ada17568-5d66-49b8-8575-ae28d88c67ff', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'8816f871-ed40-4cef-bf58-ac29ebe0f550', N'employee1@gmail.com', N'EMPLOYEE1@GMAIL.COM', N'employee1@gmail.com', N'EMPLOYEE1@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEDbn0MjBcnktEAMcJ5e7jZgw2sjwGud9KGT5dv7GjC5wnuHQDmugpGSDyzJ/i24qLQ==', N'D6JFTW4W6HZ5DZEDUHP6AWN7FEY4JVZ5', N'58ffed2c-7695-4936-8143-e18b2ca6451e', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'cc7198b2-dc63-403e-b92a-b10c685bf82e', N'Employee4@gmail.com', N'EMPLOYEE4@GMAIL.COM', N'Employee4@gmail.com', N'EMPLOYEE4@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEN/VKzW9brthNCk17h76xwN39x1jk0ZprgoMzWClP7ZE5g9sxNFv9sudOWhTX49AmA==', N'RG6WEMSROV4XPZKCHTTZ64L7MIFV5GR5', N'8c393db7-a28a-44a5-9eaa-fe01cd779540', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'd4199c37-558a-48de-9da7-a00f55fd6488', N'TeamLeaders@gmail.com', N'TEAMLEADERS@GMAIL.COM', N'TeamLeaders@gmail.com', N'TEAMLEADERS@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEIdcSgykCJU4mFpbilzUHrzhE/zksf1/S7om1pVcRZ8hnEhnNlxbegsdt088W4M5zw==', N'3FPRTOAR4ACUYBCZ35KGXZQ2OCABTTAH', N'0448f570-e575-434d-b88d-1acfcd0be02d', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[TaskMgnt] ON 

INSERT [dbo].[TaskMgnt] ([Id], [TaskName], [EmployeeId], [Notes], [Attechment], [TaskStartDate], [TaskEndDate], [TaskStatus], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [FileName]) VALUES (1, N'Task1', N'8816f871-ed40-4cef-bf58-ac29ebe0f550', N'Adding Notes', NULL, CAST(N'2024-07-15T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-20T00:00:00.0000000' AS DateTime2), 0, N'1baaa65f-ba22-4c71-a74b-eea42d5e5058', CAST(N'2024-07-14T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[TaskMgnt] ([Id], [TaskName], [EmployeeId], [Notes], [Attechment], [TaskStartDate], [TaskEndDate], [TaskStatus], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [FileName]) VALUES (2, N'Task emp2', N'6bbeb334-887e-4f5a-b471-36600378ee71', N'Test- EMP 2', NULL, CAST(N'2024-07-12T17:05:00.0000000' AS DateTime2), CAST(N'2024-07-27T17:05:00.0000000' AS DateTime2), 0, N'1baaa65f-ba22-4c71-a74b-eea42d5e5058', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[TaskMgnt] ([Id], [TaskName], [EmployeeId], [Notes], [Attechment], [TaskStartDate], [TaskEndDate], [TaskStatus], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [FileName]) VALUES (3, N'Task0 emp2 ', N'6bbeb334-887e-4f5a-b471-36600378ee71', N'testing', NULL, CAST(N'2024-07-10T17:47:00.0000000' AS DateTime2), CAST(N'2024-08-02T17:47:00.0000000' AS DateTime2), 0, N'1baaa65f-ba22-4c71-a74b-eea42d5e5058', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[TaskMgnt] ([Id], [TaskName], [EmployeeId], [Notes], [Attechment], [TaskStartDate], [TaskEndDate], [TaskStatus], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [FileName]) VALUES (4, N'Task emp 3', N'3ed74dd0-3853-4c35-b860-fdf908fff141', N'Testing EMP 3', NULL, CAST(N'2024-07-17T17:49:00.0000000' AS DateTime2), CAST(N'2024-07-24T17:49:00.0000000' AS DateTime2), 0, N'1baaa65f-ba22-4c71-a74b-eea42d5e5058', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[TaskMgnt] ([Id], [TaskName], [EmployeeId], [Notes], [Attechment], [TaskStartDate], [TaskEndDate], [TaskStatus], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [FileName]) VALUES (5, N'emp 4', N'cc7198b2-dc63-403e-b92a-b10c685bf82e', N'test emp4 ', NULL, CAST(N'2024-07-24T17:50:00.0000000' AS DateTime2), CAST(N'2024-07-26T17:50:00.0000000' AS DateTime2), 0, N'1baaa65f-ba22-4c71-a74b-eea42d5e5058', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[TaskMgnt] ([Id], [TaskName], [EmployeeId], [Notes], [Attechment], [TaskStartDate], [TaskEndDate], [TaskStatus], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [FileName]) VALUES (6, N'emp 4', N'cc7198b2-dc63-403e-b92a-b10c685bf82e', N'test emp4', NULL, CAST(N'2024-07-05T17:52:00.0000000' AS DateTime2), CAST(N'2024-07-12T17:52:00.0000000' AS DateTime2), 0, N'1baaa65f-ba22-4c71-a74b-eea42d5e5058', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[TaskMgnt] OFF
GO
SET IDENTITY_INSERT [dbo].[UsersMap] ON 

INSERT [dbo].[UsersMap] ([id], [EmployeeId], [ManagerId]) VALUES (1, N'8816f871-ed40-4cef-bf58-ac29ebe0f550', N'0b4bb3c5-509e-4082-908c-f63f12d97537')
INSERT [dbo].[UsersMap] ([id], [EmployeeId], [ManagerId]) VALUES (2, N'6bbeb334-887e-4f5a-b471-36600378ee71', N'5993cf78-c065-41e9-97b7-da4cafa28a55')
INSERT [dbo].[UsersMap] ([id], [EmployeeId], [ManagerId]) VALUES (3, N'3ed74dd0-3853-4c35-b860-fdf908fff141', N'0b4bb3c5-509e-4082-908c-f63f12d97537')
INSERT [dbo].[UsersMap] ([id], [EmployeeId], [ManagerId]) VALUES (4, N'cc7198b2-dc63-403e-b92a-b10c685bf82e', N'5993cf78-c065-41e9-97b7-da4cafa28a55')
INSERT [dbo].[UsersMap] ([id], [EmployeeId], [ManagerId]) VALUES (5, N'0b4bb3c5-509e-4082-908c-f63f12d97537', N'0b4bb3c5-509e-4082-908c-f63f12d97537')
INSERT [dbo].[UsersMap] ([id], [EmployeeId], [ManagerId]) VALUES (6, N'5993cf78-c065-41e9-97b7-da4cafa28a55', N'5993cf78-c065-41e9-97b7-da4cafa28a55')
INSERT [dbo].[UsersMap] ([id], [EmployeeId], [ManagerId]) VALUES (7, N'173d6068-985b-4a75-ab81-c113b1b57935', N'0b4bb3c5-509e-4082-908c-f63f12d97537')
SET IDENTITY_INSERT [dbo].[UsersMap] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 20-07-2024 18:27:47 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 20-07-2024 18:27:47 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 20-07-2024 18:27:47 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 20-07-2024 18:27:47 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 20-07-2024 18:27:47 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 20-07-2024 18:27:47 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 20-07-2024 18:27:47 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
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
ALTER DATABASE [testdb] SET  READ_WRITE 
GO
