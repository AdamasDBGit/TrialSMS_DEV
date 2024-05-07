﻿CREATE procedure [dbo].[uspSaveSMSDetails](@MobileNo VARCHAR(MAX),@Message VARCHAR(MAX), @UniqueID VARCHAR(MAX), @BrandID INT, @ReferenceID INT)
AS
BEGIN


	insert into T_SMS_SEND_DETAILS
	select @MobileNo,@UniqueID,B.I_SMS_TYPE_ID,@Message,0,0,'',@UniqueID,@ReferenceID,NULL,1,'rice-group-admin',NULL,GETDATE(),NULL 
	from 
	T_SMS_REFERENCE_TYPE_MASTER A
	inner join T_SMS_TYPE_MASTER B on A.I_REFERENCE_TYPE_ID=B.I_REFERENCE_TYPE_ID
	where
	A.I_REFERENCE_TYPE_ID=@ReferenceID and B.I_Brand_ID=@BrandID


END
