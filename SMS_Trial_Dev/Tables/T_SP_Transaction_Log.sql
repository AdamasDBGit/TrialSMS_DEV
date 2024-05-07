CREATE TABLE [dbo].[T_SP_Transaction_Log] (
    [ID]        INT           IDENTITY (1, 1) NOT NULL,
    [CreatedOn] DATETIME      NULL,
    [LogText]   VARCHAR (MAX) NULL,
    [XMLText]   XML           NULL
);

