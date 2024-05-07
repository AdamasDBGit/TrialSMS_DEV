﻿-- =============================================  
-- Author:  <Susmita Paul>  
-- Create date: <2023-Oct-12>  
-- Description: <SaveLogBookCompletionDetails>  
-- =============================================  
CREATE PROCEDURE [dbo].[usp_ERP_SaveLogBookCompletionDetails]  
-- Add the parameters for the stored procedure here  
 @iLogbookID int,  
 @iCompletionPercentage decimal(4,1),  
 @sRemarks varchar(max),  
 @sToken nvarchar(200)=NULL  
AS  
  
BEGIN TRY  
 -- SET NOCOUNT ON added to prevent extra result sets from  
 -- interfering with SELECT statements.  
 SET NOCOUNT ON;  
  
 begin transaction  
  
 DECLARE @ErrMessage NVARCHAR(4000),@UserID INT  
  
 IF EXISTS  
 (  
 select * from   
 T_Faculty_Master as FM   
 inner join  
 T_ERP_User as UM on UM.I_User_ID=FM.I_User_ID  
 where   
 UM.S_Token=@sToken  
 )  
 begin  
  
  select @UserID=I_User_ID from T_User_Master where   
  S_Token=@sToken  
  
  IF EXISTS  
  (  
  select * from T_ERP_Subject_Structure_Plan as SP  
  inner join  
  T_ERP_Subject_Structure_Plan_Detail as SSPD on SP.I_Subject_Structure_Plan_ID=SSPD.I_Subject_Structure_Plan_ID  
  where SP.I_Subject_Structure_Plan_ID=@iLogbookID  
  )  
  
   begin  
  
    IF NOT EXISTS  
    (  
    select * from T_ERP_Subject_Structure_Plan_Execution_Remarks
	--where I_Subject_Structure_Plan_ID=@iLogbookID  
    )  
  
    begin  
  
  
     insert into T_ERP_Subject_Structure_Plan_Execution_Remarks  
     (  
     --I_Subject_Structure_Plan_ID,  
     I_Completion_Percentage,  
     S_Remarks,  
     I_CreatedBy,  
     Dt_CreatedAt,  
     Dt_ExecutedAt  
     )  
     select --@iLogbookID
	 --,
	 @iCompletionPercentage,@sRemarks,@UserID,GETDATE(),GETDATE()   
  
     IF SCOPE_IDENTITY()  > 0  
  
      BEGIN  
  
       select 1 StatusFlag,'Remarks and percentage has been saved Successfully ' Message  
  
      END  
  
    end  
  
    else  
  
     begin  
  
     update T_ERP_Subject_Structure_Plan_Execution_Remarks   
     set I_Completion_Percentage=@iCompletionPercentage,  
     S_Remarks=@sRemarks,  
     I_UpdatedBy=@UserID,  
     Dt_UpdatedAt=GETDATE()  
    -- where I_Subject_Structure_Plan_ID=@iLogbookID  
  
  
     IF @@ROWCOUNT  > 0  
  
      BEGIN  
  
       select 1 StatusFlag,'Remarks and percentage has been saved Successfully ' Message  
  
      END  
  
  
     end  
  
  
   end  
  
  else  
   begin  
  
    SELECT @ErrMessage='Log book Does not Exists '  
  
    RAISERROR(@ErrMessage,11,1)  
  
   end  
  
  
  
 end  
  
 else  
   begin  
  
    SELECT @ErrMessage='Invalid Token'  
  
    RAISERROR(@ErrMessage,11,1)  
  
   end  
  
 commit transaction  
  
END TRY  
BEGIN CATCH  
 rollback transaction  
 DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity int  
  
 SELECT @ErrMsg = ERROR_MESSAGE(),  
   @ErrSeverity = ERROR_SEVERITY()  
  
 RAISERROR(@ErrMsg, @ErrSeverity, 1)  
END CATCH  
  