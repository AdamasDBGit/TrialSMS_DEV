-- =============================================
-- Author:		<Susmita Paul>
-- Create date: <2023 Nov 14>
-- Description:	<Get The Faculty Details for ERP Based on User LogIN>
-- =============================================
CREATE PROCEDURE uspGetERP_AllFacultyDetailsBasedOnLogIn 
	-- Add the parameters for the stored procedure here
	@iBrandID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select FM.I_Faculty_Master_ID as FacultyId,
	FM.S_Faculty_Name as FacultyName,
	Fm.S_Faculty_Code as FacultyCode
	from 
	T_Faculty_Master as FM 
	inner join
	T_ERP_User as EU on FM.I_User_ID=EU.I_User_ID
	where FM.I_Brand_ID=@iBrandID



END
