﻿-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>

-- exec [dbo].[usp_ERP_RoutineSubjectTeacherAllocationAddEdit] 250, 1, 1, 1
-- =============================================
CREATE PROCEDURE [dbo].[usp_ERP_RoutineSubjectTeacherAllocationAddEdit]
	-- Add the parameters for the stored procedure here
	(
		@selectedClassStructureDetailID INT = NULL,
		@FacultyMasterID INT = NULL,
		@SubjectID INT = NULL,
		@ClassType VARCHAR(50) = NULL,
		@CreatedBy INT = NULL
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF EXISTS(SELECT 1 FROM T_ERP_Student_Class_Routine WHERE I_Routine_Structure_Detail_ID = @selectedClassStructureDetailID)
	BEGIN
		UPDATE T_ERP_Student_Class_Routine
		SET I_Faculty_Master_ID = @FacultyMasterID,
			I_Subject_ID = @SubjectID,
			S_Class_Type = @ClassType,
			I_CreatedBy = @CreatedBy
		WHERE I_Routine_Structure_Detail_ID = @selectedClassStructureDetailID;
		SELECT 1 AS statusFlag, 'Subject & Faculty updated successfully' AS Message
	END
	ELSE
	BEGIN
		INSERT INTO T_ERP_Student_Class_Routine(I_Routine_Structure_Detail_ID, I_Faculty_Master_ID, I_Subject_ID, I_CreatedBy, Dt_CreatedAt, S_Class_Type)
		VALUES(@selectedClassStructureDetailID, @FacultyMasterID, @SubjectID, @CreatedBy, GETDATE(), @ClassType);
		SELECT 1 AS statusFlag, 'Subject & Faculty added successfully' AS Message
	END
END
