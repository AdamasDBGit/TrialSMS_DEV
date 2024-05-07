CREATE TABLE [dbo].[T_ERP_Document_Type_Master] (
    [I_Document_Type_ID]   INT          IDENTITY (1, 1) NOT NULL,
    [S_Document_Type_Name] VARCHAR (20) NULL,
    [Is_Mandatory]         BIT          DEFAULT ((0)) NULL,
    [Is_Active]            BIT          DEFAULT ((1)) NULL,
    [I_CreatedBy]          INT          NULL,
    [I_UpdatedBy]          INT          NULL,
    [Dtt_CreatedAt]        DATETIME     DEFAULT (getdate()) NULL,
    [Dtt_UpdatedAt]        DATETIME     NULL,
    PRIMARY KEY CLUSTERED ([I_Document_Type_ID] ASC)
);

