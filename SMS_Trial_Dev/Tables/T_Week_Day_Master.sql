CREATE TABLE [dbo].[T_Week_Day_Master] (
    [I_Day_ID]     INT           IDENTITY (1, 1) NOT NULL,
    [S_Day_Name]   VARCHAR (MAX) NOT NULL,
    [S_CreatedBy]  VARCHAR (MAX) NOT NULL,
    [Dt_CreatedOn] DATETIME      NOT NULL,
    [S_UpdatedBy]  VARCHAR (MAX) NULL,
    [Dt_UpdatedOn] DATETIME      NULL
);

