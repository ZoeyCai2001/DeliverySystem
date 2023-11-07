use milktea_deliver
go

create procedure customer_ordering (@cname char(10))
as 

begin
DECLARE @coid varCHAR(10),@cbname varchar(10),@cmname varchar(20),@cprice numeric(6,2),
@cotime datetime,@cexptime datetime,@costa varchar(10),@cno varchar(10)


declare cus_ordering cursor static
for
select ordering.oid,bname,mname,mprice+ofee as price,otime,exptime,osta
from ordering join deliver on(ordering.oid=deliver.oid)
join milktea on (ordering.mno=milktea.mno)
join business on (milktea.bno=business.bno)
join customer on (customer.cno=ordering.cno)
where cname=@cname


if not exists (select top 1 * from customer where cname=@cname)
begin
	print '��������û������ڣ�'
	DEALLOCATE cus_ordering
	return
end
else
begin
	select @cno=cno
	from customer
	where customer.cname=@cname

	print '����:'+@cname+'    '+'���:'+@cno
	print '----------------------------------------'

	open cus_ordering
	fetch next from cus_ordering 
	into @coid,@cbname,@cmname,@cprice,@cotime,@cexptime,@costa

	while @@FETCH_STATUS=0
	begin
		print '�����ţ�'+@coid+'  '+'�̼ң�'+@cbname+'  '+@cmname+'  '+'�۸�'+cast(@cprice as char(10))+'  '+
		'�µ�ʱ�䣺'+convert(varchar(20),@cotime,20)+'  '+'Ԥ���ʹ�ʱ�䣺'+convert(varchar(20),@cexptime,20)+'  '+@costa
		fetch next from cus_ordering 
	into @coid,@cbname,@cmname,@cprice,@cotime,@cexptime,@costa
	end

	CLOSE cus_ordering
    DEALLOCATE cus_ordering
end
end
go
 

