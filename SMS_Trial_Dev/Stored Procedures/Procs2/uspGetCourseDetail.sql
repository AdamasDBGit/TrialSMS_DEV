﻿CREATE PROCEDURE [dbo].[uspGetCourseDetail] -- [dbo].[uspGetCourseDetail] '05-0782',62    
    (  
      @sSelectedStudentCode VARCHAR(500) ,  
      @iInvoiceID INT = NULL,
      @iCenterID INT =NULL      
    )  
AS   
    BEGIN      
        SET NOCOUNT ON ;      
       
        DECLARE @iStudentDetailId INT      
        DECLARE @sCenterName VARCHAR(100)      
        DECLARE @sStudentName VARCHAR(150)      
        DECLARE @iBatchID INT  
        DECLARE @iCourseID INT      
        DECLARE @iCourseFeePlanId INT      
        DECLARE @sIsLumpSum VARCHAR(1)      
        DECLARE @iTotalLumpSum NUMERIC(18, 2)      
        DECLARE @iTotalInstallment NUMERIC(18, 2)       
      
        DECLARE @tblCourseDetail TABLE  
            (  
              COURSE_NAME VARCHAR(250) ,  
              START_DATE DATETIME ,  
              FEEPLAN_ID INT ,  
              FEEPLAN VARCHAR(200) ,  
              BOOKLIST VARCHAR(1000) ,  
              TOTAL_LUMPSUM NUMERIC(18, 2) ,  
              TOTAL_INSTALLMENT NUMERIC(18, 2) ,  
              IS_LUMPSUM VARCHAR(1) ,  
              COURSE_ID INT ,  
              S_Course_Code VARCHAR(50) ,  
              S_Course_Description VARCHAR(500) ,  
              I_Currency_ID INT ,  
              S_Course_Family VARCHAR(50) ,  
              I_Is_Completed BIT ,  
              I_Batch_ID INT  
            )       
      
        DECLARE @sBookList VARCHAR(1000)      
        DECLARE @sIndividualBook VARCHAR(100)      
       
        SELECT  @iStudentDetailId = TSD.I_Student_Detail_ID  
        FROM    T_STUDENT_DETAIL TSD 
        inner join T_Student_Center_Detail TSCD
        on TSD.I_Student_Detail_ID = TSCD.I_Student_Detail_ID
        WHERE   S_Student_ID = @sSelectedStudentCode   
        AND I_Centre_Id = ISNULL(@iCenterID,I_Centre_Id)   
       
		IF @iCenterID IS NULL
		BEGIN
        SELECT  @iCenterId = I_CENTRE_ID  
        FROM    T_STUDENT_CENTER_DETAIL  
        WHERE   I_Student_Detail_ID = @iStudentDetailId  
                AND I_Status = 1    
        END
        
        SELECT  @sCenterName = S_Center_Name  
        FROM    T_CENTRE_MASTER  
        WHERE   I_Centre_Id = @iCenterId      
       
 -- TABLE [0] -- STUDENT NAME      
        SELECT  S_First_Name ,  
                ISNULL(S_Middle_Name, '') ,  
                S_Last_Name ,  
                ISNULL(S_CURR_Address1, '') ,  
                ISNULL(S_CURR_Address2, '') ,  
                ISNULL(S_CURR_Area, '') ,  
                ISNULL(S_CURR_Pincode, 0) ,  
                I_Student_Detail_ID,
                I_Transport_ID,
                I_Route_ID,
                I_room_ID,
                DT_Transport_Deactivation  
        FROM    T_STUDENT_DETAIL  
        WHERE   I_Student_Detail_ID = @iStudentDetailId      
       
        IF ( @iInvoiceID IS NULL ) -- WHEN CALLED FROM GENERATE INVOICE PAGE      
            BEGIN      
  -- TABLE[1] -- COURSE, FEE PLAN, FEE PAYMENT SCHEDULE, BOOKS ALLOTED      
                DECLARE COURSE_CURSOR CURSOR FOR      
                SELECT TSBD.I_Batch_ID FROM dbo.T_Student_Batch_Details AS TSBD  
                WHERE I_Student_ID = @iStudentDetailId AND TSBD.I_STATUS = 1    
      
                OPEN COURSE_CURSOR      
                FETCH NEXT FROM COURSE_CURSOR INTO @iBatchID      
      
                SELECT  @iCourseID = I_Course_ID  
                FROM    dbo.T_Student_Batch_Master AS TSBM  
                WHERE   I_Batch_ID = @iBatchID  
        
                WHILE @@FETCH_STATUS = 0   
                    BEGIN      
                        SET @sBookList = ''      
          
                        SELECT  @sBookList = @sBookList + ','  
                                + CAST(I_Book_ID AS VARCHAR(10)) + '|'  
                                + S_Book_Code + '|' + REPLACE(S_BOOK_NAME, ',',  
                                                              '')  
                        FROM    T_BOOK_MASTER  
                        WHERE   I_BOOK_ID IN (  
                                SELECT DISTINCT  
                                        I_BOOK_ID  
                                FROM    T_MODULE_BOOK_MAP MBM  
                                WHERE   I_MODULE_ID IN (  
                                        SELECT  I_MODULE_ID  
                                        FROM    T_MODULE_TERM_MAP MTM  
                                        WHERE   I_TERM_ID IN (  
                                                SELECT  I_TERM_ID  
                                                FROM    T_TERM_COURSE_MAP TCM  
                                                WHERE   I_COURSE_ID = @iCourseId  
                                                        AND I_Status <> 0  
                                                        AND GETDATE() >= ISNULL(TCM.Dt_Valid_From,  
                                                              GETDATE())  
                                                        AND GETDATE() <= ISNULL(TCM.Dt_Valid_To,  
                                                              GETDATE()) )  
                                                AND GETDATE() >= ISNULL(MTM.Dt_Valid_From,  
                                                              GETDATE())  
                                                AND GETDATE() <= ISNULL(MTM.Dt_Valid_To,  
                                                              GETDATE()) )  
                                        AND GETDATE() >= ISNULL(MBM.Dt_Valid_From,  
                                                              GETDATE())  
                                        AND GETDATE() <= ISNULL(MBM.Dt_Valid_To,  
                                                              GETDATE()) )      
          
          
                        SELECT  @iCourseFeePlanId = I_Course_Fee_Plan_ID  
                        FROM    dbo.T_Center_Batch_Details AS TCBD  
                        WHERE   I_Batch_ID = @iBatchID  
                                AND I_Centre_Id = @iCenterId  
                          
                          
          
                        SELECT  @iTotalLumpSum = ISNULL(N_TOTALLUMPSUM, 0) ,  
                                @iTotalInstallment = ISNULL(N_TOTALINSTALLMENT,  
                                                            0)  
                        FROM    T_COURSE_FEE_PLAN  
                        WHERE   I_COURSE_ID = @iCourseId  
                                AND I_COURSE_FEE_PLAN_ID = @iCourseFeePlanId            
          
                        SELECT  @sIsLumpSum = ISNULL(C_IS_LUMPSUM, 'N')  
                        FROM    dbo.T_Student_Batch_Details AS TSBD  
                        WHERE   I_Student_ID = @iStudentDetailId  
                                AND I_Batch_ID = @iBatchID  
              
                        INSERT  INTO @tblCourseDetail  
                                SELECT  TCM.S_COURSE_NAME ,    
                                        TSBM.Dt_BatchStartDate AS Dt_Course_Start_Date ,    
                                        @iCourseFeePlanId ,    
                                        TCFP.S_Fee_Plan_Name ,    
                                        @sBookList ,    
                                        @iTotalLumpSum ,    
                                        @iTotalInstallment ,    
                                        @sIsLumpSum ,    
                                        @iCourseId ,    
                                        TCM.S_Course_Code ,    
                                        TCM.S_Course_Desc ,    
                                        TCFP.I_Currency_ID ,    
                                        TCFM.S_CourseFamily_Name ,    
                                        CAST(CASE ISNULL(TCBD.I_Status, TSBM.I_Status) WHEN 5 THEN 1 ELSE 0 END AS BIT) AS I_Is_Completed ,    
                                        TSBM.I_Batch_ID    
                                FROM    T_COURSE_MASTER TCM INNER JOIN     
                                        dbo.T_Student_Batch_Master AS TSBM  
                                        ON TCM.I_Course_ID = TSBM.I_Course_ID  
                                        INNER JOIN dbo.T_Center_Batch_Details AS TCBD  
                                        ON TSBM.I_Batch_ID = TCBD.I_Batch_ID  
          INNER JOIN T_COURSE_FEE_PLAN TCFP   
          ON TCBD.I_Course_Fee_Plan_ID = TCFP.I_Course_Fee_Plan_ID  
          INNER JOIN T_CourseFamily_Master TCFM  
          ON TCM.I_CourseFamily_ID = TCFM.I_CourseFamily_ID    
                                WHERE   TCBD.I_Batch_ID =  @iBatchID  
          AND I_Centre_Id = @iCenterId                                   
             
                        FETCH NEXT FROM COURSE_CURSOR INTO @iBatchID      
                    END      
        
                CLOSE COURSE_CURSOR      
                DEALLOCATE COURSE_CURSOR      
        
                SELECT DISTINCT  
                        COURSE_NAME ,  
                        START_DATE ,  
                        FEEPLAN_ID ,  
                        FEEPLAN ,  
                        BOOKLIST ,  
                        ISNULL(TOTAL_LUMPSUM, 0) AS TOTAL_LUMPSUM ,  
                        ISNULL(TOTAL_INSTALLMENT, 0) AS TOTAL_INSTALLMENT ,  
                        IS_LUMPSUM ,  
                        COURSE_ID ,  
                        S_Course_Code ,  
                        S_Course_Description ,  
                        I_Currency_ID ,  
                        S_Course_Family ,  
                        I_Is_Completed ,  
                        I_Batch_ID  
                FROM    @tblCourseDetail      
            END      
       
        IF ( @iInvoiceID IS NOT NULL ) -- WHEN CALLED FROM CANCEL INVOICE PAGE      
            BEGIN      
                DECLARE COURSE_CURSOR CURSOR FOR      
                SELECT I_Batch_ID FROM dbo.T_Invoice_Child_Header AS TICH  
                INNER JOIN dbo.T_Invoice_Batch_Map AS TIBM  
                ON TICH.I_Invoice_Child_Header_ID = TIBM.I_Invoice_Child_Header_ID  
                WHERE I_Invoice_Header_ID = @iInvoiceID  
                AND I_Status = 1  
      
                OPEN COURSE_CURSOR      
                FETCH NEXT FROM COURSE_CURSOR INTO @iBatchID      
      
    SELECT  @iCourseID = I_Course_ID  
                FROM    dbo.T_Student_Batch_Master AS TSBM  
                WHERE   I_Batch_ID = @iBatchID  
      
                WHILE @@FETCH_STATUS = 0   
                    BEGIN      
                        SET @sBookList = ''          
                        SELECT  @sBookList = @sBookList + ','  
                                + CAST(I_Book_ID AS VARCHAR(10)) + '|'  
                                + S_Book_Code + '|' + REPLACE(S_BOOK_NAME, ',',  
                                                              '')  
                        FROM    T_BOOK_MASTER  
                        WHERE   I_BOOK_ID IN (  
                                SELECT DISTINCT  
                                        I_BOOK_ID  
                                FROM    T_MODULE_BOOK_MAP MBM  
                                WHERE   I_MODULE_ID IN (  
                                        SELECT  I_MODULE_ID  
                                        FROM    T_MODULE_TERM_MAP MTM  
                                        WHERE   I_TERM_ID IN (  
                                                SELECT  I_TERM_ID  
                                                FROM    T_TERM_COURSE_MAP TCM  
                                                WHERE   I_COURSE_ID = @iCourseId  
                                                        AND I_Status <> 0  
                                                        AND GETDATE() >= ISNULL(TCM.Dt_Valid_From,  
                                                              GETDATE())  
                                                        AND GETDATE() <= ISNULL(TCM.Dt_Valid_To,  
                                                              GETDATE()) )  
                                                AND GETDATE() >= ISNULL(MTM.Dt_Valid_From,  
                                                              GETDATE())  
                                                AND GETDATE() <= ISNULL(MTM.Dt_Valid_To,  
                                                              GETDATE()) )  
                                        AND GETDATE() >= ISNULL(MBM.Dt_Valid_From,  
                                                              GETDATE())  
                                        AND GETDATE() <= ISNULL(MBM.Dt_Valid_To,  
                                                              GETDATE()) )      
             
      SELECT  @iCourseFeePlanId = I_Course_Fee_Plan_ID  
                        FROM    dbo.T_Center_Batch_Details AS TCBD  
                        WHERE   I_Batch_ID = @iBatchID  
                                AND I_Centre_Id = @iCenterId  
                          
                        SELECT  @iTotalLumpSum = ISNULL(TIP.N_Invoice_Amount, 0) ,  
                                @iTotalInstallment = ISNULL(TIP.N_Invoice_Amount,  
                                                            0)  
                        FROM    dbo.T_Invoice_Parent AS TIP  
                        WHERE   I_Invoice_Header_ID = @iInvoiceID  
                                        
      
                        SELECT  @sIsLumpSum = ISNULL(C_IS_LUMPSUM, 'N')  
                        FROM    dbo.T_Student_Batch_Details AS TSBD  
                        WHERE   I_Student_ID = @iStudentDetailId  
                                AND I_Batch_ID = @iBatchID  
      
                        INSERT  INTO @tblCourseDetail  
                                SELECT  TCM.S_COURSE_NAME ,    
                                        TSBM.Dt_BatchStartDate AS Dt_Course_Start_Date ,    
                                        @iCourseFeePlanId ,    
                                        TCFP.S_Fee_Plan_Name ,    
                                        @sBookList ,    
                                        @iTotalLumpSum ,    
                                        @iTotalInstallment ,    
                                        @sIsLumpSum ,    
                                        @iCourseId ,    
                                        TCM.S_Course_Code ,    
                                        TCM.S_Course_Desc ,    
                                        TCFP.I_Currency_ID ,    
                                        TCFM.S_CourseFamily_Name ,    
                                        CAST(CASE ISNULL(TCBD.I_Status, TSBM.I_Status) WHEN 5 THEN 1 ELSE 0 END AS BIT) AS I_Is_Completed ,    
                                        TSBM.I_Batch_ID    
                                FROM    T_COURSE_MASTER TCM INNER JOIN     
                                        dbo.T_Student_Batch_Master AS TSBM  
                                        ON TCM.I_Course_ID = TSBM.I_Course_ID  
                                        INNER JOIN dbo.T_Center_Batch_Details AS TCBD  
                                        ON TSBM.I_Batch_ID = TCBD.I_Batch_ID  
          INNER JOIN T_COURSE_FEE_PLAN TCFP   
          ON TCBD.I_Course_Fee_Plan_ID = TCFP.I_Course_Fee_Plan_ID  
          INNER JOIN T_CourseFamily_Master TCFM  
          ON TCM.I_CourseFamily_ID = TCFM.I_CourseFamily_ID    
                                WHERE   TCBD.I_Batch_ID =  @iBatchID  
          AND I_Centre_Id = @iCenterId  
                  
                        FETCH NEXT FROM COURSE_CURSOR INTO @iBatchID      
                    END      
        
                CLOSE COURSE_CURSOR      
                DEALLOCATE COURSE_CURSOR      
        
                SELECT DISTINCT  
                        *  
                FROM    @tblCourseDetail      
            END          
       
 --TABLE[2] STUDENT_DETAIL_ID      
        SELECT  @iStudentDetailId ,  
                @iCenterId ,  
                @sSelectedStudentCode ,  
                @sCenterName      
       
 --TABLE[3] RETURNS THE DISCOUNT INFORMATION... ONLY WHEN @iFlag = 1   IF (@iInvoiceID IS NOT NULL)      
        BEGIN      
            SELECT  ISNULL(TIP.I_Discount_Scheme_ID, 0) ,  
                    ISNULL(TDSM.S_Discount_Scheme_Name, '') ,  
                    ISNULL(TIP.I_Discount_Applied_At, 0)  
            FROM    T_INVOICE_PARENT TIP ,  
                    T_DISCOUNT_SCHEME_MASTER TDSM  
            WHERE   TIP.I_Student_Detail_ID = @iStudentDetailId  
                    AND TIP.I_Discount_Scheme_ID = TDSM.I_Discount_Scheme_ID      
       
        END      
    END   
