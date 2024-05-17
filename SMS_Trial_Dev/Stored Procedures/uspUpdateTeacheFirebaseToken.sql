CREATE PROCEDURE [dbo].[uspUpdateTeacheFirebaseToken] 
(
	@sMobile nvarchar(200),
	@sFireBaseToken nvarchar(max) = null
)
AS
begin transaction
BEGIN TRY 
IF(@sFireBaseToken is not null)
BEGIN
UPDATE T_ERP_USER 
SET S_FireBase_Token = @sFireBaseToken
WHERE S_Mobile = @sMobile
END
select 1 StatusFlag,'Token updated succesfully' Message
END TRY
BEGIN CATCH
	rollback transaction
	DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity int

	SELECT	@ErrMsg = ERROR_MESSAGE(),
			@ErrSeverity = ERROR_SEVERITY()

	RAISERROR(@ErrMsg, @ErrSeverity, 1)
END CATCH
commit transaction