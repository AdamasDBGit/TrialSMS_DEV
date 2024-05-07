CREATE TABLE [dbo].[T_ERP_EnquiryReg_Prev_Details] (
    [I_Enq_PrevD_ID]      BIGINT         IDENTITY (1, 1) NOT NULL,
    [R_I_Prev_Class_ID]   INT            NULL,
    [R_I_Enquiry_Regn_ID] INT            NULL,
    [Is_Marks_Input]      BIT            NULL,
    [N_TotalMarks]        NUMERIC (6, 2) CONSTRAINT [df_N_TotalMarks] DEFAULT ((0)) NULL,
    [N_Obtain_Marks]      NUMERIC (6, 2) NULL,
    [S_Grade]             CHAR (3)       NULL,
    [N_Percentage]        NUMERIC (4, 2) NULL,
    [S_School_Name]       VARCHAR (100)  NULL,
    [S_School_Board]      VARCHAR (200)  NULL,
    [S_Address]           VARCHAR (255)  NULL,
    [Dtt_Created_At]      DATETIME       DEFAULT (getdate()) NULL,
    [Dtt_Modified_At]     DATETIME       NULL,
    [I_Created_By]        VARCHAR (100)  NULL,
    [I_Modified_By]       VARCHAR (100)  NULL,
    [Is_Active]           BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([I_Enq_PrevD_ID] ASC)
);

