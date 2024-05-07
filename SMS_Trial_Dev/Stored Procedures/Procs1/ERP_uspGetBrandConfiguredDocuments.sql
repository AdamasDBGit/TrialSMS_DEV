

CREATE PROCEDURE [dbo].[ERP_uspGetBrandConfiguredDocuments]
	(
		@sToken NVARCHAR(200),
		@sMobileNo varchar(20),
		@DocumentType varchar(100)=NULL
	)
AS
BEGIN

	DECLARE @BrandID INT 

	CREATE TABLE #Documents (
    DocumentPath VARCHAR(100),
    DocumentTypeID INT,
	PatternHeaderID INT,
	SaasPatternChildHeaderID INT,
	DocumentID INT
);

IF @sToken='Ahx6cuOkPkykBfpthTpYhXc'

BEGIN


	IF EXISTS (select * from T_Parent_Master where S_Mobile_No = @sMobileNo )
	BEGIN
	SELECT @BrandID=I_Brand_ID
	from T_Parent_Master where S_Mobile_No= @sMobileNo

	

-- Insert split values into the temporary table
INSERT INTO #Documents (DocumentPath, DocumentTypeID,PatternHeaderID,SaasPatternChildHeaderID,DocumentID)
SELECT 
    'Document/'+LEFT(Value, CHARINDEX(';', Value) - 1) AS DocumentPath,
    SUBSTRING(Value, CHARINDEX(';', Value) + 1, LEN(Value)) AS Type
	,PatternHeaderID,SaasPatternChildHeaderID,DocumentID
FROM (
    -- Sample data
    SELECT ESPCH.N_Value AS Value,
	ESPCH.I_Pattern_HeaderID as PatternHeaderID,
	ESPCH.I_Saas_Pattern_Child_Header_ID SaasPatternChildHeaderID,
	ESPCH.I_Saas_Pattern_Child_Header_ID DocumentID
	 from T_ERP_Saas_Pattern_Header as SPH
	inner join 
	T_ERP_Saas_Pattern_Child_Header ESPCH on SPH.I_Pattern_HeaderID=ESPCH.I_Pattern_HeaderID
	where SPH.S_Property_Name='Document' and SPH.I_Brand_ID=@BrandID

) AS Data;

-- Select data from the temporary table
SELECT @BrandID BrandID,DC.*,BCD.STypeName as DocumentType from #Documents as DC
inner join
T_ERP_BrandConfigDocumentType  as BCD on DC.DocumentTypeID=BCD.I_DocumentTypeID
where  BCD.STypeName=ISNULL(@DocumentType,BCD.STypeName)



	END
	else
	BEGIN
	select 0 StatusFlag,'Mobile No not exists' Message
	END

END
ELSE
	BEGIN
	select 0 StatusFlag,'Invalid Token' Message
	END

END
