-- =============================================
-- Author:		<Parichoy Nandi>
-- Create date: <30th Jan 2024>
-- Description:	<to get the student Detail for on Account>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ERP_GetStudentDetail_OnAccount]
	@EnquiryID int = null,
	@StudentID varchar(255) = null,
	@BrandID int =null
AS
BEGIN
	SET NOCOUNT ON;
	select TSD.I_Student_Detail_ID as StudentDetailID,
			TSD.S_Student_ID as StudentID,
			ISNULL(ERD.S_First_Name, '') + ' ' + ISNULL(ERD.S_Middle_Name, '') + ' ' + ISNULL(ERD.S_Last_Name, '') AS StudentName,
			ERD.I_Enquiry_Regn_ID as EnquiryID,
			ERD.S_Form_No as FormNo


from [SMS].[dbo].[T_Student_Detail]as TSD right join [SMS].[dbo].[T_Enquiry_Regn_Detail] as ERD
on TSD.I_Enquiry_Regn_ID= ERD.I_Enquiry_Regn_ID join [SMS].[dbo].[T_Brand_Center_Details] as BCD on ERD.I_Centre_Id =BCD.I_Centre_Id
where ERD.I_Enquiry_Regn_ID =@EnquiryID and BCD.I_Brand_ID=@BrandID or TSD.S_Student_ID=@StudentID
	END
