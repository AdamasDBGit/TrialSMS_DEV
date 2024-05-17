CREATE TABLE [NETWORK].[T_Agreement_Details] (
    [I_Agreement_ID]              INT             IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Brand_ID]                  INT             NULL,
    [I_City_ID]                   INT             NULL,
    [I_Agreement_Template_ID]     INT             NULL,
    [I_State_ID]                  INT             NULL,
    [I_Country_ID]                INT             NULL,
    [I_BP_ID]                     INT             NULL,
    [S_Company_Name]              VARCHAR (100)   NULL,
    [S_BP_Email]                  VARCHAR (50)    NULL,
    [S_Company_Address1]          VARCHAR (100)   NULL,
    [S_Company_Address2]          VARCHAR (100)   NULL,
    [S_Pin_No]                    VARCHAR (10)    NULL,
    [S_Agreement_Code]            VARCHAR (50)    NULL,
    [Dt_Agreement_date]           DATETIME        NULL,
    [Dt_Effective_Agreement_Date] DATETIME        NULL,
    [S_Territory]                 VARCHAR (50)    NULL,
    [I_BP_User_ID]                INT             NULL,
    [Dt_Expiry_Date]              DATETIME        NULL,
    [S_Authorised_Courses]        VARCHAR (200)   NULL,
    [S_Reason]                    VARCHAR (1000)  NULL,
    [S_Firm_Registration_No]      VARCHAR (20)    NULL,
    [S_Business_Jurisdiction]     VARCHAR (100)   NULL,
    [S_Authorised_Signatories]    VARCHAR (100)   NULL,
    [I_Signatories_Age]           INT             NULL,
    [S_Signatories_Address1]      VARCHAR (100)   NULL,
    [S_Signatories_Address2]      VARCHAR (100)   NULL,
    [S_Signatories_City]          INT             NULL,
    [S_Signatories_State]         INT             NULL,
    [S_Signatories_Country]       INT             NULL,
    [S_Signatories_Pin]           VARCHAR (10)    NULL,
    [Dt_Frankling_Date]           DATETIME        NULL,
    [N_Amount]                    NUMERIC (18, 2) NULL,
    [N_Renewal_Amount]            NUMERIC (18, 2) NULL,
    [S_Constitution]              VARCHAR (100)   NULL,
    [S_Place]                     VARCHAR (100)   NULL,
    [S_Plan]                      VARCHAR (100)   NULL,
    [I_Document_ID]               INT             NULL,
    [S_Crtd_By]                   VARCHAR (20)    NULL,
    [S_Upd_By]                    VARCHAR (20)    NULL,
    [Dt_Crtd_On]                  DATETIME        NULL,
    [Dt_Upd_On]                   DATETIME        NULL,
    [I_Status]                    INT             NULL,
    [S_Phone_Number]              VARCHAR (50)    NULL,
    [S_Signatories_Phone_Number]  VARCHAR (50)    NULL,
    [I_Currency_ID]               INT             NULL,
    CONSTRAINT [PK__T_Agreement_Deta__50BCA3B7] PRIMARY KEY CLUSTERED ([I_Agreement_ID] ASC),
    CONSTRAINT [FK__T_Agreeme__I_Agr__74FA042D] FOREIGN KEY ([I_Agreement_Template_ID]) REFERENCES [NETWORK].[T_Agreement_Template_Master] ([I_Agreement_Template_ID]),
    CONSTRAINT [FK__T_Agreeme__I_BP___79BEB94A] FOREIGN KEY ([I_BP_ID]) REFERENCES [NETWORK].[T_BP_Master] ([I_BP_ID]),
    CONSTRAINT [FK__T_Agreeme__I_Bra__75EE2866] FOREIGN KEY ([I_Brand_ID]) REFERENCES [dbo].[T_Brand_Master] ([I_Brand_ID]),
    CONSTRAINT [FK__T_Agreeme__I_Cit__76E24C9F] FOREIGN KEY ([I_City_ID]) REFERENCES [dbo].[T_City_Master] ([I_City_ID]),
    CONSTRAINT [FK__T_Agreeme__I_Cou__78CA9511] FOREIGN KEY ([I_Country_ID]) REFERENCES [dbo].[T_Country_Master] ([I_Country_ID]),
    CONSTRAINT [FK__T_Agreeme__I_Sta__77D670D8] FOREIGN KEY ([I_State_ID]) REFERENCES [dbo].[T_State_Master] ([I_State_ID])
);


GO
ALTER TABLE [NETWORK].[T_Agreement_Details] NOCHECK CONSTRAINT [FK__T_Agreeme__I_Bra__75EE2866];


GO
ALTER TABLE [NETWORK].[T_Agreement_Details] NOCHECK CONSTRAINT [FK__T_Agreeme__I_Cit__76E24C9F];


GO
ALTER TABLE [NETWORK].[T_Agreement_Details] NOCHECK CONSTRAINT [FK__T_Agreeme__I_Sta__77D670D8];



