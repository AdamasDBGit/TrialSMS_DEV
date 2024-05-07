--exec [dbo].[uspGetGuardian] 'A4FB978805F7459D895E4026DE51D882'
CREATE PROCEDURE [dbo].[uspGetGuardian]
(
 
 @sToken nvarchar(MAX) =null,
 @iParentID int = null
)
AS
BEGIN

select DISTINCT TPM.I_Parent_Master_ID guardian_id
,isnull(TPM.S_First_Name,'') first_name
,ISNULL(TPM.S_Last_Name,'') last_name
 ,case when TPM.I_Parent_Master_ID = TS.I_Parent_Master_ID THEN 'Self' else TRM.S_Relation_Type end 
	as relation
	,TPM.S_Address address
	,TPM.S_Profile_Picture profile_picture 
	,TPM.S_Mobile_No phone_number
	,TPM.I_IsPrimary isPrimary
from T_Parent_Master as TPM 
join T_Student_Parent_Maps TSPM on TPM.I_Parent_Master_ID = TSPM.I_Parent_Master_ID
join (
select TSPM.S_Student_ID,TPM.I_Parent_Master_ID 
from T_Parent_Master TPM 
join  T_Student_Parent_Maps TSPM
ON TPM.I_Parent_Master_ID = TSPM.I_Parent_Master_ID
where TPM.S_Token = @sToken
) as TS on TS.S_Student_ID =TSPM.S_Student_ID
JOIN T_Relation_Master as TRM ON TRM.I_Relation_Master_ID = TPM.I_Relation_ID
where TPM.I_Parent_Master_ID = ISNULL(@iParentID,TPM.I_Parent_Master_ID) AND TPM.I_Status = 1
END