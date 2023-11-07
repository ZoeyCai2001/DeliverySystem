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
  print '该配送员不存在'
  deallocate  del_ordering
  return 
end
else 
begin
   select @cdno=dno
   from deliveryman
   where deliveryman.dname=@cdname
print '配送员姓名：'+@cdname+'    '+'编号：'+@cdno
print '----------------------------------------'

open del_ordering
fetch next from del_ordering into
@cbname,@cbhome,@coid,@cmname,@cptime, @cexptime,@cchome,@ccname,@cctel
while @@FETCH_STATUS=0
begin
  print '商家名：'+@cbname+'  '+'商家地址：'+@cbhome+'  '+'订单号：'+@coid+'  '+'奶茶名：'
  +@cmname+'  '+'取货时间：'+convert(varchar(20),@cptime,20)+'  '+'预计送达时间:'+convert(varchar(20),@cexptime,20)
  +'  '+'送达地址：'+@cchome+'  '+'买家姓名：'+@ccname+'  '+'买家电话：'+@cctel
  fetch next from del_ordering into
@cbname,@cbhome,@coid,@cmname,@cptime, @cexptime,@cchome,@ccname,@cctel
end
CLOSE del_ordering
DEALLOCATE del_ordering
end
end



