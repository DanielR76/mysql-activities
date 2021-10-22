 
CREATE DATABASE Movies;
USE Movies;

/*tabla cliente*/
CREATE TABLE clientes
(
	id_cliente INT PRIMARY KEY,
	direccion VARCHAR (20),
	telefono INT,
	nombre VARCHAR (20) NOT NULL,
	apellido VARCHAR(20) NOT NULL,
	email VARCHAR (20),
	fecha_nacimiento DATE,
	fecha_inscripcion DATE,
	estado VARCHAR (20),
	tema_interes VARCHAR (20)	
); 


/*tabla sancion*/
CREATE TABLE sanciones
(
	id_sancion INT PRIMARY KEY,
	id_cliente INT,
	id_alquiler INT,
	tipo_sancion VARCHAR(20),
	dias_sancion INT
);


/*tabla alquiler*/
CREATE TABLE Alquileres
(
	id_alquiler INT PRIMARY KEY,
	id_cliente INT,
	fecha_alquiler DATE NOT NULL,
	valor_alquiler INT
);


/*tabla detalle alquier*/
CREATE TABLE Detalles_alquiler
(
	id_detalle INT PRIMARY KEY,
	id_alquiler INT,
	id_titulo INT NOT NULL,
	id_pelicula INT,
	dias_prestamo INT,
	fecha_devolucion DATE,
	descripcion_entrega VARCHAR (50)
);


/*Tabla Pelicula*/
CREATE TABLE Peliculas
(
	id_pelicula INT PRIMARY KEY,
	id_titulo INT,
	condicion VARCHAR (20),
	ubicacion VARCHAR (20) NOT NULL,
	estado VARCHAR (20) NOT NULL
);


/*Tabla titulo*/
CREATE TABLE Titulos
(
	id_titulo INT PRIMARY KEY,
	titulo_pelicula VARCHAR (20),
	año DATE,
	genero VARCHAR (20),
	productora VARCHAR (20),
	director VARCHAR (20),
	idioma VARCHAR (20),
	calificacion INT
);


/*Llave Foranea Sancion*/
ALTER TABLE sanciones
ADD CONSTRAINT FK_cliente_sancion
FOREIGN KEY (id_cliente)
REFERENCES clientes (id_cliente);

ALTER TABLE sanciones
ADD CONSTRAINT Fk_alquiler_sancion
FOREIGN KEY (id_alquiler)
REFERENCES Alquileres (id_alquiler);

/*Llave Foranea Alquiler*/
ALTER TABLE Alquileres
ADD CONSTRAINT FK_cliente_alquiler
FOREIGN KEY (id_cliente)
REFERENCES clientes (id_cliente);

/*Llave Foranea Detalle_alquiler*/
ALTER TABLE Detalles_alquiler
ADD CONSTRAINT FK_alquiler_Detalle_alquiler
FOREIGN KEY (id_alquiler)
REFERENCES alquileres (id_alquiler);

ALTER TABLE Detalles_alquiler
ADD CONSTRAINT FK_titulo_Detalle_alquiler
FOREIGN KEY (id_titulo)
REFERENCES titulos (id_titulo);

ALTER TABLE Detalles_alquiler
ADD CONSTRAINT FK_pelicula_Detalle_alquiler
FOREIGN KEY (id_pelicula)
REFERENCES peliculas (id_pelicula);

/*Llave Foranea pelicula*/
ALTER TABLE Peliculas
ADD CONSTRAINT FK_titulo_pelicula
FOREIGN KEY (id_titulo)
REFERENCES titulos (id_titulo);

/*Valores cliente*/
INSERT INTO clientes (id_Cliente,Direccion,Telefono,Nombre,Apellido,Email,Fecha_Nacimiento,Fecha_inscripcion,Estado)
VALUES(101,'Av tintal',7832300,'Deivid','Aldana','Deivida@gmail.com','1980/08/05','2013/06/04','Activo'),
(102,'Av tunal',7856405,'Erika','Sanchez','Erikas@gmail.com','1995/06/18','2014/08/09','Activo'),
(103,'Av dorado',7946205,'Jorge','Sanchez','Jorges@gmail.com','1998/02/03','2015/08/09','Activo'),
(104,'Circunbalar',7910065,'Karem','Porras','Karemp@gmail.com','1997/10/06','2013/12/25','Activo'),
(105,'Circunbalar',7950691,'Paula','Mora','Paulam@gmail.com','1996/12/06','2013/12/25','Activo'),
(106,'Tranversal',7946287,'Oscar','Buitrago','Oscarb@gmail.com','1991/08/01','2013/06/04','Inactivo'),
(107,'Av tintal',7141400,'Luisa','Cuellar','Luisac@gmail.com','1992/06/07','2015/01/25','Activo'),
(108,'Av dorado',7080601,'Johan','Prada','Johanp@gmail.com','1995/12/09','2012/05/30','Activo'),
(109,'Tranversal',7238492,'Erley','Bravo','Erleyb@gmail.com','1999/01/10','2015/05/26','Inactivo'),
(110,'Circunbalar',7059156,'Vanesa','Chacon','Vanesac@gmail.com','200/08/12','2014/11/18','Activo');

/*Valor titulo*/
INSERT INTO Titulos (id_titulo,titulo_pelicula,año,genero,productora,director,idioma,calificacion)
VALUES(1231,'Que paso ayer','2005/05/26','comedia','Universal','Alex','Español',3),
(1232,'La era del hielo','2007/11/25','comedia','Dreamworks','Camilo','Español',5),
(1233,'Aprendiz de Mago','2006/08/15','Terror','Disney','Pablo','Español',3),
(1234,'Madagascar','2009/11/26','comedia','Dreamworks','Alejandro','Español',3),
(1235,'Rapidos y furiosos','2010/06/08','Accion','Disney','Steven','Español',2),
(1236,'Eliminar amigo','2004/04/09','Terror','Universal','Manuel','Español',1),
(1237,'Los vengadores','2002/08/05','Accion','Disney','Raul','Español',5),
(1238,'American pie','2007/07/01','Terror','Disney','Jose','Español',2),
(1239,'Kun fu panda','2006/06/14','comedia','Universal','Julio','Español',4),
(1240,'Mi villano favorito','2009/07/29','comedia','Dreamworks','Alexander','Español',4);

/*Valor pelicula*/
INSERT INTO Peliculas (id_pelicula,id_titulo,condicion,ubicacion,estado)
VALUES(9561,1231,'no dañar','mostrario 1','bueno'),
(9562,1232,'no dañar','mostrario 2','regular'),
(9563,1233,'no dañar','mostrario 3','bueno'),
(9564,1234,'no dañar','mostrario 1','bueno'),
(9565,1235,'no dañar','mostrario 3','regular'),
(9566,1236,'no dañar','mostrario 2','bueno'),
(9567,1237,'no dañar','mostrario 1','exelente'),
(9568,1238,'no dañar','mostrario 1','bueno'),
(9569,1239,'no dañar','mostrario 2','malo'),
(9570,1240,'no dañar','mostrario 3','bueno');

/*Valor alquier*/
INSERT INTO Alquileres (id_alquiler,id_cliente,fecha_alquiler,Valor_alquiler)
VALUES(1501,101,'2015/10/10',5000),
(1502,102,'2015/10/12',6000),
(1503,103,'2015/09/01',4000),
(1504,104,'2015/12/13',5000),
(1505,105,'2015/11/20',5000),
(1506,106,'2015/10/10',6000),
(1507,107,'2015/11/17',4000),
(1508,108,'2015/10/23',3000),
(1509,109,'2015/10/16',5000),
(1510,110,'2015/11/30',6000);

/*Valor detalle alquiler*/
INSERT INTO detalles_alquiler (id_detalle,id_alquiler,id_titulo,id_pelicula,dias_prestamo,fecha_devolucion,Descripcion_entrega)
VALUES(9510,1501,1231,9561,8,'2015/10/18','Entregado'),
(9511,1502,1232,9562,3,'2015/10/15','Entregado'),
(9512,1503,1233,9563,9,'2015/09/10','Entregado'),
(9513,1504,1234,9564,15,'2015/12/28','Entregado'),
(9514,1505,1235,9565,2,'2015/11/29','Entregado'),
(9515,1506,1236,9566,6,'2015/10/16','Entregado'),
(9516,1507,1237,9567,11,'2015/11/28','Entregado'),
(9517,1508,1238,9568,6,'2015/11/29','Entregado'),
(9518,1509,1239,9569,1,'2015/10/30','Entregado'),
(9519,1510,1240,9570,8,'2015/12/07','Entregado');

/*Valores Sancion*/
INSERT INTO sanciones (id_sancion,id_cliente,id_alquiler,tipo_sancion,dias_sancion)
VALUES(123,101,1501,'no alquiler',8),
(124,102,1502,'no alquiler',12),
(125,103,1503,'no alquiler',11),
(126,104,1504,'no alquiler',25),
(127,105,1505,'no alquiler',35),
(128,106,1506,'no alquiler',12),
(129,107,1507,'no alquiler',9),
(130,108,1508,'no alquiler',2),
(131,109,1509,'no alquiler',98),
(132,110,1510,'no alquiler',23);


-----------------------------------------------------


/*1 punto*/
UPDATE cliente
SET estado ='Inactivo'
WHERE fecha_inscripcion <= '2015/01/02' AND Tema_interes IS NULL;

/*2 punto*/
UPDATE Alquiler
SET Fecha_alquiler='2015/01/23'
WHERE Fecha_alquiler BETWEEN '2015/01/01' AND '2015/02/01' AND Codigo_cliente IS NOT NULL;

/*3 punto*/
DELETE FROM Pelicula
WHERE Ubicacion IN ('Stan E','Stan Y') AND Ubicacion NOT IN ('Stan Z');

/*4 punto*/
CREATE TABLE Copia_Cliente
(
Direccion_cliente VARCHAR (100),
Telefono BIGINT,
Nombre VARCHAR (100),
Email VARCHAR (100),
Nro_DNI BIGINT,
Fecha_nacimiento DATE,
Fecha_inscripcion DATE,
Tema_interes VARCHAR (100),
Estado VARCHAR (100),
Codigo_copia_cliente BIGINT
);

ALTER TABLE Copia_cliente
ADD CONSTRAINT PK_Copia_cliente
PRIMARY KEY (Codigo_copia_cliente);

/*5 punto*/
ALTER TABLE Detalle_alquiler
ADD CONSTRAINT FK_Detalle_alquiler_pelicula
FOREIGN KEY (Codigo_titulo)
REFERENCES Pelicula (codigo_titulo);

/*6 punto*/
SELECT ALL titulo.titulo_pelicula, cliente.nombre_cliente, cliente.apellido_cliente
FROM cliente, titulo 
WHERE titulo.idioma = 'Español';

/*7 punto*/
SELECT nombre_cliente, apellido_cliente
FROM cliente
WHERE Estado='Activo';

SELECT nombre_cliente, apellido_cliente
FROM cliente
WHERE Estado='Inactivo';

/*8 punto*/
SELECT valor_alquiler, AVG(valor_alquiler) from alquiler

/*9 punto*/
UPDATE detalle_alquiler
SET descripcion_entrega = 'Entrega_oportuna'
WHERE dias_prestamo <= 3;

/*10 punto*/
UPDATE titulo
SET Calificacion = 5
WHERE Genero = 'Terror' 
AND Idioma = 'Español' 
AND Calificacion < 4 
AND Año BETWEEN '2005/01/01' AND '2007/12/31';

/*11 punto*/
ALTER TABLE TITULO
ADD COLUMN Pais VARCHAR (20);

UPDATE TITULO
SET pais = 'Indeterminado'
WHERE codigo_titulo IS NOT NULL;

/*12 punto*/
CREATE VIEW 
Directorio AS
SELECT nombre_cliente,apellido_cliente,telefono,direccion_cliente
FROM Cliente
WHERE estado = 'activo';
