use milktea_deliver
go
create procedure business_all_ordering(@cbname char(20))
as

begin
declare @cbno varchar(10),@coid varchar(10),@cmname varchar(20),@cmsize varchar(10),
@cmsweet varchar(10),@cmtem varchar(10),@cptime datetime,@costa varchar(10)

declare bus_all_ordering cursor static
for
select ordering.oid,mname,msize,msweet,mtem,pickup.ptime,ordering.osta
from ordering join milktea on(milktea.mno=ordering.mno)
join business on(milktea.bno=business.bno)
join pickup on(pickup.oid=ordering.oid)
where business.bname=@cbname 

if not exists(select top 1 * from business where bname=@cbname)
begin 
  print '该店家不存在'
  deallocate bus_all_ordering
  return
end
else

open bus_all_ordering
begin 
select @cbno=bno
from business
where business.bname=@cbname
print '店名:'+@cbname+'    '+'编号:'+@cbno
	print '----------------------------------------'
fetch next from bus_all_ordering into @coid,@cmname,@cmsize,@cmsweet,@cmtem,@cptime,@costa
while @@FETCH_STATUS=0
begin
   print '订单号：'+@coid+'  '+ '奶茶名：'+@cmname+'  '+'奶茶规格：'+@cmsize+'  '+'甜度：'+
@cmsweet+'  '+'温度：'+@cmtem+'  '+'取货时间：'+convert(varchar(20),@cptime,20)+'  '+'订单状态：'+@costa
   fetch next from bus_all_ordering into @coid,@cmname,@cmsize,@cmsweet,@cmtem,@cptime,@costa
end
close bus_all_ordering
deallocate bus_all_ordering

end
end

