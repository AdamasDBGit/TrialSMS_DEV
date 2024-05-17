CREATE TABLE [PLACEMENT].[T_Employer_Detail] (
    [I_Employer_ID]          INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_State_ID]             INT           NULL,
    [I_Nature_of_Business]   INT           NULL,
    [I_Country_ID]           INT           NULL,
    [I_City_ID]              INT           NOT NULL,
    [S_Company_Code]         VARCHAR (50)  NULL,
    [S_Company_Name]         VARCHAR (250) NULL,
    [Dt_First_Enquiry_Date]  DATETIME      NULL,
    [S_Group_Company_Code]   VARCHAR (50)  NULL,
    [S_Address]              VARCHAR (200) NULL,
    [S_Pincode]              VARCHAR (50)  NULL,
    [S_Crtd_By]              VARCHAR (20)  NULL,
    [S_Upd_By]               VARCHAR (20)  NULL,
    [Dt_Crtd_On]             DATETIME      NULL,
    [Dt_Upd_On]              DATETIME      NULL,
    [I_Status]               INT           NOT NULL,
    [S_Phone_No]             VARCHAR (20)  NULL,
    [S_Mobile_No]            VARCHAR (20)  NULL,
    [S_GroupCompanyTurnOver] VARCHAR (MAX) NULL,
    [S_MCAList]              VARCHAR (6)   NULL,
    CONSTRAINT [PK__T_Employer_Detai__116B5A52] PRIMARY KEY CLUSTERED ([I_Employer_ID] ASC),
    CONSTRAINT [FK__T_Employe__I_Cit__153BEB36] FOREIGN KEY ([I_City_ID]) REFERENCES [dbo].[T_City_Master] ([I_City_ID]),
    CONSTRAINT [FK__T_Employe__I_Cou__1447C6FD] FOREIGN KEY ([I_Country_ID]) REFERENCES [dbo].[T_Country_Master] ([I_Country_ID]),
    CONSTRAINT [FK__T_Employe__I_Sta__1353A2C4] FOREIGN KEY ([I_State_ID]) REFERENCES [dbo].[T_State_Master] ([I_State_ID])
);


GO
ALTER TABLE [PLACEMENT].[T_Employer_Detail] NOCHECK CONSTRAINT [FK__T_Employe__I_Cit__153BEB36];


GO
ALTER TABLE [PLACEMENT].[T_Employer_Detail] NOCHECK CONSTRAINT [FK__T_Employe__I_Cou__1447C6FD];


GO
ALTER TABLE [PLACEMENT].[T_Employer_Detail] NOCHECK CONSTRAINT [FK__T_Employe__I_Sta__1353A2C4];



