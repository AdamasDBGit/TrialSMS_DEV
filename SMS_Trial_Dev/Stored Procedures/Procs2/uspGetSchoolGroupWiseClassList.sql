-- =============================================
-- Author:		<Susmita Paul>
-- Create date: <2023 July 11>
-- Description:	<Get School Group Class>
-- =============================================
CREATE PROCEDURE [dbo].[uspGetSchoolGroupWiseClassList] 
	-- Add the parameters for the stored procedure here
	(
	@iBrandID INT=NULL,
	@iSchoolGroupID INT 
	)
AS
BEGIN
	
	select SG.I_School_Group_ID as SchoolGroupID,
	TC.I_Class_ID as ClassID,
	TC.S_Class_Code as ClassCode,
	TC.S_Class_Name as ClassName from 
	T_School_Group as SG
	inner join
	T_School_Group_Class as SGC on SG.I_School_Group_ID=SGC.I_School_Group_ID
	inner join
	T_Class as TC on TC.I_Class_ID=SGC.I_Class_ID
	where SG.I_Brand_Id=ISNULL(@iBrandID,SG.I_Brand_Id) and SGC.I_School_Group_ID=@iSchoolGroupID
	and SG.I_Status=1 and SGC.I_Status=1 and TC.I_Status=1
	
END
