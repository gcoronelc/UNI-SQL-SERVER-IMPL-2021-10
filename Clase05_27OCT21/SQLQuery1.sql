begin tran;
go


select @@TRANCOUNT;
go


select * from curso;
go


update curso 
set cur_precio = 5000
where cur_id = 1;
go

rollback;
go





