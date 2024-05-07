CREATE PROCEDURE ERP.uspOracleSMSRecon
    (
      @iBrandID INT ,
      @sHierarchyList VARCHAR(MAX) ,
      @dtStartDate DATETIME ,
      @dtEndDate DATETIME
    )
AS
    BEGIN
    
    
        DECLARE @BrandName VARCHAR(MAX)
        DECLARE @MonthYear VARCHAR(MAX)= DATENAME(MONTH, @dtStartDate) + ' '
            + CAST(DATEPART(YYYY, @dtStartDate) AS VARCHAR)
		
        IF @iBrandID = 109
            SET @BrandName = 'RICE Private Limited'
        ELSE
            IF @iBrandID = 111
                SET @BrandName = 'Adamas Career'
            ELSE
                IF @iBrandID = 107
                    SET @BrandName = 'AIS'
                ELSE
                    IF @iBrandID = 108
                        SET @BrandName = 'AIT'
                    ELSE
                        IF @iBrandID = 110
                            SET @BrandName = 'AWS'
                        ELSE
                            IF @iBrandID = 112
                                SET @BrandName = 'AHSMS'


        CREATE TABLE #MAP
            (
              Brand VARCHAR(MAX) ,
              TypeName VARCHAR(MAX) ,
              OraAccCode INT ,
              OraAccDesc VARCHAR(MAX) ,
              SMSAccDesc VARCHAR(MAX)
            )
            
        --CREATE TABLE ERP.T_Oracle_SMS_Recon_Temp
        --    (
        --      Brand VARCHAR(MAX) ,
        --      MonthYear VARCHAR(MAX) ,
        --      TypeName VARCHAR(MAX) ,
        --      FeeComponent VARCHAR(MAX) ,
        --      Amount DECIMAL(14, 2)
        --    )
        
        TRUNCATE TABLE ERP.T_Oracle_SMS_Recon_Temp 
        UPDATE  ERP.T_SMS_Oracle_Recon_Result
        SET     MonthYear = REPLACE(MonthYear, '`', '')
        WHERE   MonthYear LIKE '`%'  

        INSERT  INTO #MAP
                ( Brand ,
                  TypeName ,
                  OraAccCode ,
                  OraAccDesc ,
                  SMSAccDesc
                )
                SELECT  T1.OU ,
                        T1.[TYPE_NAME] ,
                        T1.ORAACCCODE ,
                        T1.ORAACCDESC ,
                        T1.SMSACCDESC
                FROM    OPENQUERY(PROD,
                                  'select OU,TYPE_NAME,ORAACCCODE,ORAACCDESC,SMSACCDESC from rice.XXRICE_SMS_ORACLE_MAP')
                        AS T1
                        
        --Execute individual SPs
        
        --1
        EXEC ERP.uspRevenueRecon @iBrandID = @iBrandID, -- int
            @sHierarchyList = @sHierarchyList, -- varchar(max)
            @dtStartDate = @dtStartDate, -- datetime
            @dtEndDate = @dtEndDate -- datetime
            
        --2
        EXEC ERP.uspDueRecon @iBrandID = @iBrandID, -- int
            @sHierarchyList = @sHierarchyList, -- varchar(max)
            @dtStartDate = @dtStartDate, -- datetime
            @dtEndDate = @dtEndDate -- datetime
            
        --3
        EXEC ERP.uspAdvanceRecon @iBrandID = @iBrandID, -- int
            @sHierarchyList = @sHierarchyList, -- varchar(max)
            @dtStartDate = @dtStartDate, -- datetime
            @dtEndDate = @dtEndDate -- datetime
            
       --4
        EXEC ERP.uspBankRecon @iBrandID = @iBrandID, -- int
            @sHierarchyListID = @sHierarchyList, -- varchar(max)
            @dtStartDate = @dtStartDate, -- datetime
            @dtEndDate = @dtEndDate -- datetime
           
       --5
        EXEC ERP.uspCashandConvenienceChargeRecon @iBrandID = @iBrandID, -- int
            @sHierarchyList = @sHierarchyList, -- varchar(max)
            @dtStartDate = @dtStartDate, -- datetime
            @dtEndDate = @dtEndDate -- datetime
           
            
        UPDATE  T1
        SET     T1.SMSAmount = T2.SMSAmount ,
                T1.CreatedOn = GETDATE()
        FROM    ERP.T_SMS_Oracle_Recon_Result AS T1
                INNER JOIN ( SELECT TSORR.BrandName ,
                                    TSORR.MonthYear ,
                                    TSORR.Type ,
                                    TSORR.AccCode ,
                                    TSORR.AccDesc ,
                                    SUM(ISNULL(TOSRT.Amount, 0)) AS SMSAmount
                             FROM   ERP.T_SMS_Oracle_Recon_Result AS TSORR
                                    INNER JOIN #MAP AS M ON TSORR.BrandName = M.Brand
                                                            AND M.TypeName = TSORR.Type
                                                            AND M.OraAccDesc = TSORR.AccDesc
                                    LEFT JOIN ERP.T_Oracle_SMS_Recon_Temp AS TOSRT ON TOSRT.Brand = M.Brand
                                                              AND TOSRT.MonthYear = TSORR.MonthYear
                                                              AND TOSRT.TypeName = M.TypeName
                                                              AND M.SMSAccDesc = TOSRT.FeeComponent
                             WHERE  TSORR.Status = 1
                                    AND TSORR.BrandName = @BrandName
                                    AND TSORR.MonthYear = @MonthYear
                             GROUP BY TSORR.BrandName ,
                                    TSORR.MonthYear ,
                                    TSORR.Type ,
                                    TSORR.AccCode ,
                                    TSORR.AccDesc
                           ) T2 ON T2.AccCode = T1.AccCode
                                   AND T2.AccDesc = T1.AccDesc
                                   AND T2.BrandName = T1.BrandName
                                   AND T2.MonthYear = T1.MonthYear
                                   AND T2.Type = T1.Type    
                       
        UPDATE  ERP.T_SMS_Oracle_Recon_Result
        SET     DifferenceAmount = ISNULL(OracleAmount, 0)
                - ( -ISNULL(SMSAmount, 0) )
        WHERE   [Type] IN ( 'Revenue', 'ADVANCE', 'CONVENIENCE CHARGE' )
        UPDATE  ERP.T_SMS_Oracle_Recon_Result
        SET     DifferenceAmount = ISNULL(OracleAmount, 0) - ISNULL(SMSAmount,
                                                              0)
        WHERE   [Type] NOT IN ( 'Revenue', 'ADVANCE', 'CONVENIENCE CHARGE' )
        
        UPDATE ERP.T_SMS_Oracle_Recon_Result SET Status =0 WHERE Status=1               
        --SELECT  *
        --FROM    ERP.T_Oracle_SMS_Recon_Temp
        
        SELECT  TSORR.BrandName,TSORR.MonthYear,TSORR.Type,TSORR.AccCode,TSORR.AccDesc,TSORR.OracleAmount,TSORR.SMSAmount,TSORR.DifferenceAmount
        FROM    ERP.T_SMS_Oracle_Recon_Result AS TSORR
        WHERE   TSORR.BrandName = @BrandName
                AND TSORR.MonthYear = @MonthYear

    END



