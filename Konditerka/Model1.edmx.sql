
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 03/30/2026 21:24:13
-- Generated from EDMX file: C:\Users\FREED\Desktop\Lern\MorozGrig\Konditerka\Konditerka\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Konditer];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Baskets_Orders]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Baskets] DROP CONSTRAINT [FK_Baskets_Orders];
GO
IF OBJECT_ID(N'[dbo].[FK_Baskets_Users]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Baskets] DROP CONSTRAINT [FK_Baskets_Users];
GO
IF OBJECT_ID(N'[dbo].[FK_BasketsCatalogs_Baskets]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BasketsCatalogs] DROP CONSTRAINT [FK_BasketsCatalogs_Baskets];
GO
IF OBJECT_ID(N'[dbo].[FK_BasketsCatalogs_Catalogs]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BasketsCatalogs] DROP CONSTRAINT [FK_BasketsCatalogs_Catalogs];
GO
IF OBJECT_ID(N'[dbo].[FK_Catalogs_Categories]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Catalogs] DROP CONSTRAINT [FK_Catalogs_Categories];
GO
IF OBJECT_ID(N'[dbo].[FK_Orders_StatusOrders]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Orders] DROP CONSTRAINT [FK_Orders_StatusOrders];
GO
IF OBJECT_ID(N'[dbo].[FK_Orders_Users]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Orders] DROP CONSTRAINT [FK_Orders_Users];
GO
IF OBJECT_ID(N'[dbo].[FK_OrdersCatalogs_Catalogs]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrdersCatalogs] DROP CONSTRAINT [FK_OrdersCatalogs_Catalogs];
GO
IF OBJECT_ID(N'[dbo].[FK_OrdersCatalogs_Orders]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrdersCatalogs] DROP CONSTRAINT [FK_OrdersCatalogs_Orders];
GO
IF OBJECT_ID(N'[dbo].[FK_Users_Roles]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Users] DROP CONSTRAINT [FK_Users_Roles];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Baskets]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Baskets];
GO
IF OBJECT_ID(N'[dbo].[BasketsCatalogs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BasketsCatalogs];
GO
IF OBJECT_ID(N'[dbo].[Catalogs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Catalogs];
GO
IF OBJECT_ID(N'[dbo].[Categories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Categories];
GO
IF OBJECT_ID(N'[dbo].[Orders]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Orders];
GO
IF OBJECT_ID(N'[dbo].[OrdersCatalogs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OrdersCatalogs];
GO
IF OBJECT_ID(N'[dbo].[Roles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Roles];
GO
IF OBJECT_ID(N'[dbo].[StatusOrders]', 'U') IS NOT NULL
    DROP TABLE [dbo].[StatusOrders];
GO
IF OBJECT_ID(N'[dbo].[sysdiagrams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sysdiagrams];
GO
IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Baskets'
CREATE TABLE [dbo].[Baskets] (
    [IdBasket] int IDENTITY(1,1) NOT NULL,
    [IdUser] int  NOT NULL,
    [TotalPrice] decimal(18,2)  NOT NULL,
    [IsOrdered] tinyint  NOT NULL,
    [CreateDate] datetime  NOT NULL,
    [IdOrder] int  NOT NULL
);
GO

-- Creating table 'BasketsCatalogs'
CREATE TABLE [dbo].[BasketsCatalogs] (
    [IdBasketCatalog] int IDENTITY(1,1) NOT NULL,
    [IdBasket] int  NOT NULL,
    [IdCatalog] int  NOT NULL,
    [Quantity] int  NOT NULL
);
GO

-- Creating table 'Catalogs'
CREATE TABLE [dbo].[Catalogs] (
    [IdCatalog] int IDENTITY(1,1) NOT NULL,
    [Product] nvarchar(100)  NOT NULL,
    [Descripton] nvarchar(500)  NOT NULL,
    [PhotoPath] nvarchar(max)  NOT NULL,
    [Price] decimal(5,2)  NOT NULL,
    [IdCategory] int  NOT NULL
);
GO

-- Creating table 'Categories'
CREATE TABLE [dbo].[Categories] (
    [IdCategory] int IDENTITY(1,1) NOT NULL,
    [NameCategory] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'Orders'
CREATE TABLE [dbo].[Orders] (
    [IdOrder] int IDENTITY(1,1) NOT NULL,
    [IdUser] int  NOT NULL,
    [IdStatusOrder] int  NOT NULL,
    [Data] datetime  NOT NULL,
    [Price] decimal(5,2)  NOT NULL
);
GO

-- Creating table 'OrdersCatalogs'
CREATE TABLE [dbo].[OrdersCatalogs] (
    [IdOrderCatalog] int IDENTITY(1,1) NOT NULL,
    [IdOrder] int  NOT NULL,
    [IdCatalog] int  NOT NULL,
    [Quantity] int  NOT NULL
);
GO

-- Creating table 'Roles'
CREATE TABLE [dbo].[Roles] (
    [IdRole] int IDENTITY(1,1) NOT NULL,
    [NameRole] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'StatusOrders'
CREATE TABLE [dbo].[StatusOrders] (
    [IdStatusOrder] int IDENTITY(1,1) NOT NULL,
    [NameStatusOrder] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [IdUser] int IDENTITY(1,1) NOT NULL,
    [NameUser] nvarchar(50)  NOT NULL,
    [IdRole] int  NOT NULL,
    [Password] nvarchar(50)  NOT NULL,
    [Email] nvarchar(50)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [IdBasket] in table 'Baskets'
ALTER TABLE [dbo].[Baskets]
ADD CONSTRAINT [PK_Baskets]
    PRIMARY KEY CLUSTERED ([IdBasket] ASC);
GO

-- Creating primary key on [IdBasketCatalog] in table 'BasketsCatalogs'
ALTER TABLE [dbo].[BasketsCatalogs]
ADD CONSTRAINT [PK_BasketsCatalogs]
    PRIMARY KEY CLUSTERED ([IdBasketCatalog] ASC);
GO

-- Creating primary key on [IdCatalog] in table 'Catalogs'
ALTER TABLE [dbo].[Catalogs]
ADD CONSTRAINT [PK_Catalogs]
    PRIMARY KEY CLUSTERED ([IdCatalog] ASC);
GO

-- Creating primary key on [IdCategory] in table 'Categories'
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [PK_Categories]
    PRIMARY KEY CLUSTERED ([IdCategory] ASC);
GO

-- Creating primary key on [IdOrder] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [PK_Orders]
    PRIMARY KEY CLUSTERED ([IdOrder] ASC);
GO

-- Creating primary key on [IdOrderCatalog] in table 'OrdersCatalogs'
ALTER TABLE [dbo].[OrdersCatalogs]
ADD CONSTRAINT [PK_OrdersCatalogs]
    PRIMARY KEY CLUSTERED ([IdOrderCatalog] ASC);
GO

-- Creating primary key on [IdRole] in table 'Roles'
ALTER TABLE [dbo].[Roles]
ADD CONSTRAINT [PK_Roles]
    PRIMARY KEY CLUSTERED ([IdRole] ASC);
GO

-- Creating primary key on [IdStatusOrder] in table 'StatusOrders'
ALTER TABLE [dbo].[StatusOrders]
ADD CONSTRAINT [PK_StatusOrders]
    PRIMARY KEY CLUSTERED ([IdStatusOrder] ASC);
GO

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- Creating primary key on [IdUser] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([IdUser] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [IdOrder] in table 'Baskets'
ALTER TABLE [dbo].[Baskets]
ADD CONSTRAINT [FK_Baskets_Orders]
    FOREIGN KEY ([IdOrder])
    REFERENCES [dbo].[Orders]
        ([IdOrder])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Baskets_Orders'
CREATE INDEX [IX_FK_Baskets_Orders]
ON [dbo].[Baskets]
    ([IdOrder]);
GO

-- Creating foreign key on [IdUser] in table 'Baskets'
ALTER TABLE [dbo].[Baskets]
ADD CONSTRAINT [FK_Baskets_Users]
    FOREIGN KEY ([IdUser])
    REFERENCES [dbo].[Users]
        ([IdUser])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Baskets_Users'
CREATE INDEX [IX_FK_Baskets_Users]
ON [dbo].[Baskets]
    ([IdUser]);
GO

-- Creating foreign key on [IdBasket] in table 'BasketsCatalogs'
ALTER TABLE [dbo].[BasketsCatalogs]
ADD CONSTRAINT [FK_BasketsCatalogs_Baskets]
    FOREIGN KEY ([IdBasket])
    REFERENCES [dbo].[Baskets]
        ([IdBasket])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BasketsCatalogs_Baskets'
CREATE INDEX [IX_FK_BasketsCatalogs_Baskets]
ON [dbo].[BasketsCatalogs]
    ([IdBasket]);
GO

-- Creating foreign key on [IdCatalog] in table 'BasketsCatalogs'
ALTER TABLE [dbo].[BasketsCatalogs]
ADD CONSTRAINT [FK_BasketsCatalogs_Catalogs]
    FOREIGN KEY ([IdCatalog])
    REFERENCES [dbo].[Catalogs]
        ([IdCatalog])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BasketsCatalogs_Catalogs'
CREATE INDEX [IX_FK_BasketsCatalogs_Catalogs]
ON [dbo].[BasketsCatalogs]
    ([IdCatalog]);
GO

-- Creating foreign key on [IdCategory] in table 'Catalogs'
ALTER TABLE [dbo].[Catalogs]
ADD CONSTRAINT [FK_Catalogs_Categories]
    FOREIGN KEY ([IdCategory])
    REFERENCES [dbo].[Categories]
        ([IdCategory])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Catalogs_Categories'
CREATE INDEX [IX_FK_Catalogs_Categories]
ON [dbo].[Catalogs]
    ([IdCategory]);
GO

-- Creating foreign key on [IdCatalog] in table 'OrdersCatalogs'
ALTER TABLE [dbo].[OrdersCatalogs]
ADD CONSTRAINT [FK_OrdersCatalogs_Catalogs]
    FOREIGN KEY ([IdCatalog])
    REFERENCES [dbo].[Catalogs]
        ([IdCatalog])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrdersCatalogs_Catalogs'
CREATE INDEX [IX_FK_OrdersCatalogs_Catalogs]
ON [dbo].[OrdersCatalogs]
    ([IdCatalog]);
GO

-- Creating foreign key on [IdStatusOrder] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [FK_Orders_StatusOrders]
    FOREIGN KEY ([IdStatusOrder])
    REFERENCES [dbo].[StatusOrders]
        ([IdStatusOrder])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Orders_StatusOrders'
CREATE INDEX [IX_FK_Orders_StatusOrders]
ON [dbo].[Orders]
    ([IdStatusOrder]);
GO

-- Creating foreign key on [IdUser] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [FK_Orders_Users]
    FOREIGN KEY ([IdUser])
    REFERENCES [dbo].[Users]
        ([IdUser])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Orders_Users'
CREATE INDEX [IX_FK_Orders_Users]
ON [dbo].[Orders]
    ([IdUser]);
GO

-- Creating foreign key on [IdOrder] in table 'OrdersCatalogs'
ALTER TABLE [dbo].[OrdersCatalogs]
ADD CONSTRAINT [FK_OrdersCatalogs_Orders]
    FOREIGN KEY ([IdOrder])
    REFERENCES [dbo].[Orders]
        ([IdOrder])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrdersCatalogs_Orders'
CREATE INDEX [IX_FK_OrdersCatalogs_Orders]
ON [dbo].[OrdersCatalogs]
    ([IdOrder]);
GO

-- Creating foreign key on [IdRole] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [FK_Users_Roles]
    FOREIGN KEY ([IdRole])
    REFERENCES [dbo].[Roles]
        ([IdRole])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Users_Roles'
CREATE INDEX [IX_FK_Users_Roles]
ON [dbo].[Users]
    ([IdRole]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------