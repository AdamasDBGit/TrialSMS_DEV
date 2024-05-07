-- =============================================
-- Author:		<Susmita Paul>
-- Create date: <2023 July 12>
-- Description:	<Get Academic Session Master>
-- =============================================
CREATE PROCEDURE [dbo].[uspGetAllSchoolAcademicSessionMaster]
	-- Add the parameters for the stored procedure here
	@iBrandID INT = NULL,
	@iSessionID int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select 
	I_School_Session_ID SchoolAcademicSessionID,
	Dt_Session_Start_Date AcademicSessionStartDate,
	Dt_Session_End_Date AcademicSessionEndDate,
	S_Label	Label
	from 
	T_School_Academic_Session_Master
	where I_Status=1
	AND I_Brand_ID=ISNULL(@iBrandID,I_Brand_ID) -- Add Search Parameter : Susmita 
	AND I_School_Session_ID = ISNULL(@iSessionID,I_School_Session_ID)
	order by I_School_Session_ID desc

END
