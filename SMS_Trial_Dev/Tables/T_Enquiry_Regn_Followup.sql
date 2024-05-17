CREATE TABLE [dbo].[T_Enquiry_Regn_Followup] (
    [I_Followup_ID]           INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Followup_Closure_ID]   INT           NULL,
    [I_Employee_ID]           INT           NULL,
    [I_Enquiry_Regn_ID]       INT           NULL,
    [Dt_Followup_Date]        DATETIME      NULL,
    [Dt_Next_Followup_Date]   DATETIME      NULL,
    [S_Followup_Remarks]      VARCHAR (200) NULL,
    [S_Followup_Type]         CHAR (1)      NULL,
    [S_Followup_Status]       CHAR (1)      NULL,
    [ERP_R_I_FollowupType_ID] INT           NULL,
    [ERP_R_I_Enquiry_Type_ID] INT           NULL,
    [I_User_ID]               INT           NULL,
    CONSTRAINT [PK__T_Enquiry_Regn_F__7909C0DC] PRIMARY KEY CLUSTERED ([I_Followup_ID] ASC),
    CONSTRAINT [FK__T_Enquiry__I_Enq__37FB178E] FOREIGN KEY ([I_Enquiry_Regn_ID]) REFERENCES [dbo].[T_Enquiry_Regn_Detail] ([I_Enquiry_Regn_ID]),
    CONSTRAINT [FK__T_Enquiry__I_Fol__3612CF1C] FOREIGN KEY ([I_Followup_Closure_ID]) REFERENCES [dbo].[T_Followup_Closure_Master] ([I_Followup_Closure_ID]),
    CONSTRAINT [FK__T_Enquiry__I_Pro__3706F355] FOREIGN KEY ([I_Employee_ID]) REFERENCES [dbo].[T_Employee_Dtls] ([I_Employee_ID])
);


GO
ALTER TABLE [dbo].[T_Enquiry_Regn_Followup] NOCHECK CONSTRAINT [FK__T_Enquiry__I_Pro__3706F355];



