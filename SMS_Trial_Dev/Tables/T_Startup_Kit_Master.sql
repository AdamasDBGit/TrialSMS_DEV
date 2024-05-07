﻿CREATE TABLE [NETWORK].[T_Startup_Kit_Master] (
    [I_Startup_Kit_ID] INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Brand_ID]       INT           NULL,
    [I_Plan_ID]        INT           NULL,
    [S_Material_Item]  VARCHAR (20)  NULL,
    [S_Rec_Spec]       VARCHAR (200) NULL,
    [S_Rec_No]         VARCHAR (50)  NULL,
    [S_Crtd_By]        VARCHAR (20)  NULL,
    [S_Upd_By]         VARCHAR (20)  NULL,
    [Dt_Crtd_On]       DATETIME      NULL,
    [Dt_Upd_On]        DATETIME      NULL,
    [I_Status]         INT           NULL,
    CONSTRAINT [PK__T_Startup_Kit_Ma__71297349] PRIMARY KEY CLUSTERED ([I_Startup_Kit_ID] ASC),
    CONSTRAINT [FK__T_Startup__I_Bra__0FADFA69] FOREIGN KEY ([I_Brand_ID]) REFERENCES [dbo].[T_Brand_Master] ([I_Brand_ID])
);

