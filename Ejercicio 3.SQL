

/*Crea una base de datos llamada TIENDA*/
CREATE DATABASE TIENDA;

/*Muestra las Bases de datos almacenadas */
SHOW DATABASES;

/*Habilita la Base de datos TIENDA*/
USE TIENDA;

/*Genera las siguientes tablas*/
CREATE TABLE FABRICANTES (
	Clave_fabricante INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	Nombre VARCHAR(30) 
) AUTO_INCREMENT = 10;

CREATE TABLE ARTICULOS (
	Clave_articulo INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	Nombre VARCHAR(30), 
	Precio INT, 
	Clave_fabricante INT, 	
	FOREIGN KEY(Clave_fabricante) 
	REFERENCES FABRICANTES (Clave_fabricante)
)AUTO_INCREMENT = 40 ;	

/*Muestra las tablas de la Base de datos TIENDA*/
SHOW TABLES;

/*Muestra los atributos de la tabla ARTICULOS;*/
DESCRIBE ARTICULOS;

/*Introduce los siguientes datos en cada tabla*/
INSERT INTO FABRICANTES (Nombre)
VALUES ('Kingston'),
('Adata'),
('Logitech'),
('Lexar'),
('Seagate');

INSERT INTO ARTICULOS (Nombre, precio, Clave_fabricante)
VALUES ('Teclado', 100 , 10 ),
('Disco duro 300 Gb', 500 , 11),
('Mouse', 80 , 12),
('Memoria USB', 140 , 13),
('Memoria RAM', 290 , 14),
('Disco duro extraíble 250 Gb', 650 , 10),
('Memoria USB', 279 , 11),
('DVD Rom', 450 , 12),
('CD Rom', 200 , 13),
('Tarjeta de red', 180 , 14);

/*Obtener todos los datos de los productos de la tienda*/
SELECT * 
FROM ARTICULOS;

/*Obtener los nombres de los productos de la tienda*/
SELECT Nombre 
FROM ARTICULOS;

/*Obtener los nombres y precio de los productos de la tienda*/
SELECT Nombre,Precio 
FROM ARTICULOS;

/*Obtener los nombres de los artículos sin repeticiones*/
SELECT DISTINCT Nombre 
FROM ARTICULOS;

/*Obtener todos los datos del  artículo cuya clave de producto es ‘5’*/
SELECT * 
FROM ARTICULOS 
WHERE Clave_articulo=5;

/*Obtener todos los datos del  artículo cuyo nombre del producto es 'Teclado'*/
SELECT * 
FROM ARTICULOS 
WHERE Nombre='Teclado';

/*Obtener todos los datos de la Memoria RAM y memorias USB*/
SELECT * 
FROM ARTICULOS 
WHERE Nombre='Memoria RAM' OR Nombre='Memoria USB';

/*Obtener todos los datos de los artículos que empiezan con 'M'*/
SELECT * 
FROM ARTICULOS 
WHERE Nombre LIKE 'M%';

/*Obtener el nombre de los productos donde el precio sea  $ 100*/
SELECT Nombre FROM ARTICULOS
 WHERE Precio = 100;

/*Obtener el nombre de los productos donde el precio sea mayor a $ 200*/
SELECT Nombre FROM ARTICULOS 
WHERE Precio > 200;

/*Obtener todos los datos de los artículos cuyo precio este entre $100 y $350*/
----------------------------------------
/* OPERADOR AND */ 
SELECT * 
FROM ARTICULOS 
WHERE Precio >= 100 AND Precio<=350; 

/* OPERADOR BETWEEN */ 
SELECT * 
FROM ARTICULOS 
WHERE Precio BETWEEN 100 AND 350;
---------------------------------------

/*Obtener el precio promedio de todos los productos*/ 
SELECT AVG(Precio) 
FROM ARTICULOS;

/*Obtener el precio promedio de los artículos cuyo código de fabricante sea 3*/
SELECT  AVG(Precio)  
FROM ARTICULOS WHERE Clave_fabricante=3;

/*Obtener el nombre y precio de los artículos ordenados por Nombre*/
SELECT Nombre, Precio 
FROM ARTICULOS 
ORDER BY Nombre;

/*Obtener todos los datos de los productos ordenados descendentemente por Precio*/
SELECT * 
FROM ARTICULOS 
ORDER BY Precio DESC;

/*Obtener el nombre y precio de los artículos cuyo precio sea mayor a $ 250 
y ordenarlos descendentemente por precio y luego ascendentemente por nombre*/
SELECT Nombre, Precio 
FROM ARTICULOS 
WHERE Precio >= 250 
ORDER BY Precio DESC, Nombre;

/*Obtener un listado completo de los productos, incluyendo por cada 
articulo los datos del articulo y del fabricante*/
SELECT * 
FROM ARTICULOS, FABRICANTES 
WHERE ARTICULOS.Clave_fabricante=FABRICANTES.Clave_fabricante;

/*Obtener la clave de producto, nombre del producto y nombre del fabricante 
de todos los productos en venta*/
SELECT ARTICULOS.Clave_articulo, ARTICULOS.Nombre, FABRICANTES.Nombre 
FROM ARTICULOS, FABRICANTES 
WHERE ARTICULOS.Clave_fabricante=FABRICANTES.Clave_fabricante

/*Obtener el nombre y precio de los artículos donde el fabricante sea Logitech
 ordenarlos alfabéticamente por nombre del producto*/
SELECT ARTICULOS.Nombre, ARTICULOS.Precio 
FROM ARTICULOS, FABRICANTES 
WHERE FABRICANTES.Nombre='Logitech' AND ARTICULOS.Clave_fabricante=FABRICANTES.Clave_fabricante 
ORDER BY ARTICULOS.Nombre;

/*Obtener el nombre, precio y nombre de fabricante de los productos que son 
marca Lexar o Kingston ordenados descendentemente por precio*/
SELECT ARTICULOS.Nombre, ARTICULOS.Precio, FABRICANTES.Nombre 
FROM ARTICULOS, FABRICANTES 
WHERE FABRICANTES.Nombre='Lexar' OR FABRICANTES.Nombre='Kingston' 
AND ARTICULOS.Clave_fabricante=FABRICANTES.Clave_fabricante 
ORDER BY ARTICULOS.Precio DESC;

/*Añade un nuevo producto: Clave del producto 11, Altavoces de $ 120  del fabricante 2*/
INSERT INTO ARTICULOS 
VALUES (11 ,'Altavoces', 120, 2);

/*Cambia el nombre del producto 6 a ‘Impresora Laser’*/
UPDATE ARTICULOS 
SET Nombre='Impresora Laser' 
WHERE Clave_articulo = 8;

/*Aplicar un descuento del 10% a todos los productos.*/
UPDATE ARTICULOS 
SET Precio=Precio *0.10;

/*Aplicar un descuento de $ 10 a todos los productos cuyo precio sea mayor o igual a $ 300*/
UPDATE ARTICULOS 
SET Precio=Precio – 10 
WHERE Precio >= 300;

/*Borra el producto numero 6*/
DELETE FROM ARTICULOS 
WHERE Clave_articulo= 6;

-----------------------------------------------------------
CREATE TABLE CLIENTES(
	cedula INT PRIMARY KEY,
	nombre VARCHAR(30),
	telefono_local INT,
	direccion_residencia VARCHAR(20),
	correo VARCHAR(30)
);


CREATE TABLE VENTAS(
	cod_venta INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	fecha DATE,
	impuestos FLOAT,
	descuentos FLOAT,	
	Clave_articulo INT,
	cedula INT,
	FOREIGN KEY(Clave_articulo) 
	REFERENCES ARTICULOS (Clave_articulo),
	FOREIGN KEY(cedula)
	REFERENCES CLIENTES (cedula)
)AUTO_INCREMENT=30;

INSERT INTO CLIENTES (cedula,nombre,telefono_local,direccion_residencia,correo)
VALUES (52300,'fulatino',7569834,'cra 80#2-12','nocopeo@gmail.org'),
(55600,'sultanito',7986712,'cra 80#1-13','sisabreve@gmail.org'),
(51670,'pitufito',2096734,'cra 80#3-14','pgl@gmail.org'),
(53890,'soldentino',2784678,'cra 80#3-14','pgl@gmail.org');

INSERT INTO VENTAS(fecha,impuestos,descuentos,Clave_articulo,cedula)
VALUES ('2016-10-5', 3, 10, 40, 52300),
('2016-08-3', 4 , 6, 41, 55600),
('2016-05-14', 5, 10, 43, 51670),
('2016-12-11', 7, 8, 44, 53890),
('2016-08-20', 2, 8, 47, 52300),
('2016-06-23', 4, 12, 49, 53890);

/*Qué ventas se realizaron en el mes de agosto*/
SELECT * FROM VENTAS
WHERE MONTH(fecha) = 08;

/*Cuál es el detalle de la venta 34*/
SELECT * FROM ventas
WHERE cod_venta = 34

/*Quien es el cliente de la venta 30, se requiere conocer el teléfono, dirección y correo*/
SELECT CLIENTES.nombre, CLIENTES.telefono_local, CLIENTES.direccion_residencia, CLIENTES.correo, VENTAS.cod_venta
FROM CLIENTES, VENTAS
WHERE CLIENTES.cedula= VENTAS.cedula AND cod_venta=30;

/*A que productos se les descontó el 10%*/
SELECT ARTICULOS.nombre
FROM ARTICULOS, VENTAS
WHERE  ARTICULOS.Clave_articulo = VENTAS.Clave_articulo  AND  descuentos = 10;

/*Cuanto suma el iva en Agosto*/
SELECT sum(impuestos)
FROM VENTAS
WHERE MONTH(fecha) = 08;

/*Ver compras de los siguientes clientes*/
SELECT CLIENTES.cedula, CLIENTES.nombre, VENTAS.fecha
FROM CLIENTES, VENTAS
WHERE CLIENTES.cedula = VENTAS.cedula
HAVING cedula IN (52300, 53890)
ORDER BY VENTAS.fecha;

/*Ver los articulos con el precio entre 80 y 100*/
SELECT Nombre, Precio
FROM ARTICULOS 
WHERE Precio BETWEEN 80 AND 180;

/*Ver los articulos con clave 43,44,46*/
SELECT nombre, Precio 
from ARTICULOS 
GROUP BY Clave_articulo
HAVING Clave_articulo IN (43,44,46);

/*Ver la suma total de los articulos del fabricante Kingston*/
SELECT SUM(precio), FABRICANTES.nombre
FROM ARTICULOS, FABRICANTES
WHERE ARTICULOS.Clave_fabricante= FABRICANTES.Clave_fabricante AND FABRICANTES.Nombre='Kingston';

