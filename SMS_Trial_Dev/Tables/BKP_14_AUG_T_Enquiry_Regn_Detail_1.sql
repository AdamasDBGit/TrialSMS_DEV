﻿CREATE TABLE [dbo].[BKP_14_AUG_T_Enquiry_Regn_Detail] (
    [I_Enquiry_Regn_ID]          INT             IDENTITY (1, 1) NOT NULL,
    [I_Centre_Id]                INT             NULL,
    [I_Occupation_ID]            INT             NULL,
    [I_Pref_Career_ID]           INT             NULL,
    [I_Enquiry_Status_Code]      INT             NULL,
    [I_Info_Source_ID]           INT             NULL,
    [I_Enquiry_Type_ID]          INT             NULL,
    [S_Enquiry_No]               VARCHAR (20)    NULL,
    [S_Is_Corporate]             VARCHAR (20)    NULL,
    [S_Enquiry_Desc]             VARCHAR (500)   NULL,
    [S_Title]                    VARCHAR (10)    NULL,
    [S_First_Name]               VARCHAR (50)    NULL,
    [S_Middle_Name]              VARCHAR (50)    NULL,
    [S_Last_Name]                VARCHAR (50)    NULL,
    [Dt_Birth_Date]              DATETIME        NULL,
    [S_Age]                      VARCHAR (20)    NULL,
    [I_Qualification_Name_ID]    INT             NULL,
    [C_Skip_Test]                CHAR (1)        NULL,
    [I_Stream_ID]                INT             NULL,
    [I_Aptitude_Marks]           INT             NULL,
    [S_Email_ID]                 VARCHAR (200)   NULL,
    [S_Phone_No]                 VARCHAR (20)    NULL,
    [S_Mobile_No]                VARCHAR (20)    NULL,
    [I_Curr_City_ID]             INT             NULL,
    [I_Curr_State_ID]            INT             NULL,
    [I_Curr_Country_ID]          INT             NULL,
    [S_Guardian_Name]            VARCHAR (200)   NULL,
    [I_Guardian_Occupation_ID]   INT             NULL,
    [S_Guardian_Email_ID]        VARCHAR (200)   NULL,
    [S_Guardian_Phone_No]        VARCHAR (20)    NULL,
    [S_Guardian_Mobile_No]       VARCHAR (20)    NULL,
    [I_Income_Group_ID]          INT             NULL,
    [S_Curr_Address1]            VARCHAR (200)   NULL,
    [S_Curr_Address2]            VARCHAR (200)   NULL,
    [S_Curr_Pincode]             VARCHAR (20)    NULL,
    [S_Curr_Area]                VARCHAR (50)    NULL,
    [S_Perm_Address1]            VARCHAR (200)   NULL,
    [S_Perm_Address2]            VARCHAR (200)   NULL,
    [S_Perm_Pincode]             VARCHAR (20)    NULL,
    [I_Perm_City_ID]             INT             NULL,
    [I_Perm_State_ID]            INT             NULL,
    [I_Perm_Country_ID]          INT             NULL,
    [S_Perm_Area]                VARCHAR (50)    NULL,
    [S_Crtd_By]                  VARCHAR (20)    NULL,
    [S_Upd_By]                   VARCHAR (20)    NULL,
    [Dt_Crtd_On]                 DATETIME        NULL,
    [Dt_Upd_On]                  DATETIME        NULL,
    [I_Corporate_ID]             INT             NULL,
    [I_Corporate_Plan_ID]        INT             NULL,
    [I_Caste_ID]                 INT             NULL,
    [S_Student_Photo]            VARCHAR (500)   NULL,
    [I_Residence_Area_ID]        INT             NULL,
    [S_Father_Name]              VARCHAR (200)   NULL,
    [S_Mother_Name]              VARCHAR (200)   NULL,
    [B_IsPreEnquiry]             BIT             NULL,
    [I_Sex_ID]                   INT             NULL,
    [I_Native_Language_ID]       INT             NULL,
    [I_Nationality_ID]           INT             NULL,
    [I_Religion_ID]              INT             NULL,
    [I_Marital_Status_ID]        INT             NULL,
    [I_Blood_Group_ID]           INT             NULL,
    [I_Father_Qualification_ID]  INT             NULL,
    [I_Father_Occupation_ID]     INT             NULL,
    [I_Father_Business_Type_ID]  INT             NULL,
    [S_Father_Company_Name]      VARCHAR (200)   NULL,
    [S_Father_Designation]       VARCHAR (200)   NULL,
    [S_Father_Office_Phone]      VARCHAR (20)    NULL,
    [I_Father_Income_Group_ID]   INT             NULL,
    [S_Father_Photo]             VARCHAR (500)   NULL,
    [S_Father_Office_Address]    VARCHAR (2000)  NULL,
    [I_Mother_Qualification_ID]  INT             NULL,
    [I_Mother_Occupation_ID]     INT             NULL,
    [I_Mother_Business_Type_ID]  INT             NULL,
    [S_Mother_Designation]       VARCHAR (200)   NULL,
    [S_Mother_Company_Name]      VARCHAR (200)   NULL,
    [S_Mother_Office_Address]    VARCHAR (2000)  NULL,
    [S_Mother_Office_Phone]      VARCHAR (20)    NULL,
    [I_Mother_Income_Group_ID]   INT             NULL,
    [S_Mother_Photo]             VARCHAR (500)   NULL,
    [S_Guardian_Relationship]    VARCHAR (200)   NULL,
    [S_Guardian_Address]         VARCHAR (2000)  NULL,
    [I_Monthly_Family_Income_ID] INT             NULL,
    [B_Can_Sponsor_Education]    BIT             NULL,
    [S_Sibling_ID]               VARCHAR (500)   NULL,
    [B_Has_Given_Exam]           BIT             NULL,
    [I_Attempts]                 INT             NULL,
    [S_Other_Institute]          VARCHAR (50)    NULL,
    [N_Duration]                 DECIMAL (18, 2) NULL,
    [I_Seat_Type_ID]             INT             NULL,
    [I_Enrolment_Type_ID]        INT             NULL,
    [S_Enrolment_No]             VARCHAR (50)    NULL,
    [I_Rank_Obtained]            INT             NULL,
    [S_Univ_Registration_No]     VARCHAR (50)    NULL,
    [S_Univ_Roll_No]             VARCHAR (50)    NULL,
    [I_Scholar_Type_ID]          INT             NULL,
    [S_Second_Language_Opted]    VARCHAR (100)   NULL,
    [S_Physical_Ailment]         VARCHAR (200)   NULL,
    [S_Form_No]                  VARCHAR (100)   NULL,
    [B_IsLateral]                BIT             NULL,
    [I_PreEnquiryFor]            INT             NULL,
    [I_Relevence_ID]             INT             NULL,
    [N_Test_Score]               DECIMAL (14, 1) NULL,
    [Enquiry_Date]               DATETIME        NULL,
    [Enquiry_Crtd_By]            VARCHAR (MAX)   NULL,
    [PreEnquiryDate]             DATETIME        NULL,
    [PreEnquiry_Crtd_By]         VARCHAR (MAX)   NULL,
    [CustomerID]                 VARCHAR (MAX)   NULL,
    [RegID]                      INT             NULL
);
