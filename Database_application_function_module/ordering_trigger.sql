use milktea_deliver
go

create trigger tr_ordering on ordering
instead of insert
as
declare @oid char(10),@cno char(10),@mno char(10),@otime datetime,@oway char(10)
declare @ofee numeric(6,2),@oco numeric(6,2),@osta varchar(10),@mtem char(5),@msweet char(10)
select @oid=oid,@cno=cno,@mno=mno,@otime=otime,@oway=oway,@ofee=ofee,
@oco=oco,@osta=osta,@mtem=mtem,@msweet=msweet from inserted 
if(exists(select * from customer where @cno=cno) and exists(select * from milktea where @mno=mno))
 begin
  insert into ordering
  (oid,cno,mno,otime,oway,ofee,oco,osta,mtem,msweet)
  values(@oid,@cno,@mno,@otime,@oway,@ofee,@oco,@osta,@mtem,@msweet)
 end
else
 begin
  print'≤Â»Î ß∞‹£°'
 end
return