use milktea_deliver 
go

create trigger tr_pickup on pickup
instead of insert
as
declare @dno char(10),@ptime datetime,@oid char(10),@bno char(10)
select @dno=dno,@ptime=ptime,@bno=bno,@oid=oid from inserted
if(exists(select oid from pickup where dno=@dno and bno!=@bno and abs(datediff(mi,ptime,@ptime))<5))
 begin
  print '��ʱ�޷��ӵ�����ȴ������ӣ�'
 end
else if(exists(select * from business where bno=@bno) and exists(select * from deliveryman where dno=@dno)
        and exists(select * from ordering where oid=@oid))
 begin
  insert into pickup 
  (oid,bno,dno,ptime)
  values(@oid,@bno,@dno,@ptime)
 end
else
 begin
  print '����ʧ��!'
 end
return