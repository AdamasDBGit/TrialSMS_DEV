﻿CREATE PROCEDURE [dbo].[usGetRollNo]   
( @format VARCHAR(100) )    
AS     
    BEGIN TRY    
        IF ( CHARINDEX('/', @format) > 0 )     
            BEGIN    
                SELECT  ISNULL(MAX(CONVERT(INT, ( RIGHT(S_Student_ID,    
                                                        CHARINDEX('/',    
                                                              REVERSE(S_Student_ID))    
                                                        - 1) ))), 0) + 1 AS RollNo    
                FROM    dbo.T_Student_Detail AS TSD    
                WHERE   S_Student_ID LIKE @format + '%'    
            END    
        ELSE     
            IF ( CHARINDEX('-', @format) > 0 )     
                BEGIN    
                    SELECT  ISNULL(MAX(CONVERT(INT, ( RIGHT(S_Student_ID,    
                                                            CHARINDEX('-',    
                                                              REVERSE(S_Student_ID))    
                                                            - 1) ))), 0) + 1 AS RollNo    
                    FROM    dbo.T_Student_Detail AS TSD    
                    WHERE   S_Student_ID LIKE @format + '%'  AND S_Student_ID NOT LIKE '%/%'  
                END    
            ELSE     
                BEGIN    
                    SELECT  ISNULL(MAX(CONVERT(INT, ( RIGHT(S_Student_ID, 3) ))),    
                                   0) + 1 AS RollNo    
                    FROM    dbo.T_Student_Detail AS TSD    
                    WHERE   S_Student_ID LIKE @format + '%'    
    
                END    
    END TRY    
    
    BEGIN CATCH    
--Error occurred:    
    
        DECLARE @ErrMsg NVARCHAR(4000) ,    
            @ErrSeverity INT    
        SELECT  @ErrMsg = ERROR_MESSAGE() ,    
                @ErrSeverity = ERROR_SEVERITY()    
    
        RAISERROR(@ErrMsg, @ErrSeverity, 1)    
    END CATCH 