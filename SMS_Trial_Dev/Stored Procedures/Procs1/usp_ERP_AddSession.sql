-- =============================================
-- Author:		<Parichoy Nandi>
-- Create date: <22-09-2023>
-- Description:	<to add session>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ERP_AddSession] 
	-- Add the parameters for the stored procedure here
	@iSchoolSessionID int =null,
	@iBrandID int ,
	@sSessionLabel nvarchar(50),
	@dtStartDate datetime,
	@dtEndDate datetime,
	@iSessionStatus int,
	@sUpdatedBy varchar(Max)
AS
	begin transaction
BEGIN TRY 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	if(@iSchoolSessionID >0)
	--BEGIN
	--if exists (select 1 from [SMS].[dbo].[T_School_Academic_Session_Master] as SASM where SASM.I_School_Session_ID = @iSchoolSessionID and SASM.I_Status=1)
	--BEGIN
	--SELECT 0 StatusFlag,'Active Session Present' Message
	--END
	--ELSE
	BEGIN 
	 IF  EXISTS (SELECT 1 FROM [SMS].[dbo].[T_School_Academic_Session_Master]
                   WHERE I_Brand_ID = @iBrandID
                     AND ((@dtStartDate >= Dt_Session_Start_Date AND @dtStartDate <= Dt_Session_End_Date)
                          OR (@dtEndDate >= Dt_Session_Start_Date AND @dtEndDate <= Dt_Session_End_Date)))
        BEGIN
	update [SMS].[dbo].[T_School_Academic_Session_Master]
	set 
	 --- [I_Brand_ID] = @iBrandID,
     -- [Dt_Session_Start_Date] = @dtStartDate,
     -- [Dt_Session_End_Date] = @dtEndDate,
      [S_Label] =@sSessionLabel,
      [I_Status]=@iSessionStatus,
      [S_UpdatedBy] =@sUpdatedBy,
      [Dt_UpdatedOn]= GETDATE()
	where [I_School_Session_ID] = @iSchoolSessionID
	SELECT 1 StatusFlag,'Session updated' Message
	END
	--ELSE
	--BEGIN
	--SELECT 0 StatusFlag, 'Session with the same date range exists for the brand' Message
	--END
	END
	ELSE
	--IF NOT EXISTS (SELECT 1 FROM [SMS].[dbo].[T_School_Academic_Session_Master]
 --                  WHERE I_Brand_ID = @iBrandID
 --                    AND ((@dtStartDate >= Dt_Session_Start_Date AND @dtStartDate <= Dt_Session_End_Date)
 --                         OR (@dtEndDate >= Dt_Session_Start_Date AND @dtEndDate <= Dt_Session_End_Date)))
	BEGIN
	INSERT INTO [SMS].[dbo].[T_School_Academic_Session_Master]
(
[I_Brand_ID]
      ,[Dt_Session_Start_Date]
      ,[Dt_Session_End_Date]
      ,[S_Label]
      ,[I_Status]
      ,[S_CreatedBy]
      ,[Dt_CreatedOn]
)
VALUES
(
	@iBrandID,
	@dtStartDate,
	@dtEndDate,
	@sSessionLabel,
	@iSessionStatus,
	@sUpdatedBy,
	GETDATE()
)
SELECT 1 StatusFlag,'New Session added' Message
	END
	--ELSE
	--BEGIN
	--SELECT 0 StatusFlag, 'Session with the same date range exists for the brand' Message
	--END
--END
END
END TRY
BEGIN CATCH
	rollback transaction
	DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity int

	SELECT	@ErrMsg = ERROR_MESSAGE(),
			@ErrSeverity = ERROR_SEVERITY()
select 0 StatusFlag,@ErrMsg Message
END CATCH
commit transaction

