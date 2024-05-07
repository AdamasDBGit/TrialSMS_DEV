CREATE TABLE [dbo].[T_ERP_Followup_Closure_Master] (
    [I_Followup_Closure_ID]   INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [S_Followup_Closure_Desc] VARCHAR (50) NULL,
    [I_Status]                INT          NULL,
    [I_Created_By]            INT          NULL,
    [I_Modified_By]           INT          NULL,
    [Dt_Created_At]           DATETIME     DEFAULT (getdate()) NULL,
    [Dt_Modified_At]          DATETIME     NULL,
    CONSTRAINT [PK__T_Followup_Closu__5ABA43E634] PRIMARY KEY CLUSTERED ([I_Followup_Closure_ID] ASC)
);

