CREATE TABLE [dbo].[T_Pincode_Details] (
    [I_Pincode_Detail_ID] INT           IDENTITY (1, 1) NOT NULL,
    [S_Pincode]           VARCHAR (20)  NULL,
    [S_Pincode_Location]  VARCHAR (MAX) NULL,
    [I_Status]            INT           NULL
);

