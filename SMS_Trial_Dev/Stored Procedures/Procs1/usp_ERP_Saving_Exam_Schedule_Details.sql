﻿  
--Procedure: usp_ERP_Saving_Exam_Schedule_Details                    
-- Ref Used: UT_EXAM_Schedule_Config                   
-- Author:      Abhik Porel                    
-- Create date: 12.01.2024      
-- Modified date:Null      
-- Reason: Exam Schedule Savings      
-- Description: Savings Exam Schedule ;                   
-- =============================================                    
  
CREATE PROCEDURE [dbo].[usp_ERP_Saving_Exam_Schedule_Details]  
    @brand_ID int,  
    @groupid int,  
    @Classid int,  
    @streamid int,  
    @sectionid int,  
    @I_School_Session_ID int,  
    @I_Created_By int,  
    @ExamScheduleName Varchar(100),
	@ExamTypeID int,
	@ResultType int,
    @h_I_Result_Exam_Schedule_ID int=null,--------
	@I_Exam_Component_Header_ID int,
	@ExamSt_Dt Date,
	@ExamEnd_Dt Date,
	@I_Is_Term_Exam int,
    @Is_Active bit null,  
    @Exam_Schedule_Details [UT_EXAM_Schedule_Config] READONLY  
AS  
BEGIN  
    SET NOCOUNT ON;  
    BEGIN TRY  
        BEGIN TRANSACTION;  
  
        Declare @messageInsert int,@messageUpdate int 
		Declare @I_School_Group_Class_ID int
		SET @I_School_Group_Class_ID=(Select Top 1 I_School_Group_Class_ID from T_School_Group_Class 
		where I_School_Group_ID=@groupid and I_Class_ID=@Classid)

        IF @h_I_Result_Exam_Schedule_ID IS NULL  
        Begin  
            INSERT INTO T_ERP_Result_Exam_Schedule  
            (  

                S_Exam_Schedule_Name
               ,I_School_Session_ID
			   ,I_Brand_ID
               ,I_Class_ID
               ,I_School_Group_Class_ID
               ,I_Stream_ID
               ,I_Section_ID
               ,Dt_Exam_Start_Date
               ,Dt_Exam_End_Date
               ,I_Exam_Type_ID
               ,I_Result_Type
               ,I_Exam_Comp_Header_ID
               ,S_Class_Teacher_Name
               ,S_Principal_Name
               ,I_Result_Process_Status
               ,I_Result_Publish_Status
               ,Dt_Result_Publish_Date
               ,I_Is_Freezed
               ,Dt_CreatedAt
               ,I_Created_By
               ,I_IsActive
               ,I_Is_Previous_Exam_Marks
               ,I_Is_Term_Exam  
            )  
            Values  
            (
			 @ExamScheduleName,  
             @I_School_Session_ID,
			 @brand_ID,
			 @Classid,
			 @I_School_Group_Class_ID,
			 @streamid,  
             @sectionid,
			 @ExamSt_Dt,
			 @ExamEnd_Dt,
			 @ExamTypeID,
			 @ResultType,
			 @I_Exam_Component_Header_ID,
			 Null,
			 Null,
			 0,
			 0,
			 Null,
			 0,
			 GETDATE(),
			 1,
			 @Is_Active,
			 0,
			 0
            )  
            SET @h_I_Result_Exam_Schedule_ID = SCOPE_IDENTITY();  

           SET @messageInsert=1  
        END  
        ELSE  
        Begin  
  
            UPDATE T_ERP_Result_Exam_Schedule  
            SET 
			    S_Exam_Schedule_Name=@ExamScheduleName
               ,I_Class_ID=@Classid
               ,I_School_Group_Class_ID=@I_School_Group_Class_ID
               ,I_Stream_ID=@streamid
               ,I_Section_ID=@sectionid
               ,Dt_Exam_Start_Date=@ExamSt_Dt
               ,Dt_Exam_End_Date=@ExamEnd_Dt
               ,I_Exam_Type_ID=@ExamTypeID
               ,I_Result_Type=@ResultType
               ,I_Exam_Comp_Header_ID=@I_Exam_Component_Header_ID
               ,I_IsActive=@Is_Active
            Where I_Result_Exam_Schedule_ID = @h_I_Result_Exam_Schedule_ID  
        End  
  
        MERGE INTO T_ERP_Exam_Schedule_Details AS target  
        Using @Exam_Schedule_Details AS Source  
        ON target.I_ScheduleDetail_ID = source.I_ScheduleDetail_ID  
        And target.R_I_Result_Exam_Schedule_ID = @h_I_Result_Exam_Schedule_ID  
        WHEN MATCHED THEN  
            UPDATE SET Dt_Exam_Start_Date = Source.Dt_Exam_Start_Date,  
                       Dt_Exam_End_Date = Source.[Dt_Exam_End_Date],  
                       R_I_Slot_ID = Source.[R_I_Slot_ID],  
                       I_Exam_Comp_Header_ID = Source.[I_Exam_Comp_Header_ID],  
                       I_Exam_Comp_Map_ID = Source.[I_Exam_Comp_Map_ID],  
                       Is_Active = Source.Is_Active_Details,  
                       I_Faculty_Master_ID = Source.[I_Faculty_Master_ID],  
                       Dtt_Modified_At = Getdate()  
        WHEN NOT MATCHED THEN  
            INSERT  
            (  
                R_I_Result_Exam_Schedule_ID
               ,Dt_Exam_Start_Date
               ,Dt_Exam_End_Date
               ,R_I_Slot_ID
               ,I_Exam_Comp_Header_ID
               ,I_Exam_Comp_Map_ID
               ,I_Faculty_Master_ID
               ,Dtt_Created_At
               ,I_Created_By
               ,Is_Active 
            )  
            Values  
            (@h_I_Result_Exam_Schedule_ID,  
             Source.[Dt_Exam_Start_Date],  
             Source.[Dt_Exam_End_Date],  
             Source.[R_I_Slot_ID],  
             Source.[I_Exam_Comp_Header_ID],  
             Source.[I_Exam_Comp_Map_ID],  
             Source.[I_Faculty_Master_ID],  
             Getdate(),
			 @I_Created_By,
			 source.Is_Active_Details 
            )  
            WHEN NOT MATCHED BY SOURCE and target.R_I_Result_Exam_Schedule_ID = @h_I_Result_Exam_Schedule_ID THEN  
            Update SET Is_Active = 0,  
                       Dtt_Modified_At = GETDATE();  
          SET @messageUpdate=1  

  If (@messageInsert=1 and @messageUpdate=1)  
  Begin   
  select 1 StatusFlag,  
             'Exam Schedule Added' Message  
  End  
  Else If (@messageUpdate=1 and @messageInsert is null)  
  Begin  
  select 1 StatusFlag,  
             'Exam Schedule Updated' Message  
  End   
  Else  
  Begin  
  Print 'NO Action Taken'  
  End  
        COMMIT;  
    END TRY  
    BEGIN CATCH  
        IF @@TRANCOUNT > 0  
            ROLLBACK;  
  
        DECLARE @ErrMsg NVARCHAR(4000),  
                @ErrSeverity int  
  
        SELECT ERROR_MESSAGE() as Message,  
               0 StatusFlag  
  
        RAISERROR(@ErrMsg, @ErrSeverity, 1)  
  
    END CATCH;  
END;