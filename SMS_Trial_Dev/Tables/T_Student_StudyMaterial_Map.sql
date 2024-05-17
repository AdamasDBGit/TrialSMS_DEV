CREATE TABLE [dbo].[T_Student_StudyMaterial_Map] (
    [I_Student_Detail_ID] INT           NOT NULL,
    [S_StudyMaterial_No]  VARCHAR (500) NOT NULL,
    CONSTRAINT [PK_T_Student_StudyMaterial_Map] PRIMARY KEY CLUSTERED ([I_Student_Detail_ID] ASC, [S_StudyMaterial_No] ASC),
    CONSTRAINT [FK_T_Student_StudyMaterial_Map_T_Student_Detail] FOREIGN KEY ([I_Student_Detail_ID]) REFERENCES [dbo].[T_Student_Detail] ([I_Student_Detail_ID])
);


GO
ALTER TABLE [dbo].[T_Student_StudyMaterial_Map] NOCHECK CONSTRAINT [FK_T_Student_StudyMaterial_Map_T_Student_Detail];



