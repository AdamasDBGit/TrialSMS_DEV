CREATE TABLE [CORPORATE].[T_CorporatePlan_FeePlan_Map] (
    [I_Corporate_Plan_ID]  INT NULL,
    [I_Course_Fee_Plan_ID] INT NULL,
    CONSTRAINT [FK_T_CorporatePlan_FeePlan_Map_T_Corporate_Plan] FOREIGN KEY ([I_Corporate_Plan_ID]) REFERENCES [CORPORATE].[T_Corporate_Plan] ([I_Corporate_Plan_ID]),
    CONSTRAINT [FK_T_CorporatePlan_FeePlan_Map_T_Course_Fee_Plan] FOREIGN KEY ([I_Course_Fee_Plan_ID]) REFERENCES [dbo].[T_Course_Fee_Plan] ([I_Course_Fee_Plan_ID])
);

