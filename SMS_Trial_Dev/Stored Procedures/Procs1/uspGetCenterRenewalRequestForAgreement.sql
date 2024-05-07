﻿-- =============================================          
-- Author:  Santanu Maity          
-- Create date: 04/07/2007          
-- Description: Get center from dbo.T_Centre_Master CM          
-- =============================================          
CREATE PROCEDURE [NETWORK].[uspGetCenterRenewalRequestForAgreement] --'L3 Sent'         
 -- Add the parameters for the stored procedure here          
    ( @sStatus VARCHAR(20) = NULL )    
AS     
    BEGIN TRY          
        IF ( @sStatus IS NOT NULL )     
            BEGIN          
                SELECT  CRS.I_Centre_Id,    
                        CM.S_Center_Code,    
                        CM.S_Center_Name,    
                        CRS.I_Status,    
                        CRS.S_Reason    
                FROM    dbo.T_Centre_Master CM    
                        INNER JOIN NETWORK.T_Center_Renewal_Status CRS ON CRS.I_Centre_Id = CM.I_Centre_Id    
                                                                          AND CRS.S_Reason = @sStatus          
            END          
        ELSE     
            BEGIN          
                SELECT  CRS.I_Centre_Id,    
                        CM.S_Center_Code,    
                        CM.S_Center_Name,    
                        CRS.I_Status,    
                        CRS.S_Reason    
                FROM    dbo.T_Centre_Master CM    
                        INNER JOIN NETWORK.T_Center_Renewal_Status CRS ON CRS.I_Centre_Id = CM.I_Centre_Id          
   --AND CRS.I_Status <> 0          
            END          
          
    END TRY          
          
    BEGIN CATCH          
           
        DECLARE @ErrMsg NVARCHAR(4000),    
            @ErrSeverity int          
          
        SELECT  @ErrMsg = ERROR_MESSAGE(),    
                @ErrSeverity = ERROR_SEVERITY()          
          
        RAISERROR ( @ErrMsg, @ErrSeverity, 1 )          
    END CATCH
