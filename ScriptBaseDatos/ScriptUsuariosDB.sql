USE [ACMDistribuidores]
GO
/****** Object:  User [IIS APPPOOL\DefaultAppPool]    Script Date: 21/12/2014 10:46:02 ******/
CREATE USER [IIS APPPOOL\DefaultAppPool] FOR LOGIN [IIS APPPOOL\DefaultAppPool] WITH DEFAULT_SCHEMA=[db_datawriter]
GO
ALTER ROLE [db_owner] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
