-- IDENTITY

create table demo01.dbo.venta2(
  id int not null identity(1,1),
  importe decimal(10,2) not null,
  constraint pk_venta2   primary key(id)
);
go

insert into demo01.dbo.venta2(importe) values(1000);
go

select * from demo01.dbo.venta2;
go

delete from demo01.dbo.venta2 where id=2;
go

insert into demo01.dbo.venta2(importe) values(2000);
go

delete from demo01.dbo.venta2;
go

insert into demo01.dbo.venta2(importe) values(2000);
go


insert into demo01.dbo.venta2(importe) values('eee');
go

select * from demo01.dbo.venta2;
go


-- Hay casos en los que no puede existir id faltantes.
-- En estos casos una solución es manejar tablas de contadores.

set IDENTITY_INSERT demo01.dbo.venta2 ON;
go

insert into demo01.dbo.venta2(id,importe) values(1,1000);
go

set IDENTITY_INSERT demo01.dbo.venta2 OFF;
go



