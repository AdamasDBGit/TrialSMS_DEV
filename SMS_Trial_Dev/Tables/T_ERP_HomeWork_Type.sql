CREATE TABLE [dbo].[T_ERP_HomeWork_Type] (
    [I_HomeworkType_ID] TINYINT       IDENTITY (1, 1) NOT NULL,
    [S_Type]            VARCHAR (100) NULL,
    [is_Active]         BIT           NULL,
    PRIMARY KEY CLUSTERED ([I_HomeworkType_ID] ASC)
);

