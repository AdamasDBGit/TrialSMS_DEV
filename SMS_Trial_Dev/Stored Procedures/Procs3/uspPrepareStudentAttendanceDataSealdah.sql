CREATE PROCEDURE [dbo].[uspPrepareStudentAttendanceDataSealdah]
    (
      @executionDate DATETIME = NULL
    )
AS 
    BEGIN


        IF ( @executionDate IS NULL ) 
            SET @executionDate = DATEADD(dd, -1, GETDATE())
            
            
            
        CREATE TABLE #T_Student_Attendance_Records
            (
              S_Form_No VARCHAR(100) ,
              I_RollNo INT ,
              S_Student_ID VARCHAR(100) ,
              S_Batch_Name VARCHAR(100) ,
              S_Course_Code VARCHAR(100) ,
              Dt_Crtd_On DATETIME ,
              S_First_Name VARCHAR(100) ,
              S_Middle_Name VARCHAR(100) ,
              S_Last_Name VARCHAR(100) ,
              YearCode VARCHAR(100) ,
              Division VARCHAR(10) ,
              LMDT DATETIME
            )


         
        INSERT  INTO #T_Student_Attendance_Records
                ( S_Form_No ,
                  S_Student_ID ,
                  I_RollNo ,
                  S_Course_Code ,
                  S_Batch_Name ,
                  Dt_Crtd_On ,
                  S_First_Name ,
                  S_Middle_Name ,
                  S_Last_Name ,
                  YearCode ,
                  Division ,
                  LMDT
                )
                SELECT  C.S_Form_No ,
                        A.S_Student_ID ,
                        I_RollNo ,
                        TCM.S_Course_Name ,
                        D.S_Batch_Name ,
                        A.Dt_Crtd_On ,
                        A.S_First_Name ,
                        A.S_Middle_Name ,
                        A.S_Last_Name ,
                        DATEPART(year, GETDATE()) ,
                        'D001' ,
                        CAST(GETDATE() AS DATE)
                FROM    SMS.dbo.T_Student_Detail A
                        INNER JOIN SMS.dbo.T_Student_Batch_Details B ON A.I_Student_Detail_ID = B.I_Student_ID
                        INNER JOIN SMS.dbo.T_Enquiry_Regn_Detail C ON C.I_Enquiry_Regn_ID = A.I_Enquiry_Regn_ID
                        INNER JOIN SMS.dbo.T_Student_Batch_Master D ON D.I_Batch_ID = B.I_Batch_ID
                        INNER JOIN SMS.dbo.T_Center_Batch_Details E ON E.I_Batch_ID = D.I_Batch_ID
                        INNER JOIN SMS.dbo.T_Center_Hierarchy_Name_Details F ON F.I_Center_ID = E.I_Centre_ID
                        INNER JOIN SMS.dbo.T_Course_Master TCM ON D.I_Course_ID = TCM.I_Course_ID
                WHERE   B.I_Status = 1
                        AND F.I_Center_ID = 18
                        AND DATEDIFF(dd, @executionDate, A.Dt_Crtd_On) = 0 
        
     --SELECT * FROM #T_Student_Attendance_Records TSAR
            
        -- -These are the columns of the DC for which the data is to be moved.
        BEGIN
            INSERT  OPENQUERY(SLDH,
                              'SELECT			    FormNo,				
									StdId,
									BatchCode,
									AdmDate,
									FirstName,
									MiddleName,
									LastName,
									YearCode,
									Division,
									LMDT  
									FROM
									RICESEALDAH.dbo.admissionregister')
                    SELECT  S_Form_No ,
                            S_Student_ID ,
                            S_Batch_Name ,
                            Dt_Crtd_On ,
                            S_First_Name ,
                            S_Middle_Name ,
                            S_Last_Name ,
                            YearCode ,
                            Division ,
                            LMDT
                    FROM    #T_Student_Attendance_Records
        END
        BEGIN
            INSERT  OPENQUERY(SLDH, 'SELECT					
									StdId,
									BranchCode,
									CCode,
									Batch,
									YearCode,
									TrNo,
									EffectDt,
									PCode,
									CfRevNo,
									Division,
									LMDT,
									CurrRoll
									FROM
									RICESEALDAH.dbo.stdstatus')
                    
                    SELECT  S_Student_ID ,
                            'BR002' ,
                            S_Course_Code ,
                            S_Batch_Name ,
                            YearCode ,
                            '0' ,
                            Dt_Crtd_On ,
                            '0' ,
                            '10' ,
                            'D001' ,
                            LMDT ,
                            I_RollNo
                    
                    FROM    #T_Student_Attendance_Records TSAR
        
        END                     
            
    END
