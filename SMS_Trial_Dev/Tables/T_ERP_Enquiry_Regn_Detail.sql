﻿CREATE TABLE [dbo].[T_ERP_Enquiry_Regn_Detail] (
    [I_Enquiry_Regn_ID]          INT           IDENTITY (1, 1) NOT NULL,
    [I_Enquiry_Status_Code]      INT           NULL,
    [I_Brand_ID]                 INT           NULL,
    [I_Info_Source_ID]           INT           NULL,
    [I_Enquiry_Type_ID]          INT           NULL,
    [S_Enquiry_No]               VARCHAR (20)  NULL,
    [S_First_Name]               VARCHAR (50)  NULL,
    [S_Middle_Name]              VARCHAR (50)  NULL,
    [S_Last_Name]                VARCHAR (50)  NULL,
    [Dt_Birth_Date]              DATE          NULL,
    [S_Email_ID]                 VARCHAR (200) NULL,
    [S_Mobile_No]                VARCHAR (20)  NULL,
    [I_Income_Group_ID]          INT           NULL,
    [S_Crtd_By]                  INT           NULL,
    [S_Upd_By]                   INT           NULL,
    [Dt_Crtd_On]                 DATETIME      NULL,
    [Dt_Upd_On]                  DATETIME      NULL,
    [I_Caste_ID]                 INT           NULL,
    [S_Student_Photo]            VARCHAR (500) NULL,
    [B_IsPreEnquiry]             BIT           NULL,
    [I_Gender_ID]                INT           NULL,
    [I_Native_Language_ID]       INT           NULL,
    [I_Nationality_ID]           INT           NULL,
    [I_Religion_ID]              INT           NULL,
    [I_Marital_Status_ID]        INT           NULL,
    [I_Blood_Group_ID]           INT           NULL,
    [I_Monthly_Family_Income_ID] INT           NULL,
    [I_PreEnquiryFor]            INT           NULL,
    [Enquiry_Date]               DATETIME      NULL,
    [Enquiry_Crtd_By]            VARCHAR (MAX) NULL,
    [PreEnquiryDate]             DATETIME      NULL,
    [PreEnquiry_Crtd_By]         VARCHAR (MAX) NULL,
    [I_Course_Applied_For]       INT           NULL,
    [I_School_Group_ID]          INT           NULL,
    [App_Payment_Status]         BIT           NULL,
    [R_I_AdmStgTypeID]           INT           NULL,
    [I_Is_Active]                BIT           NULL,
    [Is_Sibling]                 BIT           NULL,
    [Is_Prev_Academy]            BIT           NULL,
    [R_I_School_Session_ID]      INT           NULL,
    CONSTRAINT [PK__T_Enquiry_Regn_D__02932ERP16] PRIMARY KEY CLUSTERED ([I_Enquiry_Regn_ID] ASC)
);

