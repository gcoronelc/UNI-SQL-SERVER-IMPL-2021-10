with
v1 as (
	select *
	from edutec..CursoProgramado 
	where idciclo = '2020-02'
)
select *
from edutec..Curso C
LEFT JOIN v1 CP on C.IdCurso = CP.IdCurso
ORDER BY 1
go


with
v1 as (
	select distinct IdCurso
	from edutec..CursoProgramado 
	where idciclo = '2020-02'
)
select *
from edutec..Curso C
where IdCurso not in (select idcurso from v1);
go


