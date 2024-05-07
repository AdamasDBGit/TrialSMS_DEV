CREATE TABLE [dbo].[CacheObject] (
    [Name]         VARCHAR (50)  NOT NULL,
    [Description]  VARCHAR (100) NULL,
    [ClassName]    VARCHAR (100) NULL,
    [ExpiresIn]    DECIMAL (18)  NULL,
    [UtilizeCache] BIT           NULL,
    [CacheKey]     VARCHAR (50)  NULL,
    CONSTRAINT [PK_CacheObject] PRIMARY KEY CLUSTERED ([Name] ASC)
);

