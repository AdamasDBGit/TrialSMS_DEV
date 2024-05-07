﻿CREATE TABLE [dbo].[T_ERP_Stud_Fee_Struct_Comp_Mapping] (
    [I_Stud_Fee_Struct_CompMap_ID] BIGINT          IDENTITY (1, 1) NOT NULL,
    [R_I_Enquiry_Regn_ID]          BIGINT          NULL,
    [R_I_Student_Detail_ID]        BIGINT          NULL,
    [R_I_Fee_Structure_ID]         INT             NULL,
    [R_I_School_Session_ID]        INT             NULL,
    [I_Brand_ID]                   INT             NULL,
    [N_Comp_Total_Amount]          NUMERIC (18, 2) NULL,
    [N_Component_Wise_TotalAmt]    NUMERIC (18, 2) NULL,
    [S_Invoice_No]                 VARCHAR (15)    NULL,
    [Dtt_Created_At]               DATETIME        CONSTRAINT [DF__T_ERP_Stu__Dtt_C__65D7EDF8] DEFAULT (getdate()) NULL,
    [Dtt_Modified_At]              DATETIME        NULL,
    [I_Created_By]                 INT             NULL,
    [I_Modified_By]                INT             NULL,
    [Is_Active]                    BIT             CONSTRAINT [DF__T_ERP_Stu__Is_Ac__66CC1231] DEFAULT ((1)) NULL,
    [Is_Moved]                     BIT             NULL,
    [Dt_Moved_DT]                  DATETIME        NULL,
    [Is_LumpSum]                   BIT             NULL,
    [I_Currency_ID]                INT             NULL,
    CONSTRAINT [PK__T_ERP_St__09AACFC58992BE6A] PRIMARY KEY CLUSTERED ([I_Stud_Fee_Struct_CompMap_ID] ASC)
);

