-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
--exec [usp_ERP_GetAllDocumentForStudent] 234868
-- =============================================
CREATE PROCEDURE [dbo].[usp_ERP_GetAllDocumentForStudent]
	(
	@EnquiryID int
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select 
	t1.I_Document_Type_ID DocumentTypeID,
t1.S_Document_Type_Name DocumentTypeName
,t1.Is_Mandatory Mandatory
,t2.S_Imagepath Imagepath
,ISNULL(t2.Is_verified,0) Verified
,t2.I_Document_StudRegn_ID  DocumentStudRegnID
,t2.Is_Active IsActive
,t2.I_Seq_No Sequence
from [T_ERP_Document_Type_Master] t1
left join T_ERP_Document_Student_Map t2 on t2.R_I_Document_Type_ID=t1.I_Document_Type_ID and t2.R_I_Enquiry_Regn_ID=@EnquiryID

--Where t2.Is_Active = 1 and t2.R_I_Enquiry_Regn_ID=@EnquiryID

END
