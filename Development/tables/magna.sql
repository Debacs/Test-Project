USE [magna consolidated]
GO
/****** Object:  Table [dbo].[BusinessUnit]    Script Date: 5/22/2020 2:49:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusinessUnit](
	[BusinessUnitID] [nvarchar](50) NOT NULL,
	[BusinessUnit] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_BusinessUnit] PRIMARY KEY CLUSTERED 
(
	[BusinessUnitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientType]    Script Date: 5/22/2020 2:49:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientType](
	[ClientTypeID] [int] NOT NULL,
	[ClientType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ClientType] PRIMARY KEY CLUSTERED 
(
	[ClientTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanyInfo]    Script Date: 5/22/2020 2:49:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyInfo](
	[CompanyID] [nvarchar](50) NOT NULL,
	[CompanyName] [nchar](10) NOT NULL,
	[CompanyPhone] [nchar](10) NULL,
	[CompanyWebsite] [nchar](10) NULL,
	[CompanyAddress] [nchar](10) NULL,
	[ClientTypeID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanyRep]    Script Date: 5/22/2020 2:49:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyRep](
	[CompanyRepID] [nvarchar](50) NOT NULL,
	[CRFirstName] [nvarchar](50) NOT NULL,
	[CRLastName] [nvarchar](50) NOT NULL,
	[CRTitle] [nvarchar](50) NULL,
	[CRPhone] [nvarchar](50) NULL,
	[CREmail] [nvarchar](50) NULL,
	[CompanyID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CompanyRep] PRIMARY KEY CLUSTERED 
(

GO
/****** Object:  Table [dbo].[Interaction]    Script Date: 5/22/2020 2:49:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Interaction](
	[InteractionID] [int] IDENTITY(1,1) NOT NULL,
	[InteractionDescription] [nvarchar](max) NULL,
	[InteractionDate] [date] NOT NULL,
	[InteractionTypeID] [int] NOT NULL,
	[WorkPlanID] [int] NOT NULL,
	[ProjectID] [nvarchar](50) NOT NULL,
	[Expense] [money] NULL,
	[Follow-upDueDate] [date] NULL,
	[NextStepDueDate] [date] NOT NULL,
	[ActualNextStepDate] [date] NULL,
	[ManagerAction?] [bit] NULL,
	[ProjectedProjectBudget] [money] NULL,
	[LikelihoodOfProjectApproval] [int] NULL,
	[ApprovedProjectBudget] [money] NULL,
 CONSTRAINT [PK_Interaction] PRIMARY KEY CLUSTERED 
(
	[InteractionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InteractionType]    Script Date: 5/22/2020 2:49:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InteractionType](
	[InteractionTypeID] [int] NOT NULL,
	[InteractionType] [varchar](50) NOT NULL,
 CONSTRAINT [PK_InteractionType] PRIMARY KEY CLUSTERED 
(
	[InteractionTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manager]    Script Date: 5/22/2020 2:49:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manager](
	[ManagerID] [varchar](50) NOT NULL,
	[MFirstName] [nvarchar](50) NOT NULL,
	[MLastName] [nvarchar](50) NOT NULL,
	[MTitle] [nvarchar](50) NULL,
	[BusinessUnitID] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectInfo]    Script Date: 5/22/2020 2:49:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectInfo](
	[ProjectID] [nvarchar](50) NULL,
	[ProjectName] [nvarchar](50) NOT NULL,
	[ProjectedProjectBudget] [money] NULL,
	[ApprovedBudgetAmount] [money] NULL,
	[InitialContactDate] [date] NULL,
	[ProjectApprovalDate] [date] NULL,
	[LengthofTimetoAcquireProject]  AS (datediff(day,[ProjectApprovalDate],[InitialContactDate])),
	[ManagerID] [nvarchar](50) NULL,
	[CompanyRepID] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Workplan]    Script Date: 5/22/2020 2:49:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

