CREATE TABLE [dbo].[T_Enquiry_Course] (
    [I_Enquiry_Course_ID] INT      IDENTITY (1, 1) NOT NULL,
    [I_Course_ID]         INT      NULL,
    [I_Enquiry_Regn_ID]   INT      NULL,
    [C_Is_Registered]     CHAR (1) NULL,
    [I_TimeSlot_ID]       INT      NULL,
    [C_Is_Enrolled]       CHAR (1) NULL,
    [Dt_Registration]     DATETIME NULL,
    CONSTRAINT [PK__T_Enquiry_Course__66EB10A1] PRIMARY KEY CLUSTERED ([I_Enquiry_Course_ID] ASC),
    CONSTRAINT [FK__T_Enquiry__I_Cou__63CEACD4] FOREIGN KEY ([I_Course_ID]) REFERENCES [dbo].[T_Course_Master] ([I_Course_ID]),
    CONSTRAINT [FK__T_Enquiry__I_Enq__314E19FF] FOREIGN KEY ([I_Enquiry_Regn_ID]) REFERENCES [dbo].[T_Enquiry_Regn_Detail] ([I_Enquiry_Regn_ID]),
    CONSTRAINT [FK__T_Enquiry__I_Tim__2F65D18D] FOREIGN KEY ([I_TimeSlot_ID]) REFERENCES [dbo].[T_Center_TimeSlot] ([I_TimeSlot_ID])
);


GO
ALTER TABLE [dbo].[T_Enquiry_Course] NOCHECK CONSTRAINT [FK__T_Enquiry__I_Cou__63CEACD4];




GO
CREATE NONCLUSTERED INDEX [Ix_I_Enquiry_Regn_ID]
    ON [dbo].[T_Enquiry_Course]([I_Enquiry_Regn_ID] ASC);

