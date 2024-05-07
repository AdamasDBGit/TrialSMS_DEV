﻿
CREATE PROCEDURE [dbo].[KPMG_uspAddPoPRDetails]
@POPR_XML XML,
@Context varchar(50)
AS   
	BEGIN Try	
		DECLARE @POLIST_COUNT INT
		DECLARE @PO_COUNTER INT
		DECLARE @ITEMNODE_COUNT INT
		DECLARE @ITEM_COUNTER INT
		DECLARE @PO_ID VARCHAR(100)
		DECLARE @PO_NMBR VARCHAR(100)
		DECLARE @PR_NMBR VARCHAR(100)
		DECLARE @GEN_MOV_ID INT
		DECLARE @LINEID VARCHAR(255)
		DECLARE @ITEM_ID VARCHAR(100)
		DECLARE @START_SR_NO INT
		DECLARE @QUANTITY INT
		DECLARE @CREATE_DATE VARCHAR(255)
		DECLARE @PREFIX VARCHAR(255)
		DECLARE @tempStrtNo VARCHAR(255)
		DECLARE @tempCharCount INT
		
		IF ISNULL(@Context,'') = 'ADD'
		BEGIN
			select @POLIST_COUNT = count(1)  --t.col.value('PO_LIST[1]','varchar(50)')
			from @POPR_XML.nodes('/NODE/PO_LIST') as t(col)
			SET @PO_COUNTER = 1
			WHILE @PO_COUNTER <= @POLIST_COUNT
			BEGIN
				
				SELECT	@PO_ID = t.col.value('PO_ID[1]','varchar(50)'),
						@PO_NMBR = t.col.value('PO_NUMBER[1]','varchar(50)'),
						@PR_NMBR = t.col.value('PR_NUMBER[1]','varchar(50)')
				FROM @POPR_XML.nodes('/NODE/PO_LIST[sql:variable("@PO_COUNTER")]') as t(col)
				
				SELECT @ITEMNODE_COUNT = COUNT(1)
				FROM @POPR_XML.nodes('/NODE/PO_LIST[sql:variable("@PO_COUNTER")]/ITEMS/ITEM') as t(col)
				SEt @ITEM_COUNTER =  1
				WHILE @ITEM_COUNTER <= @ITEMNODE_COUNT
				BEGIN
					
					SELECT	@ITEM_ID = t.col.value('ITEM_ID[1]','varchar(50)'),
							@START_SR_NO = t.col.value('START_SR_NO[1]','INT'),
							@QUANTITY = t.col.value('QUANTITY[1]','INT'),
							@CREATE_DATE = t.col.value('CREATED_DATE[1]','varchar(50)'),
							@PREFIX = t.col.value('PREFIX[1]','varchar(50)'),
							@LINEID = t.col.value('LINE_ID[1]','varchar(50)'),
							@tempStrtNo = t.col.value('START_SR_NO[1]','varchar(100)')
							
					FROM @POPR_XML.nodes('/NODE/PO_LIST[sql:variable("@PO_COUNTER")]/ITEMS[sql:variable("@ITEM_COUNTER")]/ITEM') as t(col)
					--select * from  Tbl_KPMG_PoDetails
					INSERT INTO Tbl_KPMG_PoDetails (Fld_KPMG_PO_Id,Fld_KPMG_PR_Id,Fld_KPMG_Item_Id,Fld_KPMG_Qty,Fld_KPMG_PO_Date,Fld_KPMG_Status,OraclePoId)
					VALUES (@PO_NMBR,@PR_NMBR,@ITEM_ID,@QUANTITY,@CREATE_DATE,0,@PO_ID)
					SET @GEN_MOV_ID = @@IDENTITY
					print @tempStrtNo
					SET @tempStrtNo =  REPLACE(@tempStrtNo,CONVERT(varchar(100),@START_SR_NO),'')
					SET @tempCharCount = LEN(CONVERT(varchar(100),@START_SR_NO))
					print @tempStrtNo
					print @tempCharCount
					DECLARE @ITEM_QTY_CNTR INT = 1
					DECLARE @BARCODE_COUNTER INT = 1
					DECLARE @tempBarCode varchar(255)
					SET @BARCODE_COUNTER = @START_SR_NO
					WHILE @ITEM_QTY_CNTR <= @QUANTITY
					BEGIN
						--select top 1* from Tbl_KPMG_PoDetailItems
						IF LEN(CONVERT(varchar(100),@BARCODE_COUNTER)) > @tempCharCount
						BEGIN
							SET @tempStrtNo = LEFT(@tempStrtNo,LEN(@tempStrtNo) - 1)
							SET @tempCharCount = LEN(CONVERT(varchar(100),@BARCODE_COUNTER))							
						END
						
						SET @tempBarCode =@PREFIX + '/' + @tempStrtNo + CONVERT(varchar(100),@BARCODE_COUNTER)
						print @tempBarCode
						
						INSERT INTO Tbl_KPMG_PoDetailItems (Fld_KPMG_PoPr_Id,Fld_KPMG_Barcode,Fld_KPMG_Status,OracleLinieId)
						VALUES (@GEN_MOV_ID,@tempBarCode,0,@LINEID)
						SET @BARCODE_COUNTER = @BARCODE_COUNTER + 1
						SET  @ITEM_QTY_CNTR = @ITEM_QTY_CNTR + 1
					END
					
					SET @ITEM_COUNTER =  @ITEM_COUNTER  + 1
				END
				
				
				SET @ITEMNODE_COUNT = 0
				SET @PO_COUNTER = @PO_COUNTER + 1
			END
		END
	END TRY
	BEGIN CATCH            
	--Error occurred:              

		DECLARE @ErrMsg NVARCHAR(4000) ,  
		@ErrSeverity INT            
		SELECT  @ErrMsg = ERROR_MESSAGE() ,  
			@ErrSeverity = ERROR_SEVERITY()            
		RAISERROR(@ErrMsg, @ErrSeverity, 1)            
	END CATCH
	
	
	
	
