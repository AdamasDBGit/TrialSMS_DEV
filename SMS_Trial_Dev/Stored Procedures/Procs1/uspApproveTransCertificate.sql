﻿CREATE PROCEDURE [dbo].[uspApproveTransCertificate]    
    @iStudentID INT ,    
    @iRequestStatus CHAR ,  
    @SRemarks varchar(500),  
    @sUpdatedBy VARCHAR(20),  
    @DtUpdatedOn DATETIME       
AS     
    BEGIN TRY      
        SET NOCOUNT OFF      
  DECLARE @I_Transfer_Cert_Req_ID INT   
    
        IF EXISTS ( SELECT  *    
                    FROM    dbo.T_Transfer_Certificates    
                    WHERE   I_Student_Detail_ID = @iStudentID    
                            AND I_Transfer_Req_Status = 1 )     
            BEGIN      
                  
                SELECT @I_Transfer_Cert_Req_ID=I_Transfer_Cert_Req_ID FROM dbo.T_Transfer_Certificates WHERE   I_Student_Detail_ID = @iStudentID    
                            AND I_Transfer_Req_Status = 1  
                  
                  
                UPDATE  dbo.T_Transfer_Certificates    
                SET     I_Transfer_Req_Status = 2 ,  
      S_Remarks = @SRemarks ,  
      S_Upd_By =@sUpdatedBy ,  
      Dt_Upd_On = @DtUpdatedOn  
                WHERE   I_Student_Detail_ID = @iStudentID      
                                                          
      
    INSERT  INTO T_Transfer_Certificates_Audit_Trial    
                        ( I_Transfer_Cert_Req_ID ,    
                          I_Transfer_Req_Status ,     
                          S_Remarks ,  
                          S_Crtd_By,Dt_Crtd_On    
                         )  
                          VALUES                          
                 ( @I_Transfer_Cert_Req_ID,2,@SRemarks ,@sUpdatedBy,@DtUpdatedOn )  
                            
                               
            END      
            BEGIN
            --UPDATE dbo.T_Student_Center_Detail SET I_Status=0 WHERE I_Student_Detail_ID=@iStudentID
            UPDATE dbo.T_Student_Batch_Details SET i_status=0 WHERE I_Student_ID=@iStudentID
            --UPDATE dbo.T_Student_Detail SET i_status=0 WHERE I_Student_Detail_ID=@iStudentID
            END
       
    END TRY      
      
    BEGIN CATCH      
 --Error occurred:        
      
        DECLARE @ErrMsg NVARCHAR(4000) ,    
            @ErrSeverity INT      
        SELECT  @ErrMsg = ERROR_MESSAGE() ,    
                @ErrSeverity = ERROR_SEVERITY()      
      
        RAISERROR(@ErrMsg, @ErrSeverity, 1)      
    END CATCH  
