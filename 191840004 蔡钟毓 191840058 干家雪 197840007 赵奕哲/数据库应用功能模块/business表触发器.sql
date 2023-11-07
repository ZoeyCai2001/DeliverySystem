use milktea_deliver 
go

create trigger tr_business on business
after delete
as
begin
 delete milktea where bno in (select bno from deleted)
end