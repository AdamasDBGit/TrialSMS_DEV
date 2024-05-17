CREATE TABLE [dbo].[T_Enquiry_Regn_Detail] (
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
    [RegID]                      INT             NULL,
    [I_Enq_PrevD_ID]             INT             NULL,
    [S_Father_Mobile_No]         VARCHAR (20)    NULL,
    [S_Mother_Mobile_No]         VARCHAR (20)    NULL,
    [S_Father_Email]             VARCHAR (200)   NULL,
    [S_Mother_Email]             VARCHAR (200)   NULL,
    [App_Payment_Status]         BIT             NULL,
    [R_I_AdmStgTypeID]           INT             NULL,
    [I_Is_Active]                BIT             NULL,
    [Is_Sibling]                 BIT             NULL,
    [Is_Prev_Academy]            BIT             NULL,
    [R_I_School_Session_ID]      INT             NULL,
    [I_School_Group_ID]          INT             NULL,
    [I_Class_ID]                 INT             NULL,
    [I_ERP_Entry]                BIT             NULL,
    [I_ERP_Crtd_By]              INT             NULL,
    [I_ERP_Updt_By]              INT             NULL,
    [I_Tab_No]                   INT             CONSTRAINT [DF_T_Enquiry_Regn_Detail_I_Tab_No] DEFAULT ((0)) NULL,
    CONSTRAINT [PK__T_Enquiry_Regn_D__02932B16] PRIMARY KEY CLUSTERED ([I_Enquiry_Regn_ID] ASC),
    CONSTRAINT [FK__T_Enquiry__I_Cur__4C02103B] FOREIGN KEY ([I_Corporate_Plan_ID]) REFERENCES [CORPORATE].[T_Corporate_Plan] ([I_Corporate_Plan_ID]),
    CONSTRAINT [FK__T_Enquiry__I_Cur__4CF63474] FOREIGN KEY ([I_Curr_City_ID]) REFERENCES [dbo].[T_City_Master] ([I_City_ID]),
    CONSTRAINT [FK__T_Enquiry__I_Enq__4460EE73] FOREIGN KEY ([I_Enquiry_Type_ID]) REFERENCES [dbo].[T_Enquiry_Type] ([I_Enquiry_Type_ID]),
    CONSTRAINT [FK__T_Enquiry__I_Inc__48317F57] FOREIGN KEY ([I_Income_Group_ID]) REFERENCES [dbo].[T_Income_Group_Master] ([I_Income_Group_ID]),
    CONSTRAINT [FK__T_Enquiry__I_Inf__4EDE7CE6] FOREIGN KEY ([I_Info_Source_ID]) REFERENCES [dbo].[T_Information_Source_Master] ([I_Info_Source_ID]),
    CONSTRAINT [FK__T_Enquiry__I_Occ__4925A390] FOREIGN KEY ([I_Occupation_ID]) REFERENCES [dbo].[T_Occupation_Master] ([I_Occupation_ID]),
    CONSTRAINT [FK__T_Enquiry__I_Pre__4A19C7C9] FOREIGN KEY ([I_Pref_Career_ID]) REFERENCES [dbo].[T_Preferred_Career_Master] ([I_Pref_Career_ID]),
    CONSTRAINT [FK__T_Enquiry__I_Qua__464936E5] FOREIGN KEY ([I_Qualification_Name_ID]) REFERENCES [dbo].[T_Qualification_Name_Master] ([I_Qualification_Name_ID]),
    CONSTRAINT [FK__T_Enquiry__I_Str__473D5B1E] FOREIGN KEY ([I_Stream_ID]) REFERENCES [dbo].[T_Stream_Master] ([I_Stream_ID]),
    CONSTRAINT [FK_T_Enquiry_Regn_Detail_T_Blood_Group] FOREIGN KEY ([I_Blood_Group_ID]) REFERENCES [dbo].[T_Blood_Group] ([I_Blood_Group_ID]),
    CONSTRAINT [FK_T_Enquiry_Regn_Detail_T_Business_Type] FOREIGN KEY ([I_Father_Business_Type_ID]) REFERENCES [dbo].[T_Business_Type] ([I_Business_Type_ID]),
    CONSTRAINT [FK_T_Enquiry_Regn_Detail_T_Business_Type1] FOREIGN KEY ([I_Mother_Business_Type_ID]) REFERENCES [dbo].[T_Business_Type] ([I_Business_Type_ID]),
    CONSTRAINT [FK_T_Enquiry_Regn_Detail_T_Corporate_Details] FOREIGN KEY ([I_Corporate_ID]) REFERENCES [CORPORATE].[T_Corporate_Details] ([I_Corporate_ID]),
    CONSTRAINT [FK_T_Enquiry_Regn_Detail_T_Enquiry_Regn_Detail] FOREIGN KEY ([I_Enquiry_Regn_ID]) REFERENCES [dbo].[T_Enquiry_Regn_Detail] ([I_Enquiry_Regn_ID]),
    CONSTRAINT [FK_T_Enquiry_Regn_Detail_T_Enquiry_Regn_Detail1] FOREIGN KEY ([I_Enquiry_Regn_ID]) REFERENCES [dbo].[T_Enquiry_Regn_Detail] ([I_Enquiry_Regn_ID]),
    CONSTRAINT [FK_T_Enquiry_Regn_Detail_T_Enquiry_Regn_Detail2] FOREIGN KEY ([I_Enquiry_Regn_ID]) REFERENCES [dbo].[T_Enquiry_Regn_Detail] ([I_Enquiry_Regn_ID]),
    CONSTRAINT [FK_T_Enquiry_Regn_Detail_T_Enrolment_Type_Master] FOREIGN KEY ([I_Enrolment_Type_ID]) REFERENCES [dbo].[T_Enrolment_Type_Master] ([I_Enrolment_Type_ID]),
    CONSTRAINT [FK_T_Enquiry_Regn_Detail_T_Income_Group_Master] FOREIGN KEY ([I_Father_Income_Group_ID]) REFERENCES [dbo].[T_Income_Group_Master] ([I_Income_Group_ID]),
    CONSTRAINT [FK_T_Enquiry_Regn_Detail_T_Income_Group_Master1] FOREIGN KEY ([I_Monthly_Family_Income_ID]) REFERENCES [dbo].[T_Income_Group_Master] ([I_Income_Group_ID]),
    CONSTRAINT [FK_T_Enquiry_Regn_Detail_T_Income_Group_Master2] FOREIGN KEY ([I_Mother_Income_Group_ID]) REFERENCES [dbo].[T_Income_Group_Master] ([I_Income_Group_ID]),
    CONSTRAINT [FK_T_Enquiry_Regn_Detail_T_Marital_Status] FOREIGN KEY ([I_Marital_Status_ID]) REFERENCES [dbo].[T_Marital_Status] ([I_Marital_Status_ID]),
    CONSTRAINT [FK_T_Enquiry_Regn_Detail_T_Native_Language] FOREIGN KEY ([I_Native_Language_ID]) REFERENCES [dbo].[T_Native_Language] ([I_Native_Language_ID]),
    CONSTRAINT [FK_T_Enquiry_Regn_Detail_T_Occupation_Master] FOREIGN KEY ([I_Father_Occupation_ID]) REFERENCES [dbo].[T_Occupation_Master] ([I_Occupation_ID]),
    CONSTRAINT [FK_T_Enquiry_Regn_Detail_T_Occupation_Master1] FOREIGN KEY ([I_Mother_Occupation_ID]) REFERENCES [dbo].[T_Occupation_Master] ([I_Occupation_ID]),
    CONSTRAINT [FK_T_Enquiry_Regn_Detail_T_Qualification_Name_Master] FOREIGN KEY ([I_Father_Qualification_ID]) REFERENCES [dbo].[T_Qualification_Name_Master] ([I_Qualification_Name_ID]),
    CONSTRAINT [FK_T_Enquiry_Regn_Detail_T_Qualification_Name_Master1] FOREIGN KEY ([I_Mother_Qualification_ID]) REFERENCES [dbo].[T_Qualification_Name_Master] ([I_Qualification_Name_ID]),
    CONSTRAINT [FK_T_Enquiry_Regn_Detail_T_Residence_Area_Master] FOREIGN KEY ([I_Residence_Area_ID]) REFERENCES [dbo].[T_Residence_Area_Master] ([I_Residence_Area_ID]),
    CONSTRAINT [FK_T_Enquiry_Regn_Detail_T_Scholar_Type_Master] FOREIGN KEY ([I_Scholar_Type_ID]) REFERENCES [dbo].[T_Scholar_Type_Master] ([I_Scholar_Type_ID]),
    CONSTRAINT [FK_T_Enquiry_Regn_Detail_T_Seat_Type_Master] FOREIGN KEY ([I_Seat_Type_ID]) REFERENCES [dbo].[T_Seat_Type_Master] ([I_Seat_Type_ID]),
    CONSTRAINT [FK_T_Enquiry_Regn_Detail_T_User_Nationality] FOREIGN KEY ([I_Nationality_ID]) REFERENCES [dbo].[T_User_Nationality] ([I_Nationality_ID]),
    CONSTRAINT [FK_T_Enquiry_Regn_Detail_T_User_Religion] FOREIGN KEY ([I_Religion_ID]) REFERENCES [dbo].[T_User_Religion] ([I_Religion_ID]),
    CONSTRAINT [FK_T_Enquiry_Regn_Detail_T_User_Sex] FOREIGN KEY ([I_Sex_ID]) REFERENCES [dbo].[T_User_Sex] ([I_Sex_ID])
);


GO
ALTER TABLE [dbo].[T_Enquiry_Regn_Detail] NOCHECK CONSTRAINT [FK__T_Enquiry__I_Cur__4C02103B];


GO
ALTER TABLE [dbo].[T_Enquiry_Regn_Detail] NOCHECK CONSTRAINT [FK__T_Enquiry__I_Cur__4CF63474];


GO
ALTER TABLE [dbo].[T_Enquiry_Regn_Detail] NOCHECK CONSTRAINT [FK__T_Enquiry__I_Enq__4460EE73];


GO
ALTER TABLE [dbo].[T_Enquiry_Regn_Detail] NOCHECK CONSTRAINT [FK__T_Enquiry__I_Inc__48317F57];


GO
ALTER TABLE [dbo].[T_Enquiry_Regn_Detail] NOCHECK CONSTRAINT [FK__T_Enquiry__I_Inf__4EDE7CE6];


GO
ALTER TABLE [dbo].[T_Enquiry_Regn_Detail] NOCHECK CONSTRAINT [FK__T_Enquiry__I_Occ__4925A390];


GO
ALTER TABLE [dbo].[T_Enquiry_Regn_Detail] NOCHECK CONSTRAINT [FK__T_Enquiry__I_Pre__4A19C7C9];


GO
ALTER TABLE [dbo].[T_Enquiry_Regn_Detail] NOCHECK CONSTRAINT [FK__T_Enquiry__I_Qua__464936E5];


GO
ALTER TABLE [dbo].[T_Enquiry_Regn_Detail] NOCHECK CONSTRAINT [FK__T_Enquiry__I_Str__473D5B1E];


GO
ALTER TABLE [dbo].[T_Enquiry_Regn_Detail] NOCHECK CONSTRAINT [FK_T_Enquiry_Regn_Detail_T_Blood_Group];


GO
ALTER TABLE [dbo].[T_Enquiry_Regn_Detail] NOCHECK CONSTRAINT [FK_T_Enquiry_Regn_Detail_T_Business_Type];


GO
ALTER TABLE [dbo].[T_Enquiry_Regn_Detail] NOCHECK CONSTRAINT [FK_T_Enquiry_Regn_Detail_T_Business_Type1];


GO
ALTER TABLE [dbo].[T_Enquiry_Regn_Detail] NOCHECK CONSTRAINT [FK_T_Enquiry_Regn_Detail_T_Corporate_Details];


GO
ALTER TABLE [dbo].[T_Enquiry_Regn_Detail] NOCHECK CONSTRAINT [FK_T_Enquiry_Regn_Detail_T_Enquiry_Regn_Detail];


GO
ALTER TABLE [dbo].[T_Enquiry_Regn_Detail] NOCHECK CONSTRAINT [FK_T_Enquiry_Regn_Detail_T_Enquiry_Regn_Detail1];


GO
ALTER TABLE [dbo].[T_Enquiry_Regn_Detail] NOCHECK CONSTRAINT [FK_T_Enquiry_Regn_Detail_T_Enquiry_Regn_Detail2];


GO
ALTER TABLE [dbo].[T_Enquiry_Regn_Detail] NOCHECK CONSTRAINT [FK_T_Enquiry_Regn_Detail_T_Enrolment_Type_Master];


GO
ALTER TABLE [dbo].[T_Enquiry_Regn_Detail] NOCHECK CONSTRAINT [FK_T_Enquiry_Regn_Detail_T_Income_Group_Master];


GO
ALTER TABLE [dbo].[T_Enquiry_Regn_Detail] NOCHECK CONSTRAINT [FK_T_Enquiry_Regn_Detail_T_Income_Group_Master1];


GO
ALTER TABLE [dbo].[T_Enquiry_Regn_Detail] NOCHECK CONSTRAINT [FK_T_Enquiry_Regn_Detail_T_Income_Group_Master2];


GO
ALTER TABLE [dbo].[T_Enquiry_Regn_Detail] NOCHECK CONSTRAINT [FK_T_Enquiry_Regn_Detail_T_Marital_Status];


GO
ALTER TABLE [dbo].[T_Enquiry_Regn_Detail] NOCHECK CONSTRAINT [FK_T_Enquiry_Regn_Detail_T_Native_Language];


GO
ALTER TABLE [dbo].[T_Enquiry_Regn_Detail] NOCHECK CONSTRAINT [FK_T_Enquiry_Regn_Detail_T_Occupation_Master];


GO
ALTER TABLE [dbo].[T_Enquiry_Regn_Detail] NOCHECK CONSTRAINT [FK_T_Enquiry_Regn_Detail_T_Occupation_Master1];


GO
ALTER TABLE [dbo].[T_Enquiry_Regn_Detail] NOCHECK CONSTRAINT [FK_T_Enquiry_Regn_Detail_T_Qualification_Name_Master];


GO
ALTER TABLE [dbo].[T_Enquiry_Regn_Detail] NOCHECK CONSTRAINT [FK_T_Enquiry_Regn_Detail_T_Qualification_Name_Master1];


GO
ALTER TABLE [dbo].[T_Enquiry_Regn_Detail] NOCHECK CONSTRAINT [FK_T_Enquiry_Regn_Detail_T_Residence_Area_Master];


GO
ALTER TABLE [dbo].[T_Enquiry_Regn_Detail] NOCHECK CONSTRAINT [FK_T_Enquiry_Regn_Detail_T_Scholar_Type_Master];


GO
ALTER TABLE [dbo].[T_Enquiry_Regn_Detail] NOCHECK CONSTRAINT [FK_T_Enquiry_Regn_Detail_T_Seat_Type_Master];


GO
ALTER TABLE [dbo].[T_Enquiry_Regn_Detail] NOCHECK CONSTRAINT [FK_T_Enquiry_Regn_Detail_T_User_Nationality];


GO
ALTER TABLE [dbo].[T_Enquiry_Regn_Detail] NOCHECK CONSTRAINT [FK_T_Enquiry_Regn_Detail_T_User_Religion];


GO
ALTER TABLE [dbo].[T_Enquiry_Regn_Detail] NOCHECK CONSTRAINT [FK_T_Enquiry_Regn_Detail_T_User_Sex];




GO
CREATE NONCLUSTERED INDEX [Ix_B_IsPreEnquiry]
    ON [dbo].[T_Enquiry_Regn_Detail]([B_IsPreEnquiry] ASC, [I_ERP_Entry] ASC, [App_Payment_Status] ASC)
    INCLUDE([I_Enquiry_Regn_ID], [I_Centre_Id], [I_Info_Source_ID], [R_I_AdmStgTypeID], [I_Class_ID]);


GO
CREATE NONCLUSTERED INDEX [Ix_I_Centre_Id_Enq_IsPre]
    ON [dbo].[T_Enquiry_Regn_Detail]([I_Centre_Id] ASC, [I_Enquiry_Status_Code] ASC, [B_IsPreEnquiry] ASC)
    INCLUDE([I_Enquiry_Regn_ID], [S_Mobile_No]);


GO
CREATE TRIGGER [dbo].[TUPDATE_T_Enquiry_Regn_Detail] ON [dbo].[T_Enquiry_Regn_Detail] AFTER UPDATE ASBEGININSERT INTO T_Enquiry_Regn_Detail_A(I_Enquiry_Regn_ID,I_Centre_Id,I_Occupation_ID,I_Pref_Career_ID,I_Enquiry_Status_Code,I_Info_Source_ID,I_Enquiry_Type_ID,S_Enquiry_No,S_Is_Corporate,S_Enquiry_Desc,S_Title,S_First_Name,S_Middle_Name,S_Last_Name,Dt_Birth_Date,S_Age,I_Qualification_Name_ID,C_Skip_Test,I_Stream_ID,I_Aptitude_Marks,S_Email_ID,S_Phone_No,S_Mobile_No,I_Curr_City_ID,I_Curr_State_ID,I_Curr_Country_ID,S_Guardian_Name,I_Guardian_Occupation_ID,S_Guardian_Email_ID,S_Guardian_Phone_No,S_Guardian_Mobile_No,I_Income_Group_ID,S_Curr_Address1,S_Curr_Address2,S_Curr_Pincode,S_Curr_Area,S_Perm_Address1,S_Perm_Address2,S_Perm_Pincode,I_Perm_City_ID,I_Perm_State_ID,I_Perm_Country_ID,S_Perm_Area,S_Crtd_By,S_Upd_By,Dt_Crtd_On,Dt_Upd_On,I_Corporate_ID,I_Corporate_Plan_ID,I_Caste_ID,S_Student_Photo,I_Residence_Area_ID,S_Father_Name,S_Mother_Name,B_IsPreEnquiry,I_Sex_ID,I_Native_Language_ID,I_Nationality_ID,I_Religion_ID,I_Marital_Status_ID,I_Blood_Group_ID,I_Father_Qualification_ID,I_Father_Occupation_ID,I_Father_Business_Type_ID,S_Father_Company_Name,S_Father_Designation,S_Father_Office_Phone,I_Father_Income_Group_ID,S_Father_Photo,S_Father_Office_Address,I_Mother_Qualification_ID,I_Mother_Occupation_ID,I_Mother_Business_Type_ID,S_Mother_Designation,S_Mother_Company_Name,S_Mother_Office_Address,S_Mother_Office_Phone,I_Mother_Income_Group_ID,S_Mother_Photo,S_Guardian_Relationship,S_Guardian_Address,I_Monthly_Family_Income_ID,B_Can_Sponsor_Education,S_Sibling_ID,B_Has_Given_Exam,I_Attempts,S_Other_Institute,N_Duration,I_Seat_Type_ID,I_Enrolment_Type_ID,S_Enrolment_No,I_Rank_Obtained,S_Univ_Registration_No,S_Univ_Roll_No,I_Scholar_Type_ID,S_Second_Language_Opted,S_Physical_Ailment,S_Form_No,B_IsLateral,I_PreEnquiryFor,AuditedOn,AuditType)SELECT I_Enquiry_Regn_ID,I_Centre_Id,I_Occupation_ID,I_Pref_Career_ID,I_Enquiry_Status_Code,I_Info_Source_ID,I_Enquiry_Type_ID,S_Enquiry_No,S_Is_Corporate,S_Enquiry_Desc,S_Title,S_First_Name,S_Middle_Name,S_Last_Name,Dt_Birth_Date,S_Age,I_Qualification_Name_ID,C_Skip_Test,I_Stream_ID,I_Aptitude_Marks,S_Email_ID,S_Phone_No,S_Mobile_No,I_Curr_City_ID,I_Curr_State_ID,I_Curr_Country_ID,S_Guardian_Name,I_Guardian_Occupation_ID,S_Guardian_Email_ID,S_Guardian_Phone_No,S_Guardian_Mobile_No,I_Income_Group_ID,S_Curr_Address1,S_Curr_Address2,S_Curr_Pincode,S_Curr_Area,S_Perm_Address1,S_Perm_Address2,S_Perm_Pincode,I_Perm_City_ID,I_Perm_State_ID,I_Perm_Country_ID,S_Perm_Area,S_Crtd_By,S_Upd_By,Dt_Crtd_On,Dt_Upd_On,I_Corporate_ID,I_Corporate_Plan_ID,I_Caste_ID,S_Student_Photo,I_Residence_Area_ID,S_Father_Name,S_Mother_Name,B_IsPreEnquiry,I_Sex_ID,I_Native_Language_ID,I_Nationality_ID,I_Religion_ID,I_Marital_Status_ID,I_Blood_Group_ID,I_Father_Qualification_ID,I_Father_Occupation_ID,I_Father_Business_Type_ID,S_Father_Company_Name,S_Father_Designation,S_Father_Office_Phone,I_Father_Income_Group_ID,S_Father_Photo,S_Father_Office_Address,I_Mother_Qualification_ID,I_Mother_Occupation_ID,I_Mother_Business_Type_ID,S_Mother_Designation,S_Mother_Company_Name,S_Mother_Office_Address,S_Mother_Office_Phone,I_Mother_Income_Group_ID,S_Mother_Photo,S_Guardian_Relationship,S_Guardian_Address,I_Monthly_Family_Income_ID,B_Can_Sponsor_Education,S_Sibling_ID,B_Has_Given_Exam,I_Attempts,S_Other_Institute,N_Duration,I_Seat_Type_ID,I_Enrolment_Type_ID,S_Enrolment_No,I_Rank_Obtained,S_Univ_Registration_No,S_Univ_Roll_No,I_Scholar_Type_ID,S_Second_Language_Opted,S_Physical_Ailment,S_Form_No,B_IsLateral,I_PreEnquiryFor, GETDATE(), 'U'FROM DELETED IEND
GO
CREATE TRIGGER [dbo].[TDELETE_T_Enquiry_Regn_Detail] ON [dbo].[T_Enquiry_Regn_Detail] AFTER DELETE ASBEGININSERT INTO T_Enquiry_Regn_Detail_A(I_Enquiry_Regn_ID,I_Centre_Id,I_Occupation_ID,I_Pref_Career_ID,I_Enquiry_Status_Code,I_Info_Source_ID,I_Enquiry_Type_ID,S_Enquiry_No,S_Is_Corporate,S_Enquiry_Desc,S_Title,S_First_Name,S_Middle_Name,S_Last_Name,Dt_Birth_Date,S_Age,I_Qualification_Name_ID,C_Skip_Test,I_Stream_ID,I_Aptitude_Marks,S_Email_ID,S_Phone_No,S_Mobile_No,I_Curr_City_ID,I_Curr_State_ID,I_Curr_Country_ID,S_Guardian_Name,I_Guardian_Occupation_ID,S_Guardian_Email_ID,S_Guardian_Phone_No,S_Guardian_Mobile_No,I_Income_Group_ID,S_Curr_Address1,S_Curr_Address2,S_Curr_Pincode,S_Curr_Area,S_Perm_Address1,S_Perm_Address2,S_Perm_Pincode,I_Perm_City_ID,I_Perm_State_ID,I_Perm_Country_ID,S_Perm_Area,S_Crtd_By,S_Upd_By,Dt_Crtd_On,Dt_Upd_On,I_Corporate_ID,I_Corporate_Plan_ID,I_Caste_ID,S_Student_Photo,I_Residence_Area_ID,S_Father_Name,S_Mother_Name,B_IsPreEnquiry,I_Sex_ID,I_Native_Language_ID,I_Nationality_ID,I_Religion_ID,I_Marital_Status_ID,I_Blood_Group_ID,I_Father_Qualification_ID,I_Father_Occupation_ID,I_Father_Business_Type_ID,S_Father_Company_Name,S_Father_Designation,S_Father_Office_Phone,I_Father_Income_Group_ID,S_Father_Photo,S_Father_Office_Address,I_Mother_Qualification_ID,I_Mother_Occupation_ID,I_Mother_Business_Type_ID,S_Mother_Designation,S_Mother_Company_Name,S_Mother_Office_Address,S_Mother_Office_Phone,I_Mother_Income_Group_ID,S_Mother_Photo,S_Guardian_Relationship,S_Guardian_Address,I_Monthly_Family_Income_ID,B_Can_Sponsor_Education,S_Sibling_ID,B_Has_Given_Exam,I_Attempts,S_Other_Institute,N_Duration,I_Seat_Type_ID,I_Enrolment_Type_ID,S_Enrolment_No,I_Rank_Obtained,S_Univ_Registration_No,S_Univ_Roll_No,I_Scholar_Type_ID,S_Second_Language_Opted,S_Physical_Ailment,S_Form_No,B_IsLateral,I_PreEnquiryFor,AuditedOn,AuditType)SELECT I_Enquiry_Regn_ID,I_Centre_Id,I_Occupation_ID,I_Pref_Career_ID,I_Enquiry_Status_Code,I_Info_Source_ID,I_Enquiry_Type_ID,S_Enquiry_No,S_Is_Corporate,S_Enquiry_Desc,S_Title,S_First_Name,S_Middle_Name,S_Last_Name,Dt_Birth_Date,S_Age,I_Qualification_Name_ID,C_Skip_Test,I_Stream_ID,I_Aptitude_Marks,S_Email_ID,S_Phone_No,S_Mobile_No,I_Curr_City_ID,I_Curr_State_ID,I_Curr_Country_ID,S_Guardian_Name,I_Guardian_Occupation_ID,S_Guardian_Email_ID,S_Guardian_Phone_No,S_Guardian_Mobile_No,I_Income_Group_ID,S_Curr_Address1,S_Curr_Address2,S_Curr_Pincode,S_Curr_Area,S_Perm_Address1,S_Perm_Address2,S_Perm_Pincode,I_Perm_City_ID,I_Perm_State_ID,I_Perm_Country_ID,S_Perm_Area,S_Crtd_By,S_Upd_By,Dt_Crtd_On,Dt_Upd_On,I_Corporate_ID,I_Corporate_Plan_ID,I_Caste_ID,S_Student_Photo,I_Residence_Area_ID,S_Father_Name,S_Mother_Name,B_IsPreEnquiry,I_Sex_ID,I_Native_Language_ID,I_Nationality_ID,I_Religion_ID,I_Marital_Status_ID,I_Blood_Group_ID,I_Father_Qualification_ID,I_Father_Occupation_ID,I_Father_Business_Type_ID,S_Father_Company_Name,S_Father_Designation,S_Father_Office_Phone,I_Father_Income_Group_ID,S_Father_Photo,S_Father_Office_Address,I_Mother_Qualification_ID,I_Mother_Occupation_ID,I_Mother_Business_Type_ID,S_Mother_Designation,S_Mother_Company_Name,S_Mother_Office_Address,S_Mother_Office_Phone,I_Mother_Income_Group_ID,S_Mother_Photo,S_Guardian_Relationship,S_Guardian_Address,I_Monthly_Family_Income_ID,B_Can_Sponsor_Education,S_Sibling_ID,B_Has_Given_Exam,I_Attempts,S_Other_Institute,N_Duration,I_Seat_Type_ID,I_Enrolment_Type_ID,S_Enrolment_No,I_Rank_Obtained,S_Univ_Registration_No,S_Univ_Roll_No,I_Scholar_Type_ID,S_Second_Language_Opted,S_Physical_Ailment,S_Form_No,B_IsLateral,I_PreEnquiryFor, GETDATE(), 'D'FROM DELETED IEND