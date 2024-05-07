﻿CREATE TABLE [NETWORK].[T_Upgrade_Request_Audit] (
    [I_Upgrade_Request_Audit_ID]  INT            IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Center_Upgrade_Request_ID] INT            NOT NULL,
    [I_Centre_Id]                 INT            NULL,
    [S_Reason]                    VARCHAR (200)  NULL,
    [S_Remarks]                   VARCHAR (1000) NULL,
    [I_Is_Upgrade]                BIT            NULL,
    [S_Crtd_By]                   VARCHAR (20)   NULL,
    [S_Upd_By]                    VARCHAR (20)   NULL,
    [Dt_Crtd_On]                  DATETIME       NULL,
    [Dt_Upd_On]                   DATETIME       NULL,
    [I_Requested_Category]        INT            NULL,
    [I_Status]                    INT            NULL,
    CONSTRAINT [PK__T_Upgrade_Reques__62E57593] PRIMARY KEY CLUSTERED ([I_Upgrade_Request_Audit_ID] ASC),
    CONSTRAINT [FK__T_Upgrade__I_Cen__58739F6F] FOREIGN KEY ([I_Centre_Id]) REFERENCES [dbo].[T_Centre_Master] ([I_Centre_Id])
);

