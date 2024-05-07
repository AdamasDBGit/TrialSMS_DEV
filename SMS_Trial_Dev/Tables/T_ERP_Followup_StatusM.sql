CREATE TABLE [dbo].[T_ERP_Followup_StatusM] (
    [I_FollowupStatus_ID]   INT           IDENTITY (1, 1) NOT NULL,
    [S_FollowupStatus_Desc] VARCHAR (100) NULL,
    [Is_Active]             BIT           DEFAULT ((1)) NULL,
    [I_Seq]                 INT           NULL
);

