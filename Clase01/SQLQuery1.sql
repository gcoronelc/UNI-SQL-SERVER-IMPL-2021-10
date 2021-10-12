
create database demo01;
go

select * from maestros.articulo;

exec sys.sp_helpdb demo01;
go

create table algo( dato varchar(30));
go


sp_help algo;
go


exec sp_help 'maestros.articulo';
go



INSERT INTO ARTICULO VALUES( 'UVA', 200, 300, 500);
GO

INSERT INTO ARTICULO VALUES( NULL, 200, 300, 500);
GO

SELECT * FROM ARTICULO;

ALTER TABLE ARTICULO 
ADD CONSTRAINT PK_ARTICULO
PRIMARY KEY (ART_ID);
GO

ALTER TABLE ARTICULO 
ADD CONSTRAINT U_ARTICULO_NOMBRE
UNIQUE (ART_NOMBRE);
GO

DELETE FROM ARTICULO;