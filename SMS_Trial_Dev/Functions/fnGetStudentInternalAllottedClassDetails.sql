﻿		  
CREATE FUNCTION [REPORT].[fnGetStudentInternalAllottedClassDetails]
(
	@iStudentID INT,
	@iTermID INT,
	@iModuleID INT,
	@iExamComponentID INT,
	@sAttendanceType VARCHAR(MAX)
)
RETURNS	VARCHAR(10)
AS
BEGIN
	DECLARE @dAllottedClass INT

	IF(@sAttendanceType='Term')
	BEGIN

		IF EXISTS(select * from EXAMINATION.T_Student_Internal_Attendance where I_Student_Detail_ID=@iStudentID and I_Term_ID=@iTermID and I_Exam_Component_ID=@iExamComponentID and I_Module_ID IS NULL)
		BEGIN

			SELECT TOP 1 @dAllottedClass = ROUND(ISNULL(tstd.N_AllottedClass,0),0) FROM EXAMINATION.T_Student_Internal_Attendance AS tstd
			WHERE I_Student_Detail_ID = @iStudentID
			AND I_Term_ID = @iTermID
			AND I_Exam_Component_ID=@iExamComponentID
			and I_Module_ID IS NULL

		END
		ELSE IF EXISTS(select * from EXAMINATION.T_Student_Internal_Attendance where I_Student_Detail_ID=@iStudentID and I_Term_ID=@iTermID and I_Exam_Component_ID IS NULL and I_Module_ID IS NULL)
		BEGIN

			SELECT TOP 1 @dAllottedClass = ROUND(ISNULL(tstd.N_AllottedClass,0),0) FROM EXAMINATION.T_Student_Internal_Attendance AS tstd
			WHERE I_Student_Detail_ID = @iStudentID
			AND I_Term_ID = @iTermID
			AND I_Exam_Component_ID IS NULL
			and I_Module_ID IS NULL

		END

	END

	IF(@sAttendanceType='Module')
	BEGIN

		IF EXISTS(select * from EXAMINATION.T_Student_Internal_Attendance where I_Student_Detail_ID=@iStudentID and I_Term_ID=@iTermID and I_Exam_Component_ID=@iExamComponentID and I_Module_ID=@iModuleID)
		BEGIN

			SELECT TOP 1 @dAllottedClass = ROUND(ISNULL(tstd.N_AllottedClass,0),0) FROM EXAMINATION.T_Student_Internal_Attendance AS tstd
			WHERE I_Student_Detail_ID = @iStudentID
			AND I_Term_ID = @iTermID
			AND I_Exam_Component_ID=@iExamComponentID
			and I_Module_ID=@iModuleID

		END
		ELSE IF EXISTS(select * from EXAMINATION.T_Student_Internal_Attendance where I_Student_Detail_ID=@iStudentID and I_Term_ID=@iTermID and I_Exam_Component_ID IS NULL and I_Module_ID=@iModuleID)
		BEGIN

			SELECT TOP 1 @dAllottedClass = ROUND(ISNULL(tstd.N_AllottedClass,0),0) FROM EXAMINATION.T_Student_Internal_Attendance AS tstd
			WHERE I_Student_Detail_ID = @iStudentID
			AND I_Term_ID = @iTermID
			AND I_Exam_Component_ID IS NULL
			and I_Module_ID=@iModuleID

		END

	END
	
	RETURN @dAllottedClass
END
