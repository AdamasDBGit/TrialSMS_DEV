CREATE TABLE [dbo].[T_ERP_Subject_Component] (
    [I_Subject_Component_ID]   INT          IDENTITY (1, 1) NOT NULL,
    [S_Subject_Component_Name] VARCHAR (50) NULL,
    [Dt_Created_At]            DATETIME     DEFAULT (getdate()) NULL,
    [Dt_Modified_At]           DATETIME     NULL,
    [I_Created_By]             INT          NULL,
    [I_Modified_By]            INT          NULL,
    [Is_Active]                BIT          DEFAULT ((1)) NULL,
    [I_Brand_ID]               INT          NULL
);

