CREATE TABLE [dbo].[T_Holiday_Type] (
    [I_Holiday_Type_ID]   INT           IDENTITY (1, 1) NOT NULL,
    [S_Holiday_Type_Name] VARCHAR (MAX) NOT NULL,
    [I_Status]            INT           DEFAULT ((1)) NOT NULL,
    [S_CreatedBy]         VARCHAR (MAX) NOT NULL,
    [Dt_CreatedOn]        DATETIME      NOT NULL,
    [S_UpdatedBy]         VARCHAR (MAX) NULL,
    [Dt_UpdatedOn]        DATETIME      NULL
);

