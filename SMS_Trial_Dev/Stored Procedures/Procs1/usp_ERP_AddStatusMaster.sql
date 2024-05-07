-- =============================================
-- Author:		<Parichoy Nandi>
-- Create date: <14th Sept 2023>
-- Description:	<to add or update the status master>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ERP_AddStatusMaster] 
	-- Add the parameters for the stored procedure here
	@StatusDesc varchar(255) null,
    @StatusSMSDesc varchar(MAX) null,
    @StatusID int null,
    @Amount numeric null,
	@Brandid int null
AS
begin transaction
BEGIN TRY 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	if(@StatusID>0)
	BEGIN
	if exists (select * from T_Status_Master where S_Status_Desc = @StatusDesc and I_Status_Id != @StatusID and S_Status_Desc_SMS = @StatusDesc)
	BEGIN
	SELECT 0 StatusFlag,'Duplicate Status Master' Message
	END
	ELSE
	BEGIN
	update [SMS].[dbo].[T_Status_Master] 
	set 
	[S_Status_Desc]					= @StatusDesc,
	[S_Status_Type]					= 'ReceiptType',
	[S_Status_Desc_SMS]				= @StatusSMSDesc,
	[N_Amount]						= @Amount
	
	where I_Status_Id = @StatusID
	
	SELECT 1 StatusFlag,'Status Updated' Message
	END
	
	END
	ELSE
	BEGIN
	if exists (select * from T_Status_Master where S_Status_Desc = @StatusDesc and S_Status_Desc_SMS = @StatusDesc)
	BEGIN
	SELECT 0 StatusFlag,'Duplicate Status Master' Message
	END
	ELSE
	BEGIN
	DECLARE @StatusValue INT;
	set @StatusValue = (Select Max(I_Status_Value)+1 from T_Status_Master);


	INSERT INTO [SMS].[dbo].[T_Status_Master]
(
[S_Status_Desc],
[S_Status_Type],
[S_Status_Desc_SMS],
[I_Status_Value],
[N_Amount],
[I_Brand_ID]
)
VALUES
(
	@StatusDesc,
	'ReceiptType',
	@StatusSMSDesc,
	@StatusValue,
	@Amount,
	@Brandid
)

	SELECT 1 StatusFlag,'Status added' Message
	END
	
	END
	

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


	