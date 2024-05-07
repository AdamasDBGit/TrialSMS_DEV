﻿
CREATE PROCEDURE [dbo].[KPMG_uspReceivePoPr]
(
@PO_Id varchar(50),
@PR_Id varchar(50),
@PO_Date datetime,
@Delivery_Date datetime,

@Branch_Id int = 0,
@ItemCode int = 0,
@Barcode varchar(4000),
@Status int = 0
)
AS   
DECLARE @idmaster INT

    BEGIN TRY 
        
        Select @idmaster = Fld_KPMG_PoPr_Id from dbo.Tbl_KPMG_PoDetails where Fld_KPMG_PO_Id = @PO_Id AND Fld_KPMG_PR_Id =@PR_Id
        
        Select @PO_Date = Fld_KPMG_PO_Date from dbo.Tbl_KPMG_PoDetails where Fld_KPMG_PoPr_Id = @idmaster
        Select @Delivery_Date = Fld_KPMG_Delivery_Date from dbo.Tbl_KPMG_PoDetails where Fld_KPMG_PoPr_Id = @idmaster
                
        Insert into dbo.Tbl_KPMG_StockMaster(Fld_KPMG_Branch_Id,Fld_KPMG_ItemCode,Fld_KPMG_Mo_Id,Fld_KPMG_IsMo) 
		values (@Branch_Id,@ItemCode,@idmaster,0)
		        
        Select @idmaster = @@IDENTITY;
                
        while len(@Barcode) > 0
		begin
			
			insert into dbo.Tbl_KPMG_StockDetails (Fld_KPMG_Stock_Id,Fld_KPMG_Barcode ) values(@idmaster,left(@Barcode , charindex(',', @Barcode +',')-1))
			set @Barcode = stuff(@Barcode , 1, charindex(',', @Barcode +','), '')
						
		end
        Return 1;
                        
    END TRY        
        
    BEGIN CATCH            
 --Error occurred:              
            
        DECLARE @ErrMsg NVARCHAR(4000) ,  
            @ErrSeverity INT            
        SELECT  @ErrMsg = ERROR_MESSAGE() ,  
                @ErrSeverity = ERROR_SEVERITY()            
        RAISERROR(@ErrMsg, @ErrSeverity, 1)            
    END CATCH 





