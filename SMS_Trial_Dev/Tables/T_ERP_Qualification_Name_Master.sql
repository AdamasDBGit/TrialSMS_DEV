CREATE TABLE [dbo].[T_ERP_Qualification_Name_Master] (
    [I_Qualification_Name_ID] INT          IDENTITY (1, 1) NOT NULL,
    [I_Qualification_Type_ID] INT          NULL,
    [S_Qualification_Name]    VARCHAR (50) NULL,
    [I_Created_By]            INT          NULL,
    [I_Modified_By]           INT          NULL,
    [Dtt_Created_At]          DATETIME     DEFAULT (getdate()) NULL,
    [Dtt_Modified_At]         DATETIME     NULL,
    [Is_Active]               BIT          DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([I_Qualification_Name_ID] ASC)
);

