CREATE TABLE [dbo].[Enquiry_Source_Details] (
    [I_Enquiry_Source_Detail_ID] INT           IDENTITY (1, 1) NOT NULL,
    [I_Info_Source_ID]           INT           NULL,
    [I_Enquiry_ID]               INT           NULL,
    [S_Referer_Name]             VARCHAR (MAX) NULL,
    [S_Referer_Mobile_No]        VARCHAR (20)  NULL,
    [I_Status]                   INT           NULL,
    [S_Created_By]               VARCHAR (MAX) NULL,
    [Dt_Created_At]              DATETIME      NULL,
    [S_Updated_By]               VARCHAR (MAX) NULL,
    [Dt_Updated_At]              DATETIME      NULL
);

