USE [TEST]
GO

/****** Object:  Table [dbo].[FILE_WATCHER]    Script Date: 2/15/2020 1:47:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FILE_WATCHER](
	[paymentmode] [varchar](100) NULL,
	[txnid] [varchar](max) NULL,
	[Ben_Name] [varchar](max) NULL,
	[Ben_code] [varchar](max) NULL,
	[Amount] [varchar](max) NULL,
	[Txn_date] [varchar](max) NULL,
	[Ben_accno] [varchar](max) NULL,
	[Ben_ifsc] [varchar](max) NULL,
	[Payer_Accno] [varchar](max) NULL,
	[Utr_no] [varchar](max) NULL,
	[Filler1] [varchar](max) NULL,
	[Pay_status] [varchar](max) NULL,
	[Filler2] [varchar](max) NULL,
	[Ben_Name2] [varchar](max) NULL,
	[Ben_Name3] [varchar](max) NULL,
	[Ref_no] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


