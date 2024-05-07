CREATE PROCEDURE [dbo].[uspGetStudentAfterLogin]
(
 @sToken nvarchar(MAX) =null
)
AS
BEGIN

select TPM.S_Mobile_No MobileNo
,TSD.S_Student_ID as student_erp_id
,TSD.I_Student_Detail_ID StudentID
,TCM.I_Brand_ID brandid
,BM.S_Brand_Name AS client_name
,CONCAT(LTRIM(RTRIM(TSD.S_First_Name)),case when TSD.S_Middle_Name is not null AND TSD.S_Middle_Name !='' then concat(' ',LTRIM(RTRIM(TSD.S_Middle_Name))) else '' end ,
        ' ',LTRIM(RTRIM(TSD.S_Last_Name))) AS student_name
,ERD.S_Student_Photo as profile_picture 
,TCM.S_Course_Code as class_name
,TSBM.S_Batch_Name as section_name
,TSGS.I_Class_ID as classid
,CASE WHEN TPM.I_IsBusTravel = 1  THEN 1 ELSE 0 end IsTransport
--,CASE WHEN TSD.I_Transport_ID IS NOT NULL AND TSD.Dt_Transport_Deactivation IS NULL 
--        THEN 'Transport Availed'
--    WHEN TSD.I_Transport_ID IS NOT NULL AND TSD.Dt_Transport_Deactivation IS NOT NULL AND TSD.Dt_Transport_Deactivation<CURRENT_TIMESTAMP
--        THEN  'Transport Deactivated'
--    ELSE 
--        'Transport not Availed'
--END Is_Transport

from T_Parent_Master TPM 
JOIN T_Student_Parent_Maps TSPM ON TPM.I_Parent_Master_ID = TSPM.I_Parent_Master_ID
JOIN dbo.T_Student_Detail as TSD ON TSD.S_Student_ID = TSPM.S_Student_ID
join [dbo].[T_Student_Batch_Details] as TSBD on TSD.I_Student_Detail_ID = TSBD.I_Student_ID
join [dbo].[T_Student_Batch_Master] as TSBM on TSBM.I_Batch_ID = TSBD.I_Batch_ID
join [dbo].[T_Course_Master] as TCM on TCM.I_Course_ID = TSBM.I_Course_ID 
JOIN dbo.T_Enquiry_Regn_Detail as ERD on ERD.I_Enquiry_Regn_ID=TSD.I_Enquiry_Regn_ID
join T_Student_Class_Section TSCS ON TSCS.I_Student_Detail_ID = TSD.I_Student_Detail_ID AND TSCS.I_Status=1
join T_School_Group_Class TSGS ON TSGS.I_School_Group_Class_ID = TSCS.I_School_Group_Class_ID
JOIN T_Brand_Master BM ON BM.I_Brand_ID = TCM.I_Brand_ID AND TPM.I_Brand_ID = BM.I_Brand_ID AND TSPM.I_Brand_ID = BM.I_Brand_ID
where 
--TCM.I_Brand_ID=107 
--and 
TSBD.I_Status=1 and 
TPM.S_Token=@sToken  
END