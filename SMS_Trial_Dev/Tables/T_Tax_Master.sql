﻿CREATE TABLE [dbo].[T_Tax_Master] (
    [I_Tax_ID]       INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Country_ID]   INT          NULL,
    [S_Tax_Code]     VARCHAR (10) NULL,
    [S_Tax_Desc]     VARCHAR (50) NULL,
    [C_Is_Surcharge] CHAR (1)     NULL,
    [I_Status]       INT          NULL,
    [Dt_Valid_From]  DATETIME     NULL,
    [Dt_Valid_To]    DATETIME     NULL,
    [S_Crtd_By]      VARCHAR (20) NULL,
    [S_Upd_By]       VARCHAR (20) NULL,
    [Dt_Crtd_On]     DATETIME     NULL,
    [Dt_Upd_On]      DATETIME     NULL,
    CONSTRAINT [PK__T_Tax_Master__58C8A52A] PRIMARY KEY CLUSTERED ([I_Tax_ID] ASC),
    CONSTRAINT [FK__T_Tax_Mas__I_Cou__0BA92AB2] FOREIGN KEY ([I_Country_ID]) REFERENCES [dbo].[T_Country_Master] ([I_Country_ID])
);

