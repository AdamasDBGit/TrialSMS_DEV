CREATE  PROC [dbo].[uspGetAttendanceTransactionDataSolus] 
AS
BEGIN
      CREATE TABLE #temp_link_table_data (
            id INT IDENTITY(1,1),
                  StdID VARCHAR(200),
                  AttnDate VARCHAR(200),
                  ArrivalTime VARCHAR(200),
                  DepartureTime VARCHAR(200),
                  Attendance VARCHAR(200),
                  TrnNo int,
                  Centercode VARCHAR(200)
            )
      DECLARE 
                @l_mydb_StdID                               VARCHAR(200),
                  @l_mydb_AttnDate                          VARCHAR(200),
                  @l_mydb_ArrivalTime                             VARCHAR(200),
                  @l_mydb_DepartureTime                     VARCHAR(200),
                  @l_mydb_Attendance                              VARCHAR(200),
                  @l_mydb_TrnNo                                   INT,
                  @l_mydb_Centercode                              VARCHAR(200),
            

                  @l_linkdb_StdID                                 VARCHAR(200),
                  @l_linkdb_AttnDate                              VARCHAR(200),
                  @l_linkdb_ArrivalTime                     VARCHAR(200),
                  @l_linkdb_DepartureTime                   VARCHAR(200),
                  @l_linkdb_Attendance                      VARCHAR(200),
                  @l_linkdb_TrnNo                                 VARCHAR(200),
                  @l_linkdb_Centercode                      VARCHAR(200)
                  
                  
                  


            INSERT INTO #temp_link_table_data
            SELECT 
                  StdID,
                  AttnDate,
                  ArrivalTime,
                  DepartureTime,
                  Attendance,
                  TrnNo,
                  Centercode              
            FROM [BLG-SOLUS].[TxnAccess].[dbo].[tbl_Send_Attendance_Data] 
                  
                   
            DECLARE 
                  @l_loop_count INT,
                  @l_total_loop_count INT

            SELECT 
                  @l_total_loop_count = COUNT(*), 
                  @l_loop_count = 1
            FROM #temp_link_table_data --WHERE CONVERT(DATE,CAST(AttnDate AS DATE))=CONVERT(DATE,GETDATE())
            
            WHILE (@l_loop_count <= @l_total_loop_count)
            
            BEGIN 
                  SELECT 
                        @l_linkdb_StdID                           =     StdID,                  
                        @l_linkdb_AttnDate                        =     AttnDate,         
                        @l_linkdb_ArrivalTime               =     ArrivalTime,            
                        @l_linkdb_DepartureTime             =     DepartureTime,    
                        @l_linkdb_Attendance                =     Attendance,       
                        @l_linkdb_TrnNo                           =     TrnNo,                  
                        @l_linkdb_Centercode                =     Centercode        
                  
                  FROM #temp_link_table_data
                  WHERE id = @l_loop_count

            IF NOT EXISTS (SELECT 1 FROM T_Send_Attendance_Data WHERE StdID = @l_linkdb_StdID )
                  BEGIN
                        INSERT INTO T_Send_Attendance_Data (
                              StdID                   ,
                              AttnDate                ,
                              ArrivalTime             ,
                              DepartureTime           ,
                              Attendance              ,
                              TrnNo                   ,
                              Centercode              
                        )
                        VALUES (
                              @l_linkdb_StdID,                    
                              @l_linkdb_AttnDate,                 
                              @l_linkdb_ArrivalTime,  
                              @l_linkdb_DepartureTime,      
                              @l_linkdb_Attendance,   
                              @l_linkdb_TrnNo,                    
                              @l_linkdb_Centercode                
                        )

                        PRINT 'Data Saved FOR EMPCODE =' + @l_linkdb_StdID 

                  END 
                  ELSE
                  BEGIN
                        SELECT 
                              @l_mydb_StdID                       = StdID,
                              @l_mydb_AttnDate					  = AttnDate,
                              @l_mydb_ArrivalTime                 = ArrivalTime,
                              @l_mydb_DepartureTime               = DepartureTime,
                              @l_mydb_Attendance                  = Attendance,
                              @l_mydb_TrnNo                       = TrnNo,
                              @l_mydb_Centercode                  = Centercode            
                              
                        FROM T_Send_Attendance_Data 
                        WHERE StdID = @l_linkdb_StdID --AND CONVERT(DATE,CAST(AttnDate AS DATE))=CONVERT(DATE,GETDATE())

                        IF (
                                    (@l_linkdb_StdID                    <>    @l_mydb_StdID  )                        OR
                                    (@l_linkdb_AttnDate                       <>      @l_mydb_AttnDate              ) OR  
                                    (@l_linkdb_ArrivalTime              <>      @l_mydb_ArrivalTime                 ) OR  
                                    (@l_linkdb_DepartureTime            <>      @l_mydb_DepartureTime         ) OR  
                                    (@l_linkdb_Attendance               <>      @l_mydb_Attendance                  ) OR  
                                    (@l_linkdb_TrnNo                    <>    @l_mydb_TrnNo                        ) OR  
                                    (@l_linkdb_Centercode               <>      @l_mydb_Centercode                  ) 
                              )
                        BEGIN
                              UPDATE T_Send_Attendance_Data SET 
                                    StdID             =     @l_linkdb_StdID                     ,           
                                    AttnDate          =     @l_linkdb_AttnDate                  ,
                                    ArrivalTime       =     @l_linkdb_ArrivalTime         ,      
                                    DepartureTime     =     @l_linkdb_DepartureTime       ,
                                    Attendance        =     @l_linkdb_Attendance          ,
                                    TrnNo             =     @l_linkdb_TrnNo                     ,
                                    Centercode        =     @l_linkdb_Centercode          
                                    
                              WHERE StdID = @l_linkdb_StdID

                              PRINT 'Recored Updated FOR' +       @l_linkdb_StdID 
                        END
                        ELSE
                        BEGIN
                              PRINT 'DATA IS NOT UPDATE FOR' + @l_linkdb_StdID 
                        END

                  END
                  SET @l_loop_count = @l_loop_count + 1
            END

      DROP TABLE #temp_link_table_data
END
