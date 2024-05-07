CREATE TABLE [dbo].[T_Student_Leave_Request] (
    [I_Student_Leave_ID]  INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Student_Detail_ID] INT           NULL,
    [S_Leave_Type]        VARCHAR (20)  NULL,
    [Dt_From_Date]        DATETIME      NULL,
    [Dt_To_Date]          DATETIME      NULL,
    [S_Reason]            VARCHAR (500) NULL,
    [S_Comments]          VARCHAR (500) NULL,
    [I_Status]            INT           NULL,
    [S_Crtd_By]           VARCHAR (20)  NULL,
    [S_Upd_By]            VARCHAR (20)  NULL,
    [Dt_Crtd_On]          DATETIME      NULL,
    [Dt_Upd_On]           DATETIME      NULL,
    CONSTRAINT [PK__T_Student_Leave___304F08CE] PRIMARY KEY CLUSTERED ([I_Student_Leave_ID] ASC),
    CONSTRAINT [FK__T_Student__I_Stu__38EF3BC7] FOREIGN KEY ([I_Student_Detail_ID]) REFERENCES [dbo].[T_Student_Detail] ([I_Student_Detail_ID])
);

