CREATE TABLE [PLACEMENT].[T_International_Certificate] (
    [I_Intnal_Certification_ID]      INT IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [I_International_Certificate_ID] INT NOT NULL,
    [I_Student_Detail_ID]            INT NOT NULL,
    [I_Status]                       INT NULL,
    CONSTRAINT [PK__T_International___0A943F91] PRIMARY KEY CLUSTERED ([I_Intnal_Certification_ID] ASC),
    CONSTRAINT [FK__T_Interna__I_Int__33965524] FOREIGN KEY ([I_International_Certificate_ID]) REFERENCES [PLACEMENT].[T_Intnal_Certificate_Master] ([I_International_Certificate_ID]),
    CONSTRAINT [FK__T_Interna__I_Stu__4AA3D7AE] FOREIGN KEY ([I_Student_Detail_ID]) REFERENCES [PLACEMENT].[T_Placement_Registration] ([I_Student_Detail_ID])
);

