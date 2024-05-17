﻿CREATE TABLE [NETWORK].[T_Premise_Master] (
    [I_Premise_ID]   INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Brand_ID]     INT           NULL,
    [I_Plan_ID]      INT           NULL,
    [S_Premise_Name] VARCHAR (20)  NULL,
    [S_Rec_No]       VARCHAR (50)  NULL,
    [S_Rec_Spec]     VARCHAR (200) NULL,
    [S_Crtd_By]      VARCHAR (20)  NULL,
    [S_Upd_By]       VARCHAR (20)  NULL,
    [Dt_Crtd_On]     DATETIME      NULL,
    [Dt_Upd_On]      DATETIME      NULL,
    [I_Status]       INT           NULL,
    CONSTRAINT [PK__T_Premise_Master__69885181] PRIMARY KEY CLUSTERED ([I_Premise_ID] ASC),
    CONSTRAINT [FK__T_Premise__I_Bra__09F52113] FOREIGN KEY ([I_Brand_ID]) REFERENCES [dbo].[T_Brand_Master] ([I_Brand_ID])
);


GO
ALTER TABLE [NETWORK].[T_Premise_Master] NOCHECK CONSTRAINT [FK__T_Premise__I_Bra__09F52113];



