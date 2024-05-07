﻿create procedure uspSaveInvoiceDiscountDetails
(
@InvoiceID int,
@InvoiceDetailID int,
@DiscountAmount decimal(14,2),
@sUser Varchar(MAX)
)
as

begin

	if not exists(select * from T_DiscountDetails where I_Invoice_Header_ID=@InvoiceID and I_Invoice_Child_Detail_ID=@InvoiceDetailID)
	begin

		insert into T_DiscountDetails
		select @InvoiceID,@InvoiceDetailID,@DiscountAmount,@sUser,NULL,GETDATE(),NULL

	end
	else
	begin

		update T_DiscountDetails set N_Discount_Amount=@DiscountAmount,S_Upd_By=@sUser,Dt_Upd_On=GETDATE()
		where I_Invoice_Header_ID=@InvoiceID and I_Invoice_Child_Detail_ID=@InvoiceDetailID

	end


end