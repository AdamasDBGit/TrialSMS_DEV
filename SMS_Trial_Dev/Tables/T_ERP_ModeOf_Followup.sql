CREATE TABLE [dbo].[T_ERP_ModeOf_Followup] (
    [I_ModeFollowup_ID]      INT         IDENTITY (1, 1) NOT NULL,
    [S_ModeOf_Followup_Desc] VARCHAR (1) NULL,
    [Dtt_Created_At]         DATETIME    DEFAULT (getdate()) NULL,
    [Dtt_Modified_At]        DATETIME    NULL,
    [I_Created_By]           INT         NULL,
    [I_Modified_By]          INT         NULL,
    [Is_Active]              BIT         NULL,
    PRIMARY KEY CLUSTERED ([I_ModeFollowup_ID] ASC)
);

