
CREATE DATABASE DULCE_SABROSO;
USE DULCE_SABROSO;

CREATE TABLE CLIENTES(
	cedula INT NOT NULL PRIMARY KEY,
	nombre VARCHAR (30)
);

CREATE TABLE PROVEEDORES(
	id_proveedor INT NOT NULL PRIMARY KEY,
	nombre VARCHAR(30)
);

CREATE TABLE TELEFONOS_CLIENTES(
	id_tel INT NOT NULL PRIMARY KEY,
	tipo VARCHAR (20),
	numero INT,
	cedula_cliente INT,
	FOREIGN KEY (cedula_cliente)
	REFERENCES CLIENTES(cedula)
);

CREATE TABLE TELEFONOS_PROVEEDORES(
	id_tel INT NOT NULL PRIMARY KEY,
	tipo VARCHAR (20),
	numero INT,
	id_proveedor INT,
	FOREIGN KEY (id_proveedor)
	REFERENCES PROVEEDORES(id_proveedor)
);

CREATE TABLE CIUDADES(
	id_ciudad INT NOT NULL PRIMARY KEY,
	nombre_ciudad VARCHAR(30)
);

CREATE TABLE LOCALIDADES(
	id_localidad INT NOT NULL PRIMARY KEY,
	nombre_localidad VARCHAR(30),
	id_ciudad INT,
	FOREIGN KEY (id_ciudad)	
	REFERENCES CIUDADES(id_ciudad)
);

CREATE TABLE BARRIOS(
	id_barrio INT NOT NULL PRIMARY KEY,
	nombre_barrio VARCHAR(30),
	id_localidad INT,
	FOREIGN KEY (id_localidad)
	REFERENCES LOCALIDADES(id_localidad)
);
 
CREATE TABLE DIRECCIONES_CLIENTES(
	id_direccion INT NOT NULL PRIMARY KEY,
	direccion VARCHAR(30),
	cedula_cliente INT,
	id_barrio INT,
	FOREIGN KEY (cedula_cliente)
	REFERENCES CLIENTES (cedula),
	FOREIGN KEY (id_barrio)
	REFERENCES BARRIOS(id_barrio)
);


CREATE TABLE DIRECCIONES_PROVEEDORES(
	id_direccion INT NOT NULL PRIMARY KEY,
	tipo VARCHAR(20),
	direccion VARCHAR(30),
	id_proveedor INT,
	id_barrio INT,
	FOREIGN KEY (id_proveedor)
	REFERENCES PROVEEDORES (id_proveedor),
	FOREIGN KEY (id_barrio)
	REFERENCES BARRIOS(id_barrio)
);

CREATE TABLE CORREOS_CLIENTES(
	id_correo INT NOT NULL PRIMARY KEY,
	correo VARCHAR(30),
	cedula_cliente INT,
	FOREIGN KEY (cedula_cliente)
	REFERENCES CLIENTES(cedula)
);


CREATE TABLE CORREOS_PROVEEDORES(
	id_correo INT NOT NULL PRIMARY KEY,
	correo VARCHAR(30),
	id_proveedor INT,
	FOREIGN KEY (id_proveedor)
	REFERENCES PROVEEDORES(id_proveedor)
);

CREATE TABLE INVENTARIOS(
	id_inventario INT NOT NULL PRIMARY KEY,
	stock INT,
	precio_compra INT,
	precio_venta INT,
	fecha DATE
);

CREATE TABLE PRODUCTOS(
	id_producto INT NOT NULL PRIMARY KEY,
	tipo VARCHAR(20),
	nombre VARCHAR(30),
	contenido VARCHAR(40),
	fecha_farica DATE,
	fecha_vencimiento DATE,
	id_inventario INT,
	id_proveedor INT,
	FOREIGN KEY (id_inventario)
	REFERENCES INVENTARIOS(id_inventario),
	FOREIGN KEY (id_proveedor)
	REFERENCES PROVEEDORES(id_proveedor)
);

CREATE TABLE COMPOSICIONES(
	id_composicion INT NOT NULL PRIMARY KEY,
	calorias INT,
	carbohidratos INT,
	proteinas INT,
	grasas INT,
	sodio INT,
	id_producto INT,
	FOREIGN KEY (id_producto)
	REFERENCES PRODUCTOS(id_producto)
);

CREATE TABLE VENTAS(
	id_venta INT NOT NULL PRIMARY KEY,
	fecha DATE,
	descripcion VARCHAR(30)
);

CREATE TABLE DETALLE_VENTA(
	id_detalle INT NOT NULL PRIMARY KEY,
	cantidad INT,
	id_venta INT,
	id_producto INT,
	FOREIGN KEY (id_venta)
	REFERENCES VENTAS(id_venta),
	FOREIGN KEY (id_producto)
	REFERENCES PRODUCTOS(id_producto)
);

CREATE TABLE BODEGAS(
	id_bodega INT NOT NULL PRIMARY KEY,
	nombre VARCHAR(30)
);


INSERT INTO CLIENTES (cedula,nombre)
VALUES (1,'Gabriela'),
(2,'Mileidy'),
(3,'Paula'),
(4,'Derly'),(5,'Karen');

INSERT INTO PROVEEDORES (id_proveedor,nombre)
VALUES (6,'los_pollos'),
(7,'greneye'),
(8,'Payula'),
(9,'ertia'),
(10,'home');

INSERT INTO TELEFONOS_CLIENTES(id_tel,tipo,numero,cedula_cliente)
VALUES (11,'celular',310947584,1),
(12,'fijo',318384,2),
(13,'celular',311927114,3),
(14,'celular',312934567,4),(15,'fijo',83940234,5);

INSERT INTO TELEFONOS_PROVEEDORES (id_tel,tipo,numero,id_proveedor)
VALUES (16,'celular',311287584,6),
(17,'celular',315947584,7),
(18,'celular',314447544,8),(19,'fijo',1234509,9),(20,'fijo',8670584,10);

INSERT INTO CIUDADES (id_ciudad,nombre_ciudad)
VALUES (21,'Miami'),
(22,'Bogota'),
(23,'Bucaramanga'),
(24,'Paris'),
(25,'Cali');

INSERT INTO LOCALIDADES (id_localidad,nombre_localidad,id_ciudad)
VALUES (26,'Miamitown',21),
(27,'Bogotatown',22),
(28,'Bucaramangatown',23),
(29,'Paristown',24),
(30,'Calitown',25);

INSERT INTO BARRIOS (id_barrio,nombre_barrio,id_localidad)
VALUES (31,'Mitown',26),
(32,'Botatown',27),
(33,'Bumangatown',28),
(34,'Pastown',29),
(35,'Catown',30);

INSERT INTO DIRECCIONES_CLIENTES(id_direccion,direccion,cedula_cliente,id_barrio)
VALUES (36,'Av siempre viva',1,31),
(37,'calle principal viasol',2,32),
(38,'Buga no23',3,33),
(39,'calle 11',4,34),
(40,'av cali',5,35);

INSERT INTO DIRECCIONES_PROVEEDORES(id_direccion,tipo,direccion,id_proveedor,id_barrio)
VALUES (41,'casa','calle 90-12',6,31),
(42,'oficina','calle secundaria viasol',7,32),
(43,'edificio','av calle 2 no23',8,33),
(44,'casa','calle 11-34',9,34),
(45,'apartamento','av boyaca',10,35);

INSERT INTO CORREOS_CLIENTES (id_correo,correo,cedula_cliente)
VALUES (46,'gaby@gmail.com',1),
(47,'mili@gmail.com',2),
(48,'paula@gmail.com',3),
(49,'darly@gmail.com',4),
(50,'karengon05@gmail.com',5);

INSERT INTO CORREOS_PROVEEDORES (id_correo,correo,id_proveedor)
VALUES (51,'lospollos@gmail.com',6),
(52,'grenye@gmail.com',7),
(53,'payula@gmail.com',8),
(54,'ertia@gmail.com',9),
(55,'home@gmail.com',10);

INSERT INTO INVENTARIOS (id_inventario,precio_compra,precio_venta)
VALUES (56,10,10000),
(57,25,23043),
(58,35,5388888),
(59,45,447385),
(60,23,129945);

INSERT INTO PRODUCTOS (id_producto,tipo,nombre,contenido,fecha_farica,fecha_vencimiento,id_inventario,id_proveedor)
VALUES (61,'Crema dulce','glister','250ml','01/01/2010','01/01/2020',56,6),
(62,'arequipe limon','Alpina','500ml','01/01/2010','01/01/2020',57,7),
(63,'leche entera','Colanta','250ml','01/01/2010','01/01/2020',58,8),
(64,'champus','friszla','1litro','01/01/2010','01/01/2020',59,9),
(65,'betacaroteno','nutrillite','60 capsulas','01/01/2010','01/01/2020',60,10);

INSERT INTO COMPOSICIONES (id_composicion,calorias,carbohidratos,proteinas,grasas,sodio,id_producto)
VALUES (66,100,230,50,30,20,61),
(67,130,170,65,43,10,62),
(68,123,430,70,123,243,63),
(69,200,167,05,40,26,64),
(70,154,330,150,320,320,65);

INSERT INTO VENTAS (id_venta,fecha,descripcion)
VALUES (71,'2012/03/20','perdida'),
(72,'2012/03/20','recompensa'),
(73,'2012/03/20','equilibrio'),
(74,'2012/03/20','perdida'),
(75,'2012/03/20','ganancias');

INSERT INTO DETALLE_VENTA (id_detalle,cantidad,id_venta,id_producto)
VALUES (76,2,71,61),
(77,4,72,62),
(78,1,73,63),
(79,1,74,64),
(80,1,75,65);

INSERT INTO BODEGAS (id_bodega,nombre)
VALUES (81,'bodega1'),
(82,'bodega1'),
(83,'bodega1'),
(84,'bodega1'),
(85,'bodega1');


SELECT cantidad FROM DETALLE_VENTA WHERE EXISTS (SELECT fecha, descripcion FROM VENTAS WHERE VENTAS.id_venta = DETALLE_VENTA.id_venta);


SELECT precio_venta
FROM INVENTARIOS
WHERE EXISTS (SELECT nombre, contenido 
	     FROM PRODUCTOS
	     WHERE INVENTARIOS.id_inventario = PRODUCTOS.id_inventario)
AND EXISTS (SELECT id_composicion
	   FROM COMPOSICIONES 
	   WHERE  PRODUCTOS.id_producto = COMPOSICIONES.id_producto);

SELECT SUM(precio_venta)
FROM INVENTARIOS