use milktea_deliver
go
create procedure deliver_ordering (@cdname char(10))
as

begin

declare @cbname varchar(10),@cbhome varchar(20),@coid varchar(10),@cmname varchar(20),@cptime datetime, @cexptime datetime,@cchome varchar(20),
@ccname varchar(10),@cctel  varchar(15),@cdno varchar(10)

declare del_ordering cursor static
for

select bname,bhome,ordering.oid,mname,ptime,exptime,chome,cname,ctel
from ordering join pickup on (ordering.oid=pickup.oid)
join deliver on (pickup.oid=deliver.oid)
join business on (pickup.bno=business.bno)
join milktea on (ordering.mno=milktea.mno)
join deliveryman on (pickup.dno=deliveryman.dno)
join customer on (ordering.cno=customer.cno)
where dname=@cdname

if not exists (select top 1 * from deliveryman where dname=@cdname)
begin
  print '������Ա������'
  deallocate  del_ordering
  return 
end
else 
begin
   select @cdno=dno
   from deliveryman
   where deliveryman.dname=@cdname
print '����Ա������'+@cdname+'    '+'��ţ�'+@cdno
print '----------------------------------------'

open del_ordering
fetch next from del_ordering into
@cbname,@cbhome,@coid,@cmname,@cptime, @cexptime,@cchome,@ccname,@cctel
while @@FETCH_STATUS=0
begin
  print '�̼�����'+@cbname+'  '+'�̼ҵ�ַ��'+@cbhome+'  '+'�����ţ�'+@coid+'  '+'�̲�����'
  +@cmname+'  '+'ȡ��ʱ�䣺'+convert(varchar(20),@cptime,20)+'  '+'Ԥ���ʹ�ʱ��:'+convert(varchar(20),@cexptime,20)
  +'  '+'�ʹ��ַ��'+@cchome+'  '+'���������'+@ccname+'  '+'��ҵ绰��'+@cctel
  fetch next from del_ordering into
@cbname,@cbhome,@coid,@cmname,@cptime, @cexptime,@cchome,@ccname,@cctel
end
CLOSE del_ordering
DEALLOCATE del_ordering
end
end



