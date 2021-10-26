
/*
SELECCION DE COLUMNAS
*/

select * from rh.dbo.empleado;
go

select idempleado, nombre, apellido 
from rh.dbo.empleado;
go

/*
CAMPOS CALCULADOS EN UNA TABLA
*/

CREATE TABLE dbo.Notas
(
	ID int IDENTITY (1,1) NOT NULL,
	NOMBRE VARCHAR(50) NOT NULL,
	NOTA1 INT NOT NULL,
	NOTA2 INT NOT NULL,
	PROMEDIO AS (NOTA1 + NOTA2) / 2
);

INSERT INTO NOTAS VALUES('Gustavo', 15, 16);
go

SELECT * FROM dbo.Notas;
GO

-- Error, PROMEDIO es una columna calculada.
UPDATE NOTAS SET PROMEDIO = 20;
GO


UPDATE NOTAS SET NOTA1 = 20;
GO

INSERT INTO NOTAS(nombre,nota1,nota2)
VALUES('Ricardo', 18, 20);
go

SELECT * FROM dbo.Notas;
GO


/*
CAMPOS CALCULADOS EN EL SELECT
*/




