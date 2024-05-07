﻿/*****************************************************************************************************************
Created by: Debman Mukherjee
Date: 02/05/2007
Description:Gets the list of Students based CenterID, TimeSlotID, 
			CourseID, TermID, ModuleID, 
			TimeSlotFlag = 1 for fetching student based on the TimeSlot
			0 = for fetching student not in that TimeSlot
			2 = for ignoring the TimeSlot while fetching the student
Parameters: CenterID, TimeSlotID,CourseID, TermID, ModuleID,TimeSlotFlag
Returns:	
Modified By: 
******************************************************************************************************************/
--exec uspGetEventListNew 110
CREATE PROCEDURE [dbo].[uspGetEventListNew]
(
	@iBrandID int = null
	,@iYear int = null
)
AS

BEGIN
DECLARE @start datetime
DECLARE @end datetime
set @start = (select top 1 Dt_Session_Start_Date from T_School_Academic_Session_Master where I_Brand_ID=@iBrandID)
set @end = (select top 1 Dt_Session_End_Date from T_School_Academic_Session_Master where I_Brand_ID=@iBrandID)
SELECT 
AM.*,
TE.I_Event_ID ID 
,TEC.S_Event_Category EventCategory
,TE.S_Event_Name EventName
,TE.Dt_StartDate StartDate
,TE.Dt_EndDate EndDate
,TE.S_Address Address
,@start SessionStartDate
,@end SessionEndDate
from 
(SELECT
 number,
 DATENAME(MONTH, '1900-' + CAST(number as varchar(2)) + '-1') monthname
FROM master..spt_values
WHERE Type = 'P' and number between 1 and 12
) as AM
left join T_Event TE on AM.number = MONTH(TE.Dt_StartDate) 
and  TE.Dt_StartDate between @start and @end
left join T_Event_Category TEC ON TEC.I_Event_Category_ID = TE.I_Event_Category_ID


END

