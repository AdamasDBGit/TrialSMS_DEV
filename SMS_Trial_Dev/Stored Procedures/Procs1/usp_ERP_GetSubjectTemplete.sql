-- =============================================
-- Author:		<Parichoy Nandi>
-- Create date: <25th Sept 2023>
-- Description:	<to get the Subject Template>
-- =============================================
CREATE PROCEDURE dbo.usp_ERP_GetSubjectTemplete 
	-- Add the parameters for the stored procedure here
	@iSubjectTemplateHeaderID int = null,
	@iBrandID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select STH.I_Brand_ID as BrandID,
  STH.S_Title as SubjectTitle,
  STH.I_IsDefault as IsDefault,
  STH.I_Subject_Template_Header_ID as SubjectTemplateHeaderID
  from [SMS].[dbo].[T_ERP_Subject_Template_Header] as STH
		where STH.I_Subject_Template_Header_ID= ISNULL(@iSubjectTemplateHeaderID,STH.I_Subject_Template_Header_ID)
		and I_Brand_ID=@iBrandID
END
