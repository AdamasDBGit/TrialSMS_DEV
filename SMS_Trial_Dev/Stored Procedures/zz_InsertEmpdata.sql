﻿Create Proc zz_InsertEmpdata(
@rollnumber int,
@name varchar(100),
@is_Active bit

)
AS
bEGIN
Insert Into Emp(name,Rollnumber,Is_Active,Dt)
Values(@name,@rollnumber,@is_Active,GETDATE())
eND