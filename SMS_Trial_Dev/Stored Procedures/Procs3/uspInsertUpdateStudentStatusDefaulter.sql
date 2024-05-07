CREATE PROCEDURE ACADEMICS.uspInsertUpdateStudentStatusDefaulter
    (
      @dtExecutionDate DATE = NULL
    )
AS 
    BEGIN
        IF @dtExecutionDate = NULL 
            SET @dtExecutionDate = GETDATE()
	
        DECLARE @StdID INT
        DECLARE @Due DECIMAL(14, 2)
        CREATE TABLE #temp1
        (
        StudentID INT
        )
	
        CREATE TABLE #temp
            (
              I_Student_Detail_ID INT ,
              S_Mobile_No VARCHAR(50) ,
              S_Student_ID VARCHAR(100) ,
              I_Roll_No INT ,
              S_Student_Name VARCHAR(200) ,
              S_Invoice_No VARCHAR(100) ,
              S_Receipt_No VARCHAR(100) ,
              Dt_Invoice_Date DATETIME ,
              S_Component_Name VARCHAR(100) ,
              S_Batch_Name VARCHAR(100) ,
              S_Course_Name VARCHAR(100) ,
              I_Center_ID INT ,
              S_Center_Name VARCHAR(100) ,
              S_Brand_Name VARCHAR(100) ,
              S_Cost_Center VARCHAR(100) ,
              Due_Value REAL ,
              Dt_Installment_Date DATETIME ,
              I_Installment_No INT ,
              I_Parent_Invoice_ID INT ,
              I_Invoice_Detail_ID INT ,
              Revised_Invoice_Date DATETIME ,
              Tax_Value DECIMAL(14, 2) ,
              Total_Value DECIMAL(14, 2) ,
              Amount_Paid DECIMAL(14, 2) ,
              Tax_Paid DECIMAL(14, 2) ,
              Total_Paid DECIMAL(14, 2) ,
              Total_Due DECIMAL(14, 2) ,
              sInstance VARCHAR(MAX)
            )

        INSERT  INTO #temp
                EXEC REPORT.uspGetDueReport_History @sHierarchyList = '54', -- varchar(max)
                    @iBrandID = 109, -- int
                    @dtUptoDate = @dtExecutionDate, -- datetime
                    @sStatus = 'ALL' -- varchar(100)
                    
        DECLARE RICEDefaulter CURSOR
        FOR
        SELECT TSD.I_Student_Detail_ID,SUM(T1.Total_Due) AS Due FROM #temp T1
        INNER JOIN dbo.T_Student_Detail TSD ON T1.S_Student_ID = TSD.S_Student_ID
        WHERE
        DATEDIFF(d,T1.Dt_Installment_Date,@dtExecutionDate)>10
        GROUP BY TSD.I_Student_Detail_ID
        HAVING SUM(Total_Due)>=100
                    
        OPEN RICEDefaulter
        FETCH NEXT FROM RICEDefaulter
                    INTO
                    @StdID,@Due
                    
        WHILE @@FETCH_STATUS = 0 
            BEGIN
                    
						
						
                IF EXISTS ( SELECT  TSSD.I_Student_Status_Detail_ID
                            FROM    dbo.T_Student_Status_Details TSSD
                            WHERE   TSSD.I_Student_Detail_ID = @StdID
                                    AND TSSD.I_Student_Status_ID = 1
                                    AND TSSD.I_Status = 1 ) 
                    BEGIN
                        UPDATE  dbo.T_Student_Status_Details
                        SET     DueAmount = @Due ,
                                Dt_Upd_On = @dtExecutionDate ,
                                S_Upd_By = 'dba'
                        WHERE   I_Student_Status_Detail_ID = ( SELECT
                                                              TSSD.I_Student_Status_Detail_ID
                                                              FROM
                                                              dbo.T_Student_Status_Details TSSD
                                                              WHERE
                                                              TSSD.I_Student_Detail_ID = @StdID
                                                              AND TSSD.I_Student_Status_ID = 1
                                                              AND TSSD.I_Status = 1
                                                             )
                    		
                        INSERT INTO #temp1
                                ( StudentID )
                        VALUES  ( @StdID  -- StudentID - int
                                  )
                    		   		
                    END
                    
                    ELSE
                    
                    BEGIN
                    	INSERT INTO dbo.T_Student_Status_Details
                    	        ( I_Student_Detail_ID ,
                    	          I_Student_Status_ID ,
                    	          I_Status ,
                    	          S_Crtd_By ,
                    	          Dt_Crtd_On ,
                    	          DueAmount
                    	        )
                    	VALUES  ( @StdID , -- I_Student_Detail_ID - int
                    	          1 , -- I_Student_Status_ID - int
                    	          1 , -- I_Status - int
                    	          'dba' , -- S_Crtd_By - varchar(max)
                    	          @dtExecutionDate , -- Dt_Crtd_On - datetime
                    	          @Due  -- DueAmount - decimal
                    	        )
                    	        
                    	        INSERT INTO #temp1
                                ( StudentID )
                        VALUES  ( @StdID  -- StudentID - int
                                  )
                    END
                    
                    FETCH NEXT FROM RICEDefaulter
                    INTO @StdID,@Due
            END
            
            CLOSE RICEDefaulter
            DEALLOCATE RICEDefaulter
            
            --PRINT @idlist;
            
            UPDATE dbo.T_Student_Status_Details SET I_Status=0,Dt_Upd_On=@dtExecutionDate,S_Upd_By='dba' WHERE
            I_Student_Detail_ID NOT IN (SELECT T2.StudentID FROM #temp1 T2) AND I_Student_Status_ID=1 AND I_Status=1
                    
                    
                    
    END