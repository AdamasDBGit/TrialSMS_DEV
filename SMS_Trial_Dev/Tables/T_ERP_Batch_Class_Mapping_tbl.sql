CREATE TABLE [dbo].[T_ERP_Batch_Class_Mapping_tbl] (
    [Batch_Class_Mapping_tbl_ID] INT           IDENTITY (1, 1) NOT NULL,
    [I_Batch_ID]                 INT           NULL,
    [S_Batch_Name]               VARCHAR (100) NULL,
    [S_Class_Name]               VARCHAR (20)  NULL,
    [I_Class_ID]                 INT           NULL,
    [S_StreamName]               VARCHAR (20)  NULL,
    [I_StreamID]                 INT           NULL,
    [S_SectionName]              VARCHAR (10)  NULL,
    [I_Section_ID]               INT           NULL,
    [S_GroupName]                VARCHAR (25)  NULL,
    [I_School_GroupID]           INT           NULL,
    [Dt_CreateDt]                DATETIME      DEFAULT (getdate()) NULL
);

