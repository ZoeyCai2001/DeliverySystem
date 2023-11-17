use milktea_deliver 
go

backup database milktea_deliver to disk='C:\database\milktea_deliver.bak'

exec sp_addumpdevice 'disk','back','D:\back.bak'

backup database milktea_deliver to back

backup LOG milktea_deliver to back with norecovery