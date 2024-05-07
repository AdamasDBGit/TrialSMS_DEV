﻿-- Add the parameters for the stored procedure here      
CREATE PROCEDURE [dbo].[uspInsertUpdateTransportDetails]    
    (    
      @I_PickupPoint_ID INT ,    
      @I_Brand_ID INT ,    
      @S_PickupPoint_Name VARCHAR(2000) ,    
      @N_Fees NUMERIC(18, 2) ,    
      @I_Status INT ,    
      @vEsdCrtdBy VARCHAR(50) ,    
      @vEsdUpdBy VARCHAR(50) ,    
      @iUpdateID INT ,    
      @dEsdCrtdOn DATETIME ,    
      @dEsdUpdOn DATETIME ,    
      @I_BusRoute_ID VARCHAR(MAX) = NULL      
    )    
AS     
    BEGIN TRY       
        SET NOCOUNT OFF ;      
        DECLARE @iResult INT      
        DECLARE @iPickupPointID INT      
 --DECLARE @iUpdateID INT      
        BEGIN TRANSACTION       
        SET @iResult = 0 -- set to default zero       
          
        IF @iUpdateID = 1 --for insert        
            BEGIN      
                IF ( SELECT COUNT(*)    
                     FROM   dbo.T_Transport_Master AS TERD    
                     WHERE  S_PickupPoint_Name = @S_PickupPoint_Name    
                            AND I_Status = 1
                            --akash 28.3.2017
                            AND I_Brand_ID= @I_Brand_ID
                            --akash 28.3.2017  
                   ) = 0     
                    BEGIN              
                   
                        INSERT  INTO dbo.T_Transport_Master    
                                ( I_Brand_ID ,    
                                  S_PickupPoint_Name ,    
                                  N_Fees ,    
                                  I_Status ,    
                                  S_Crtd_By ,    
                                  Dt_Crtd_On       
                                )    
                        VALUES  ( @I_Brand_ID ,    
                                  @S_PickupPoint_Name ,    
                                  @N_Fees ,    
                                  @I_Status ,    
                                  @vEsdCrtdBy ,    
                                  @dEsdCrtdOn      
                                )      
         
                        SELECT  @iPickupPointID = @@IDENTITY           
                  
                        INSERT  INTO dbo.T_Route_Transport_Map    
                                ( I_PickupPoint_ID ,    
                                  I_Route_ID ,    
                                  I_Status ,    
                                  S_Crtd_By ,    
                                  Dt_Crtd_On        
                                )    
                                SELECT  @iPickupPointID ,    
                                        CAST(Val AS INT) ,    
                                        @I_Status ,    
                                        @vEsdCrtdBy ,    
                                        @dEsdCrtdOn    
                                FROM    dbo.fnString2Rows(@I_BusRoute_ID, ',')    
                                        AS FSR    
                             
                    END        
                ELSE     
                    BEGIN      
                        RAISERROR('Entry with the same PickupPoint Name. already exists',11,1)      
                    END      
             
                  
            END      
 --SELECT  @@IDENTITY      
        ELSE     
            IF @iUpdateID = 0 -- for update      
                BEGIN  
                
                
                INSERT INTO dbo.T_Transport_History( I_PickupPoint_ID ,
                          I_Brand_ID ,
                          S_PickupPoint_Name ,
                          N_Fees ,
                          I_Status ,
                          S_Crtd_By ,
                          Dt_Crtd_On 
                        )
                        SELECT TM.I_PickupPoint_ID,TM.I_Brand_ID,TM.S_PickupPoint_Name,TM.N_Fees,TM.I_Status,@vEsdUpdBy,@dEsdUpdOn  FROM T_Transport_Master TM  WHERE   I_PickupPoint_ID = @I_PickupPoint_ID   
                        
                    UPDATE  T_Transport_Master    
                    SET     S_PickupPoint_Name = @S_PickupPoint_Name ,    
                            N_Fees = @N_Fees ,    
                            S_Updt_By = @vEsdUpdBy ,    
                            Dt_Updt_On = @dEsdUpdOn    
                    WHERE   I_PickupPoint_ID = @I_PickupPoint_ID      
        
                    UPDATE  T_Route_Transport_Map    
                    SET     I_Status = 0 ,    
                            S_Updt_By = @vEsdUpdBy ,    
                            Dt_Updt_On = @dEsdUpdOn    
                    WHERE   I_PickupPoint_ID = @I_PickupPoint_ID      
                       
                    INSERT  INTO dbo.T_Route_Transport_Map    
                                ( I_PickupPoint_ID ,    
   I_Route_ID ,    
                                  I_Status ,    
                                  S_Crtd_By ,    
                                  Dt_Crtd_On        
      )    
                                SELECT  @I_PickupPoint_ID ,    
                                        CAST(Val AS INT) ,    
                                        @I_Status ,    
                                        @vEsdCrtdBy ,    
                                        @dEsdCrtdOn    
                                FROM    dbo.fnString2Rows(@I_BusRoute_ID, ',')    
                                        AS FSR     
                        
        
                END      
            ELSE     
                IF @iUpdateID = 2 -- for delete      
                    BEGIN   
                    
                     INSERT INTO dbo.T_Transport_History( I_PickupPoint_ID ,
                          I_Brand_ID ,
                          S_PickupPoint_Name ,
                          N_Fees ,
                          I_Status ,
                          S_Crtd_By ,
                          Dt_Crtd_On 
                        )
                        SELECT TM.I_PickupPoint_ID,TM.I_Brand_ID,TM.S_PickupPoint_Name,TM.N_Fees,TM.I_Status,@vEsdUpdBy,@dEsdUpdOn  FROM T_Transport_Master TM  WHERE   I_PickupPoint_ID = @I_PickupPoint_ID    
                           
                        UPDATE  T_Transport_Master    
                        SET     I_Status = @I_Status ,    
                                S_Updt_By = @vEsdUpdBy ,    
                                Dt_Updt_On = @dEsdUpdOn    
                        WHERE   I_PickupPoint_ID = @I_PickupPoint_ID       
        
                        UPDATE  T_Route_Transport_Map    
                        SET     I_Status = @I_Status ,    
                                S_Updt_By = @vEsdUpdBy ,    
                                Dt_Updt_On = @dEsdUpdOn    
                        WHERE   I_PickupPoint_ID = @I_PickupPoint_ID       
                    END      
       
        SELECT  @iResult Result      
        COMMIT TRANSACTION       
    END TRY      
    BEGIN CATCH      
        ROLLBACK TRANSACTION        
        DECLARE @ErrMsg NVARCHAR(4000) ,    
            @ErrSeverity INT      
      
        SELECT  @ErrMsg = ERROR_MESSAGE() ,    
                @ErrSeverity = ERROR_SEVERITY()      
      
        RAISERROR(@ErrMsg, @ErrSeverity, 1)      
    END CATCH   
