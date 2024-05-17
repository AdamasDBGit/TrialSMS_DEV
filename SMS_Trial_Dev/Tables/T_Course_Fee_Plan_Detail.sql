CREATE TABLE [dbo].[T_Course_Fee_Plan_Detail] (
    [I_Fee_Component_ID]          INT          NOT NULL,
    [I_Course_Fee_Plan_ID]        INT          NOT NULL,
    [I_Course_Fee_Plan_Detail_ID] INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_Item_Value]                NUMERIC (18) NULL,
    [N_CompanyShare]              NUMERIC (18) NULL,
    [I_Sequence]                  INT          NULL,
    [I_Installment_No]            INT          NULL,
    [S_Crtd_By]                   VARCHAR (20) NULL,
    [C_Is_LumpSum]                CHAR (1)     NULL,
    [I_Display_Fee_Component_ID]  INT          NULL,
    [S_Upd_By]                    VARCHAR (20) NULL,
    [Dt_Crtd_On]                  DATETIME     NULL,
    [I_Status]                    INT          NULL,
    [Dt_Upd_On]                   DATETIME     NULL,
    CONSTRAINT [PK__T_Course_Fee_Pla__7721786A] PRIMARY KEY CLUSTERED ([I_Course_Fee_Plan_Detail_ID] ASC),
    CONSTRAINT [FK__T_Course___I_Cou__64B8AF6C] FOREIGN KEY ([I_Course_Fee_Plan_ID]) REFERENCES [dbo].[T_Course_Fee_Plan] ([I_Course_Fee_Plan_ID]),
    CONSTRAINT [FK__T_Course___I_Fee__1D9C270D] FOREIGN KEY ([I_Fee_Component_ID]) REFERENCES [dbo].[T_Fee_Component_Master] ([I_Fee_Component_ID])
);


GO
ALTER TABLE [dbo].[T_Course_Fee_Plan_Detail] NOCHECK CONSTRAINT [FK__T_Course___I_Fee__1D9C270D];




GO
CREATE NONCLUSTERED INDEX [IX_I_Fee_Component_ID]
    ON [dbo].[T_Course_Fee_Plan_Detail]([I_Fee_Component_ID] ASC, [I_Course_Fee_Plan_ID] ASC)
    INCLUDE([I_Course_Fee_Plan_Detail_ID]);

