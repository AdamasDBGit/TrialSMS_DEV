CREATE TABLE [dbo].[T_ERP_User_Type] (
    [I_User_Type_ID] INT           IDENTITY (1, 1) NOT NULL,
    [S_UserType]     NVARCHAR (50) NULL,
    [I_CreatedBy]    INT           NULL,
    [Dt_CreatedAt]   DATETIME      DEFAULT (getdate()) NULL,
    [Dt_ModifiedAt]  DATETIME      NULL,
    [I_ModifiedBy]   INT           NULL,
    [Is_Active]      BIT           DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([I_User_Type_ID] ASC)
);

