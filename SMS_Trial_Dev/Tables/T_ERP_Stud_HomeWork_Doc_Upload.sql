CREATE TABLE [dbo].[T_ERP_Stud_HomeWork_Doc_Upload] (
    [I_Home_Work_Doc_Upload_ID] BIGINT        IDENTITY (1, 1) NOT NULL,
    [R_I_Student_HomeWork_ID]   INT           NULL,
    [S_Filepath]                VARCHAR (255) NULL,
    [S_SeqNo]                   INT           NULL,
    [Is_Active]                 BIT           DEFAULT ((1)) NULL,
    [Dtt_Created_At]            DATETIME      DEFAULT ((1)) NULL,
    [Dtt_Modified_At]           DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([I_Home_Work_Doc_Upload_ID] ASC)
);

