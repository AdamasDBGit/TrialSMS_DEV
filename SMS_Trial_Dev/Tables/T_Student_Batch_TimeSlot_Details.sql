CREATE TABLE [dbo].[T_Student_Batch_TimeSlot_Details] (
    [ID]             INT           IDENTITY (1, 1) NOT NULL,
    [BatchID]        INT           NOT NULL,
    [ClassDay]       VARCHAR (MAX) NULL,
    [PeriodSequence] INT           NULL,
    [TimeSlot]       VARCHAR (MAX) NULL,
    [CreatedBy]      VARCHAR (MAX) NULL,
    [CreatedOn]      DATETIME      NULL
);

