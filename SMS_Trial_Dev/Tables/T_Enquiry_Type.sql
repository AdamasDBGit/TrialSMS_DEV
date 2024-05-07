CREATE TABLE [dbo].[T_Enquiry_Type] (
    [I_Enquiry_Type_ID]   INT          IDENTITY (1, 1) NOT NULL,
    [S_Enquiry_Type_Desc] VARCHAR (50) NULL,
    [I_Status]            INT          NULL,
    [S_Crtd_By]           VARCHAR (20) NULL,
    [S_Upd_By]            VARCHAR (20) NULL,
    [Dt_Crtd_On]          DATETIME     NULL,
    [Dt_Upd_On]           DATETIME     NULL,
    [I_ERP_Status]        TINYINT      NULL,
    CONSTRAINT [PK__T_Enquiry_Type__5812E165] PRIMARY KEY CLUSTERED ([I_Enquiry_Type_ID] ASC)
);

