use milktea_deliver
go
create procedure dese_tip(@zoid char(20))
as
declare @ztip numeric(6,2)
set @ztip =(select tip from deliver where oid=@zoid)
if @ztip is null
 print '����δ�յ����ͩѩҩn�ѩ�'
else
 print '�����յ��Ĵ���Ϊ��'+cast(@ztip as varchar)+'Ԫ'