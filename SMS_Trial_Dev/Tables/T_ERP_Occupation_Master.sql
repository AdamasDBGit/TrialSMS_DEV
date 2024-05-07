CREATE TABLE [dbo].[T_ERP_Occupation_Master] (
    [I_Occupation_ID]   INT          IDENTITY (1, 1) NOT NULL,
    [S_Occupation_Name] VARCHAR (50) NULL,
    [Dtt_Created_At]    DATETIME     DEFAULT (getdate()) NULL,
    [Dtt_Modified_At]   DATETIME     NULL,
    [I_Created_By]      INT          NULL,
    [I_Modified_By]     INT          NULL,
    [Is_Active]         BIT          DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([I_Occupation_ID] ASC)
);

