--Stellvertretekonto 

--Ausf�hren als.. nur f�r dem Agent, damit dieser 
--best Jobs wie PS / CMD ausf�hren 

 -- es geht immer um nicht SQL Ressourcen
 --


 1.. Zuerst Anmeldeinformation in Sicherit anlegen (KOnto und Kennwort)
 2. Proxykonto definieren und Kat zuweise
 3. Im Auftragsschritt Kat w�hlen, dann ist auch Proxy ausw�hlbar



 USE [master]
GO
CREATE CREDENTIAL [KairoAdmin] WITH IDENTITY = N'KAIRO\Administrator', SECRET = N'ppedvAG01!'
GO

USE [msdb]
GO
EXEC msdb.dbo.sp_add_proxy @proxy_name=N'ProxyKairoAdmin',@credential_name=N'KarioAdmin', 
		@enabled=1, 
		@description=N'Kairo Admin darf nur PS und CMD'
GO
EXEC msdb.dbo.sp_grant_proxy_to_subsystem @proxy_name=N'ProxyKairoAdmin', @subsystem_id=3
GO
EXEC msdb.dbo.sp_grant_proxy_to_subsystem @proxy_name=N'ProxyKairoAdmin', @subsystem_id=12
GO



--jetzt ist das KOnto f�rentsprechende Schritte im Agentjob
--w�hlbar..