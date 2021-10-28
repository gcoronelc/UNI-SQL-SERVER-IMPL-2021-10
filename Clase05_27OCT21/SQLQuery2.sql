begin tran;
go


select @@TRANCOUNT;
go


select cur_id, cur_nombre 
from curso
where cur_id = 1;
go


rollback;
go

