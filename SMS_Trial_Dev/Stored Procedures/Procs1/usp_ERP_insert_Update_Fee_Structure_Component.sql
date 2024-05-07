﻿-- =============================================        
--Procedure: usp_ERP_insert_Update_Fee_Structure_Component        
-- Ref Used: UT_FeeStructure_Component_Details        
-- Author:      Abhik Porel   
-- Modified By : Susmita Paul : 2024-Jan-09  
-- Create date: 12.12.2023        
-- Description: Fee Structure and Component Creation        
-- =============================================        
        
CREATE  PROCEDURE [dbo].[usp_ERP_insert_Update_Fee_Structure_Component]        
    @h_I_Fee_Structure_ID INT = NULL,          
    @p_S_Fee_Structure_Name varchar(100),        
    @p_S_Fee_Code varchar(20)=null,        
    @p_Dt_StartDt date,        
    @p_Dt_EndDt date,        
    @p_I_School_Group_ID int,        
    @p_I_Class_ID int,        
    @p_I_Stream_ID int=null,        
    @p_I_Section_ID int=null,   
 @p_Is_Late_Fine_Applicable bit,  
    @p_R_I_FineRangeTagID int=0,        
    @p_I_Currency_Type_ID int =null,        
    @p_Is_Active bit,  
 @p_Action_By int,  
 @Fee_ComponentDEtails UT_FeePlanStructure_Component_Details READONLY  
           
  
AS        
BEGIN        
    BEGIN TRY        
        BEGIN TRANSACTION;   
    
  DECLARE @ErrMessage NVARCHAR(4000)  
   
        IF @h_I_Fee_Structure_ID IS NULL   
    
        BEGIN     
        
   INSERT INTO T_ERP_Fee_Structure (        
   S_Fee_Structure_Name,        
   S_Fee_Code,        
   Dt_StartDt,        
   Dt_EndDt,        
   I_School_Group_ID,        
   I_Class_ID,        
   I_Stream_ID,        
   I_Section_ID,        
   Is_Late_Fine_Applicable,             
   R_I_FineRangeTagID,        
   I_Currency_Type_ID,        
   Is_Active,        
   I_CreatedBy        
   )        
   values(@p_S_Fee_Structure_Name,        
   @p_S_Fee_Code,@p_Dt_StartDt,        
   @p_Dt_EndDt        
   ,@p_I_School_Group_ID,        
   @p_I_Class_ID,        
   @p_I_Stream_ID,        
   @p_I_Section_ID,        
   @p_Is_Late_Fine_Applicable,             
   @p_R_I_FineRangeTagID,        
   @p_I_Currency_Type_ID,        
   1,        
   @p_Action_By    
   )        
        
        SET @h_I_Fee_Structure_ID = SCOPE_IDENTITY();       
        
     INSERT INTO T_ERP_Fee_Structure_Installment_Component (        
        
      R_I_Fee_Structure_ID        
     ,R_I_Fee_Component_ID        
     ,I_Seq_No        
     ,N_Component_Actual_Total_Annual_Amount       
     ,Is_OneTime        
     ,Is_During_Admission        
     ,Dt_PostAdmissionDt        
     ,R_I_Fee_Pay_Installment_ID    
     ,Installm_Range_PreAdm  
     ,I_Created_By        
     ,Is_Active        
     )        
  Select        
   @h_I_Fee_Structure_ID,        
   [p_R_I_Fee_Component_ID],        
   [p_I_Seq_No],        
   [N_Component_Actual_Total_Annual_Amount],        
   [p_Is_OneTime],        
   [p_Is_During_Admission],        
   [p_Dt_PostAdmissionDt],        
   [p_R_I_Fee_Pay_Installment_ID],   
   [p_N_Installment_Range_For_PreAdmission],  
   [p_I_Action_By],        
    1  from @Fee_ComponentDEtails     
     
  END    
   
        ELSE   
   BEGIN        
      IF NOT EXISTS(select 1 from T_ERP_Stud_Fee_Struct_Comp_Mapping      
      WHERE R_I_Fee_Structure_ID=@h_I_Fee_Structure_ID)      
      Begin      
        
       UPDATE [dbo].T_ERP_Fee_Structure         
       SET S_Fee_Structure_Name=@p_S_Fee_Structure_Name,        
       S_Fee_Code=@p_S_Fee_Code,        
       Dt_StartDt=@p_Dt_StartDt,        
       Dt_EndDt=@p_Dt_EndDt,        
       I_School_Group_ID=@p_I_School_Group_ID,        
       I_Class_ID=@p_I_Class_ID,        
       I_Stream_ID=@p_I_Stream_ID,        
       I_Section_ID=@p_I_Section_ID,        
       Is_Late_Fine_Applicable=@p_Is_Late_Fine_Applicable,       
       R_I_FineRangeTagID=@p_R_I_FineRangeTagID,        
       I_Currency_Type_ID=@p_I_Currency_Type_ID,        
       Is_Active=@p_Is_Active,        
       I_UpdatedBy=@p_Action_By,        
       Dtt_UpdatedAt=Getdate()         
       WHERE I_Fee_Structure_ID=@h_I_Fee_Structure_ID        
      
         UPDATE FSIC         
         SET R_I_Fee_Component_ID=p_R_I_Fee_Component_ID,               I_Seq_No=p_I_Seq_No,        
         FSIC.N_Component_Actual_Total_Annual_Amount=UTD.[N_Component_Actual_Total_Annual_Amount],        
         Is_OneTime=[p_Is_OneTime],        
         Is_During_Admission=[p_Is_During_Admission],        
         Dt_PostAdmissionDt=[p_Dt_PostAdmissionDt],        
         R_I_Fee_Pay_Installment_ID=[p_R_I_Fee_Pay_Installment_ID],  
         Installm_Range_PreAdm=[p_N_Installment_Range_For_PreAdmission],  
         Dtt_Modified_At=Getdate(),        
         I_Modified_By=[p_I_Action_By],        
         Is_Active=[p_IsActive]  from T_ERP_Fee_Structure_Installment_Component FSIC      
         Inner Join @Fee_ComponentDEtails UTD on FSIC.R_I_Fee_Structure_ID=UTD.p_R_I_Fee_Structure_HeaderID      
         and FSIC.I_Fee_Structure_Installment_Component_ID=UTD.p_I_Fee_Structure_Installment_Component_ID    
     
         IF @@ROWCOUNT  <= 0  
  
       BEGIN  
  
          SELECT @ErrMessage='Someting Went Wrong!'  
  
          RAISERROR(@ErrMessage,11,1)  
  
       END  
  
      End       
      Else      
       Begin      
       --Print 'Edit Not Possible Structure Already Exists in Stud Mapping'     
       SELECT @ErrMessage='Student Already Purchased Fee Structure'  
  
       RAISERROR(@ErrMessage,11,1)  
       End      
    End      
      
   -----Update The Total Amount of Component's at Structure Header--------      
   Update T_ERP_Fee_Structure Set N_Total_OneTime_Amount=(      
   Select Sum([N_Component_Actual_Total_Annual_Amount]) from @Fee_ComponentDEtails where [p_Is_OneTime]=1     
   Group by [p_R_I_Fee_Structure_HeaderID]      
   )   
   ,N_Total_Installment_Amount=(  
   Select Sum([N_Component_Actual_Total_Annual_Amount]) from @Fee_ComponentDEtails where [p_Is_OneTime]=0    
   Group by [p_R_I_Fee_Structure_HeaderID]      
   )   
   where I_Fee_Structure_ID=@h_I_Fee_Structure_ID  
   -----Data Inserting into Old Fee Structure Model-----
   EXEC USP_ERP_OLD_Fee_Plan_Insert @NewFeeStructureID=@h_I_Fee_Structure_ID  
  
 IF @@ROWCOUNT  > 0  
  
  BEGIN  
   select 1 StatusFlag,'Fee Structure Successfully Saved' Message  
  END  
  
 else  
  BEGIN  
  
   SELECT @ErrMessage='Failure! Something Went Wrong..'  
  
   RAISERROR(@ErrMessage,11,1)  
  
  END  
  
  
  
        
        COMMIT;        
    END TRY        
    BEGIN CATCH        
        IF @@TRANCOUNT > 0        
            ROLLBACK;        
        
       DECLARE @ErrMsg NVARCHAR(4000), @ErrSeverity int    
    
 SELECT @ErrMsg = ERROR_MESSAGE(),    
   @ErrSeverity = ERROR_SEVERITY()    
    
 RAISERROR(@ErrMsg, @ErrSeverity, 1)     
               
    END CATCH;        
END; 