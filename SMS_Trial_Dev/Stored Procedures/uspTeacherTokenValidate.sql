CREATE PROCEDURE [dbo].[uspTeacherTokenValidate]
	(
		@sToken NVARCHAR(200)	
	)
AS
BEGIN
	IF EXISTS (select * from T_ERP_User where S_Token = @sToken)
	BEGIN
	declare @brandid int
	set @brandid=(select top 1 t2.I_Brand_ID from T_ERP_User t1 inner join T_Faculty_Master t2 on t2.I_User_ID=t1.I_User_ID where t1.S_Token=@sToken)
	--set @brandid = (select top 1 I_Brand_ID from T_ERP_User_Brand t1 inner join T_ERP_User t2  )
	SELECT 
	I_User_ID ID,
	S_Token Token,
	@brandid BrandID,
	1 StatusFlag,
	'Valid Token' Message
	from T_ERP_User where S_Token = @sToken
	END
	else
	BEGIN
	select 0 StatusFlag,'Invalid Token' Message
	END


END