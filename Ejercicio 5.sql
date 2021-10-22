
/*Alejandro Bocanegra*/
/*Sebastian Correa*/
/*Daniel Rodriguez*/
/*Análisis y diseño de base de datos*/
/*Puntos extra Joins*/

create database carros;
use carros;

create table clientes(
	cedula int primary key,
	nombre varchar(20)
);

create table vendedores(
	cedula int primary key,
	nombre varchar(20)
);

create table correos_cliente(
	id_correo int auto_increment primary key,
	dominio varchar(20),
	cedula_cliente int,
	foreign key  (cedula_cliente) 
    references clientes (cedula)
)auto_increment=100;

create table correos_vendedor(
	id_correo int auto_increment primary key,
	dominio varchar(20),
	cedula_vendedor int,
	foreign key  (cedula_vendedor) 
    references vendedores (cedula)
)auto_increment=150;

create table telefonos_cliente(
	id_tel int auto_increment primary key,
	tipo varchar(15),
	numero int,
	cedula_cliente int,
	foreign key  (cedula_cliente) 
    references clientes (cedula)
)auto_increment=200;

create table telefonos_vendedor(
	id_tel int auto_increment primary key,
	tipo varchar(15),
	numero int,
	cedula_vendedor int,
	foreign key  (cedula_vendedor) 
    references vendedores (cedula)
)auto_increment=250;

create table ciudades(
	id_ciudad int auto_increment primary key,
	nombre varchar(20)
)auto_increment=300;

create table localidades(
	id_local int auto_increment primary key,
	nombre varchar(20),
	id_ciudad int,
	foreign key  (id_ciudad) 
    references ciudades (id_ciudad)
)auto_increment=350;

create table barrios(
	id_barrio int auto_increment primary key,
	nombre varchar(20),
	id_local int ,
	foreign key  (id_local) 
    references localidades (id_local)
)auto_increment=400;

create table direcciones_cliente(
	id_dir int auto_increment primary key,
	direccion varchar(30),
	cedula_cliente int,
	id_barrio int,
	foreign key  (cedula_cliente) 
    references clientes (cedula)
)auto_increment=450;


create table direcciones_vendedor(
	id_dir int auto_increment primary key,
	direccion varchar(30),
	cedula_vendedor int,
	id_barrio int,
	foreign key  (cedula_vendedor) 
    references vendedores (cedula)
)auto_increment=500;

create table marcas(
	id_marca int auto_increment primary key,
	nombre varchar(20)
)auto_increment=550;

create table facturas(
	id_factura int auto_increment primary key,
	fecha date,
	descripcion varchar(100),
	precio double,
	comision float,
	cedula_cliente int,
	cedula_vendedor int,
	foreign key  (cedula_cliente) 
    references clientes (cedula),
    foreign key  (cedula_vendedor) 
    references vendedores (cedula)
)auto_increment=600;

create table carros(
	placa int auto_increment primary key,
	modelo int,
	estado varchar(10),
	id_factura int,
	id_marca int,
	foreign key  (id_factura) 
    references facturas (id_factura),
    foreign key  (id_marca) 
    references marcas (id_marca)
)auto_increment=650;

create table tipos(
	id_tipo int auto_increment primary key,
	nombre varchar (20),
	id_marca int,
	foreign key  (id_marca) 
    references marcas (id_marca)
) auto_increment=700;

create table clasificaciones(
	id_clafificaion int auto_increment primary key,
	nombre varchar(15),
	id_tipo int,
	foreign key  (id_tipo) 
    references tipos (id_tipo)
)auto_increment=750;

create table caracteristicas(
	id_caract int auto_increment primary key,
	color varchar(20),
	motor varchar(20),
	neumaticos varchar(20),
	palanca_cambios varchar(20),
	transmision varchar(20),
	frenos varchar(20),
	direccion varchar(20),
	suspension varchar(20),
	placa_carro int,
	foreign key  (placa_carro) 
    references carros (placa)
)auto_increment=800;

/*Clientes*/
INSERT INTO clientes (cedula, nombre)
VALUES (1032,"Jhon Alex Castaño"),
(2056,"Jeisson Jimenez"),
(3095,"Alzate"),
(4072,"Pipe Bueno"),
(5081,"Paola Jara");


/*Vendedores*/
INSERT INTO vendedores (cedula,nombre)
VALUES (9054,"Gabriela"),
(9012,"Mileidy"),
(9067,"Paula"),
(9093,"Derly"),
(9078,"Karen");

/*telefono vendedor*/
INSERT INTO telefonos_vendedor (tipo, numero, cedula_vendedor)
VALUES("fijo",8743645,9054),
("celular",6730967,9067),
("celular",7430962,9012),
("fijo",9837845,9093),
("fijo",5120962,9078);

/*telefono cliente*/
INSERT INTO telefonos_cliente (tipo, numero, cedula_cliente)
VALUES("fijo",9847264,1032),
("celular",7296387,2056),
("celular",6200190,3095),
("fijo",9862300,4072),
("fijo",3800100,5081);

/*correo vendedor*/
INSERT INTO correos_vendedor(dominio,cedula_vendedor)
VALUES("buena@gmail.com",9054),
("comoes@gmail.com",9067),
("copas@gmail.com",9012),
("laenergy@gmail.com",9093),
("launi@gmail.com",9078);

/*correo cliente*/
INSERT INTO correos_cliente(dominio,cedula_cliente)
VALUES("unipa@gmail.com",1032),
("otrauni@gmail.com",2056),
("sigueotra@gmail.com",3095),
("aunmas@gmail.com",4072),
("laultima@gmail.com",5081);

/*Ciudades*/
INSERT INTO Ciudades(nombre)
VALUES("Bogotá"),
("Medellin"),
("Cali"),
("Cartagena"),
("Bucaramanga");

/*Localidades*/
INSERT INTO Localidades(nombre,id_ciudad)
VALUES("Bosa",300),
("Kennedy",301),
("Suba",302),
("Soacha",303),
("Teusaquillo",304),
("Fontibon",300),
("Usme",301),
("Tunal",302),
("Chapinero",303),
("Engativa",304);

/*Barrios*/
INSERT INTO Barrios(nombre, id_local)
VALUES("castilla",350),
("El paraiso",351),
("Brasilia",352),
("Herreros",353),
("Modelia",354),
("Nuevo barrio",355),
("Antiguo barrio",356),
("Tintal",357),
("Escocia",358),
("Recreo",359);


/*Direccion vendedor*/
INSERT INTO direcciones_vendedor(direccion, cedula_vendedor, id_barrio)
VALUES("Cra 53", 9054, 400),
("Cll 76", 9067, 401),
("Cra 88", 9012, 402),
("Cra 19", 9093, 403),
("Cll 9", 9078, 404);

/*Direccion cliente*/
INSERT INTO direcciones_cliente(direccion, cedula_cliente, id_barrio)
VALUES("Cll 98",1032,405),
("Cra 87",2056,406),
("Cra 5",3095,407),
("Cll 100",4072,408),
("Cll 50",5081,409);

/*Marcas*/
INSERT INTO Marcas(nombre)
VALUES("Ferrari"),
("Lamborghini"),
("Porshe"),
("Buggati"),
("Ford"),
("Peuget"),
("Mercedes"),
("Maserati");

/*Facturas*/
INSERT INTO Facturas(fecha, descripcion, precio, comision, cedula_cliente, cedula_vendedor)
VALUES("2016/01/23","No hay",1000000,10,1032,9054),
("2016/02/23","No hay",2300000,13,2056,9067),
("2016/03/24","No hay",5400000,12,3095,9012),
("2016/04/11","No hay",3200000,11,4072,9093),
("2016/05/01","No hay",4300000,14,5081,9078),
("2016/06/03","No hay",1900000,15,2056,9093),
("2016/07/05","No hay",1600000,10,3095,9067),
("2016/08/07","No hay",4500000,11,4072,9067),
("2016/09/09","No hay",6700000,12,5081,9012),
("2016/10/13","No hay",7800000,13,2056,9012),
("2016/11/16","No hay",4500000,14,3095,9012),
("2016/12/19","No hay",5600000,15,4072,9012),
("2016/01/21","No hay",7600000,10,5081,9067),
("2016/02/22","No hay",5600000,11,1032,9067),
("2016/03/26","No hay",3100000,12,1032,9093),
("2016/04/29","No hay",4900000,13,1032,9067),
("2016/05/30","No hay",5800000,14,5081,9054);

/*Carros*/
INSERT INTO Carros(modelo, estado, id_factura, id_marca)
VALUES(2014, "Nuevo",600,550),
(2012,"Antiguo",601,551),
(2013,"Nuevo",602,552),
(2014,"Nuevo",603,553),
(2015,"Vuevo",604,554),
(2016,"Antiguo",605,555),
(2011,"Antiguo",606,556),
(2013,"Nuevo",607,557),
(2012,"Antiguo",608,551),
(2014,"Antiguo",609,552),
(2013,"Antiguo",610,553),
(2013,"Nuevo",611,554),
(2014,"Antiguo",612,555),
(2014,"Nuevo",613,556),
(2015,"Nuevo",613,557),
(2016,"Antiguo",614,550);

/*Tipos*/
INSERT INTO Tipos(nombre, id_marca)
VALUES("Camioneta",550),
("Convertible",551),
("Familiar",552),
("Deportivo",553),
("Carga",554),
("Deportivo",555),
("Deportivo",556),
("Familiar",557),
("Convertible",550),
("Carga",551);

----------------------------------------------

/*Consultas Join*/

SELECT clientes.cedula, clientes.nombre, facturas.precio, facturas.id_factura
FROM facturas INNER JOIN clientes ON clientes.cedula = facturas.cedula_cliente;

SELECT tipos.nombre, marcas.nombre
FROM tipos RIGHT JOIN marcas ON marcas.id_marca = tipos.id_marca;

SELECT facturas.fecha,facturas.comision, vendedores.cedula, vendedores.nombre
FROM facturas INNER JOIN vendedores ON facturas.cedula_vendedor = vendedores.cedula AND comision=13;

SELECT facturas.precio,facturas.comision, facturas.fecha, clientes.cedula, clientes.nombre
FROM facturas LEFT JOIN clientes ON facturas.cedula_cliente = clientes.cedula AND month(fecha)>8;

SELECT facturas.precio,facturas.descripcion, carros.modelo, carros.estado
FROM carros LEFT JOIN facturas ON carros.id_factura = facturas.id_factura;

SELECT facturas.precio,facturas.descripcion, carros.modelo, carros.estado
FROM carros RIGHT JOIN facturas ON carros.id_factura = facturas.id_factura AND estado="Nuevo";

SELECT ciudades.nombre,localidades.nombre
FROM ciudades RIGHT JOIN localidades ON localidades.id_ciudad = ciudades.id_ciudad and ciudades.nombre= "Bogotá";

SELECT tipos.id_tipo, marcas.id_marca, tipos.nombre, marcas.nombre
FROM tipos INNER JOIN marcas ON tipos.id_marca = marcas.id_marca AND tipos.nombre = "deportivo";