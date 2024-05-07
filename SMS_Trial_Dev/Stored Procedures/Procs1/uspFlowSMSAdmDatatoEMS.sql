CREATE PROCEDURE [dbo].[uspFlowSMSAdmDatatoEMS]
AS
BEGIN

DECLARE @ExecutionDate DATETIME=GETDATE()

INSERT  OPENQUERY(QBOLE, 'SELECT	
		S_Student_ID ,
        S_First_Name ,
        S_Middle_Name ,
        S_Last_Name ,
        S_Batch_Name ,
        I_Centre_ID ,
        S_Centre_Name ,
        I_Brand_ID ,
        Dt_Crtd_On,
        I_Course_ID
        from RICE_EMS.dbo.T_SMS_Interface')
        SELECT  TSD.S_Student_ID ,
                TSD.S_First_Name ,
                TSD.S_Middle_Name ,
                TSD.S_Last_Name ,
                TSBM.S_Batch_Name ,
                TCHND.I_Center_ID ,
                TCHND.S_Center_Name ,
                TCHND.I_Brand_ID ,
                @ExecutionDate AS Crtd_On,
                TSBM.I_Course_ID
        FROM    dbo.T_Invoice_Parent TIP
                INNER JOIN dbo.T_Invoice_Child_Header TICH ON TIP.I_Invoice_Header_ID = TICH.I_Invoice_Header_ID
                INNER JOIN dbo.T_Invoice_Batch_Map TIBM ON TICH.I_Invoice_Child_Header_ID = TIBM.I_Invoice_Child_Header_ID
                INNER JOIN dbo.T_Student_Batch_Master TSBM ON TIBM.I_Batch_ID = TSBM.I_Batch_ID
                INNER JOIN dbo.T_Student_Detail TSD ON TSD.I_Student_Detail_ID = TIP.I_Student_Detail_ID
                INNER JOIN dbo.T_Center_Hierarchy_Name_Details TCHND ON TIP.I_Centre_Id = TCHND.I_Center_ID
        WHERE   TIP.I_Status IN (1,3)
                --AND TIP.I_Parent_Invoice_ID IS NULL
                --AND (TSBM.S_Batch_Name LIKE '%_ITE%' OR TSBM.S_Batch_Name LIKE '%_IDT%' OR TSBM.S_Batch_Name LIKE 'BCP%')
                AND TIP.Dt_Invoice_Date >= CONVERT(DATE, @ExecutionDate)
                AND TIP.Dt_Invoice_Date < DATEADD(d, 1,CONVERT(DATE, @ExecutionDate))
                AND TCHND.I_Brand_ID = 109
                AND TSBM.I_Course_ID IN ( 11, 12, 269, 270,367,368,364,471,467,468,469,470,472,475,510,511,512,519,520,522,530,532)
        --UNION ALL
        --SELECT  A.S_Student_ID ,
        --        A.S_First_Name ,
        --        A.S_Middle_Name ,
        --        A.S_Last_Name ,
        --        C.S_Batch_Name ,
        --        E.I_Center_ID ,
        --        E.S_Center_Name ,
        --        E.I_Brand_ID ,
        --        @ExecutionDate AS Crtd_On,
        --        G.I_Course_ID
        --FROM    T_Student_Detail A
        --        INNER JOIN T_Student_Batch_Details B ON A.I_Student_Detail_ID = B.I_Student_ID
        --        INNER JOIN T_Student_Batch_Master C ON C.I_Batch_ID = B.I_Batch_ID
        --        INNER JOIN T_Center_Batch_Details D ON D.I_Batch_ID = C.I_Batch_ID
        --        INNER JOIN T_Center_Hierarchy_Name_Details E ON E.I_Center_ID = D.I_Centre_Id
        --        INNER JOIN T_Enquiry_Regn_Detail F ON F.I_Enquiry_Regn_ID = A.I_Enquiry_Regn_ID
        --        INNER JOIN T_Course_Master G ON G.I_Course_ID = C.I_Course_ID
        --WHERE   B.I_Status = 1
        --        AND G.I_Course_ID IN ( 11, 12, 269, 270,367,368,364 )
        --        AND E.I_Brand_ID = 109
        --        AND A.Dt_Crtd_On >= CONVERT(DATE, @ExecutionDate)
        --        AND A.Dt_Crtd_On < DATEADD(d, 1, CONVERT(DATE, @ExecutionDate))
                
              END