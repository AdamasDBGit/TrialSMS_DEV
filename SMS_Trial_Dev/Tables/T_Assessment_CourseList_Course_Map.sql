CREATE TABLE [ASSESSMENT].[T_Assessment_CourseList_Course_Map] (
    [I_Course_List_ID] INT NOT NULL,
    [I_Course_ID]      INT NOT NULL,
    CONSTRAINT [PK_T_Assessment_CourseList_Course_Map] PRIMARY KEY CLUSTERED ([I_Course_List_ID] ASC, [I_Course_ID] ASC),
    CONSTRAINT [FK_T_Assessment_CourseList_Course_Map_T_Course_Master] FOREIGN KEY ([I_Course_ID]) REFERENCES [dbo].[T_Course_Master] ([I_Course_ID]),
    CONSTRAINT [FK_T_Assessment_CourseList_Course_Map_T_Rule_CourseList_Map] FOREIGN KEY ([I_Course_List_ID]) REFERENCES [ASSESSMENT].[T_Rule_CourseList_Map] ([I_CourseList_ID])
);


GO
ALTER TABLE [ASSESSMENT].[T_Assessment_CourseList_Course_Map] NOCHECK CONSTRAINT [FK_T_Assessment_CourseList_Course_Map_T_Course_Master];



