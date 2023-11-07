
use milktea_deliver
go
create procedure od_sale(@zmname varchar(20))
as
if @zmname in(select mname from milktea )
begin
declare @zoid char(20)
declare @zsale varchar
declare zoid cursor static
for
select oid from ordering inner join milktea 
on ordering.mno=milktea.mno where mname=@zmname
open zoid 
set @zsale=@@CURSOR_ROWS
fetch next from zoid into @zoid
while @@FETCH_STATUS=0
 fetch next from zoid into @zoid
print @zmname+'������Ϊ'+@zsale
close zoid
deallocate zoid
end
else 
print '���̲費���ڣ�'

go
use milktea_deliver
go
create procedure od_score(@zmname varchar(20))
as
if @zmname in(select mname from milktea ) 
begin
declare @zoco1 numeric =0
declare @zscore numeric,@zoco2 numeric
declare @num int =0
declare zoco cursor static
for
select oco from ordering inner join milktea 
on ordering.mno=milktea.mno where mname=@zmname
open zoco 
set @num=@@CURSOR_ROWS
fetch next from zoco into @zoco2
while @@FETCH_STATUS=0
begin
 set @zoco1=@zoco1+@zoco2
 fetch next from zoco into @zoco2
end
set @zscore=@zoco1/@num
print cast(@zmname as varchar)+'������Ϊ'+cast(@zscore as varchar)
close zoco
deallocate zoco
end
else 
print '���̲費���ڣ�'