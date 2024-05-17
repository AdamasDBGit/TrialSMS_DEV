CREATE TABLE [dbo].[T_Coupon_Course_Map] (
    [I_Coupon_ID] BIGINT NOT NULL,
    [I_Course_ID] INT    NOT NULL,
    CONSTRAINT [FK_T_Coupon_Course_Map_T_Company_Coupon] FOREIGN KEY ([I_Coupon_ID]) REFERENCES [dbo].[T_Company_Coupon] ([I_Coupon_ID]),
    CONSTRAINT [FK_T_Coupon_Course_Map_T_Course_Master] FOREIGN KEY ([I_Course_ID]) REFERENCES [dbo].[T_Course_Master] ([I_Course_ID])
);


GO
ALTER TABLE [dbo].[T_Coupon_Course_Map] NOCHECK CONSTRAINT [FK_T_Coupon_Course_Map_T_Course_Master];



