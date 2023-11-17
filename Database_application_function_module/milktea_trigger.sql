use milktea_deliver 
go

create trigger tr_milktea on milktea
instead of insert
as
 declare @mno char(10),@mname char(20),@bno char(10),@mprice numeric(6,2),@msize char(5)
 select @bno=bno,@mno=mno,@mname=mname,@mprice=mprice,@msize=msize from inserted
 if(exists(select * from business where bno=@bno))
  begin
   insert into milktea
   (mno,mname,bno,mprice,msize)
   values(@mno,@mname,@bno,@mprice,@msize)
  end
 else
  begin
   print'≤Â»Î¥ÌŒÛ!'
  end
return
