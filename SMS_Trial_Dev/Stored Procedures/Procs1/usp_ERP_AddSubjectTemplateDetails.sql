﻿-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ERP_AddSubjectTemplateDetails]
	-- Add the parameters for the stored procedure here
	@StructureHeaderID int ,
    @SubjectTemplateID int,
    @SubjectStructureID int null,
    @StructureName varchar(MAX),
    @CreatedBy int,
    @Status int,
	@ParentID int,
	@Objective varchar(MAX),
	@Methodology varchar(MAX)

AS
begin transaction
BEGIN TRY 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @iLsatID int
	if(@SubjectStructureID >0)
	BEGIN
	
	update [SMS].[dbo].[T_ERP_Subject_Structure]
	set
      [S_Name] = @StructureName,
	  [Methodology]=@Methodology,
      [Objective]=@Objective
	where [I_Subject_Structure_ID] = @SubjectStructureID
	SELECT 1 StatusFlag,'Structure updated' Message
	
	END
	ELSE
	BEGIN
	INSERT INTO [SMS].[dbo].[T_ERP_Subject_Structure]
(
      [I_Subject_Structure_Header_ID]
      ,[I_Subject_Template_ID]
      ,[I_Parent_Subject_Structure_ID]
      ,[S_Name]
      ,[I_CreatedBy]
      ,[Dt_CreatedAt]
      ,[I_Status]
	  ,[Methodology]
      ,[Objective]
)
VALUES
(
	@StructureHeaderID,
	@SubjectTemplateID,
	@ParentID,
	@StructureName,
	@CreatedBy,
	GETDATE(),
	@Status,
	@Objective,
	@Methodology
)
set @iLsatID = SCOPE_IDENTITY()
SELECT 1 StatusFlag,'Structure added' Message, @iLsatID StructureID
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


