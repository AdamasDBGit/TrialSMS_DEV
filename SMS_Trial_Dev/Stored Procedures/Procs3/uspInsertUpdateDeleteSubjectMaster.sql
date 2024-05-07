/*******************************************************
Description : Save E-Project Manual
Author	:     Arindam Roy
Date	:	  05/22/2007
*********************************************************/

CREATE PROCEDURE [dbo].[uspInsertUpdateDeleteSubjectMaster] 
(
	@iMode int =0,
	@iSubjectID int = null,
	@iSchoolGroupID int = null,
	@iClassID int =null,
	@iStreamID int = null,
	@sSubjectName nvarchar(50)=null,
	@sSubjectCode	 nvarchar(50)=null,
	@iTotalNumberOfClassesRequired int = null,
	@iStatus int = 1,
	@iBrandID int=null,
	@iCreatedBy int=null,
	@iSubjectType int =null,
	@UTSubjectComponents UT_SubjectComponents readonly
)
AS
begin transaction
BEGIN TRY 
	IF(@iMode>0)
	BEGIN
	
		IF EXISTS (SELECT I_Subject_ID FROM T_ERP_Student_Class_Routine WHERE I_Subject_ID = @iSubjectID)
		BEGIN
			SELECT 0 StatusFlag,'Unable to delete, this subject is already assigned to a teacher' Message
		END
		ELSE
		BEGIN
			DELETE FROM T_Subject_Master where I_Subject_ID = @iSubjectID
			SELECT 1 StatusFlag,'Subject deleted successfully' Message
		END

	END
	ELSE
		BEGIN
			IF(@iSubjectID>0)
			BEGIN
				IF EXISTS(select * from T_Subject_Master where S_Subject_Name=@sSubjectName and I_Class_ID=@iClassID and I_School_Group_ID=@iSchoolGroupID and I_Subject_ID!=@iSubjectID)
				BEGIN
					SELECT 0 StatusFlag,'Duplicate Subject name ' Message
				END
				ELSE IF EXISTS(select * from T_Subject_Master where S_Subject_Code=@sSubjectCode and I_Class_ID=@iClassID and I_School_Group_ID=@iSchoolGroupID and I_Subject_ID!=@iSubjectID)
				BEGIN
					SELECT 0 StatusFlag,'Duplicate Subject Code ' Message
				END
				ELSE
				BEGIN
					UPDATE T_Subject_Master
					SET
					 S_Subject_Name  = @sSubjectName
					,I_School_Group_ID = @iSchoolGroupID
					,S_Subject_Code	 = @sSubjectCode
					,I_Status		 = @iStatus
					,I_UpdatedBy	 = @iCreatedBy
					,Dt_UpdatedAt	 = GETDATE()
					,I_Subject_Type = @iSubjectType
					,I_Class_ID = @iClassID
					,I_Stream_ID = @iStreamID
					where I_Subject_ID = @iSubjectID

					MERGE T_ERP_Subject_Component_Mapping AS target    
					USING @UTSubjectComponents AS source       
					ON target.I_Subject_Component_Mapping=source.[I_Subject_Component_Mapping]    
					and target.I_Subject_ID=@iSubjectID    					
					WHEN MATCHED THEN    
						UPDATE  SET target.I_Subject_Component_ID=source.I_Subject_Component_ID,            
					    target.Is_Active=source.Is_Active     
					WHEN NOT MATCHED THEN    
					   INSERT (              
							 I_Subject_ID      
							,I_Subject_Component_ID 
							,Is_Active
						)     
						VALUES (
							@iSubjectID
							,source.I_Subject_Component_ID      
							,1
						);    


					SELECT 1 StatusFlag,'Subject updated successfully' Message
				END
			END
			ELSE
				BEGIN
					IF EXISTS(select * from T_Subject_Master where S_Subject_Name=@sSubjectName and I_Class_ID=@iClassID and I_School_Group_ID=@iSchoolGroupID)
					BEGIN
						SELECT 0 StatusFlag,'Duplicate Subject name' Message
					END
					ELSE IF EXISTS(select * from T_Subject_Master where  S_Subject_Code = @sSubjectCode and I_Class_ID=@iClassID and I_School_Group_ID=@iSchoolGroupID)
					BEGIN
						SELECT 0 StatusFlag,'Duplicate Subject Code' Message
					END
					ELSE
					BEGIN
						INSERT INTO T_Subject_Master
						(
							 I_School_Group_ID
							,I_Class_ID
							,S_Subject_Name
							,S_Subject_Code
							,I_Subject_Type
							,I_TotalNoOfClasses
							,I_Status
							,I_CreatedBy
							,Dt_CreatedAt
							,I_Brand_ID
							,I_Stream_ID
						)
						VALUES
						(
							@iSchoolGroupID
							,@iClassID
							,@sSubjectName
							,@sSubjectCode
							,@iSubjectType
							,@iTotalNumberOfClassesRequired
							,@iStatus
							,@iCreatedBy
							,GETDATE()
							,@iBrandID
							,@iStreamID
						)
						DECLARE @I_Subject_ID int
						SET @I_Subject_ID = SCOPE_IDENTITY();

						INSERT INTO T_ERP_Subject_Component_Mapping
						(
							I_Subject_ID,
							Is_Active,							
							I_Subject_Component_ID
						)
						SELECT @I_Subject_ID, 1, I_Subject_Component_ID from @UTSubjectComponents

						SELECT 1 StatusFlag,'Subject added successfully' Message
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
	--RAISERROR(@ErrMsg, @ErrSeverity, 1)
END CATCH
commit transaction
