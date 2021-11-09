
alter view v_prueba
as
with 
v1 as (
	select 
		cur_id curso,
		MONTH(pag_fecha) mes,
		pag_importe importe
	from dbo.PAGO
),
v2 as (
	select cur_id, sum(pag_importe) importe
	from dbo.PAGO
	group by cur_id
)
select curso, mes, importe from v1 
union 
select cur_id, 13, importe from v2
go

select * from v_prueba;
go

	
select 
	curso, [1] as Enero,[2] as Febrero,[3] as Marzo, [4] Abril, 
	[5] Mayo, [6] Junio, [7] Julio, [8] Agosto, [9] Setiembre, 
	[10] Octubre, [11] Noviembre, [12] Diciembre, [13] Total
from (
	select curso, mes, importe from v_prueba
) datos
pivot( sum(importe) for mes in ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[13]) ) as piv
go

/*
Ejercicio
-----------------------------------------------
Usando PIVOT desarrollar la siguiente consulta
para un determinado año.
La cantidad de matriculados.

curso        enero   febrero ....  total
------------------------------------------------
java          180
sql server    200
*/
 

