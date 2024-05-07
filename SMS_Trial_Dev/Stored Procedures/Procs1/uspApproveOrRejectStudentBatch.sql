﻿
--sp_helptext uspApproveOrRejectStudentBatch        
--uspApproveOrRejectStudentBatch        
        
CREATE PROCEDURE [dbo].[uspApproveOrRejectStudentBatch]             
(            
 @iBatchId INT,            
 @iStatus INT,            
 @UpdtBy VARCHAR(20),            
 @UpdtOn DATETIME,            
 @iCenterId INT,            
 @dtBatchStartDate DATETIME,            
 @dtBatchExpectedEndDate DATETIME,            
 @MaxStrength int,            
 @MinRegnAmt decimal(18,2),            
 --@iTimeSlotId int,            
 @iTaskDetailId int = NULL,            
 @sBatchName varchar(100),          
 @bIsApproved bit,        
 @iFacultyId INT = NULL,      
 @iAdmissionGraceDays INT,    
 @MinStrength INT,  
 @iLateFeeGraceDays INT    ,
 @dtBatchIntroductionDate DATETIME = null,
 @sBatchIntroductionTime VARCHAR(250) =null       
)            
AS            
BEGIN TRY

	DECLARE @EntryType VARCHAR(MAX)=NULL
	DECLARE @Status INT=NULL

	DECLARE @actionstatus varchar(max)=NULL,@Approveddate datetime=NULL;

	select @Status=I_Status from T_Student_Batch_Master where I_Batch_ID=@iBatchId

	IF(@iStatus=0)
		set @EntryType='UPDATE STATUS'
	ELSE IF(@Status IS NOT NULL and @Status=1)
		set @EntryType='ADD'
	ELSE IF (@Status>1)
		set @EntryType='UPDATE'

 IF(@iStatus = 4 OR @iStatus = 5)            
 BEGIN            
  UPDATE dbo.T_Student_Batch_Master             
  SET I_Status = 2,S_Batch_Name = @sBatchName, Dt_BatchStartDate = @dtBatchStartDate,Dt_Course_Expected_End_Date = @dtBatchExpectedEndDate,            
  S_Updt_By = @UpdtBy,            
  Dt_Upd_On = @UpdtOn,            
  --I_TimeSlot_Id = @iTimeSlotId,          
  b_IsApproved = @bIsApproved ,      
  I_Admission_GraceDays =  @iAdmissionGraceDays,  
  I_Latefee_Grace_Day = @iLateFeeGraceDays   ,
  Dt_BatchIntroductionDate =  @dtBatchIntroductionDate,
  s_BatchIntroductionTime =   @sBatchIntroductionTime   
 WHERE I_Batch_ID = @iBatchId             
              
  UPDATE dbo.T_Center_Batch_Details            
  SET I_Status = @iStatus,            
  S_Updt_By = @UpdtBy,            
  Dt_Upd_On = @UpdtOn,            
  Max_Strength = @MaxStrength,          
  I_Employee_ID = @iFacultyId,         
  I_Minimum_Regn_Amt = @MinRegnAmt,    
  I_Min_Strength = @MinStrength           
  WHERE I_Batch_ID = @iBatchId            
  AND I_Centre_Id = @iCenterId 
  
  /*Added by susmita : 2023March11 : Added for get the value of new selected fee plan and reason of modify and passing to procedure for log and modify */
  
  if(@iStatus = 4 )
	begin
		set @actionstatus='APPROVED : CAN_ENROLL'
	end
  if(@iStatus = 5 )
	begin
		set @actionstatus='APPROVED : COMPLETED'
	end

	set @Approveddate=getdate()

  /*-------------------------*/


 END            
 ELSE            
 BEGIN            
  UPDATE dbo.T_Student_Batch_Master             
  SET I_Status = 3,            
  S_Updt_By = @UpdtBy,            
  Dt_Upd_On = @UpdtOn,          
  b_IsApproved = @bIsApproved ,      
  I_Admission_GraceDays =  @iAdmissionGraceDays,  
  I_Latefee_Grace_Day = @iLateFeeGraceDays   ,
  Dt_BatchIntroductionDate =  @dtBatchIntroductionDate,
  s_BatchIntroductionTime =   @sBatchIntroductionTime             
 WHERE I_Batch_ID = @iBatchId            
         
 UPDATE dbo.T_Center_Batch_Details            
  SET I_Status = NULL,            
  S_Updt_By = @UpdtBy,            
  Dt_Upd_On = @UpdtOn,            
  Max_Strength = @MaxStrength,            
  I_Minimum_Regn_Amt = @MinRegnAmt,    
  I_Min_Strength = @MinStrength            
  WHERE I_Batch_ID = @iBatchId            
  AND I_Centre_Id = @iCenterId  
  
  /*Added by susmita : 2023March11 : Added for get the value of new selected fee plan and reason of modify and passing to procedure for log and modify */
  
	set @actionstatus='REJECTED'


  /*-------------------------*/
          
 END 
 
 /*Added by susmita : 2023March10 : Added for get the value of new selected fee plan and reason of modify and passing to procedure for log and modify */

	Declare @iFeePlanID INT=NULL;
	Declare @BatchApprove INT = NULL,@BrandID INT =NULL,@CenterID INT=NULL;
	select @iFeePlanID=I_Course_Fee_Plan_ID,@CenterID=I_Centre_Id from T_Center_Batch_Details where I_Batch_ID=@iBatchId
	select @BrandID = I_Brand_ID from T_Brand_Center_Details where I_Centre_Id=@CenterID and I_Status=1

	Declare @BatchFeeplanJson varchar(Max)=NULL
	SELECT @BatchFeeplanJson ='['+ STUFF((
                SELECT ',{"I_Batch_ID":"' + CONVERT(NVARCHAR(MAX),t1.I_Batch_ID) + '",'+
							+'"I_Centre_Id":"'+CONVERT(NVARCHAR(MAX),t1.I_Centre_Id) + '",'+
							+'"I_Course_Fee_Plan_ID":"'+CONVERT(NVARCHAR(MAX),t1.I_Course_Fee_Plan_ID) + '",'+
							+'"I_Minimum_Regn_Amt":"'+ISNULL(CONVERT(NVARCHAR(MAX),t1.I_Minimum_Regn_Amt),'NULL') + '",'+
							+'"Max_Strength":"'+ISNULL(CONVERT(NVARCHAR(MAX),t1.Max_Strength),'NULL') + '",'+
							+'"I_Status":"'+ISNULL(CONVERT(NVARCHAR(MAX),t1.I_Status),'NULL') + '",'+
							+'"S_Crtd_By":"'+ISNULL(CONVERT(NVARCHAR(MAX),t1.S_Crtd_By),'NULL') + '",'+
							+'"S_Updt_By":"'+ISNULL(CONVERT(NVARCHAR(MAX),t1.S_Updt_By),'NULL') + '",'
							+'"Dt_Crtd_On":"'+ISNULL(CONVERT(NVARCHAR(MAX),t1.Dt_Crtd_On),'NULL') + '",'+
							+'"Dt_Upd_On":"'+ISNULL(CONVERT(NVARCHAR(MAX),t1.Dt_Upd_On),'NULL') + '",'+
							+'"I_Employee_ID":"'+ISNULL(CONVERT(NVARCHAR(MAX),t1.I_Employee_ID),'NULL')  + '",'+
							+'"B_Is_Eligibility_List_Prepared":"'+ISNULL(CONVERT(NVARCHAR(MAX),t1.B_Is_Eligibility_List_Prepared),'NULL') + '",'+
							+'"I_Min_Strength":"'+ISNULL(CONVERT(NVARCHAR(MAX),t1.I_Min_Strength),'NULL') + '",'+
							+'"I_Center_Dispatch_Scheme_ID":"'+ISNULL(CONVERT(NVARCHAR(MAX),t1.I_Center_Dispatch_Scheme_ID),'NULL') + '",'+
							+'"S_ClassDays":"'+ISNULL(CONVERT(NVARCHAR(MAX),t1.S_ClassDays),'NULL') + '",'+
							+'"S_OfflineClassTime":"'+ISNULL(CONVERT(NVARCHAR(MAX),t1.S_OfflineClassTime),'NULL') + '",'+
							+'"S_OnlineClassTime":"'+ISNULL(CONVERT(NVARCHAR(MAX),t1.S_OnlineClassTime),'NULL') + '",'+
							+'"S_HandoutClassTime":"'+ISNULL(CONVERT(NVARCHAR(MAX),t1.S_HandoutClassTime),'NULL') + '",'+
							+'"S_ClassMode":"'+ISNULL(CONVERT(NVARCHAR(MAX),t1.S_ClassMode),'NULL') + '",'+
						+'"S_BatchTime":"'+ISNULL(CONVERT(NVARCHAR(MAX),t1.S_BatchTime),'NULL') + '"}'
				   FROM (select * from T_Center_Batch_Details where I_Batch_ID=@iBatchId) t1 
					FOR XML PATH(''), TYPE
                  ).value('.', 'varchar(max)'),1,1,''
              ) + ']' ;


	Insert into Batch_Feeschedule_Log
	(
	BrandID,
	ActionDate,
	ApproveDate,
	BatchID,
	CourseFeePlanID,
	BatchFeePlanDetailJson,
	Actionstatus,
	BatchFeePlanUpdatedBy,
	BatchFeePlanUpdatedOn
	)
	values
	(
	@BrandID,
	getdate(),
	@Approveddate,
	@iBatchId,
	@iFeePlanID,
	@BatchFeeplanJson,
	@actionstatus,
	@UpdtBy,
	@UpdtOn
	)
/*------------------------------------------------------------------ */

             
 IF(ISNULL(@iTaskDetailId,0) > 0)            
 BEGIN            
  UPDATE T_Task_Details SET I_Status = 0,Dt_Updated_Date = GETDATE() WHERE I_Task_Details_Id = @iTaskDetailId            
 END 
 
 EXEC LMS.uspInsertBatchDetailsForInterface @iBatchId,@EntryType


END TRY            
BEGIN CATCH            
 DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity int            
 SELECT @ErrMsg = ERROR_MESSAGE(),            
   @ErrSeverity = ERROR_SEVERITY()            
            
 RAISERROR(@ErrMsg, @ErrSeverity, 1)            
END CATCH  
