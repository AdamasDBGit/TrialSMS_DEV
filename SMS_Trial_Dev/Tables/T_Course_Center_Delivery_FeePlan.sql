CREATE TABLE [dbo].[T_Course_Center_Delivery_FeePlan] (
    [I_Course_Center_Delivery_ID] INT      IDENTITY (1, 1) NOT NULL,
    [I_Course_Delivery_ID]        INT      NOT NULL,
    [I_Course_Center_ID]          INT      NOT NULL,
    [I_Course_Fee_Plan_ID]        INT      NOT NULL,
    [Dt_Valid_From]               DATETIME NULL,
    [Dt_Valid_To]                 DATETIME NULL,
    [I_Status]                    INT      NULL,
    CONSTRAINT [PK__T_Course_Center___735BD47E] PRIMARY KEY CLUSTERED ([I_Course_Center_Delivery_ID] ASC),
    CONSTRAINT [FK__T_Course___I_Cou__1C5DEA11] FOREIGN KEY ([I_Course_Fee_Plan_ID]) REFERENCES [dbo].[T_Course_Fee_Plan] ([I_Course_Fee_Plan_ID]),
    CONSTRAINT [FK__T_Course___I_Cou__5FF3FA4F] FOREIGN KEY ([I_Course_Delivery_ID]) REFERENCES [dbo].[T_Course_Delivery_Map] ([I_Course_Delivery_ID]),
    CONSTRAINT [FK_T_Course_Center_Delivery_FeePlan_T_Course_Center_Detail] FOREIGN KEY ([I_Course_Center_ID]) REFERENCES [dbo].[T_Course_Center_Detail] ([I_Course_Center_ID])
);


GO
CREATE NONCLUSTERED INDEX [NC_T_Course_Center_Delivery_FeePlan_I_Status]
    ON [dbo].[T_Course_Center_Delivery_FeePlan]([I_Status] ASC)
    INCLUDE([I_Course_Delivery_ID], [I_Course_Fee_Plan_ID]);

