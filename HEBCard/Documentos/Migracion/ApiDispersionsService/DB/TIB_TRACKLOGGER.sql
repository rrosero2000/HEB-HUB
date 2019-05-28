USE [DBTIB]
GO

/****** Object:  Table [dbo].[TIB_TRACKLOGGER]    Script Date: 24/08/2018 10:06:15 a. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TIB_TRACKLOGGER]') AND type in (N'U'))
DROP TABLE [dbo].[TIB_TRACKLOGGER]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TIB_TRACKLOGGER](
	[RUN_ID] [INTEGER] IDENTITY(1,1) NOT NULL,
	[TIBDOMAIN_NM] [VARCHAR](30) NULL,
	[DEPLOYMENT_NM] [VARCHAR](30) NULL,
	[PROJECTNAME_NM] [VARCHAR](30) NULL,
	[ENGINENAME_NM] [VARCHAR](30) NULL,
	[MESSAGEDATE_TS] [DATETIME] DEFAULT GETDATE() NOT NULL,
	[IPADDRESS_ID] [VARCHAR](30) NULL,
	[ORIGIN_NM] [VARCHAR](30) NULL,
	[TRANSACTION_ID] [VARCHAR](30) NULL,
	[MESSAGETYPE_NM] [VARCHAR](30) NULL,
	[MESSAGECONTAINER_NM] [VARCHAR](MAX) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO
