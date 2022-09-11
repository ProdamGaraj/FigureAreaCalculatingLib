/****** Object:  Table [dbo].[Products]    Script Date: 11.09.2022 23:32:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Products](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Categories]    Script Date: 11.09.2022 23:31:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Categories](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ProductCategories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[ProductCategory]    Script Date: 11.09.2022 23:33:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ProductCategory](
	[Id] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[CategoryId] [int] NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ProductCategory]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategory_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO

ALTER TABLE [dbo].[ProductCategory] CHECK CONSTRAINT [FK_ProductCategory_Categories]
GO

ALTER TABLE [dbo].[ProductCategory]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategory_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO

ALTER TABLE [dbo].[ProductCategory] CHECK CONSTRAINT [FK_ProductCategory_Products]
GO

USE [Store]
GO

INSERT INTO [dbo].[Categories]
           ([Id]
           ,[Name])
     VALUES
           (1, 'Fruit'),
		   (2, 'Sweet'),
		   (3, 'Healthy');
GO
INSERT INTO [dbo].[Products]
           ([Id]
           ,[Name])
     VALUES
			(1,	'Rasbery'),
			(2,	'Bounty'),
			(3,	'FereroRosher'),
			(4,	'Piknik'),
			(5,	'Lays'),
			(6,	'Apple'),
			(7,	'BMW' );
GO
INSERT INTO [dbo].[ProductCategory]
           ([Id]
           ,[ProductId]
		   ,[CategoryId])
     VALUES
			(1,	1, 2),
			(2,	1, 3),
			(3,	2, 2),
			(4,	3, 2),
			(5,	4, 2),
			(6,	5, NULL),
			(7,	6, 1),
			(8,	6, 2),
			(9,	6, 3),
			(10, 7, NULL);
GO

select p.Name, c.Name
from Products as p left join ProductCategory as pc on(p.Id=pc.ProductId) left join Categories as c on(pc.CategoryId = c.Id) 
where p.Id=pc.ProductId