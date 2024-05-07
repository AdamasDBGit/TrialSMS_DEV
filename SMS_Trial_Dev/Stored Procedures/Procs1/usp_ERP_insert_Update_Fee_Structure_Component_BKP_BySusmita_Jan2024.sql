
-- =============================================      
--Procedure: usp_ERP_insert_Update_Fee_Structure_Component      
-- Ref Used: UT_FeeStructure_Component_Details      
-- Author:      Abhik Porel      
-- Create date: 12.12.2023      
-- Description: Fee Structure and Component Creation      
-- =============================================      
      
CREATE  PROCEDURE [dbo].[usp_ERP_insert_Update_Fee_Structure_Component_BKP_BySusmita_Jan2024]      
    @h_I_Fee_Structure_ID INT = NULL,        
    @p_S_Fee_Structure_Name varchar(100),      
    @p_S_Fee_Code varchar(20),      
    @p_Dt_StartDt date,      
    @p_Dt_EndDt date,      
    @p_I_School_Group_ID int,      
    @p_I_Class_ID int,      
    @p_I_Stream_ID int=null,      
    @p_I_Section_ID int=null,      
    @p_Is_Late_Fine_Applicable bit,      
    @p_N_Fine_Amount numeric=null,      
    @p_Dt_LateFine_Due_Dt date null,      
    @p_Is_OneTime_FineApplicable bit,      
    @p_R_I_FineRangeTagID int=0,      
    @p_I_Currency_Type_ID int =null,      
    @p_Is_Active bit=null,      
    @p_I_CreatedBy int ,      
    @p_I_UpdatedBy int =null,      
 @Fee_ComponentDEtails UT_FeeStructure_Component_Details READONLY      
AS      
BEGIN      
    BEGIN TRY      
        BEGIN TRANSACTION;      
 
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
 N_Fine_Amount,      
 Dt_LateFine_Due_Dt,      
 Is_OneTime_FineApplicable,      
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
 @p_N_Fine_Amount,      
 @p_Dt_LateFine_Due_Dt,      
 @p_Is_OneTime_FineApplicable,      
 @p_R_I_FineRangeTagID,      
 @p_I_Currency_Type_ID,      
 1,      
 @p_I_CreatedBy    
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
            ,I_Created_By      
            ,Is_Active      
   )      
Select      
 @h_I_Fee_Structure_ID,      
 [p_R_I_Fee_Component_ID],      
 [p_I_Seq_No],      
 [p_N_Component_Actual_Amount],      
 [p_Is_OneTime],      
 [p_Is_During_Admission],      
 [p_Dt_PostAdmissionDt],      
 [p_R_I_Fee_Pay_Installment_ID],      
 [p_I_Created_By],      
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
 N_Fine_Amount=@p_N_Fine_Amount,      
 Dt_LateFine_Due_Dt=@p_Dt_LateFine_Due_Dt,      
 Is_OneTime_FineApplicable=@p_Is_OneTime_FineApplicable,      
 R_I_FineRangeTagID=@p_R_I_FineRangeTagID,      
 I_Currency_Type_ID=@p_I_Currency_Type_ID,      
 Is_Active=@p_Is_Active,      
 I_UpdatedBy=@p_I_UpdatedBy,      
 Dtt_UpdatedAt=Getdate()       
 WHERE I_Fee_Structure_ID=@h_I_Fee_Structure_ID      
    
   UPDATE FSIC       
   SET R_I_Fee_Component_ID=p_R_I_Fee_Component_ID,    
   I_Seq_No=p_I_Seq_No,      
   N_Component_Actual_Total_Annual_Amount=[p_N_Component_Actual_Amount],      
   Is_OneTime=[p_Is_OneTime],      
   Is_During_Admission=[p_Is_During_Admission],      
   Dt_PostAdmissionDt=[p_Dt_PostAdmissionDt],      
   R_I_Fee_Pay_Installment_ID=[p_R_I_Fee_Pay_Installment_ID],      
   Dtt_Modified_At=Getdate(),      
   I_Modified_By=[p_I_Modified_By],      
   Is_Active=[p_Is_Active]  from T_ERP_Fee_Structure_Installment_Component FSIC    
   Inner Join @Fee_ComponentDEtails UTD on FSIC.R_I_Fee_Structure_ID=UTD.p_R_I_Fee_Structure_HeaderID    
   and FSIC.I_Fee_Structure_Installment_Component_ID=UTD.p_I_Fee_Structure_Installment_Component_ID    
   End     
   Else    
   Begin    
   Print 'Edit Not Possible Structure Already Exists in Stud Mapping'    
   End    
   End    
    
   -----Update The Total Amount of Component's at Structure Header--------    
   Update T_ERP_Fee_Structure Set N_Total_Amount=(    
   Select Sum([p_N_Component_Actual_Amount]) from @Fee_ComponentDEtails     
   Group by [p_R_I_Fee_Structure_HeaderID]    
   )  where   I_Fee_Structure_ID=@h_I_Fee_Structure_ID
     
      
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
