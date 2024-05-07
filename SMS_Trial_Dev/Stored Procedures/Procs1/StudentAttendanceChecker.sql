--exec [StudentAttendanceChecker] 436,'2024-04-06'
--exec usp_ERP_GetStudentByRoutineStructureDetailID 435,'2024-04-05',107
CREATE PROCEDURE [dbo].[StudentAttendanceChecker] 
-- =============================================
     -- Author:  Tridip Chatterjee
-- Create date:  18-09-2023
-- Description:	 To check student attendance status by teacher 
--               for particular class
-- =============================================
-- Add the parameters for the stored procedure here
/*@TeacherID int,
@DayID int,
@ClassID int,
@SubjectID int
*/
--exec [StudentAttendanceChecker] 431,'2024-03-11'
@RoutineID int,
@Date datetime = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON;
--insert into #tempAttendance
declare @isAttendanceTaken int
set @isAttendanceTaken= 
CASE WHEN 
    ( SELECT COUNT(*) FROM T_ERP_Attendance_Entry_Header AS TEAEH WHERE TEAEH.I_Student_Class_Routine_ID = @RoutineID AND Dt_Date = @Date
    ) > 0 THEN 1 ELSE 0 END
--select @isAttendanceTaken
SELECT 
	 TC.S_Class_Name
	,TERSD.T_FromSlot
     ,TERSD.T_ToSlot
	 ,TERSD.I_Period_No
	 ,TS.S_Section_Name
     ,TERSH.I_Stream_ID
     ,STE.S_Stream
	 ,TSM.I_Subject_ID
     ,TSM.S_Subject_Name
	 ,TFM.I_Faculty_Master_ID
	 ,TFM.S_Faculty_Name
	 ,TSD.I_Student_Detail_ID
	 ,concat (TSD.S_First_Name,' ',isnull(TSD.S_Middle_Name,''),' ',TSD.S_Last_Name) as Name
	 ,TSD.I_RollNo
	,ISNULL(TEAED.I_IsPresent,0) I_IsPresent
	,TEAEH.Dt_Date Date
	,ERD.S_Student_Photo as ImageUrl

	--TESCR.I_Student_Class_Routine_ID AS ClassRoutineID,
	--TERSD.I_Routine_Structure_Detail_ID AS RoutineStructureDetailID,
	--TERSH.I_Routine_Structure_Header_ID AS RoutineStructureHeaderID,
	----TERSH.I_Class_ID
	--TSGC.I_School_Group_Class_ID AS SchoolGroupClassID,
	--TSCS.I_Student_Detail_ID AS StudentDetailID,
	--ISNULL(TSD.S_First_Name,'')+' '+ISNULL(TSD.S_Middle_Name,'')+' '+ISNULL(TSD.S_Last_Name,'') AS StudentName,
	--TSCS.S_Class_Roll_No AS StudentRollNo,
	--TSD.S_Student_ID AS StudentID,
	--ISNULL(TEAED.I_IsPresent, 0) AS IsPresent 

	into #tempAttendance
	FROM T_ERP_Student_Class_Routine TESCR
	inner join T_ERP_Routine_Structure_Detail TERSD ON TERSD.I_Routine_Structure_Detail_ID = TESCR.I_Routine_Structure_Detail_ID
	inner join T_ERP_Routine_Structure_Header TERSH ON TERSH.I_Routine_Structure_Header_ID = TERSD.I_Routine_Structure_Header_ID
	inner join T_School_Group_Class TSGC ON TSGC.I_School_Group_ID = TERSH.I_School_Group_ID
	inner join T_School_Group TSG ON TSG.I_School_Group_ID = TSGC.I_School_Group_ID
	inner join T_Class TC ON TC.I_Class_ID = TSGC.I_Class_ID and TC.I_Class_ID=TERSH.I_Class_ID
	inner join T_Student_Class_Section TSCS ON TSCS.I_School_Session_ID = TERSH.I_School_Session_ID AND TSCS.I_School_Group_Class_ID = TSGC.I_School_Group_Class_ID --AND (TSCS.I_Section_ID = TERSH.I_Section_ID OR TSCS.I_Section_ID is null)-- AND (TSCS.I_Stream_ID = TERSH.I_Stream_ID OR TSCS.I_Stream_ID is null)
	AND ((TSCS.I_Section_ID = TERSH.I_Section_ID) OR (TSCS.I_Section_ID IS NULL AND TERSH.I_Section_ID IS NULL))
	AND ((TSCS.I_Stream_ID = TERSH.I_Stream_ID) OR (TSCS.I_Stream_ID IS NULL AND TERSH.I_Stream_ID IS NULL))
	inner join T_Student_Detail TSD ON TSD.I_Student_Detail_ID = TSCS.I_Student_Detail_ID
	left join T_ERP_Student_Subject TESS ON TESS.I_Subject_ID = TESCR.I_Subject_ID and TSD.I_Student_Detail_ID=TESS.I_Student_Detail_ID
	
	left join T_Section TS on TS.I_Section_ID=TERSH.I_Section_ID
    left Join T_Stream STE on STE.I_Stream_ID=TERSH.I_Stream_ID
	left join T_Subject_Master TSM  ON TESCR.I_Subject_ID=TSM.I_Subject_ID 
	Left Join T_Faculty_Master TFM on 
	TFM.I_Faculty_Master_ID=TESCR.I_Faculty_Master_ID
	left join T_ERP_Attendance_Entry_Header TEAEH on 
	TEAEH.I_Student_Class_Routine_ID=TESCR.I_Student_Class_Routine_ID and CAST(TEAEH.Dt_Date AS DATE) = CAST(@Date AS DATE)
	left join T_ERP_Attendance_Entry_Detail TEAED ON TEAED.I_Student_Detail_ID = TSCS.I_Student_Detail_ID AND TEAED.I_Attendance_Entry_Header_ID=TEAEH.I_Attendance_Entry_Header_ID
	JOIN dbo.T_Enquiry_Regn_Detail as ERD on ERD.I_Enquiry_Regn_ID=TSD.I_Enquiry_Regn_ID

	WHERE (TESCR.I_Student_Class_Routine_ID = @RoutineID) 
	if(@isAttendanceTaken=0)
	BEGIN
	CREATE TABLE #previousTempAttendance (
    I_Attendance_Entry_Detail_ID int
	,I_Attendance_Entry_Header_ID int
	,I_Student_Detail_ID int
	,I_IsPresent int
);
	INSERT INTO #previousTempAttendance 
    EXEC ERP_Usp_get_Previous_StudAttendance @Date,@RoutineID;

	update #tempAttendance 
	set #tempAttendance.I_IsPresent = #previousTempAttendance.I_IsPresent
	from  #tempAttendance inner join #previousTempAttendance  on #previousTempAttendance.I_Student_Detail_ID = #tempAttendance.I_Student_Detail_ID
	DROP TABLE #previousTempAttendance;

	END
	
	
	select * from #tempAttendance
	--select * from #previousTempAttendance
	DROP TABLE #tempAttendance;
	

END
