﻿
CREATE PROCEDURE [dbo].[uspCheckExtEnquiryValidity](@BrandID INT, @EmailID VARCHAR(MAX), @MobileNo VARCHAR(MAX), @ExtSource VARCHAR(MAX))
AS
BEGIN

	IF NOT EXISTS(SELECT * FROM dbo.T_Enquiry_External_Additional_Details AS TEEAD WHERE TEEAD.MobileNo=@MobileNo AND TEEAD.ExtSource=@ExtSource)
	BEGIN

		IF NOT EXISTS(SELECT * FROM dbo.T_Enquiry_External_Additional_Details AS TEEAD WHERE TEEAD.EmailID=@EmailID AND TEEAD.ExtSource=@ExtSource)
		BEGIN

			SELECT 1

		END

	END
	ELSE
	BEGIN

		SELECT 0

	END



END