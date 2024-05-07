﻿
CREATE PROCEDURE [dbo].[KPMG_uspGetLastMontMoveOrderPerBranch]
@Parama1	INT,
@Context	VARCHAR(100)
AS

BEGIN TRY 
	print'1'
	IF ISNULL(@Context,'') = 'BranchLevelGrid'
	BEGIN
	--datepart(month,A.Fld_KPMG_LastRecvDate)
		select A.Fld_KPMG_Branch_Id AS BranchCode,A.Fld_KPMG_Mo_Id AS MoveOrder,B.S_Center_Name AS BranchName 
		from Tbl_KPMG_MoMaster A JOIN T_Center_Hierarchy_Name_Details B
		on A.Fld_KPMG_Branch_Id = B.I_Center_ID
		WHERE datepart(month,A.[Fld_KPMG_Created Date]) = @Parama1
	END
	ELSE IF ISNULL(@Context,'') = 'MoveOrderGrid' 
	BEGIN
		print '1'
	END
END TRY
BEGIN CATCH
	
	DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity int

	SELECT	@ErrMsg = ERROR_MESSAGE(),
			@ErrSeverity = ERROR_SEVERITY()

	RAISERROR(@ErrMsg, @ErrSeverity, 1)
END CATCH

