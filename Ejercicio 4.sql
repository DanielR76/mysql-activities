
create database rapidisimo;
use rapidisimo;

create table productos (
  codpro integer primary key NOT NULL AUTO_INCREMENT,
  nompro varchar (30)
  )AUTO_INCREMENT=100;


create table presentaciones (
    codpre integer primary key NOT NULL AUTO_INCREMENT,
    descripcion varchar(50),
    codpro integer,
    precio integer,
    foreign key  (codpro) 
    references productos (codpro)
    )AUTO_INCREMENT=200;


create table facturas (
    numfac integer primary key NOT NULL AUTO_INCREMENT,
    fecha date,
    cantidad integer,
    dcto integer,
    iva integer,
    codpre integer,
    foreign key  (codpre) 
    references presentaciones (codpre)
    )AUTO_INCREMENT=300;


create table arqueos (
    idarq integer primary key NOT NULL AUTO_INCREMENT,
    fecha date
    )AUTO_INCREMENT=400;


create table soportes (
    codsop integer primary key NOT NULL AUTO_INCREMENT,
    tiposop varchar(20),
    valorsop float,
    idarq integer,
    foreign key  (idarq) 
    references arqueos (idarq)
    )AUTO_INCREMENT=500;



SELECT * FROM productos 
ORDER BY codpro;

SELECT nompro, decri 
FROM productos, presentaciones 
WHERE productos.codpro AND presentaciones.codpro=1;

SELECT NOMBRE, descripcion, precio 
FROM productos, presentaciones 
WHERE producto.cod_producto=5 AND presentaciones.cod_producto=5;

SELECT facturas.codigo_producto, nombre day(fecha), cantidad 
FROM facturas, productos 
WHERE day(fecha)=27 AND facturas.cod_producto=productos.cod_producto;

SELECT facturas.cod_producto, nombre, day(fecha), cantidad, sum(cantidad) AS total_vta 
FROM facturas, productos 
WHERE day(fecha)=27 
AND facturas.cod_producto=productos.cod_producto AND facturas.cod_producto=1;

SELECT fecha, tiposop, valorsop 
FROM arqueos, soportes 
WHERE arqueos.idarq=soportes.idarq AND arqueos.idarq=111;

SELECT fecha, tiposop, valorsop, sum(valorsop) 
FROM arqueos, soportes 
WHERE arqueos.idarq=soportes.idarq AND arqueos.idarq=555;

SELECT fecha, tiposop, valorsop 
FROM arqueos, soportes 
WHERE arqueos.idarq=soportes.idarq AND arqueos.idarq=555;

SELECT numfac, cantidad, precio, (precio*cantidad) AS total, iva, ((precio*cantidad)*iva)/100 AS total_iva 
FROM facturas, presentaciones 
WHERE facturas.codpro-presentaciones.codpro;

SELECT max(cantidad) 
FROM facturas;

SELECT cantidad 
FROM facturas 
WHERE cantidad=2;

SELECT AVG(cantidad) AS promedio 
FROM facturas;

/*Algebra*/

σ valorsop>2300∧codigosop<520(Soportes)

SELECT * FROM soportes
WHERE valorsop > 2300 AND codsop < 520;

π codpro, nompro σ nompro LIKE ‘%a’ OR nompro LIKE ‘%e%’(productos)

SELECT codpro, nompro  
FROM productos 
WHERE nompro LIKE '%a' OR nompro LIKE '%e%';

π codpro (productos) ∪ π codsop(soportes)

SELECT idarq FROM arqueos
UNION
SELECT codsop FROM soportes;

π codpre(presentaciones) − π codpre σ numfac= 302(facturas)

SELECT codpre FROM presentaciones
MINUS
SELECT codpre FROM facturas
WHERE numfac = 302;

π codpre σ descripción=grande (presentaciones) ∩ π codpre σ cantidad>=4 (facturas)

SELECT codpre  FROM presentaciones
WHERE descripcion='grande'  
INTERSECT 
SELECT codpre  FROM facturas 
WHERE cantidad>=4;

π fecha,tiposop,valorsop, sum((valorssop)arqueos(arqueos.idarq = (soportes X idarq=405)soportes)

SELECT fecha, tiposop, valorsop, sum(valorsop) 
FROM arqueos, soportes 
WHERE arqueos.idarq=soportes.idarq=405;

π codpro, cantidad, (σ fecha=04(facturas)) X π fecha, nompro( σ codpro(facturas=codpro(productos)) )

Select facturas.codpro, nompro, day(fecha), cantidad from facturas, productos 
where day(fecha)=04 AND facturas.codpro=productos.codpro;