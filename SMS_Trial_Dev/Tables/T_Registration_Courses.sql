﻿CREATE TABLE [ECOMMERCE].[T_Registration_Courses] (
    [RegistrationCourseID] INT           IDENTITY (1, 1) NOT NULL,
    [RegID]                INT           NOT NULL,
    [CourseName]           VARCHAR (MAX) NOT NULL,
    [StatusID]             INT           NULL
);

