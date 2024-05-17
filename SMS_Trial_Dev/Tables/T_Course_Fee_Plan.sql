CREATE TABLE [dbo].[T_Course_Fee_Plan] (
    [I_Course_Fee_Plan_ID]     INT          IDENTITY (1, 1) NOT NULL,
    [S_Fee_Plan_Name]          VARCHAR (40) NULL,
    [I_Course_Delivery_ID]     INT          NULL,
    [I_Course_ID]              INT          NULL,
    [I_Currency_ID]            INT          NULL,
    [S_Crtd_By]                VARCHAR (20) NULL,
    [S_Upd_By]                 VARCHAR (20) NULL,
    [C_Is_LumpSum]             CHAR (1)     NULL,
    [Dt_Valid_To]              DATETIME     NULL,
    [Dt_Crtd_On]               DATETIME     NULL,
    [N_TotalLumpSum]           NUMERIC (18) NULL,
    [Dt_Upd_On]                DATETIME     NULL,
    [N_TotalInstallment]       NUMERIC (18) NULL,
    [I_Status]                 INT          NULL,
    [N_No_Of_Installments]     INT          NULL,
    [I_New_I_Fee_Structure_ID] INT          NULL,
    [I_Schhol_Group_ID]        INT          NULL,
    CONSTRAINT [PK__T_Course_Fee_Pla__75392FF8] PRIMARY KEY CLUSTERED ([I_Course_Fee_Plan_ID] ASC)
);



