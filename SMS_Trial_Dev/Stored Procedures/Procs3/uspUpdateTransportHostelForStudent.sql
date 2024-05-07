﻿CREATE PROCEDURE [dbo].[uspUpdateTransportHostelForStudent]    
-- Add the parameters for the stored procedure here    
    @iStudentId INT ,
    @iTransportId INT ,
    @iRoomId INT ,
    @iBusRouteId INT = NULL ,
    @dtDeactivation DATETIME = NULL ,
    @S_CrtdBy VARCHAR(50) ,
    @Dt_CrtdOn DATETIME
AS 
    BEGIN TRY    
        SET NOCOUNT ON    
     
        BEGIN TRANSACTION  
          
        IF EXISTS ( SELECT  *
                    FROM    dbo.T_Student_Detail AS TSD
                    WHERE   I_Student_Detail_ID = @iStudentId
                            AND I_Status = 1 ) 
            BEGIN    
                UPDATE  dbo.T_Student_Detail
                SET     I_Transport_ID = @iTransportId ,
                        I_room_ID = @iRoomId ,
                        I_Route_ID = @iBusRouteId ,
                        Dt_Transport_Deactivation = @dtDeactivation
                WHERE   I_Student_Detail_ID = @iStudentId
                        AND I_Status = 1    
     
            END  
         IF (@iTransportId <> 0)
         BEGIN     
        IF ( SELECT COUNT(*)
             FROM   T_Student_Transport_History
             WHERE  I_Student_Detail_ID = @iStudentId
                    AND I_Route_ID = @iBusRouteId
                    AND I_PickupPoint_ID = @iTransportId
                    AND Dt_Transport_Deactivation = @dtDeactivation
           ) = 0 
            BEGIN  
          
                INSERT  INTO dbo.T_Student_Transport_History
                        ( I_Student_Detail_ID ,
                          I_PickupPoint_ID ,
                          I_Route_ID ,
                          Dt_Transport_Deactivation ,
                          S_crtd_By ,
                          Dt_crtd_On         
                        )
                VALUES  ( @iStudentId ,
                          @iTransportId ,
                          @iBusRouteId ,
                          @dtDeactivation ,
                          @S_CrtdBy ,
                          @Dt_CrtdOn  
                        )   
          
            END    
            END 
                
        COMMIT TRANSACTION   
     
    END TRY    
    BEGIN CATCH    
 --Error occurred:      
        ROLLBACK TRANSACTION  
        DECLARE @ErrMsg NVARCHAR(4000) ,
            @ErrSeverity INT    
        SELECT  @ErrMsg = ERROR_MESSAGE() ,
                @ErrSeverity = ERROR_SEVERITY()    
    
        RAISERROR(@ErrMsg, @ErrSeverity, 1)    
    END CATCH 
