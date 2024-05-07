CREATE TABLE [dbo].[MetaData] (
    [Name]          VARCHAR (100)    NOT NULL,
    [Description]   VARCHAR (2000)   NULL,
    [SelectCommand] VARCHAR (1000)   NOT NULL,
    [UpdateCommand] VARCHAR (1000)   NULL,
    [InsertCommand] VARCHAR (1000)   NULL,
    [DeleteCommand] VARCHAR (1000)   NULL,
    [RefreshPerDay] DECIMAL (15, 10) NULL,
    [IsActive]      BIT              NOT NULL,
    CONSTRAINT [PK_MetaData] PRIMARY KEY CLUSTERED ([Name] ASC)
);

