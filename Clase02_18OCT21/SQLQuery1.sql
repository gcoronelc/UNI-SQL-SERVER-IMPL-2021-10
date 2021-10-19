-- Primera tabla de trabajo

create table articulo(
	idarticulo int,
	nombre varchar(100),
	stock  int,
	preCosto decimal(12,2),
	preVenta decimal(12,2)
);
go

-- PRIMARY KEY

sp_help articulo;
go

ALTER TABLE articulo
ALTER COLUMN idarticulo int not null;
GO

delete from articulo;
go

alter table articulo
add constraint pk_articulo
primary key (idarticulo);
go

insert into dbo.articulo values(1,'Televisor',100, 1000, 800);
insert into dbo.articulo values(1,'Refrigeradora',-100, 3000, -5000);
go

select * from articulo;
go

-- UNIQUE

delete from articulo;
go

ALTER TABLE articulo
ALTER COLUMN nombre varchar(100) not null;
GO

alter table dbo.articulo
add constraint u_articulo_nombre
unique ( nombre );
go

insert into dbo.articulo values(1,'Televisor',100, 1000, 800);
insert into dbo.articulo values(2,'Televisor',-100, 3000, -5000);
insert into dbo.articulo values(3,null,-100, 3000, -5000);
go

select * from dbo.articulo;
go


-- CHECK DE COLUMNA STOCK

delete from articulo;
go

ALTER TABLE articulo
ALTER COLUMN stock int not null;

ALTER TABLE articulo
add constraint ck_articulo_stock
check (stock > 0);
GO

insert into dbo.articulo values(1,'Televisor',100, 1000, 800);
insert into dbo.articulo values(2,'Refrigeradora',-100, 3000, -5000);
go

select * from articulo;
go

-- CHECK A NIVEL DE PRECIO

delete from articulo;
go


ALTER TABLE articulo
ALTER COLUMN preCosto int not null;
go

ALTER TABLE articulo
ALTER COLUMN preVenta int not null;
go

ALTER TABLE articulo
add constraint ck_articulo_preCosto
check (preCosto > 0);
GO

ALTER TABLE articulo
add constraint ck_articulo_preVenta
check (preVenta > preCosto);
GO


insert into dbo.articulo values(1,'Televisor',100, 1000, 1800);
insert into dbo.articulo values(2,'Refrigeradora',200, 3000, 2500);
go

select * from articulo;
go


-- Se necesita darle de baja a algunos articulos.
-- Se debe agregar una nueva columna.


ALTER TABLE articulo
ADD baja int not null default 0;
go

ALTER TABLE articulo
add constraint ck_articulo_baja
check (baja in (0,1));
GO

insert into dbo.articulo values(10,'Juego de Comedor',100, 5000, 7000, 0);
go

select * from articulo;
go


-- TABLA VENTA

create table venta(
  idventa int not null identity(1,1),
  cliente varchar(100) not null,
  idarticulo int not null,
  precio decimal(12,2) not null,
  cantidad int not null,
  importe decimal(12,2) not null,
  constraint pk_venta primary key (idventa)
);
go

insert into venta values('Gustavo',1000, 600, 6, 300);
go

select * from articulo;
go

select * from venta;
go


-- Foreign Key

delete from venta;
go

-- No identificativa

alter table venta
add constraint fk_venta_articulo
foreign key( idarticulo )
references articulo( idarticulo );
go


insert into venta values('Gustavo',1, 600, 6, 300);
go

insert into venta values('Gustavo',1000, 600, 6, 300);
go


select * from venta;
go


select * from articulo;
go

delete from articulo where idarticulo = 1;
go

update articulo set idarticulo = 100 where idarticulo = 1;
go


-- actualizacion en cascada

alter table venta
drop constraint fk_venta_articulo;
go

alter table venta
add constraint fk_venta_articulo
foreign key( idarticulo )
references articulo( idarticulo )
on update cascade;
go

select * from venta;
go

select * from articulo;
go

update articulo set idarticulo = 777 where idarticulo = 1;
go


-- eliminacion en cascada

alter table venta
drop constraint fk_venta_articulo;
go

alter table venta
add constraint fk_venta_articulo
foreign key( idarticulo )
references articulo( idarticulo )
on delete cascade;
go

select * from venta;
go

select * from articulo;
go

delete from articulo where idarticulo = 777;
go




