CREATE TABLE [dbo].[T_Holiday_Calender_Title_Master] (
    [I_Calender_Title_ID]   INT           IDENTITY (1, 1) NOT NULL,
    [I_Brand_ID]            INT           NULL,
    [S_Calender_Title_Name] VARCHAR (MAX) NOT NULL,
    [Is_Default]            INT           NULL,
    [I_Status]              INT           CONSTRAINT [DF__Holiday_C__I_Sta__41D9B94D] DEFAULT ((1)) NOT NULL,
    [S_CreatedBy]           VARCHAR (MAX) NOT NULL,
    [Dt_CreatedOn]          DATETIME      NOT NULL,
    [S_UpdatedBy]           VARCHAR (MAX) NULL,
    [Dt_UpdatedOn]          DATETIME      NULL
);

