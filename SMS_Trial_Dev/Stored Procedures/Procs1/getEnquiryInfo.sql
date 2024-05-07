-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>

-- exec getEnquiryInfo 234929
-- =============================================
CREATE PROCEDURE getEnquiryInfo
	-- Add the parameters for the stored procedure here
	(
		@EnquiryNo int null
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select top 1
	TERD.I_Enquiry_Regn_ID as EnquiryID,
	Concat(isnull(TERD.S_First_Name, ''),' ', isnull(TERD.S_Middle_Name, ''),' ',  isnull(TERD.S_Last_Name, '')) as FullName,
	TERD.S_Mobile_No as Phone,
	TC.S_Class_Name as ClassName 
	from T_Enquiry_Regn_Detail TERD
	inner join T_Class as TC on TC.I_Class_ID = TERD.I_Class_ID
	where I_Enquiry_Regn_ID = isnull(@EnquiryNo, I_Enquiry_Regn_ID)
END
