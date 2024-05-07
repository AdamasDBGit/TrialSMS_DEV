﻿CREATE TABLE [dbo].[T_ERP_User_Nationality] (
    [I_Nationality_ID] INT           IDENTITY (1, 1) NOT NULL,
    [S_Nationality]    VARCHAR (100) NULL,
    [Dtt_Created_At]   DATETIME      DEFAULT (getdate()) NULL,
    [Dtt_Modified_At]  DATETIME      NULL,
    [I_Created_By]     INT           NULL,
    [I_Modified_By]    INT           NULL,
    [Is_Active]        BIT           DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([I_Nationality_ID] ASC)
);

