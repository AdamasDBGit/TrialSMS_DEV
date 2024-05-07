CREATE TABLE [dbo].[T_SMS_SEND_DETAILS] (
    [I_SMS_SEND_DETAILS_ID]       INT           IDENTITY (1, 1) NOT NULL,
    [S_MOBILE_NO]                 VARCHAR (25)  NOT NULL,
    [I_SMS_STUDENT_ID]            INT           NULL,
    [I_SMS_TYPE_ID]               INT           NOT NULL,
    [S_SMS_BODY]                  VARCHAR (MAX) NULL,
    [I_IS_SUCCESS]                INT           CONSTRAINT [DEF_IS_SUCCESS] DEFAULT ((0)) NOT NULL,
    [I_NO_OF_ATTEMPT]             INT           CONSTRAINT [DEF_NO_OF_ATTEMPT] DEFAULT ((0)) NOT NULL,
    [S_RETURN_CODE_FROM_PROVIDER] VARCHAR (MAX) NULL,
    [I_REFERENCE_ID]              INT           NULL,
    [I_REFERENCE_TYPE_ID]         INT           NOT NULL,
    [Dt_SMS_SEND_ON]              DATETIME      NULL,
    [I_Status]                    INT           CONSTRAINT [DEF_I_Status] DEFAULT ((0)) NULL,
    [S_Crtd_By]                   VARCHAR (20)  NULL,
    [S_Upd_By]                    VARCHAR (20)  NULL,
    [Dt_Crtd_On]                  DATETIME      CONSTRAINT [DEF_Dt_Crtd_On] DEFAULT (getdate()) NULL,
    [Dt_Upd_On]                   DATETIME      NULL,
    CONSTRAINT [PK_T_SMS_SEND_DETAILS] PRIMARY KEY CLUSTERED ([I_SMS_SEND_DETAILS_ID] ASC),
    CONSTRAINT [FK_T_SMS_SEND_DETAILS_T_SMS_REFERENCE_TYPE_MASTER] FOREIGN KEY ([I_REFERENCE_TYPE_ID]) REFERENCES [dbo].[T_SMS_REFERENCE_TYPE_MASTER] ([I_REFERENCE_TYPE_ID]),
    CONSTRAINT [FK_T_SMS_SEND_DETAILS_T_SMS_TYPE_MASTER] FOREIGN KEY ([I_SMS_TYPE_ID]) REFERENCES [dbo].[T_SMS_TYPE_MASTER] ([I_SMS_TYPE_ID])
);

