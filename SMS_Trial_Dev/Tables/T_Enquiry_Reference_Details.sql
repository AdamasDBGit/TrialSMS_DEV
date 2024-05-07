CREATE TABLE [dbo].[T_Enquiry_Reference_Details] (
    [I_Enquiry_Reference_ID] INT           IDENTITY (1, 1) NOT NULL,
    [I_Enquiry_Regn_ID]      INT           NOT NULL,
    [S_Name]                 VARCHAR (MAX) NULL,
    [S_Contact_No]           VARCHAR (20)  NULL,
    [S_Address]              VARCHAR (MAX) NULL
);

