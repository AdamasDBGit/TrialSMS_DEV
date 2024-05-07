﻿CREATE TABLE [dbo].[T_Discount_Details] (
    [I_Discount_Detail_ID] INT             IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Discount_Scheme_ID] INT             NULL,
    [I_CourseList_ID]      INT             NULL,
    [N_Range_From]         NUMERIC (18)    NULL,
    [N_Range_To]           NUMERIC (18)    NULL,
    [N_Discount_Rate]      NUMERIC (18)    NULL,
    [N_Discount_Amount]    DECIMAL (14, 2) NULL,
    [S_IsApplicableOn]     VARCHAR (5)     NULL,
    [S_FromInstalment]     VARCHAR (5)     NULL,
    [S_Instalments]        VARCHAR (MAX)   NULL,
    [S_FeeComponents]      VARCHAR (MAX)   NULL,
    CONSTRAINT [PK__T_Discount_Detai__34A9A997] PRIMARY KEY CLUSTERED ([I_Discount_Detail_ID] ASC)
);

