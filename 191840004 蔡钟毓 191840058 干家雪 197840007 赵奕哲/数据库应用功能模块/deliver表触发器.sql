use milktea_deliver 
go

create trigger tr_delivery on deliver
instead of insert
as
declare @oid char(10),@cno char(10),@dno char(10),@exptime datetime
declare @actime datetime,@satis numeric(6,2),@tip numeric(6,2)
select @oid=oid,@cno=cno,@dno=dno,@exptime=exptime,@actime=actime,@satis=satis,@tip=tip from inserted
if(@cno=(select cno from ordering where oid=@oid) 
   and @dno=(select dno from pickup where oid=@oid))
 begin
  insert into deliver
  (oid,cno,dno,exptime,actime,satis,tip)
  values(@oid,@cno,@dno,@exptime,@actime,@satis,@tip) 
 end
else
 begin
  print'Êı¾İ´íÎó£¬²åÈëÊ§°Ü!'
 end
return