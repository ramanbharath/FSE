
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/13/2019 20:50:49
-- Generated from EDMX file: C:\New folder\Senthil\Product_manager_2\Git-Projects\ProjectManagerService\ProjectManagerService\ProjectManager.DataAccessLayer\ProjectModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [ProjectManager];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Tasks_ParentTasks]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Tasks] DROP CONSTRAINT [FK_Tasks_ParentTasks];
GO
IF OBJECT_ID(N'[dbo].[FK_Users_Projects]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Users] DROP CONSTRAINT [FK_Users_Projects];
GO
IF OBJECT_ID(N'[dbo].[FK_Users_Tasks]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Users] DROP CONSTRAINT [FK_Users_Tasks];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[ParentTasks]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ParentTasks];
GO
IF OBJECT_ID(N'[dbo].[Projects]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Projects];
GO
IF OBJECT_ID(N'[dbo].[Tasks]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Tasks];
GO
IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'ParentTasks'
CREATE TABLE [dbo].[ParentTasks] (
    [ParentTaskID] int IDENTITY(1,1) NOT NULL,
    [ParentTask] varchar(100)  NOT NULL
);
GO

-- Creating table 'Projects'
CREATE TABLE [dbo].[Projects] (
    [ProjectID] int IDENTITY(1,1) NOT NULL,
    [Project] varchar(100)  NOT NULL,
    [StartDate] datetime  NULL,
    [EndDate] datetime  NULL,
    [Priority] int  NOT NULL
);
GO

-- Creating table 'Tasks'
CREATE TABLE [dbo].[Tasks] (
    [TaskID] int IDENTITY(1,1) NOT NULL,
    [ParentTaskID] int  NULL,
    [ProjectID] int  NULL,
    [StartDate] datetime  NOT NULL,
    [EndDate] datetime  NOT NULL,
    [Priority] int  NOT NULL,
    [Status] bit  NOT NULL,
    [Task] varchar(100)  NOT NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [UserID] int IDENTITY(1,1) NOT NULL,
    [FirstName] varchar(30)  NOT NULL,
    [LastName] varchar(30)  NOT NULL,
    [EmployeeID] varchar(6)  NOT NULL,
    [ProjectID] int  NULL,
    [TaskID] int  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ParentTaskID] in table 'ParentTasks1'
ALTER TABLE [dbo].[ParentTasks]
ADD CONSTRAINT [PK_ParentTasks]
    PRIMARY KEY CLUSTERED ([ParentTaskID] ASC);
GO

-- Creating primary key on [ProjectID] in table 'Projects1'
ALTER TABLE [dbo].[Projects]
ADD CONSTRAINT [PK_Projects]
    PRIMARY KEY CLUSTERED ([ProjectID] ASC);
GO

-- Creating primary key on [TaskID] in table 'Tasks1'
ALTER TABLE [dbo].[Tasks]
ADD CONSTRAINT [PK_Tasks]
    PRIMARY KEY CLUSTERED ([TaskID] ASC);
GO

-- Creating primary key on [UserID] in table 'Users1'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([UserID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [ParentTaskID] in table 'Tasks1'
ALTER TABLE [dbo].[Tasks]
ADD CONSTRAINT [FK_Tasks_ParentTasks]
    FOREIGN KEY ([ParentTaskID])
    REFERENCES [dbo].[ParentTasks]
        ([ParentTaskID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Tasks_ParentTasks'
CREATE INDEX [IX_FK_Tasks_ParentTasks]
ON [dbo].[Tasks]
    ([ParentTaskID]);
GO

-- Creating foreign key on [ProjectID] in table 'Users1'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [FK_Users_Projects]
    FOREIGN KEY ([ProjectID])
    REFERENCES [dbo].[Projects]
        ([ProjectID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Users_Projects'
CREATE INDEX [IX_FK_Users_Projects]
ON [dbo].[Users]
    ([ProjectID]);
GO

-- Creating foreign key on [TaskID] in table 'Users1'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [FK_Users_Tasks]
    FOREIGN KEY ([TaskID])
    REFERENCES [dbo].[Tasks]
        ([TaskID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Users_Tasks'
CREATE INDEX [IX_FK_Users_Tasks]
ON [dbo].[Users]
    ([TaskID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------