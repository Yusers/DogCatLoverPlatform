DROP DATABASE DogCatLoverPlatform
GO

CREATE DATABASE DogCatLoverPlatform
GO

USE DogCatLoverPlatform
GO


CREATE TABLE [Account] (
[user_id] VARCHAR(50) NOT NULL,
[fullname] NVARCHAR(50) NOT NULL,
[email] VARCHAR(50) NOT NULL,
[password] VARCHAR(20) NOT NULL,
[phone_number] VARCHAR(20) NOT NULL,
[description] NVARCHAR(50) NOT NULL,
[role] VARCHAR(10),
[status] VARCHAR(10) CHECK ( [status] IN ('Active', 'Inactive'))  NOT NULL,
[created_at] DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
[updated_at] DATETIME2,
[avatar] VARCHAR(100),
CONSTRAINT pk_account PRIMARY KEY ([user_id])
)
GO

CREATE TABLE [Post_category] (
[id] INT NOT NULL IDENTITY(1,1),
[name] NVARCHAR(50) NOT NULL,
[created_at] DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
[updated_at] DATETIME2,
CONSTRAINT pk_post_category PRIMARY KEY (id)
)
GO

CREATE TABLE [Post] (
[id] INT NOT NULL IDENTITY(1,1),
[title] NVARCHAR(50) NOT NULL,
[category_id] INT NOT NULL,
[author_id] VARCHAR(50) NOT NULL,
[content] NVARCHAR(255) NOT NULL,
[status] VARCHAR(20) NOT NULL,
[rejected_reason] VARCHAR(50),
[created_at] DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
[updated_at] DATETIME2,
CONSTRAINT pk_post PRIMARY KEY (id),
CONSTRAINT fk_account FOREIGN KEY (author_id) REFERENCES [Account]([user_id]),
CONSTRAINT fk_post_category FOREIGN KEY ([category_id]) REFERENCES [Post_category](id)
)
GO

CREATE TABLE [Media] (
[id] INT NOT NULL IDENTITY(1,1),
[url] VARCHAR(255) NOT NULL,
[file_name] VARCHAR(20) NOT NULL,
[created_at] DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
[updated_at] DATETIME2,
CONSTRAINT pk_media PRIMARY KEY (id)
)
GO

CREATE TABLE [Post_media] (
[id] INT NOT NULL IDENTITY(1,1),
[post_id] INT NOT NULL,
[media_id] INT NOT NULL,
CONSTRAINT pk_post_media PRIMARY KEY (id),
CONSTRAINT fk_post FOREIGN KEY (post_id) REFERENCES [Post](id),
CONSTRAINT fk_media FOREIGN KEY (media_id) REFERENCES [Media](id)
)
GO

CREATE TABLE [Notification] (
[id] INT NOT NULL IDENTITY(1,1),
[account_id] VARCHAR(50) NOT NULL,
[title] NVARCHAR(50) NOT NULL,
[content] NVARCHAR(255) NOT NULL,
[created_at] DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
[updated_at] DATETIME2,
CONSTRAINT pk_notification PRIMARY KEY (id),
CONSTRAINT fk_notificate_account FOREIGN KEY (account_id) REFERENCES [Account]([user_id])
)
GO

CREATE TABLE [Comment] (
[id] INT NOT NULL IDENTITY(1,1),
[author_id] VARCHAR(50) NOT NULL,
[post_id] INT NOT NULL,
[content] NVARCHAR(255) NOT NULL,
[parent_id] INT NOT NULL,
[created_at] DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
[updated_at] DATETIME2,
CONSTRAINT pk_comment PRIMARY KEY (id),
CONSTRAINT fk_author_comment FOREIGN KEY (author_id) REFERENCES [Account]([user_id]),
CONSTRAINT fk_post_comment FOREIGN KEY (post_id) REFERENCES [Post](id)
)
GO

CREATE TABLE [Trade] (
[id] INT NOT NULL IDENTITY(1,1),
[author_id] VARCHAR(50) NOT NULL,
[title] NVARCHAR(50) NOT NULL,
[content] NVARCHAR(255) NOT NULL,
[status] VARCHAR(20) NOT NULL,
[type] VARCHAR(20) NOT NULL,
[created_at] DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
[updated_at] DATETIME2,
CONSTRAINT pk_trade PRIMARY KEY (id),
CONSTRAINT fk_author_trade FOREIGN KEY (author_id) REFERENCES [Account]([user_id])
)
GO

CREATE TABLE [Item_category] (
[id] INT NOT NULL IDENTITY(1,1),
[name] VARCHAR(20) NOT NULL,
[created_at] DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
[updated_at] DATETIME2,
CONSTRAINT pk_item_cate PRIMARY KEY (id)
)
GO

CREATE TABLE [Trade_item] (
[id] INT NOT NULL IDENTITY(1,1),
[trade_id] INT NOT NULL, 
[item_id] INT NOT NULL,
[price] INT,
[image] VARCHAR(100),
[created_at] DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
[updated_at] DATETIME2,
CONSTRAINT pk_trade_item PRIMARY KEY (id),
CONSTRAINT fk_trade_item FOREIGN KEY (trade_id) REFERENCES [Trade](id),
CONSTRAINT fk_item_cate FOREIGN KEY (item_id) REFERENCES [Item_category](id)
)
GO

