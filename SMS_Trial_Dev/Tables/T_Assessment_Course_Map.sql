CREATE TABLE [ASSESSMENT].[T_Assessment_Course_Map] (
    [I_PreAssessment_ID] INT          NOT NULL,
    [I_Course_ID]        INT          NOT NULL,
    [S_Ctrd_by]          VARCHAR (20) NULL,
    [S_Updt_by]          VARCHAR (20) NULL,
    [Dt_Crtd_On]         DATETIME     NULL,
    [Dt_Updt_On]         DATETIME     NULL,
    CONSTRAINT [PK_T_Assessment_Course_Map] PRIMARY KEY CLUSTERED ([I_PreAssessment_ID] ASC, [I_Course_ID] ASC),
    CONSTRAINT [FK_T_Assessment_Course_Map_T_Course_Master] FOREIGN KEY ([I_Course_ID]) REFERENCES [dbo].[T_Course_Master] ([I_Course_ID]),
    CONSTRAINT [FK_T_Assessment_Course_Map_T_PreAssessment_Master] FOREIGN KEY ([I_PreAssessment_ID]) REFERENCES [ASSESSMENT].[T_PreAssessment_Master] ([I_PreAssessment_ID])
);

