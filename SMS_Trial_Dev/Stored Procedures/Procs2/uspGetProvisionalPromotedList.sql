﻿CREATE PROCEDURE REPORT.uspGetProvisionalPromotedList
    (
      @sHierarchyListID VARCHAR(MAX) ,
      @iBrandID INT ,
      @sCourseIDs VARCHAR(MAX)=NULL
    )
AS 
    BEGIN
		
		IF(@sCourseIDs IS NOT NULL)
		
		BEGIN

        SELECT  TCHND.I_Center_ID ,
                TCHND.S_Center_Name ,
                TCM.I_Course_ID ,
                TCM.S_Course_Name ,
                TSBM.I_Batch_ID ,
                TSBM.S_Batch_Name ,
                TSD.S_Student_ID ,
                TSD.S_First_Name + ' ' + ISNULL(TSD.S_Middle_Name, '') + ' '
                + TSD.S_Last_Name AS Name ,
                TSD.I_RollNo ,
                TSD.S_Mobile_No
        FROM    dbo.T_Student_Detail TSD
                INNER JOIN dbo.T_Student_Batch_Details TSBD ON TSD.I_Student_Detail_ID = TSBD.I_Student_ID
                INNER JOIN dbo.T_Student_Batch_Master TSBM ON TSBD.I_Batch_ID = TSBM.I_Batch_ID
                INNER JOIN dbo.T_Center_Batch_Details TCBD ON TSBM.I_Batch_ID = TCBD.I_Batch_ID
                INNER JOIN dbo.T_Center_Hierarchy_Name_Details TCHND ON TCBD.I_Centre_Id = TCHND.I_Center_ID
                INNER JOIN dbo.T_Enquiry_Regn_Detail TERD ON TSD.I_Enquiry_Regn_ID = TERD.I_Enquiry_Regn_ID
                INNER JOIN dbo.T_Course_Master TCM ON TSBM.I_Course_ID = TCM.I_Course_ID
        WHERE   TSBD.I_Status = 3
                AND TCBD.I_Centre_Id IN (
                SELECT  FGCFR.centerID
                FROM    dbo.fnGetCentersForReports(@sHierarchyListID,
                                                   @iBrandID) FGCFR )
                AND TCM.I_Course_ID IN (
                SELECT  CAST([Val] AS INT)
                FROM    [dbo].[fnString2Rows](@sCourseIDs, ',') AS FSR )
        ORDER BY TCHND.I_Center_ID ,
                TCHND.S_Center_Name ,
                TCM.I_Course_ID ,
                TCM.S_Course_Name ,
                TSBM.I_Batch_ID ,
                TSBM.S_Batch_Name ,
                TSD.I_RollNo
                
                
                END
                
                ELSE
                
                BEGIN
                	
                	SELECT  TCHND.I_Center_ID ,
                TCHND.S_Center_Name ,
                TCM.I_Course_ID ,
                TCM.S_Course_Name ,
                TSBM.I_Batch_ID ,
                TSBM.S_Batch_Name ,
                TSD.S_Student_ID ,
                TSD.S_First_Name + ' ' + ISNULL(TSD.S_Middle_Name, '') + ' '
                + TSD.S_Last_Name AS Name ,
                TSD.I_RollNo ,
                TSD.S_Mobile_No
        FROM    dbo.T_Student_Detail TSD
                INNER JOIN dbo.T_Student_Batch_Details TSBD ON TSD.I_Student_Detail_ID = TSBD.I_Student_ID
                INNER JOIN dbo.T_Student_Batch_Master TSBM ON TSBD.I_Batch_ID = TSBM.I_Batch_ID
                INNER JOIN dbo.T_Center_Batch_Details TCBD ON TSBM.I_Batch_ID = TCBD.I_Batch_ID
                INNER JOIN dbo.T_Center_Hierarchy_Name_Details TCHND ON TCBD.I_Centre_Id = TCHND.I_Center_ID
                INNER JOIN dbo.T_Enquiry_Regn_Detail TERD ON TSD.I_Enquiry_Regn_ID = TERD.I_Enquiry_Regn_ID
                INNER JOIN dbo.T_Course_Master TCM ON TSBM.I_Course_ID = TCM.I_Course_ID
        WHERE   TSBD.I_Status = 3
                AND TCBD.I_Centre_Id IN (
                SELECT  FGCFR.centerID
                FROM    dbo.fnGetCentersForReports(@sHierarchyListID,
                                                   @iBrandID) FGCFR )
                --AND TCM.I_Course_ID IN (
                --SELECT  CAST([Val] AS INT)
                --FROM    [dbo].[fnString2Rows](@sCourseIDs, ',') AS FSR )
        ORDER BY TCHND.I_Center_ID ,
                TCHND.S_Center_Name ,
                TCM.I_Course_ID ,
                TCM.S_Course_Name ,
                TSBM.I_Batch_ID ,
                TSBM.S_Batch_Name ,
                TSD.I_RollNo
                	
                END 
                


    END
