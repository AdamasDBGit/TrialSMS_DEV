﻿CREATE TABLE [dbo].[T_Enquiry_Education_Qualification] (
    [I_Enquiry_Education_Qualification_ID] INT           IDENTITY (1, 1) NOT NULL,
    [I_Enquiry_Regn_ID]                    INT           NOT NULL,
    [S_Crtd_By]                            VARCHAR (MAX) NULL,
    [S_Upd_By]                             VARCHAR (MAX) NULL,
    [Dt_Crtd_On]                           DATETIME      NULL,
    [Dt_Upd_On]                            DATETIME      NULL,
    [I_Education_Qualification_ID]         INT           NULL
);

