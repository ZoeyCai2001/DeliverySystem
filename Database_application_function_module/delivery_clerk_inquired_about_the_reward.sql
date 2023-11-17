use milktea_deliver
go
create procedure dese_tip(@zoid char(20))
as
declare @ztip numeric(6,2)
set @ztip =(select tip from deliver where oid=@zoid)
if @ztip is null
 print '本单未收到打赏┭┮﹏┭┮'
else
 print '本单收到的打赏为：'+cast(@ztip as varchar)+'元'