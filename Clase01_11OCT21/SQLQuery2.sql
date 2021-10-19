

DELETE FROM ARTICULO;
GO

DROP TABLE ARTICULO;
GO



CREATE TABLE articulo(
	art_id INT NOT NULL IDENTITY(1,1),
	art_nombre VARCHAR(100) NULL,
	art_pre_costo MONEY NOT NULL,
	art_pre_venta MONEY NOT NULL,
	art_stock INT NOT NULL
);



go



