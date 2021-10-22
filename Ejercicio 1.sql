/*crear Base de Almacen*/
CREATE DATABASE Almacen;
USE Almacen;

/*tabla vendedor*/
CREATE TABLE vendedor(
	cedula BIGINT,
	nombre1 VARCHAR(50) NOT NULL,
	nombre2 VARCHAR(50),
	apellido1 VARCHAR(50) NOT NULL,
	apellido2 VARCHAR(50),
	fecha_nto DATE NOT NULL
);

/*llave primaria de tabla vendedor*/
ALTER TABLE vendedor
ADD CONSTRAINT PK_vendedor
PRIMARY KEY(cedula);


/*tabla de venta*/
CREATE TABLE venta(
	codigo_venta BIGINT,
	valor_venta BIGINT,
	fecha DATE NOT NULL,
	cedula_vendedor BIGINT NOT NULL,
	codigo_pedido BIGINT NOT NULL
);

/*llave primaria de tabla venta*/
ALTER TABLE venta
ADD CONSTRAINT PK_venta
PRIMARY KEY(codigo_venta);


/*tabla de pedido*/
CREATE TABLE pedido(
	codigo_pedido BIGINT,
	codigo_cliente BIGINT NOT NULL,
	fecha DATE NOT NULL	
);

/*llave primaria de pedido*/
ALTER TABLE pedido
ADD CONSTRAINT PK_pedido
PRIMARY KEY(codigo_pedido);



/*tabla de producto*/
CREATE TABLE producto(
	codigo_proveedor BIGINT NOT NULL,
	codigo_producto BIGINT,	
	nombre VARCHAR(50),
	marca VARCHAR(50),
	garantia Varchar(50),
	descripcion VARCHAR(50)
);

/*llave primaria de producto*/
ALTER TABLE producto
ADD CONSTRAINT PK_producto
PRIMARY KEY(codigo_producto);


/*tabla de pedido_producto*/
CREATE TABLE pedido_producto(
	codigo_pedido BIGINT NOT NULL,
	codigo_producto BIGINT NOT NULL
);

/*llave primaria pedido_producto*/
ALTER TABLE pedido_producto
ADD CONSTRAINT PK_pedido_producto
PRIMARY KEY(codigo_pedido,codigo_producto);


/*tabla de existencias*/
CREATE TABLE existencias(
	codigo_producto BIGINT NOT NULL,
	codigo_existencias VARCHAR(50),
	estado VARCHAR(50),
	cantidad BIGINT NOT NULL
);

/*llave primaria existencias*/
ALTER TABLE existencias
ADD CONSTRAINT PK_existencias
PRIMARY KEY(codigo_existencias);


/*tabla de proveedor*/
CREATE TABLE proveedor(
	codigo_proveedor BIGINT,
	nombre VARCHAR(50),
	ciudad VARCHAR(50),
	pais VARCHAR(50),
	direccion VARCHAR(50)
);
/*llave primaria proveedor*/
ALTER TABLE proveedor
ADD CONSTRAINT PK_proveedor
PRIMARY KEY(codigo_proveedor);


/*tabla de cliente*/
CREATE TABLE cliente(
	codigo_cliente BIGINT,
	nombre VARCHAR(50),
	ciudad VARCHAR(50),
	pais VARCHAR(50),
	direccion VARCHAR(50),
	telefono BIGINT(50)
);
/*llave primaria cliente*/
ALTER TABLE cliente
ADD CONSTRAINT cliente
PRIMARY KEY(codigo_cliente);


/*tabla de encargado*/
CREATE TABLE encargado(
	codigo_cliente BIGINT NOT NULL,
	codigo_encargado BIGINT,
	telefono BIGINT,
	nombre1 VARCHAR(50) NOT NULL,
	nombre2 VARCHAR(50),
	apellido1 VARCHAR(50) NOT NULL,
	apellido2 VARCHAR(50)
);
/*llave primaria encargado*/
ALTER TABLE encargado
ADD CONSTRAINT PK_encargado
PRIMARY KEY(codigo_encargado);


/*tabla de pago*/
CREATE TABLE pago(
	codigo_cliente BIGINT NOT NULL,
	No_consiganacion BIGINT NOT NULL,
	Tarjeta VARCHAR(50),
	valor BIGINT NOT NULL,
	fecha DATE
);
/*llave primaria pago*/
ALTER TABLE pago
ADD CONSTRAINT PK_pago
PRIMARY KEY(No_consiganacion);

/* LLAVES FORANEAS */

/*foraneo vededor venta*/
ALTER TABLE venta
ADD CONSTRAINT FK_vendedor_venta
FOREIGN KEY (cedula_vendedor)
REFERENCES vendedor(cedula);

/*foraneo venta pedido*/
ALTER TABLE venta
ADD CONSTRAINT FK_pedido_venta
FOREIGN KEY (codigo_pedido)
REFERENCES pedido(codigo_pedido);

/*foraneo cliente pedido*/
ALTER TABLE pedido
ADD CONSTRAINT FK_cliente_pedido
FOREIGN KEY (codigo_cliente)
REFERENCES cliente(codigo_cliente);

/*foranea pedido pedido_producto*/
ALTER TABLE pedido_producto
ADD CONSTRAINT FK_pedido_pedido_producto
FOREIGN KEY (codigo_pedido)
REFERENCES pedido(codigo_pedido);

/*foranea producto pedido_producto*/
ALTER TABLE pedido_producto
ADD CONSTRAINT FK_producto_pedido_producto
FOREIGN KEY (codigo_producto)
REFERENCES producto(codigo_producto);

/*foranea producto existencias*/
ALTER TABLE existencias
ADD CONSTRAINT FK_producto_existencias
FOREIGN KEY (codigo_producto)
REFERENCES producto(codigo_producto);

/*foranea proveedor producto*/
ALTER TABLE producto
ADD CONSTRAINT FK_proveedor_producto
FOREIGN KEY (codigo_proveedor)
REFERENCES proveedor(codigo_proveedor);

/*foranea pago ciente*/
ALTER TABLE pago
ADD CONSTRAINT FK_cliente_pago
FOREIGN KEY (codigo_cliente)
REFERENCES cliente(codigo_cliente);

/*foranea cliente encargado*/
ALTER TABLE encargado
ADD CONSTRAINT FK_cliente_encargado
FOREIGN KEY (codigo_cliente)
REFERENCES cliente(codigo_cliente);


/*Datos Clientes*/
INSERT INTO cliente(codigo_cliente, nombre, ciudad, pais, direccion, telefono)
VALUES(11493630,'Karem','Bogotá','Colombia','Ciudad Tintal',1234567),
(19582384,'Oscar','Bogotá','Colombia','Centro',7654321),
(62448230,'Karem','Bogotá','Colombia','Los rosales',9632587),
(20948201,'Jorge','Bogotá','Colombia','Ciudad Verde',7418529),
(12120068,'Paula','Bogota','Colombia','Bosa',9873216),
(58509715,'Dayana','Medellin','Colombia','Bosa',6549871),
(95162107,'Oscar','Medellin','Colombia','Centro',4561237),
(86187009,'Deivid','Bucaramanga','Colombia','Ciudad Verde',1592634),
(75126840,'Derly','Bogota','Colombia','Ciudad Verde',7532416),
(30056742,'Dayana','Bogota','Colombia','Centro',9865412);
		
		
/*Datos proveedor*/
INSERT INTO proveedor(codigo_proveedor, nombre, ciudad, pais, direccion)
VALUES(1701,'APPLE','Bogota','Colombia','Tunal'),
(1702,'HP','Bogota','Colombia','Bosa'),
(1703,'SAMSUNG','Bogota','Colombia','Tunal'),
(1704,'SONY','Bogota','Colombia','Bosa'),
(1705,'SAMSUNG','Bogota','Colombia','Soacha'),	
(1706,'APPLE','Bogota','Colombia','Soacha'),		
(1707,'PANASONIC','Bogota','Colombia','Bosa'),
(1708,'SAMSUNG','Bogota','Colombia','Tintal'),	
(1709,'APPLE','Bogota','Colombia','Tintal'),
(1710,'APPLE','Bogota','Colombia','Tunal');


/*Datos vendedor*/
INSERT INTO vendedor(cedula, nombre1, nombre2, apellido1, apellido2,fecha_nto)
VALUES(10325648, 'Andres', 'Felipe', 'Sanchez', 'Quevedo', '1997/12/01'),
(103284695, 'Juliana', 'Andrea', 'Contreras', 'Diaz', '1974/11/22'),
(10228546, 'Luz', 'Nancy', 'Mora', 'Florez', '1974/05/16'),
(10220064, 'Wendy', 'Valentina', 'Guzman', 'Neira', '1976/12/05'),
(10320918, 'Andrea', 'Camila', 'Cardozo', 'Ramirez', '1989/05/01'),
(10227319, 'Maria', 'Paula', 'Vergara', 'Saenz', '1973/01/22'),
(10225281, 'Julian', 'Andres', 'Cedeno', 'Mora', '1976/05/22'),
(10327193, 'Juan', 'David', 'Cedeno', 'Mora', '1997/01/22'),
(10321010, 'Pedro', 'Julian', 'Rodriguez', 'Paez', '1991/03/02'),
(10320905, 'Juan', 'Carlos', 'Parra', 'Rodriguez', '1993/12/05');

/*Datos pedido*/
INSERT INTO pedido(codigo_pedido, codigo_cliente, fecha)
VALUES(1284,11493630,'2015/08/23'),
(3476,19582384,'2015/08/21'),
(7895,62448230,'2015/07/20'),
(3408,20948201,'2015/12/29'),
(2378,12120068,'2015/09/26'),
(1803,58509715,'2015/04/20'),
(1267,95162107,'2015/03/19'),
(7806,86187009,'2015/05/15'),
(9789,75126840,'2015/01/13'),
(1276,30056742,'2015/08/10');
		
/*Datos venta*/
INSERT INTO venta(codigo_venta, valor_venta, fecha, cedula_vendedor, codigo_pedido)
VALUES(901,54.001,'2015/08/14',10325648,1284),
(902,25.002,'2015/10/14',10228546,3476),
(903,23.0003,'2015/11/23',10228546,7895),
(904,125.004,'2015/12/13',10228546,3408),
(905,49.005,'2015/08/14',10220064,2378),
(906,10.006,'2015/07/11',10225281,1803),
(907,39.007,'2015/06/19',10320918,1267),
(908,234.508,'2015/03/17',10321010,7806),
(909,115.009,'2015/09/16',10227319,9789),
(910,19.501,'2015/04/15',10321010,1276);


/*Datos producto*/
INSERT INTO producto(codigo_proveedor, codigo_producto, nombre, marca, garantia, descripcion)
VALUES(1701,2701,'Mouse','APPLE','25 Dias','Negro y ergonomico'),
(1702,2702,'Monitor','HP','38 Dias','Negro 27pulgadas'),
(1703,2703,'parlantes','SAMSUNG','40 Dias','Negro'),
(1704,2704,'Mouse','SONY','45 Dias','Blanco y ergonomico'),
(1705,2705,'Monitor','SAMSUNG','90 Dias','Blanco 20 pulgadas'),	
(1706,2706,'Monitor','PANASONIC','16 Dias','Negro 25 pulgadas'),	
(1707,2707,'Teclado','APPLE','23 Dias','Negro y ergonomico'),		
(1708,2708,'Teclado','SAMSUNG','65 Dias','Negro y ergonomico'),		
(1709,2709,'Parlantes','APPLE','76 Dias','Negros'),
(1710,2710,'Teclado','APPLE','33 Dias','Blanco y ergonomico');
		
/*Datos pedido_producto*/
INSERT INTO pedido_producto(codigo_pedido, codigo_producto)
VALUES(1284,2701),
(3476,2702),
(7895,2703),
(3408,2704),
(2378,2705),
(1803,2706),
(1267,2707),
(7806,2708),
(9789,2709),
(1276,2710);

/*Datos encargado*/
INSERT INTO encargado(codigo_cliente, telefono, codigo_encargado, nombre1, nombre2, apellido1, apellido2)
VALUES(11493630,9875623,5230015,'Jorge','Duvan','Quiñones','Sanchez'),
(19582384,7894512,5271602,'Paula','Andrea','Mora','Arias'),
(62448230,4567812,5278109,'Oscar','Steven','Buitrago','Rodriguez'),
(20948201,6548217,5263791,'Karem','Gineth','Porras','Torres'),
(12120068,1284679,5274628,'Luis','Carlos','Galan','Sarmiento'),		
(58509715,2567103,5294861,'Pedro','Juan','Rodriguez','Muzuzu'),
(95162107,3250809,5201023,'Edgar','Alonzo','Sanchez','Vanegas'),
(86187009,1030208,5278945,'Lina','Manuela','Mejia','Prada'),
(75126840,7832992,5261090,'Tija','Casiodora','Sanchez','Parker'),
(30056742,5920178,3529430,'Maria','Elena','Henao','Niño');
		
/*Datos existencias*/
INSERT INTO existencias(codigo_producto, codigo_existencias, estado, cantidad)
VALUES(2701,'ex01','en vitrina',125),
(2702,'ex02','en bodega',94),
(2703,'ex03','en vitrina',132),
(2704,'ex04','en bodega',184),
(2705,'ex05','en vitrina',192),
(2706,'ex06','en bodega',67),
(2707,'ex07','en vitrina',123),
(2708,'ex08','en bodega',92),
(2709,'ex09','en vitrina',165),
(2710,'ex10','en bodega',185);

/*Datos pago*/		
INSERT INTO pago(codigo_cliente,No_consiganacion, tarjeta, valor, fecha)
VALUES(11493630,963258,'VISA',54.001,'2015/08/14'),
(19582384,147852,'VISA',23.002,'2015/10/14'),
(62448230,123456,'MASTER CARD',25.003,'2015/11/23'),
(20948201,789654,'MASTER CARD',125.004,'2015/12/13'),
(12120068,564789,'DEBIDO MAESTRO',49.005,'2015/08/14'),
(58509715,312978,'DEBIDO MAESTRO',10.006,'2015/07/11'),
(95162107,174396,'VISA',39.007,'2015/06/19'),
(86187009,528159,'DEBIDO MAESTRO',234.508,'2015/03/17'),
(75126840,951753,'VISA',115.009,'2015/09/16'),
(30056742,351759,'MASTER CARD',19.501,'2015/04/15');


---------------------------------------------------------------


/*Añadir una columna*/
ALTER TABLE vendedores
ADD COLUMN fecha DATE DEFAULT '1999/01/20'

ALTER TABLE clientes
ADD COLUMN fecha_registro DATE DEFAULT '2000/08/15';

ALTER TABLE clientes
ADD COLUMN telefono BIGINT;

ALTER TABLE productos
ADD COLUMN pais_producto VARCHAR(100);

ALTER TABLE vendedores
ADD COLUMN num_vendedor BIGINT;

ALTER TABLE pagos
ADD COLUMN banco_determinado VARCHAR(100) DEFAULT 'Bancolombia';


/*Actualizar registro de una tabla*/
UPDATE clientes
SET ciudad = 'Bogota'
WHERE ciudad = 'Cali' AND direccion = 'Ciudad verde';

UPDATE existencias
SET estado = 'Regular'
WHERE cantidad > 743;

UPDATE pedidos
SET fecha_pedido = '2015/09/23'
WHERE fecha_pedido = '2015/09/20' AND cod_producto > 2007;

UPDATE productos
SET garantia = '2 Años'
WHERE marca_prod = 'SONY' AND nombre_prod = 'Diadema';

UPDATE existencias
SET valor_pago = 123000
WHERE valor_pago < 560000 AND fecha_pago = '2015/08/10';


/*Eliminar una columna*/
ALTER TABLE vendedores
DROP COLUMN fecha_nto;

ALTER TABLE productos
DROP COLUMN garantia;

ALTER TABLE productos
DROP COLUMN descripcion;

ALTER TABLE clientes
DROP COLUMN direccion;

ALTER TABLE encargados
DROP COLUMN telefono;

