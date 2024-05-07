
--Procedure: usp_ERP_Savings_Grade_Pattern                
-- Ref Used: UT_Grade_Pattern_Details               
-- Author:      Abhik Porel                
-- Create date: 09.01.2024  
-- Modified date:Null  
-- Reason: Grading Savings  
-- Description: Savings Fee Grade Master ;               
-- =============================================                

CREATE PROCEDURE [dbo].[usp_ERP_Savings_Grade_Pattern]
    @h_I_Exam_Grade_Master_Header_ID INT = NULL
  , @Grade_Name Varchar(100)
  , @p_I_CreatedBy int
  , @Is_Active Int Null
  , @Grade_PatternDetails [UT_Grade_Pattern_Details] READONLY
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;


        IF @h_I_Exam_Grade_Master_Header_ID IS NULL
        BEGIN
            INSERT INTO T_ERP_Exam_Grade_Master_Header
            (
                S_Grade_Name
              , Dt_CreatedAt
              , I_CreatedBy
              , Is_Active
            )
            Values
            (@Grade_Name, getdate(), @p_I_CreatedBy, @Is_Active)
            SET @h_I_Exam_Grade_Master_Header_ID = SCOPE_IDENTITY();
        END
        ELSE
        BEGIN

            UPDATE T_ERP_Exam_Grade_Master_Header
            SET S_Grade_Name = @Grade_Name
              , Dt_Modified_At = Getdate()
              , I_Modified_By = @p_I_CreatedBy
              , Is_Active = @Is_Active
            Where I_Exam_Grade_Master_Header_ID = @h_I_Exam_Grade_Master_Header_ID
        End

        MERGE INTO T_ERP_Exam_Grade_Master AS target
        Using @Grade_PatternDetails AS Source
        ON target.I_Exam_Grade_Master_ID = source.I_Exam_Grade_Master_Details_ID
           And target.I_Exam_Grade_Master_Header_ID = Source.I_Exam_Grade_Master_Header_ID
        WHEN MATCHED THEN
            UPDATE SET S_Symbol = Source.Grade_Type
                     , I_Lower_Limit = Source.I_Lower_Limit
                     , I_Upper_Limit = Source.I_Upper_Limit
                     , S_Remarks = Source.S_Remarks
                     , Is_Active = Source.Is_Active
                     , Dt_Modified_At = Getdate()
        WHEN NOT MATCHED THEN
            INSERT
            (
                I_Exam_Grade_Master_Header_ID
              , S_Symbol
              , I_Lower_Limit
              , I_Upper_Limit
              , S_Remarks
              , Dt_CreatedBy
              , Dt_CreatedAt
              , Is_Active
            )
            Values
            (@h_I_Exam_Grade_Master_Header_ID
           , Source.Grade_Type
           , Source.I_Lower_Limit
           , Source.I_Upper_Limit
           , Source.S_Remarks
           , @p_I_CreatedBy
           , Getdate()
           , Source.[Is_Active]
            )
        WHEN NOT MATCHED BY SOURCE 
		and target.I_Exam_Grade_Master_Header_ID=@h_I_Exam_Grade_Master_Header_ID
		THEN
            Update SET Is_Active = 0
                     , Dt_Modified_At = GETDATE();

        select 1                       StatusFlag
             , 'Grade Pattern Updated' Message
        COMMIT;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK;

        DECLARE @ErrMsg NVARCHAR(4000)
              , @ErrSeverity int

        SELECT ERROR_MESSAGE() as Message
             , 0               StatusFlag

        RAISERROR(@ErrMsg, @ErrSeverity, 1)

    END CATCH;
END;