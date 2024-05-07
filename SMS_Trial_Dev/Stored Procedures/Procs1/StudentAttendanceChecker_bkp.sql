﻿Create PROCEDURE [dbo].[StudentAttendanceChecker_bkp] 
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
@RoutineID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON;

select 


TSASM.I_School_Session_ID,
TSASM.S_Label, 
TSASM.I_Brand_ID,
TERSH.I_School_Group_ID,
TERSD.I_Period_No,
TERSD.T_FromSlot,
TERSD.T_ToSlot,
TWDM.I_Day_ID,
TWDM.S_Day_Name,
TWOM.I_Weekly_Off_Day_ID,
(case when  TWOM.I_WeekOff=1 then 'YES'
      when  TWOM.I_WeekOff=7 then 'YES'
	  else 'NO'
end ) AS Week_Off,
TWOM.I_IsAlternative,
TERSH.I_Class_ID,
TC.S_Class_Name,
TERSH.I_Section_ID,
TS.S_Section_Name,
TERSH.I_Stream_ID,
STE.S_Stream,
TSM.I_Subject_ID,
TSM.S_Subject_Name,
TFM.I_Faculty_Master_ID,
TFM.S_Faculty_Name,
TSD.I_Student_Detail_ID,
concat (TSD.S_First_Name,' ',isnull(TSD.S_Middle_Name,''),' ',TSD.S_Last_Name) as Name,
TSD.I_RollNo,
TEAED.I_IsPresent,
TEAEH.Dt_Date Date,
ERD.S_Student_Photo as ImageUrl

from 

T_School_Academic_Session_Master TSASM

left join T_ERP_Routine_Structure_Header TERSH on 
TERSH.I_School_Session_ID=TSASM.I_School_Session_ID

left join T_ERP_Routine_Structure_Detail TERSD on 
TERSD.I_Routine_Structure_Header_ID=TERSH.I_Routine_Structure_Header_ID

left Join T_Week_Day_Master TWDM on TWDM.I_Day_ID=TERSD.I_Day_ID

left join T_Weekly_Off_Master TWOM on TWOM.I_Day_ID=TWDM.I_Day_ID and 
TERSD.I_Day_ID=TWOM.I_Day_ID 

left join T_Class TC on TC.I_Class_ID=TERSH.I_Class_ID

left join T_Section TS on TS.I_Section_ID=TERSH.I_Section_ID

left Join T_Stream STE on STE.I_Stream_ID=TERSH.I_Stream_ID

left join T_ERP_Student_Class_Routine TESCR on 
TESCR.I_Routine_Structure_Detail_ID=TERSD.I_Routine_Structure_Detail_ID

left join T_Subject_Master TSM  ON TESCR.I_Subject_ID=TSM.I_Subject_ID  

Left Join T_Faculty_Master TFM on 
TFM.I_Faculty_Master_ID=TESCR.I_Faculty_Master_ID

left join T_ERP_Attendance_Entry_Header TEAEH on 
TEAEH.I_Student_Class_Routine_ID=TESCR.I_Student_Class_Routine_ID

left join T_ERP_Attendance_Entry_Detail TEAED on 
TEAED.I_Attendance_Entry_Header_ID=TEAEH.I_Attendance_Entry_Header_ID

left Join T_Student_Detail TSD on 
TSD.I_Student_Detail_ID=TEAED.I_Student_Detail_ID
JOIN dbo.T_Enquiry_Regn_Detail as ERD on ERD.I_Enquiry_Regn_ID=TSD.I_Enquiry_Regn_ID




where 
--- Will Only find respective of Active Class,Strean, Academic_session------- 

TSASM.I_Status=1 
and 
TC.I_Status=1 
and 
STE.I_Status=1
and 
/*TFM.I_Faculty_Master_ID=@TeacherID 
and 
TWDM.I_Day_ID=@DayID
and 
TC.I_Class_ID= @ClassID
and 
TSM.I_Subject_ID=@SubjectID
*/
TESCR.I_Student_Class_Routine_ID=@RoutineID


group by 
TSASM.I_School_Session_ID,
TSASM.S_Label, 
TSASM.I_Brand_ID,
TERSH.I_School_Group_ID,
TERSD.I_Period_No,
TERSD.T_FromSlot,
TERSD.T_ToSlot,
TWDM.I_Day_ID,
TWDM.S_Day_Name,
TWOM.I_Weekly_Off_Day_ID,
(case when  TWOM.I_WeekOff=1 then 'YES'
      when  TWOM.I_WeekOff=7 then 'YES'
	  else 'NO'
end ),
TWOM.I_IsAlternative,
TERSH.I_Class_ID,
TC.S_Class_Name,
TERSH.I_Section_ID,
TS.S_Section_Name,
TERSH.I_Stream_ID,
STE.S_Stream,
TSM.I_Subject_ID,
TSM.S_Subject_Name,
TFM.I_Faculty_Master_ID,
TFM.S_Faculty_Name,
TSD.I_Student_Detail_ID,
TSD.S_First_Name, TSD.S_Middle_Name,TSD.S_Last_Name,
TSD.I_RollNo,
TEAED.I_IsPresent,
TEAEH.Dt_Date,
ERD.S_Student_Photo






order by 
TWDM.I_Day_ID, 
TERSD.I_Period_No,
TERSD.T_FromSlot,
TERSD.T_ToSlot;



END
