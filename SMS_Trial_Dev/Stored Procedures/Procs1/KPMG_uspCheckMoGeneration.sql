﻿
CREATE PROCEDURE [dbo].[KPMG_uspCheckMoGeneration]  
@Context varchar(255),
@CurrentDate varchar(100)

AS   
    BEGIN TRY 
    	IF ISNULL(@Context,'') = 'CHECK'
    	BEGIN
    		IF EXISTS(SELECT 1 FROM Tbl_KPMG_MoveOrderLog WHERE fld_KPMG_MoDate = @CurrentDate AND fld_KPMG_IsMoGenerated = 'Y')
    		BEGIN
    			SELECT 'MO CREATED' AS MoStatus
    		END
    		ELSE 
    		BEGIN
    			SELECT 'CREATE MO' AS MoStatus
    		END
    	END
    	ELSE IF ISNULL(@Context,'') = 'SAVE'
    	BEGIN
    		INSERT INTO Tbl_KPMG_MoveOrderLog (fld_KPMG_MoDate,fld_KPMG_Status,fld_KPMG_IsMoGenerated)
    		VALUES (@CurrentDate,'Success','Y')
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


