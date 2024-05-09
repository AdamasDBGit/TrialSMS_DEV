EXECUTE sp_addlinkedserver @server = N'PROD'
GO
EXECUTE sp_addlinkedsrvlogin @rmtsrvname = N'PROD'
