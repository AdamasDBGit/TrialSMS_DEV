CREATE TABLE [dbo].[ERP_ErrorLogTable] (
    [ID]              INT            IDENTITY (1, 1) NOT NULL,
    [ErrorMessage]    VARCHAR (MAX)  NULL,
    [ErrorSeverity]   VARCHAR (MAX)  NULL,
    [ErrorState]      VARCHAR (MAX)  NULL,
    [ErrorProcedure]  VARCHAR (MAX)  NULL,
    [ErrorController] NVARCHAR (50)  NULL,
    [ErrorAction]     NVARCHAR (50)  NULL,
    [Date]            DATETIME       NULL,
    [ErrorID]         NVARCHAR (MAX) NULL,
    [UserID]          NVARCHAR (50)  NULL
);

