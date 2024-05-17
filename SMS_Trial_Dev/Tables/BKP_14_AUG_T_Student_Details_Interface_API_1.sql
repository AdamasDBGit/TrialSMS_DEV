﻿CREATE TABLE [LMS].[BKP_14_AUG_T_Student_Details_Interface_API] (
    [ID]                 INT             IDENTITY (1, 1) NOT NULL,
    [StudentDetailID]    INT             NULL,
    [StudentID]          VARCHAR (MAX)   NULL,
    [FirstName]          VARCHAR (MAX)   NULL,
    [MiddleName]         VARCHAR (MAX)   NULL,
    [LastName]           VARCHAR (MAX)   NULL,
    [Email]              VARCHAR (MAX)   NULL,
    [ContactNo]          VARCHAR (50)    NULL,
    [CurrAddress]        VARCHAR (MAX)   NULL,
    [Country]            VARCHAR (MAX)   NULL,
    [BrandID]            INT             NULL,
    [BrandName]          VARCHAR (MAX)   NULL,
    [CentreID]           INT             NULL,
    [CentreCode]         VARCHAR (50)    NULL,
    [CentreName]         VARCHAR (MAX)   NULL,
    [BatchID]            INT             NULL,
    [BatchCode]          VARCHAR (MAX)   NULL,
    [BatchName]          VARCHAR (MAX)   NULL,
    [CourseID]           INT             NULL,
    [CourseName]         VARCHAR (MAX)   NULL,
    [StudentStatus]      VARCHAR (MAX)   NULL,
    [StatusFlag]         BIT             NULL,
    [ActionType]         VARCHAR (MAX)   NULL,
    [ActionStatus]       INT             NULL,
    [NoofAttempts]       INT             NULL,
    [StatusID]           INT             NULL,
    [CreatedOn]          DATETIME        NULL,
    [CompletedOn]        DATETIME        NULL,
    [Remarks]            VARCHAR (MAX)   NULL,
    [OrgEmailID]         VARCHAR (MAX)   NULL,
    [DefaulterDate]      DATETIME        NULL,
    [DueAmount]          DECIMAL (14, 2) NULL,
    [SecondaryLanguage]  VARCHAR (MAX)   NULL,
    [SourceBatchID]      VARCHAR (MAX)   NULL,
    [LMSCourseEnrolment] BIT             NULL,
    [MandateLink]        VARCHAR (MAX)   NULL,
    [PayOutLink]         VARCHAR (MAX)   NULL,
    [CustomerID]         VARCHAR (MAX)   NULL
);
