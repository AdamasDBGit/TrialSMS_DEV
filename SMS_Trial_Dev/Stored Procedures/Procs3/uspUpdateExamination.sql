﻿/**************************************************************************************************************
Created by  : Swagata De
Date		: 01.05.2007
Description : This SP will retrieve all the list of examinations for the valid centers pertaining to a selected brand and hierarchy id
Parameters  :
Returns     : Dataset
**************************************************************************************************************/

CREATE PROCEDURE [EXAMINATION].[uspUpdateExamination]
	(
		@iExamID INT,
		@iStatusID INT,	
		@dtExamDate DATETIME = NULL,
		@dtStartTime DATETIME = NULL,
		@dtEndTime	DATETIME = NULL,
		@sVenue VARCHAR(200) = NULL,
		@sUpdatedBy VARCHAR(20),
		@DtUpdatedOn DATETIME,
		@sReason VARCHAR(MAX)
	)
AS 
BEGIN TRY
	SET NOCOUNT ON;

	INSERT INTO EXAMINATION.T_Examination_Audit
	(
		I_Exam_ID,I_Exam_Component_ID,I_Centre_Id,I_Course_ID,I_Term_ID,I_Module_ID,
		I_Status_ID,I_Agency_ID,S_Invigilator_Name,S_Identification_Doc_Type,
		C_Invigilator_Notified,S_Reason,Dt_Exam_Date,S_Registration_No,Dt_Registration_Date,
		S_Exam_Venue,Dt_Exam_Start_Time,Dt_Exam_End_Time,S_Crtd_By,S_Upd_By,Dt_Crtd_On,Dt_Upd_On
	)
	SELECT I_Exam_ID,I_Exam_Component_ID,I_Centre_Id,I_Course_ID,I_Term_ID,I_Module_ID,
		I_Status_ID,I_Agency_ID,S_Invigilator_Name,S_Identification_Doc_Type,
		C_Invigilator_Notified,S_Reason,Dt_Exam_Date,S_Registration_No,Dt_Registration_Date,
		S_Exam_Venue,Dt_Exam_Start_Time,Dt_Exam_End_Time,S_Crtd_By,S_Upd_By,Dt_Crtd_On,Dt_Upd_On
	FROM EXAMINATION.T_Examination_Detail WHERE I_Exam_ID = @iExamID
	
	UPDATE EXAMINATION.T_Examination_Detail
	SET I_Status_ID=@iStatusID,Dt_Exam_Date=ISNULL(@dtExamDate,Dt_Exam_Date),Dt_Exam_Start_Time=ISNULL(@dtStartTime,Dt_Exam_Start_Time),
	Dt_Exam_End_Time=ISNULL(@dtEndTime,Dt_Exam_End_Time),
	S_Exam_Venue=ISNULL(@sVenue,S_Exam_Venue),
	S_Reason=@sReason,
	S_Upd_By=@sUpdatedBy,Dt_Upd_On=@DtUpdatedOn	
	WHERE I_Exam_ID=@iExamID
END TRY
BEGIN CATCH
--Error occurred:  

DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity int
SELECT	@ErrMsg = ERROR_MESSAGE(),
		@ErrSeverity = ERROR_SEVERITY()

RAISERROR(@ErrMsg, @ErrSeverity, 1)
END CATCH
