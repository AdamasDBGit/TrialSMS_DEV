CREATE TABLE [dbo].[T_Student_Upgrade_Detail] (
    [I_Upgrade_ID]                 INT          IDENTITY (1, 1) NOT NULL,
    [I_Student_Detail_ID]          INT          NOT NULL,
    [I_Previous_Invoice_Header_ID] INT          NOT NULL,
    [I_Upgrade_Invoice_Header_ID]  INT          NULL,
    [I_Bridge_ID]                  INT          NOT NULL,
    [I_Course_ID]                  INT          NOT NULL,
    [I_Status]                     INT          NULL,
    [S_Crtd_By]                    VARCHAR (20) NULL,
    [S_Upd_By]                     VARCHAR (20) NULL,
    [Dt_Crtd_On]                   DATETIME     NULL,
    [Dt_Upd_On]                    DATETIME     NULL,
    CONSTRAINT [FK__T_Student__I_Bri__4333F927] FOREIGN KEY ([I_Bridge_ID]) REFERENCES [dbo].[T_Bridge_Master] ([I_Bridge_ID]),
    CONSTRAINT [FK__T_Student__I_Bri__44281D60] FOREIGN KEY ([I_Bridge_ID]) REFERENCES [dbo].[T_Bridge_Master] ([I_Bridge_ID]),
    CONSTRAINT [FK__T_Student__I_Bri__451C4199] FOREIGN KEY ([I_Bridge_ID]) REFERENCES [dbo].[T_Bridge_Master] ([I_Bridge_ID]),
    CONSTRAINT [FK__T_Student__I_Bri__65A9D813] FOREIGN KEY ([I_Bridge_ID]) REFERENCES [dbo].[T_Bridge_Master] ([I_Bridge_ID]),
    CONSTRAINT [FK__T_Student__I_Bri__669DFC4C] FOREIGN KEY ([I_Bridge_ID]) REFERENCES [dbo].[T_Bridge_Master] ([I_Bridge_ID]),
    CONSTRAINT [FK__T_Student__I_Bri__67922085] FOREIGN KEY ([I_Bridge_ID]) REFERENCES [dbo].[T_Bridge_Master] ([I_Bridge_ID]),
    CONSTRAINT [FK__T_Student__I_Cou__461065D2] FOREIGN KEY ([I_Course_ID]) REFERENCES [dbo].[T_Course_Master] ([I_Course_ID]),
    CONSTRAINT [FK__T_Student__I_Cou__47048A0B] FOREIGN KEY ([I_Course_ID]) REFERENCES [dbo].[T_Course_Master] ([I_Course_ID]),
    CONSTRAINT [FK__T_Student__I_Cou__47F8AE44] FOREIGN KEY ([I_Course_ID]) REFERENCES [dbo].[T_Course_Master] ([I_Course_ID]),
    CONSTRAINT [FK__T_Student__I_Cou__688644BE] FOREIGN KEY ([I_Course_ID]) REFERENCES [dbo].[T_Course_Master] ([I_Course_ID]),
    CONSTRAINT [FK__T_Student__I_Cou__697A68F7] FOREIGN KEY ([I_Course_ID]) REFERENCES [dbo].[T_Course_Master] ([I_Course_ID]),
    CONSTRAINT [FK__T_Student__I_Cou__6A6E8D30] FOREIGN KEY ([I_Course_ID]) REFERENCES [dbo].[T_Course_Master] ([I_Course_ID]),
    CONSTRAINT [FK__T_Student__I_Pre__48ECD27D] FOREIGN KEY ([I_Previous_Invoice_Header_ID]) REFERENCES [dbo].[T_Invoice_Parent] ([I_Invoice_Header_ID]),
    CONSTRAINT [FK__T_Student__I_Pre__49E0F6B6] FOREIGN KEY ([I_Previous_Invoice_Header_ID]) REFERENCES [dbo].[T_Invoice_Parent] ([I_Invoice_Header_ID]),
    CONSTRAINT [FK__T_Student__I_Pre__4AD51AEF] FOREIGN KEY ([I_Previous_Invoice_Header_ID]) REFERENCES [dbo].[T_Invoice_Parent] ([I_Invoice_Header_ID]),
    CONSTRAINT [FK__T_Student__I_Pre__6B62B169] FOREIGN KEY ([I_Previous_Invoice_Header_ID]) REFERENCES [dbo].[T_Invoice_Parent] ([I_Invoice_Header_ID]),
    CONSTRAINT [FK__T_Student__I_Pre__6C56D5A2] FOREIGN KEY ([I_Previous_Invoice_Header_ID]) REFERENCES [dbo].[T_Invoice_Parent] ([I_Invoice_Header_ID]),
    CONSTRAINT [FK__T_Student__I_Pre__6D4AF9DB] FOREIGN KEY ([I_Previous_Invoice_Header_ID]) REFERENCES [dbo].[T_Invoice_Parent] ([I_Invoice_Header_ID]),
    CONSTRAINT [FK__T_Student__I_Upg__4BC93F28] FOREIGN KEY ([I_Upgrade_Invoice_Header_ID]) REFERENCES [dbo].[T_Invoice_Parent] ([I_Invoice_Header_ID]),
    CONSTRAINT [FK__T_Student__I_Upg__4CBD6361] FOREIGN KEY ([I_Upgrade_Invoice_Header_ID]) REFERENCES [dbo].[T_Invoice_Parent] ([I_Invoice_Header_ID]),
    CONSTRAINT [FK__T_Student__I_Upg__4DB1879A] FOREIGN KEY ([I_Upgrade_Invoice_Header_ID]) REFERENCES [dbo].[T_Invoice_Parent] ([I_Invoice_Header_ID]),
    CONSTRAINT [FK__T_Student__I_Upg__6E3F1E14] FOREIGN KEY ([I_Upgrade_Invoice_Header_ID]) REFERENCES [dbo].[T_Invoice_Parent] ([I_Invoice_Header_ID]),
    CONSTRAINT [FK__T_Student__I_Upg__6F33424D] FOREIGN KEY ([I_Upgrade_Invoice_Header_ID]) REFERENCES [dbo].[T_Invoice_Parent] ([I_Invoice_Header_ID]),
    CONSTRAINT [FK__T_Student__I_Upg__70276686] FOREIGN KEY ([I_Upgrade_Invoice_Header_ID]) REFERENCES [dbo].[T_Invoice_Parent] ([I_Invoice_Header_ID])
);


GO
ALTER TABLE [dbo].[T_Student_Upgrade_Detail] NOCHECK CONSTRAINT [FK__T_Student__I_Cou__461065D2];


GO
ALTER TABLE [dbo].[T_Student_Upgrade_Detail] NOCHECK CONSTRAINT [FK__T_Student__I_Cou__47048A0B];


GO
ALTER TABLE [dbo].[T_Student_Upgrade_Detail] NOCHECK CONSTRAINT [FK__T_Student__I_Cou__47F8AE44];


GO
ALTER TABLE [dbo].[T_Student_Upgrade_Detail] NOCHECK CONSTRAINT [FK__T_Student__I_Cou__688644BE];


GO
ALTER TABLE [dbo].[T_Student_Upgrade_Detail] NOCHECK CONSTRAINT [FK__T_Student__I_Cou__697A68F7];


GO
ALTER TABLE [dbo].[T_Student_Upgrade_Detail] NOCHECK CONSTRAINT [FK__T_Student__I_Cou__6A6E8D30];



