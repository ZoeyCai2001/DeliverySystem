use milktea_deliver
go
create procedure dein_score(@zoid char(10),@zsatis numeric(6,2))
as
declare @zsatis1 numeric(6,2)
set @zsatis1=(select satis from deliver where oid=@zoid)
if @zsatis1 is not null
 print '该订单配送员已评价'
else
begin
update deliver
set satis=@zsatis where oid=@zoid
select * from deliver where oid=@zoid 
end
go
create procedure dein_tip(@zoid char(10),@ztip numeric(6,2))
as
declare @ztip1 numeric(6,2)
set @ztip1=(select tip from deliver where oid=@zoid)
if @ztip1 is not null
 print '该订单配送员已打赏'
else
begin
update deliver
set tip=@ztip where oid=@zoid
select * from deliver where oid=@zoid
end

go
create procedure doin_oco(@zoid char(10),@zoco numeric(6,2))
as
declare @zoco1 numeric(6,2)
set @zoco1=(select oco from ordering where oid=@zoid)
if @zoco1 is not null
 print '该订单奶茶已评分'
else
begin
update ordering
set oco=@zoco where oid=@zoid
select * from ordering where oid=@zoid
end

