﻿-- =============================================                
-- Author:  Indranil Bhattacharya               
-- Create date: 08/10/2012                
--Comments   : Further details such as course details can be retrieved later                
-- =============================================                
CREATE PROCEDURE [dbo].[uspGetRoutineDetails] --[dbo].[uspGetRoutineDetails] 19,109,'1/14/2013 12:00:00 AM','1',18,9                
    (
      -- Add the parameters for the stored procedure here                
      @ICenterID INT , --Center ID                
      @IBrandID INT ,  --Brand ID                
      @DtSelected DATETIME ,
      @SDayOfWeek VARCHAR(1) ,  -- DayOfWeek                 
      @IRoleID INT ,   --Role ID                
      @iTimeSlotID INT              
    )
AS
    BEGIN                 
                
        DECLARE @dtCurrentDate DATETIME              
        SET @dtCurrentDate = ISNULL(@dtCurrentDate, GETDATE())              
        
  --Table[0]                      
        --SELECT  DISTINCT      
        --        TTTM.I_TimeTable_ID ,      
        --        S_Batch_Code ,      
        --        S_Batch_Name ,      
        --        TCBD.I_Batch_ID ,      
        --        S_Course_Name ,      
        --        TCM.I_Course_ID ,      
        --        I_Skill_ID ,      
        --        I_Room_ID ,      
        --        TTTFM.I_Employee_ID ,      
        --        TTTM.S_Remarks ,      
        --        TTTM.I_Session_ID ,      
        --        TTTM.I_Term_ID ,      
        --        TTTM.I_Module_ID ,      
        --        TTTM.S_Session_Name ,      
        --        TTTM.S_Session_Topic ,      
        --        TTTM.Dt_Actual_Date ,      
        --        TTTM.I_Is_Complete,
        --        TTTM.I_Sub_Batch_ID      
        --INTO    #temp      
        --FROM    dbo.T_Student_Batch_Master AS TSBM      
        --        INNER JOIN dbo.T_Center_Batch_Details AS TCBD ON TSBM.I_Batch_ID = TCBD.I_Batch_ID      
        --        INNER JOIN dbo.T_Course_Master AS TCM ON TSBM.I_Course_ID = TCM.I_Course_ID      
        --        INNER JOIN dbo.T_Course_Delivery_Map AS TCDM ON TCM.I_Course_ID = TCDM.I_Course_ID      
        --        INNER JOIN dbo.T_Delivery_Pattern_Master AS TDPM ON TSBM.I_Delivery_Pattern_ID = TDPM.I_Delivery_Pattern_ID      
        --        INNER JOIN dbo.T_Course_Center_Delivery_FeePlan AS TCCDFP ON TCDM.I_Course_Delivery_ID = TCCDFP.I_Course_Delivery_ID      
        --                                                      AND TCCDFP.I_Course_Fee_Plan_ID = TCBD.I_Course_Fee_Plan_ID      
        --        LEFT OUTER JOIN dbo.T_TimeTable_Master AS TTTM ON TCBD.I_Batch_ID = TTTM.I_Batch_ID      
        --                                                      AND TCBD.I_Centre_Id = TTTM.I_Center_ID      
        --                                                      AND TTTM.Dt_Schedule_Date = @DtSelected      
        --                                                      AND TTTM.I_TimeSlot_ID = @iTimeSlotID      
        --                                                      AND TTTM.I_Status = 1 
        --                                                      AND TTTM.I_Session_ID IS NOT NULL--akash 2015-06-01     
        --        LEFT OUTER JOIN dbo.T_TimeTable_Faculty_Map AS TTTFM ON TTTM.I_TimeTable_ID = TTTFM.I_TimeTable_ID      
        --        AND ISNULL(B_Is_Actual,0) = 0    
        --WHERE   @DtSelected BETWEEN TSBM.Dt_BatchStartDate      
        --                    AND     TSBM.Dt_Course_Expected_End_Date      
        --        AND TDPM.S_DaysOfWeek LIKE '%' + @SDayOfWeek + '%'      
        --        AND I_Centre_Id = @ICenterID      
        --        AND TCCDFP.I_Status = 1      
        --        AND TCBD.I_Status = 4      
        --        AND TCDM.I_Status = 1      
        --        AND TCM.I_Status = 1      
        --        AND TDPM.I_Status = 1
                --AND TCBD.I_Min_Strength 
                
 --akash 29.11.2017               
        SELECT  DISTINCT
                T1.I_TimeTable_ID ,
                T1.S_Batch_Code ,
                T1.S_Batch_Name ,
                T1.I_Batch_ID ,
                T1.S_Course_Name ,
                T1.I_Course_ID ,
                T1.I_Skill_ID ,
                T1.I_Room_ID ,
                T1.I_Employee_ID ,
                T1.S_Remarks ,
                T1.I_Session_ID ,
                T1.I_Term_ID ,
                T1.I_Module_ID ,
                T1.S_Session_Name ,
                T1.S_Session_Topic ,
                T1.Dt_Actual_Date ,
                T1.I_Is_Complete ,
                T1.I_Sub_Batch_ID
        INTO    #temp
        FROM    ( SELECT  DISTINCT
                            TTTM.I_TimeTable_ID ,
                            S_Batch_Code ,
                            S_Batch_Name ,
                            TCBD.I_Batch_ID ,
                            S_Course_Name ,
                            TCM.I_Course_ID ,
                            I_Skill_ID ,
                            I_Room_ID ,
                            TTTFM.I_Employee_ID ,
                            TTTM.S_Remarks ,
                            TTTM.I_Session_ID ,
                            TTTM.I_Term_ID ,
                            TTTM.I_Module_ID ,
                            TTTM.S_Session_Name ,
                            TTTM.S_Session_Topic ,
                            TTTM.Dt_Actual_Date ,
                            TTTM.I_Is_Complete ,
                            TTTM.I_Sub_Batch_ID      
        --INTO    #temp      
                  FROM      dbo.T_Student_Batch_Master AS TSBM
                            INNER JOIN dbo.T_Center_Batch_Details AS TCBD ON TSBM.I_Batch_ID = TCBD.I_Batch_ID
                            INNER JOIN dbo.T_Course_Master AS TCM ON TSBM.I_Course_ID = TCM.I_Course_ID
                            INNER JOIN dbo.T_Course_Delivery_Map AS TCDM ON TCM.I_Course_ID = TCDM.I_Course_ID
                            INNER JOIN dbo.T_Delivery_Pattern_Master AS TDPM ON TSBM.I_Delivery_Pattern_ID = TDPM.I_Delivery_Pattern_ID
                            INNER JOIN dbo.T_Course_Center_Delivery_FeePlan AS TCCDFP ON TCDM.I_Course_Delivery_ID = TCCDFP.I_Course_Delivery_ID
                                                              AND TCCDFP.I_Course_Fee_Plan_ID = TCBD.I_Course_Fee_Plan_ID
                            INNER JOIN dbo.T_TimeTable_Master AS TTTM ON TCBD.I_Batch_ID = TTTM.I_Batch_ID
                                                              AND TCBD.I_Centre_Id = TTTM.I_Center_ID
                                                              AND TTTM.Dt_Schedule_Date = @DtSelected
                                                              AND TTTM.I_TimeSlot_ID = @iTimeSlotID
                                                              AND TTTM.I_Status = 1
                                                              AND TTTM.I_Session_ID IS NOT NULL--akash 2015-06-01     
                            LEFT OUTER JOIN dbo.T_TimeTable_Faculty_Map AS TTTFM ON TTTM.I_TimeTable_ID = TTTFM.I_TimeTable_ID
                                                              AND ISNULL(B_Is_Actual,
                                                              0) = 0
                  WHERE     @DtSelected BETWEEN TSBM.Dt_BatchStartDate
                                        AND     TSBM.Dt_Course_Expected_End_Date
                            AND TDPM.S_DaysOfWeek LIKE '%' + @SDayOfWeek + '%'
                            AND I_Centre_Id = @ICenterID
                            AND TCCDFP.I_Status = 1
                            AND TCBD.I_Status IN (4,6)
                            AND TCDM.I_Status = 1
                            AND TCM.I_Status = 1
                            AND TDPM.I_Status = 1
                --AND TCBD.I_Min_Strength
                  UNION ALL
                  SELECT  DISTINCT
                            TTTM.I_TimeTable_ID ,
                            S_Batch_Code ,
                            S_Batch_Name ,
                            TCBD.I_Batch_ID ,
                            S_Course_Name ,
                            TCM.I_Course_ID ,
                            I_Skill_ID ,
                            I_Room_ID ,
                            TTTFM.I_Employee_ID ,
                            TTTM.S_Remarks ,
                            TTTM.I_Session_ID ,
                            TTTM.I_Term_ID ,
                            TTTM.I_Module_ID ,
                            TTTM.S_Session_Name ,
                            TTTM.S_Session_Topic ,
                            TTTM.Dt_Actual_Date ,
                            TTTM.I_Is_Complete ,
                            TTTM.I_Sub_Batch_ID      
        --INTO    #temp      
                  FROM      dbo.T_Student_Batch_Master AS TSBM
                            INNER JOIN dbo.T_Center_Batch_Details AS TCBD ON TSBM.I_Batch_ID = TCBD.I_Batch_ID
                            INNER JOIN dbo.T_Course_Master AS TCM ON TSBM.I_Course_ID = TCM.I_Course_ID
                            INNER JOIN dbo.T_Course_Delivery_Map AS TCDM ON TCM.I_Course_ID = TCDM.I_Course_ID
                            INNER JOIN dbo.T_Delivery_Pattern_Master AS TDPM ON TSBM.I_Delivery_Pattern_ID = TDPM.I_Delivery_Pattern_ID
                            INNER JOIN dbo.T_Course_Center_Delivery_FeePlan AS TCCDFP ON TCDM.I_Course_Delivery_ID = TCCDFP.I_Course_Delivery_ID
                                                              AND TCCDFP.I_Course_Fee_Plan_ID = TCBD.I_Course_Fee_Plan_ID
                            LEFT OUTER JOIN dbo.T_TimeTable_Master AS TTTM ON TCBD.I_Batch_ID = TTTM.I_Batch_ID
                                                              AND TCBD.I_Centre_Id = TTTM.I_Center_ID
                                                              AND TTTM.Dt_Schedule_Date = @DtSelected
                                                              AND TTTM.I_TimeSlot_ID = @iTimeSlotID
                                                              AND TTTM.I_Status = 1
                                                              AND TTTM.I_Session_ID IS NOT NULL--akash 2015-06-01     
                            LEFT OUTER JOIN dbo.T_TimeTable_Faculty_Map AS TTTFM ON TTTM.I_TimeTable_ID = TTTFM.I_TimeTable_ID
                                                              AND ISNULL(B_Is_Actual,
                                                              0) = 0
                            INNER JOIN ( SELECT TSBM.I_Batch_ID ,
                                                ISNULL(TCBD.I_Min_Strength, 1) AS MinStrength ,
                                                COUNT(DISTINCT TSBD.I_Student_ID) AS StdCount
                                         FROM   dbo.T_Student_Batch_Details AS TSBD
                                                INNER JOIN dbo.T_Student_Batch_Master
                                                AS TSBM ON TSBM.I_Batch_ID = TSBD.I_Batch_ID
                                                INNER JOIN dbo.T_Center_Batch_Details
                                                AS TCBD ON TCBD.I_Batch_ID = TSBM.I_Batch_ID
                                                INNER JOIN dbo.T_Course_Master
                                                AS TCM ON TSBM.I_Course_ID = TCM.I_Course_ID
                                                INNER JOIN dbo.T_Course_Delivery_Map
                                                AS TCDM ON TCM.I_Course_ID = TCDM.I_Course_ID
                                                INNER JOIN dbo.T_Delivery_Pattern_Master
                                                AS TDPM ON TSBM.I_Delivery_Pattern_ID = TDPM.I_Delivery_Pattern_ID
                                                INNER JOIN dbo.T_Course_Center_Delivery_FeePlan
                                                AS TCCDFP ON TCDM.I_Course_Delivery_ID = TCCDFP.I_Course_Delivery_ID
                                                             AND TCCDFP.I_Course_Fee_Plan_ID = TCBD.I_Course_Fee_Plan_ID
                                                INNER JOIN dbo.T_Center_Hierarchy_Name_Details
                                                AS TCHND ON TCBD.I_Centre_Id = TCHND.I_Center_ID
                                         WHERE  TSBD.I_Status = 1
                                                AND TCBD.I_Status IN (4,6)
        --AND TCHND.I_Brand_ID = 109
                                                AND TCHND.I_Center_ID = @ICenterID
                                                AND @DtSelected BETWEEN TSBM.Dt_BatchStartDate
                                                              AND
                                                              TSBM.Dt_Course_Expected_End_Date
                                                AND TDPM.S_DaysOfWeek LIKE '%'
                                                + @SDayOfWeek + '%'
                                                AND I_Centre_Id = @ICenterID
                                                AND TCCDFP.I_Status = 1      
                --AND TCBD.I_Status = 4      
                                                AND TCDM.I_Status = 1
                                                AND TCM.I_Status = 1
                                                AND TDPM.I_Status = 1 --AND TSBM.I_Batch_ID=2388
GROUP BY                                        TSBM.I_Batch_ID ,
                                                ISNULL(TCBD.I_Min_Strength, 1)
                                         HAVING COUNT(DISTINCT TSBD.I_Student_ID) >= ISNULL(TCBD.I_Min_Strength,
                                                              1)
                                       ) StdStrengthCheck ON StdStrengthCheck.I_Batch_ID = TSBM.I_Batch_ID
                  WHERE     @DtSelected BETWEEN TSBM.Dt_BatchStartDate
                                        AND     TSBM.Dt_Course_Expected_End_Date
                            AND TDPM.S_DaysOfWeek LIKE '%' + @SDayOfWeek + '%'
                            AND I_Centre_Id = @ICenterID
                            AND TCCDFP.I_Status = 1
                            AND TCBD.I_Status IN (4,6)
                            AND TCDM.I_Status = 1
                            AND TCM.I_Status = 1
                            AND TDPM.I_Status = 1
                ) T1
                
                
           --akash 29.11.2017       
               
                             
        --Table[1]        
        SELECT  I_TimeTable_ID ,
                S_Batch_Code ,
                S_Batch_Name ,
                I_Batch_ID ,
                S_Course_Name ,
                I_Course_ID ,
                I_Skill_ID ,
                I_Room_ID ,
                STUFF(( SELECT  ', ' + CAST(I_Employee_ID AS VARCHAR(20))
                        FROM    #temp
                        WHERE   ( I_TimeTable_ID = Results.I_TimeTable_ID )
                      FOR
                        XML PATH('')
                      ), 1, 2, '') AS EmployeeIDs ,
                S_Remarks ,
                I_Session_ID ,
                I_Term_ID ,
                I_Module_ID ,
                S_Session_Name ,
                S_Session_Topic ,
                Dt_Actual_Date ,
                I_Is_Complete ,
                I_Sub_Batch_ID
        FROM    #temp Results
        GROUP BY I_TimeTable_ID ,
                S_Batch_Code ,
                S_Batch_Name ,
                I_Batch_ID ,
                S_Course_Name ,
                I_Course_ID ,
                I_Skill_ID ,
                I_Room_ID ,
                S_Remarks ,
                I_Session_ID ,
                I_Term_ID ,
                I_Module_ID ,
                S_Session_Name ,
                S_Session_Topic ,
                Dt_Actual_Date ,
                I_Is_Complete ,
                I_Sub_Batch_ID
                --ORDER BY Results.S_Batch_Name 
        ORDER BY Results.I_TimeTable_ID              
                
        --Table[2]        
        SELECT  I_Room_ID ,
                S_Building_Name ,
                S_Block_Name ,
                S_Floor_Name ,
                S_Room_No
        FROM    dbo.T_Room_Master AS TRM
        WHERE   I_Centre_Id = @ICenterID
                AND I_Status = 1
        ORDER BY S_Building_Name ,
                S_Block_Name ,
                S_Floor_Name ,
                S_Room_No  
        --Modified By Sibsankar
        --  SELECT TRM. I_Room_ID ,      
        --       TRM.S_Building_Name ,      
        --       TRM. S_Block_Name ,      
        --       TRM. S_Floor_Name ,      
        --       TRM. S_Room_No,
        --       TBM.I_Batch_ID      
        --FROM    dbo.T_Room_Master AS TRM  
        --        INNER JOIN dbo.T_Batch_Room_Map TBM
        --        ON TBM.I_Room_ID= TRM.I_Room_ID  
        --        INNER JOIN dbo.T_Student_Batch_Master SBM
        --        ON TBM.I_Batch_ID=SBM.I_Batch_ID  
        --WHERE   I_Centre_Id = @ICenterID      
        --        AND TRM.I_Status = 1 
        --        ---AND TBM.I_Batch_ID=@
        --        ORDER BY
        --        S_Building_Name ,      
        --        S_Block_Name ,      
        --        S_Floor_Name ,      
        --        S_Room_No               
                
        --Table[3]        
        SELECT  I_Skill_ID ,
                S_Skill_Desc ,
                S_Skill_Type
        FROM    dbo.T_EOS_Skill_Master AS TESM
        WHERE   I_Brand_ID = @IBrandID
                AND I_Status = 1                
                
        --Table[4]        
        SELECT  TED.S_First_Name ,
                TED.S_Middle_Name ,
                TED.S_Last_Name ,
                TED.I_Employee_ID
        FROM    dbo.T_Employee_Dtls AS TED
                INNER JOIN EOS.T_Employee_Role_Map AS TERM ON TED.I_Employee_ID = TERM.I_Employee_ID
                INNER JOIN dbo.T_Center_Hierarchy_Name_Details TCHND ON TED.I_Centre_Id = TCHND.I_Center_ID --akash    
        WHERE   ( I_Centre_Id = @ICenterID
                  OR TED.B_IsRoamingFaculty = 1
                )
                AND I_Role_ID = @IRoleID
                AND TED.I_Status = 3
                AND TCHND.I_Brand_ID = @IBrandID--akash              
                              
         
        --SELECT DISTINCT      
        --        A.I_Session_Module_ID ,      
        --        A.I_Session_ID ,      
        --        B.S_Session_Code ,      
        --        B.S_Session_Name ,      
        --        B.S_Session_Topic ,      
        --        ISNULL(B.I_Skill_ID, ISNULL(G.I_Skill_ID, 0)) AS I_Skill_ID ,      
        --        CASE WHEN B.I_Skill_ID IS NOT NULL THEN TESM.S_Skill_Desc      
        --             ELSE ISNULL(G.S_Skill_Desc, 'Others')      
        --        END AS S_Skill_Desc ,      
        --        D.I_Term_ID ,      
        --        A.I_Module_ID ,      
        --        A.I_Sequence ,      
        --        B.N_Session_Duration ,      
        --        C.I_Sequence AS Module_Term_Seq ,      
        --        D.I_Sequence AS Term_Course_Seq      
        --INTO    #temp1      
        --FROM    dbo.T_Session_Module_Map A      
        --        INNER JOIN dbo.T_Session_Master B ON A.I_Session_ID = B.I_Session_ID      
        --        LEFT OUTER JOIN dbo.T_EOS_Skill_Master AS TESM ON B.I_Skill_ID = TESM.I_Skill_ID      
        --        INNER JOIN dbo.T_Module_Term_Map C ON A.I_Module_ID = C.I_Module_ID      
        --        INNER JOIN T_Module_Master F ON C.I_Module_ID = F.I_Module_ID      
        --        LEFT OUTER JOIN T_EOS_Skill_Master G ON F.I_Skill_ID = G.I_Skill_ID      
        --        INNER JOIN dbo.T_Term_Course_Map D ON C.I_Term_ID = D.I_Term_ID      
        --                                              AND D.I_Term_ID IN (     
        --                                              SELECT  I_Term_ID      
        --                                              FROM    #temp      
        --                                              WHERE   I_TimeTable_ID IS NOT NULL )      
        --        INNER JOIN dbo.T_Student_Batch_Master E ON D.I_Course_ID = E.I_Course_ID      
        --                                                   AND E.I_Batch_ID IN (      
        --                                                   SELECT      
        --                                                      I_Batch_ID      
        --                                                   FROM      
        --                    #temp      
        --                                                   WHERE      
        --                                                      I_TimeTable_ID IS NOT NULL )      
        --                                                   AND D.I_Course_ID IN (      
        --                                                   SELECT      
        --                                                      I_Course_ID      
        --                                                   FROM      
        --                                                      #temp      
        --                                                   WHERE      
        --                                                      I_TimeTable_ID IS NOT NULL )      
        --                                                   AND @dtCurrentDate >= ISNULL(A.Dt_Valid_From,      
        --                                                      @dtCurrentDate)      
        --                                                   AND @dtCurrentDate <= ISNULL(A.Dt_Valid_To,      
        --                                                      @dtCurrentDate)      
        --                                                   AND A.I_Status <> 0      
        --                                                   AND B.I_Status <> 0      
        --                                                   AND C.I_Status <> 0      
        --                                                   AND D.I_Status <> 0      
        --ORDER BY D.I_Sequence ,      
        --        C.I_Sequence ,      
        --        A.I_Sequence      
              
        SELECT DISTINCT
                A.I_Session_Module_ID ,
                A.I_Session_ID ,
                B.S_Session_Code ,
                B.S_Session_Name ,
                B.S_Session_Topic ,
                ISNULL(B.I_Skill_ID, ISNULL(G.I_Skill_ID, 0)) AS I_Skill_ID ,
                CASE WHEN B.I_Skill_ID IS NOT NULL THEN TESM.S_Skill_Desc
                     ELSE ISNULL(G.S_Skill_Desc, 'Others')
                END AS S_Skill_Desc ,
                D.I_Term_ID ,
                A.I_Module_ID ,
                A.I_Sequence ,
                B.N_Session_Duration ,
                C.I_Sequence AS Module_Term_Seq ,
                D.I_Sequence AS Term_Course_Seq
        INTO    #temp1
        FROM    dbo.T_Session_Module_Map A
                INNER JOIN dbo.T_Session_Master B ON A.I_Session_ID = B.I_Session_ID
                LEFT OUTER JOIN dbo.T_EOS_Skill_Master AS TESM ON B.I_Skill_ID = TESM.I_Skill_ID
                INNER JOIN dbo.T_Module_Term_Map C ON A.I_Module_ID = C.I_Module_ID
                INNER JOIN T_Module_Master F ON C.I_Module_ID = F.I_Module_ID
                LEFT OUTER JOIN T_EOS_Skill_Master G ON F.I_Skill_ID = G.I_Skill_ID
                INNER JOIN dbo.T_Term_Course_Map D ON C.I_Term_ID = D.I_Term_ID
                INNER JOIN #temp AS T ON D.I_Term_ID = T.I_Term_ID
                                         AND I_TimeTable_ID IS NOT NULL
                INNER JOIN dbo.T_Student_Batch_Master E ON D.I_Course_ID = E.I_Course_ID
                                                           AND E.I_Batch_ID = T.I_Batch_ID
                                                           AND I_TimeTable_ID IS NOT NULL
                                                           AND D.I_Course_ID = T.I_Course_ID
                                                           AND I_TimeTable_ID IS NOT NULL
                                                           AND @dtCurrentDate >= ISNULL(A.Dt_Valid_From,
                                                              @dtCurrentDate)
                                                           AND @dtCurrentDate <= ISNULL(A.Dt_Valid_To,
                                                              @dtCurrentDate)
                                                           AND A.I_Status <> 0
                                                           AND B.I_Status <> 0
                                                           AND C.I_Status <> 0
                                                           AND D.I_Status <> 0
        ORDER BY D.I_Sequence ,
                C.I_Sequence ,
                A.I_Sequence                      
                
        --Table[5]         
        SELECT  ROW_NUMBER() OVER ( ORDER BY Term_Course_Seq, Module_Term_Seq, I_Sequence ) AS Row ,
                *
        FROM    #temp1          
                 
        --Table[6]         
        SELECT  TTM.I_Term_ID ,
                TTM.S_Term_Name ,
                I_Batch_ID
        FROM    dbo.T_Term_Master AS TTM
                INNER JOIN dbo.T_Term_Course_Map AS TTCM ON TTM.I_Term_ID = TTCM.I_Term_ID
                INNER JOIN dbo.T_Student_Batch_Master AS TSBM ON TTCM.I_Course_ID = TSBM.I_Course_ID
        WHERE   I_Batch_ID IN ( SELECT  I_Batch_ID
                                FROM    #temp
                                WHERE   I_TimeTable_ID IS NOT NULL )
        ORDER BY I_Batch_ID ,
                TTCM.I_Sequence          
                 
        DROP TABLE #temp,#temp1 
        
             
    END 
