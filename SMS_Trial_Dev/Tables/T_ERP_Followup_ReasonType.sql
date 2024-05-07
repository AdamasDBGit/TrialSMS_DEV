CREATE TABLE [dbo].[T_ERP_Followup_ReasonType] (
    [I_FollowupReasonType_ID] INT           IDENTITY (1, 1) NOT NULL,
    [S_Reson_Desc]            VARCHAR (100) NULL,
    [R_I_FollowupType_ID]     INT           NULL,
    [Dtt_Created_At]          DATETIME      DEFAULT (getdate()) NULL,
    [Dtt_Modified_At]         DATETIME      NULL,
    [I_Created_By]            INT           NULL,
    [I_Modified_By]           INT           NULL,
    [Is_Active]               BIT           NULL,
    PRIMARY KEY CLUSTERED ([I_FollowupReasonType_ID] ASC)
);

