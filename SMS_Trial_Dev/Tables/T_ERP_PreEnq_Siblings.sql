CREATE TABLE [dbo].[T_ERP_PreEnq_Siblings] (
    [I_PreEnqSibling_ID]  BIGINT        IDENTITY (1, 1) NOT NULL,
    [R_I_Enquiry_Regn_ID] INT           NULL,
    [S_StudentID]         VARCHAR (100) NULL,
    [S_Stud_Name]         VARCHAR (100) NULL,
    [Is_Running_Stud]     BIT           NULL,
    [S_Passout_Year]      VARCHAR (12)  NULL,
    [Dtt_Created_At]      DATETIME      DEFAULT (getdate()) NULL,
    [Dtt_Modified_At]     DATETIME      NULL,
    [I_Created_By]        VARCHAR (100) NULL,
    [I_Modified_By]       VARCHAR (100) NULL,
    [Is_Active]           BIT           DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([I_PreEnqSibling_ID] ASC)
);

