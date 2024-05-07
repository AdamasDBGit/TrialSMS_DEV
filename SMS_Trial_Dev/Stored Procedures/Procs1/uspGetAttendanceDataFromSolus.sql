CREATE PROCEDURE [dbo].[uspGetAttendanceDataFromSolus]
AS
    BEGIN

        CREATE TABLE #SOLUSATTN
            (
              RecID VARCHAR(MAX) ,
              StdCode VARCHAR(MAX) ,
              StdName VARCHAR(MAX) ,
              CardCSN VARCHAR(MAX) ,
              Location VARCHAR(MAX) ,
              Reader VARCHAR(MAX) ,
              PunchDateTime DATETIME ,
              Access VARCHAR(MAX) ,
              StdDetailID INT
            )

        CREATE TABLE #STDTIMETBL
            (
              ID INT NOT NULL
                     PRIMARY KEY
                     IDENTITY(1, 1) ,
              StdDetailID INT ,
              TimeTableID INT ,
              ScheduledDate DATETIME
            )

        INSERT  INTO #SOLUSATTN
                ( RecID ,
                  StdCode ,
                  StdName ,
                  CardCSN ,
                  Location ,
                  Reader ,
                  PunchDateTime ,
                  Access
                )
                SELECT  *
                FROM    OPENQUERY([SOLUSSERVER\BLG_SOLUS],
                                  'select * from [TxnAccess].[TechVeritaAttendance].[SMSStdAttnView] with (NOLOCK)')
                        AS OQ

        UPDATE  #SOLUSATTN
        SET     StdDetailID = CAST(REPLACE(StdCode, 'ST', '') AS INT)



--SELECT S.*,CAST(S.PunchDateTime AS TIME) AS PunchTime FROM #SOLUSATTN AS S


        INSERT  INTO #STDTIMETBL
                ( StdDetailID ,
                  TimeTableID ,
                  ScheduledDate
                )
                SELECT  DISTINCT
                        S.StdDetailID ,
                        TTTM.I_TimeTable_ID ,
                        TTTM.Dt_Schedule_Date
--CAST(TCTM.Dt_Start_Time AS TIME) AS StartTime,CAST(TCTM.Dt_End_Time AS TIME) AS EndTime 
                FROM    #SOLUSATTN AS S
                        INNER JOIN dbo.T_Student_Batch_Details AS TSBD WITH (NOLOCK) ON S.StdDetailID = TSBD.I_Student_ID
                        INNER JOIN dbo.T_TimeTable_Master AS TTTM WITH (NOLOCK) ON TTTM.I_Batch_ID = TSBD.I_Batch_ID
                        INNER JOIN dbo.T_Center_Timeslot_Master AS TCTM WITH (NOLOCK) ON TCTM.I_TimeSlot_ID = TTTM.I_TimeSlot_ID
                        INNER JOIN dbo.T_Student_Detail AS TSD WITH (NOLOCK) ON S.StdDetailID = TSD.I_Student_Detail_ID
                WHERE   TSBD.I_Status = 1
                        AND TTTM.I_Status = 1
                        AND TSD.I_Status = 1
                        AND TCTM.I_Status = 1
                        AND TTTM.Dt_Schedule_Date = CONVERT(DATE, GETDATE())
                        --AND TTTM.I_Center_ID IN ( 18, 19 ) //Changed on 27.2.2021 as per Diptendu Sir's requirement
                        --AND CAST(TCTM.Dt_Start_Time AS TIME) >= CAST(S.PunchDateTime AS TIME)

--SELECT * FROM #STDTIMETBL AS S

        DECLARE @i INT= 1
        DECLARE @row INT= ( SELECT  MAX(ID)
                            FROM    #STDTIMETBL
                          )

        PRINT @row

        WHILE ( @i <= @row )
            BEGIN

                DECLARE @stdid INT
                DECLARE @timetableid INT

                SELECT  @stdid = S.StdDetailID ,
                        @timetableid = S.TimeTableID
                FROM    #STDTIMETBL AS S
                WHERE   S.ID = @i

                IF NOT EXISTS ( SELECT  *
                                FROM    dbo.T_Student_Attendance AS TSA WITH (NOLOCK)
                                WHERE   TSA.I_Student_Detail_ID = @stdid
                                        AND TSA.I_TimeTable_ID = @timetableid )
                    BEGIN

                        INSERT  INTO dbo.T_Student_Attendance
                                ( I_Student_Detail_ID ,
                                  S_Crtd_By ,
                                  Dt_Crtd_On ,
                                  I_TimeTable_ID
                                )
                        VALUES  ( @stdid , -- I_Student_Detail_ID - int
                                  'rice-group-admin' , -- S_Crtd_By - varchar(20)
                                  GETDATE() , -- Dt_Crtd_On - datetime
                                  @timetableid  -- I_TimeTable_ID - int
                                )

                    END

                SET @i = @i + 1

            END



        DROP TABLE #SOLUSATTN
        DROP TABLE #STDTIMETBL

    END
