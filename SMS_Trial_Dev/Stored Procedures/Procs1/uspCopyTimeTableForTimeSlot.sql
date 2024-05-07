﻿CREATE PROCEDURE [dbo].[uspCopyTimeTableForTimeSlot] 
    (    
      @ICenterID INT ,    
      @DtSelected DATETIME ,   
      @SCopyTimeTableForTimeSlotXML XML = NULL ,   
      @ISrcTimeSlotID INT ,    
      @sCrtdBy VARCHAR(20) ,    
      @DtCrtdOn DATETIME          
    )    
AS     
    BEGIN TRY                        
  BEGIN TRANSACTION T1  
          
        -- Create Temporary Table To TimeTable source Information              
        CREATE TABLE #tempTimeTable  
            (  
     I_TimeSlot_ID int ,  
     I_Batch_ID int ,  
     I_Room_ID int ,  
     S_Remarks varchar(500) ,  
     I_Session_ID int ,  
     S_SessionName VARCHAR(500) ,  
     S_SessionTopic VARCHAR(500) ,  
     I_ModuleId INT ,  
     I_TermId INT        
            )    
     
   -- Insert Values into Temporary Table              
        INSERT  INTO #tempTimeTable  
                SELECT  T.c.value('@I_TimeSlot_ID', 'int') ,  
      T.c.value('@I_Batch_ID', 'int') ,  
                        T.c.value('@I_Room_ID', 'int') ,                         
                        CASE WHEN T.c.value('@S_Remarks','varchar(500)') = '' THEN NULL ELSE T.c.value('@S_Remarks','varchar(500)') END,  
                        T.c.value('@I_Session_ID', 'int') ,  
                        T.c.value('@S_SessionName', 'VARCHAR(500)') ,  
                        CASE WHEN T.c.value('@S_SessionTopic', 'varchar(500)') = '' THEN NULL ELSE T.c.value('@S_SessionTopic', 'varchar(500)') END,  
                        T.c.value('@I_ModuleId', 'INT') ,                          
                        T.c.value('@I_TermId', 'INT')  
                FROM    @SCopyTimeTableForTimeSlotXML.nodes('/Root/TimeTableCopy') T ( c )                 
                  
                  
        IF ( SELECT COUNT(*)    
             FROM   T_TimeTable_Master    
             WHERE  I_Center_ID = @ICenterID    
                    AND Dt_Schedule_Date = @DtSelected    
                    AND I_TimeSlot_ID = @ISrcTimeSlotID    
                    AND I_Status = 1  
           ) > 0     
            BEGIN        
  
                DELETE  FROM dbo.T_TimeTable_Faculty_Map    
                WHERE   I_TimeTable_ID IN (    
                        SELECT  I_TimeTable_ID    
                        FROM    dbo.T_TimeTable_Master AS TTTM    
                        WHERE  
                        I_TimeSlot_ID IN (  SELECT  I_TimeSlot_ID FROM #tempTimeTable )  
                        AND I_Center_ID = @ICenterID    
                        AND Dt_Schedule_Date = @DtSelected )    
       
                UPDATE  dbo.T_TimeTable_Master    
                SET     I_Status = 0 ,    
                        S_Updt_By = @sCrtdBy ,    
                        Dt_Updt_On = @DtCrtdOn    
                WHERE    
                        I_TimeSlot_ID IN (  SELECT  I_TimeSlot_ID FROM #tempTimeTable )   
                        AND I_Center_ID = @ICenterID    
                        AND Dt_Schedule_Date = @DtSelected    
                          
                          
                --DELETE  FROM dbo.T_TimeTable_Faculty_Map    
                --WHERE   I_TimeTable_ID IN (    
                --        SELECT  I_TimeTable_ID    
                --      FROM    dbo.T_TimeTable_Master AS TTTM    
                --        WHERE  
                --        I_Batch_ID IN (  SELECT  I_Batch_ID FROM #tempTimeTable )   
                --        AND I_Session_ID IN (  SELECT  I_Session_ID FROM #tempTimeTable )   
                --        AND I_Center_ID = @ICenterID    
                --        AND Dt_Schedule_Date = @DtSelected   
                --        AND I_TimeSlot_ID <> @ISrcTimeSlotID )  
                          
                --UPDATE  dbo.T_TimeTable_Master    
                --SET     I_Status = 0 ,    
                --        S_Updt_By = @sCrtdBy ,    
                --        Dt_Updt_On = @DtCrtdOn    
                --WHERE    
                --        I_Batch_ID IN (  SELECT  I_Batch_ID FROM #tempTimeTable )   
                --        AND I_Session_ID IN (  SELECT  I_Session_ID FROM #tempTimeTable )   
                --        AND I_Center_ID = @ICenterID    
                --        AND Dt_Schedule_Date = @DtSelected  
                --        AND I_TimeSlot_ID <> @ISrcTimeSlotID   
                          
                INSERT  INTO dbo.T_TimeTable_Master    
                        ( I_Center_ID ,    
                          Dt_Schedule_Date ,    
                          I_TimeSlot_ID ,    
                          I_Batch_ID ,    
                          I_Room_ID ,    
                          I_Skill_ID ,    
                          I_Status ,    
                          S_Crtd_By ,    
                          Dt_Crtd_On ,  
                          S_Remarks ,  
                          I_Session_ID ,  
                          I_Term_ID ,   
        I_Module_ID ,  
        S_Session_Name ,  
        S_Session_Topic ,  
        Dt_Actual_Date ,  
        I_Is_Complete     
               
                        )         
                        SELECT  @ICenterID ,    
                                @DtSelected ,    
                                I_TimeSlot_ID ,    
                                I_Batch_ID ,    
                                I_Room_ID ,    
                                NULL ,    
                                1 ,    
                                @sCrtdBy ,    
                                @DtCrtdOn ,  
                                S_Remarks ,  
                                I_Session_ID ,  
                                I_TermId ,  
                                I_ModuleId ,  
                                S_SessionName ,  
        S_SessionTopic ,  
        null ,  
        0  
                                  
                        FROM    #tempTimeTable    
                          
         
                INSERT  INTO dbo.T_TimeTable_Faculty_Map    
                        ( I_TimeTable_ID ,    
                          I_Employee_ID,
                          B_Is_Actual     
                        )    
                        SELECT  I_TimeTable_ID ,    
                                I_Employee_ID,
                                0    
                        FROM    ( SELECT    I_Employee_ID ,    
                                            TTTM.I_Center_ID ,    
                                            TTTM.Dt_Schedule_Date ,    
                                            TTTM.I_Batch_ID ,    
                                            TTTM.I_Room_ID  
                                  FROM      dbo.T_TimeTable_Faculty_Map AS TTTFM    
                                            INNER JOIN dbo.T_TimeTable_Master    
                                            AS TTTM ON TTTFM.I_TimeTable_ID = TTTM.I_TimeTable_ID    
                                  WHERE     I_TimeSlot_ID = @ISrcTimeSlotID    
                                            AND I_Center_ID = @ICenterID    
                                            AND Dt_Schedule_Date = @DtSelected    
                                            AND TTTM.I_Status = 1    
                                ) T1    
                                INNER JOIN ( SELECT TTTM.I_TimeTable_ID ,    
                                                    TTTM.I_Center_ID ,    
                                                    TTTM.Dt_Schedule_Date ,    
                                                    TTTM.I_Batch_ID ,    
                                                    TTTM.I_Room_ID    
                                             FROM   dbo.T_TimeTable_Master AS TTTM    
                                             WHERE    
             I_TimeSlot_ID IN (  SELECT  I_TimeSlot_ID FROM #tempTimeTable )  
                                                    AND I_Center_ID = @ICenterID    
                                                    AND Dt_Schedule_Date = @DtSelected    
                                                    AND TTTM.I_Status = 1    
                                           ) T2 ON T1.I_Center_ID = T2.I_Center_ID    
                                                   AND T1.Dt_Schedule_Date = T2.Dt_Schedule_Date    
                                                   AND T1.I_Batch_ID = T2.I_Batch_ID    
                                                   AND T1.I_Room_ID = T2.I_Room_ID  
            END      
        ELSE     
            BEGIN      
                RAISERROR('No classes are scheduled on this time slot for this date.',11,1)        
            END            
            COMMIT TRANSACTION T1        
    END TRY                        
    BEGIN CATCH                        
 --Error occurred:                          
        ROLLBACK TRANSACTION T1                       
        DECLARE @ErrMsg NVARCHAR(4000) ,    
            @ErrSeverity INT                        
        SELECT  @ErrMsg = ERROR_MESSAGE() ,    
                @ErrSeverity = ERROR_SEVERITY()                        
                        
        RAISERROR(@ErrMsg, @ErrSeverity, 1)                        
    END CATCH  
