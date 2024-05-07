﻿CREATE Procedure [dbo].[uspValidateDuplicateRecordExists]
(
	@sTableName Varchar(400),
	@sFieldName Varchar(400),
	@sValue Varchar(200)
)
As

Begin

	Declare @sQuery nVarchar(MAX)
	SET @sQuery ='SELECT ''TRUE'' FROM '+@sTableName +' Where '+ @sFieldName +'='+''''+@sValue+''''

	Create Table #Result
	(
		ResultValue VARCHAR(10)
	)

	INSERT INTO #Result
	EXECUTE (@sQuery)

	SELECT Count(*) FROm #Result

End
