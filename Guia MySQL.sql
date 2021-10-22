

/*Operadores Aritméticos*/ 
( +,  -,  *,  /, ?, MOD)

/*Operadores Relacionales*/ 
< Menor que
> Mayor que
<> Distinto de
<= Menor ó Igual que
>= Mayor ó Igual que
= Igual que

/*Operadores Lógicos*/
AND Evalua dos condiciones y devuelve un valor de verdad sólo si ambas son ciertas.
OR Evalúa dos condiciones y devuelve un valor de verdar si alguna de las dos es cierta.
NOT Devuelve el valor contrario de la expresión.

/*Funciones de algunagregacion*/
AVG Utilizada para calcular el promedio de los valores de un campo determinado
COUNT Utilizada para devolver el número de registros de la selección
SUM Utilizada para devolver la suma de todos los valores de un campo determinado
MAX Utilizada para devolver el valor más alto de un campo especificado
MIN Utilizada para devolver el valor más bajo de un campo especificado
------------------------------------------------

/*Comandos*/
CREATE Utilizado para crear nuevas tablas, campos e índices
DROP Empleado para eliminar tablas e índices
ALTER Utilizado para modificar las tablas agregando campos o cambiando la definición de los campos.
SELECT Utilizado para consultar registros de la base de datos que satisfagan un criterio determinado
INSERT Utilizado para cargar lotes de datos en la base de datos en una única operación.
UPDATE Utilizado para modificar los valores de los campos y registros especificados
DELETE Utilizado para eliminar registros de una tabla de una base de datos

-------------------------------------------------

FROM Utilizada para especificar la tabla de la cual se van a seleccionar los registros
WHERE Utilizada para especificar las condiciones que deben reunir los registros que se van a seleccionar
GROUP BY Utilizada para clasificar los registros seleccionados en grupos específicos
HAVING Utilizada para expresar la condición que debe satisfacer cada grupo
ORDER BY Utilizada para ordenar los registros seleccionados de acuerdo con un orden específico

-------------------------------------------------


/*Los campos que contienen números enteros admiten el parámetro UNSIGNED que implica que no admita signos por lo que solo aceptaría enteros positivos.*/
Atributo1 Tipo_dato INT UNSIGNED AUTO_INCREMENT PRIMARY KEY;

/*Todos los campos númericos admiten el parámetro ZEROFILL cuya función es completar el campo con ceros a la izquierda hasta su longitud máxima.*/
Atributo1 Tipo_dato INT ZEROFILL AUTO_INCREMENT PRIMARY KEY;

-------------------------------------------------

/*Mostrar todas las bases de datos*/
SHOW DATABASES; 

/*Mostrar todas las tablas de la Base de datos*/
SHOW TABLES;

/*Crea una base de datos*/
CREATE DATABASE Nombre;

/*Selecciona la base de datos*/
Use Nombre_base_de_datos;

/*Crea una tabla*/
CREATE TABLE Nombre_tabla(
	Atributo1 Tipo_dato(tamaño);

/*Crea una tabla con llave primaria y auto_increment*/
CREATE TABLE Nombre_tabla(
	Atributo1 Tipo_dato NOT NULL AUTO_INCREMENT PRIMARY KEY;

/*Crea una tabla con llave foranea*/
CREATE TABLE Nombre_tabla(
	Atributo1 Tipo_dato,
	FOREIGN KEY (Atributo1)
	REFERENCES Nombre_tabla(campo)
);	

/*Elimina tabla*/
DROP TABLE Nombre_tabla;

/*Ingresar datos en una tabla*/
INSERT INTO Nombre_tabla (Atributo1,Atributo2)
VALUES (Atributo1,Atributo2);

/*Ingrese datos de archivo plano*/
LOAD DATA LOCAL INFILE 'c:/...'
INTO TABLE Nombre_tabla;

/*Describir los valores de una tabla*/
SELECT * FROM Nombre_tabla;

/*Describe los atributos de la tabla*/
DESCRIBE Nombre_tabla;

/*Crear un Auto_Increment*/
ALTER TABLE Nombre_tabla
MODIFY Nombre_columna Tipo_Dato AUTO_INCREMENT = 100;

/*Crear una llave primaria*/
ALTER TABLE Nombre_tabla
ADD CONSTRAINT pk_nombre_constraint
PRIMARY KEY (campo);

/*Crear una llave primaria compuesta*/
ALTER TABLE Nombre_tabla
ADD CONSTRAINT pk_nombre_constraint	
PRIMARY KEY (Campo1,Campo2);

/*Crear llave Foranea*/
ALTER TABLE Nombre_tabla
ADD CONSTRAINT fk_nombre_constraint
FOREIGN KEY (campo)
REFERENCES Nombre_tabla(campo);

/*Eliminar constraint llave foranea*/
ALTER TABLE Nombre_tabla
DROP CONSTRAINT fk_nombre_constraint;

/*Eliminar una columna*/
ALTER TABLE Nombre_tabla
DROP COLUMN Nombre_columna;

/*Añadir una columna*/
ALTER TABLE Nombre_tabla
ADD COLUMN Nombre_columna Tipo_dato();

/*Cambiar un registro de una tabla*/
UPDATE Nombre_tabla
SET Nombre_columna = 'Nuevo_dato'
WHERE Nombre_columna = 'Dato_a_cambiar';

/*Eliminar condicion de tabla*/
DELETE FROM Nombre_tabla
WHERE Condicion_busqueda;

/*Borrar todos los registros de una tabla*/
TRUNCATE TABLE Nombre_tabla;

DELETE FROM Nombre_tabla;
-------------------------------------------------------------------------

/*Consultas*/

/*Consulta que muestra la suma de las ventas*/
SELECT SUM(valor_venta)
FROM venta

/*Consulta que muestre la venta mas alta de cada vendedor*/
SELECT cedula_vendedor, MAX(valor_venta) 
FROM venta 
GROUP BY cedula_vendedor

/*Consulta que muestre la cantidad minima de cada producto*/
SELECT codigo_producto, MIN(cantidad)
FROM existencias
GROUP BY cantidad

/*Las ventas que en promedio ha realizado cada vendedor*/
SELECT cedula_vendedor, AVG(valor_venta)
FROM venta 
GROUP BY cedula_vendedor

/*Especificacion de grupos que desea ver*/
SELECT cedula_vendedor, SUM(valor_venta)
FROM venta 
GROUP BY cedula_vendedor
HAVING cedula_vendedor IN (10325648,103256486);

/*Consulta que muestre la cantidad total de alguna columna*/
SELECT COUNT (Nombre_columna)
FROM nombre_tabla;

/*Seleccion de datos all es para traer todos los datos repetidos*/
SELECT ALL Nombre_campos
FROM clientes
WHERE Especifico='Dato_a_traer';

/*Ordenar los datos*/
GROUP BY 
HAVING
ORDER BY 'datos_a_ordenar_ascendente_o_descendente';

/*BETWEEN AYUDA A ESTABLECER RANGOS PARA UN SOLO CAMPO Y TAMBIEN COMO AND,
 GENERALMENTE SE UTILIZA PARA FECHAS Y VALORES NUMERICOS*/

/*Seleccion de datos*/ 
SELECT ALL nombre_columna1,nombre_columna2
FROM nombre_tabla
WHERE nombre_tabla ='nombre_columna';
 
/*Ordenar datos*/
SELECT ALL nombre,ciudad,pais_producto
FROM nombre_tabla
ORDER BY nombre_columna ASC;

/*EMPEZAR*/
SELECT * 
FROM nombre_tabla
WHERE NOMBRE like 'M%'

/*TERMINAR*/
SELECT * 
FROM nombre_tabla
WHERE NOMBRE like '%A'

/*QUE TENGA*/
SELECT * 
FROM clientes
WHERE NOMBRE like '%C%'

/*Segunda posicion*/
SELECT * 
FROM clientes
WHERE NOMBRE like '_M%'

/*Terera posicion*/
SELECT * 
FROM clientes
WHERE NOMBRE like '__M%'

--------------------------------------------------------------------------

/*Crear indice*/
CREATE UNIQUE INDEX nombre_columna
ON nombre_tabla (columna);

/*Como borrar un indice*/
ALTER TABLE Nombre_tabla
DROP INDEX Nombre_indice;

/*Crear un sinonimo*/
CREATE SYNONYM <nombre_sinonimo>
FOR <nombre_tabla>;

---------------------------------------------------------------------------

/*Crear una vista*/
CREATE VIEW Nombre_vista
AS
(Consulta);

/*Eliminar padres e hijos*/
CASCADE
ALTER TABLE dbo.T2
   DROP CONSTRAINT FK_T1_T2   

ALTER TABLE dbo.T2
   ADD CONSTRAINT FK_T1_T2_Cascade
   FOREIGN KEY (EmployeeID) 
   REFERENCES dbo.T1(EmployeeID) ON DELETE CASCADE

---------------------------------------------------------------------------

/*Subconsultas*/
SELECT  campo1, campo2
FROM nombre_tabla
WHERE campo3 < (SELECT campo1, campo2
		FROM nombre_tabla
		WHERE CONDICION);

/*consultar que productos tienen mayor cantidad de existencias que el codigo
producto 2709*/
SELECT codigo_producto, cantidad
FROM existencias
WHERE cantidad >(SELECT cantidad 
		FROM existencias
                WHERE codigo_producto = 2709);


/*Consultar los productos que han sido solicitados en un pedido y que tienen mas
de 100 existencias*/
SELECT codigo_producto
FROM producto
WHERE EXISTS (SELECT codigo_producto 
	     FROM pedido_producto
	     WHERE pedido_producto.codigo_producto = producto.codigo_producto)
AND EXISTS (SELECT cantidad
	   FROM existencias 
	   WHERE cantidad > 100 AND producto.codigo_producto = existencias.codigo_producto); 


/*consultar los productos que han sido solicitados en un pedido y que se encuentren
en bodega*/
SELECT codigo_producto, marca, descripcion
FROM producto
WHERE EXISTS (SELECT codigo_producto 
	     FROM pedido_producto
	     WHERE pedido_producto.codigo_producto = producto.codigo_producto)
AND EXISTS (SELECT estado
	   FROM existencias 
	   WHERE estado = 'en bodega' AND producto.codigo_producto = existencias.codigo_producto);


/*consultar los clientes que hicieron un pedido y lo pagaron entre las fechas '2015/06/01' & '2015/10/30'*/
SELECT codigo_cliente, nombre
FROM cliente
WHERE EXISTS (SELECT codigo_pedido
	      FROM pedido
 	      WHERE pedido.codigo_cliente = cliente.codigo_cliente)
AND EXISTS (SELECT codigo_cliente
	    FROM pago
	    WHERE cliente.codigo_cliente = pago.codigo_cliente AND pago.fecha BETWEEN '2015/06/01' AND '2015/10/30');


/*consultar que personas han realizado ventas*/
SELECT cedula, nombre1, nombre2
FROM vendedor
WHERE EXISTS (SELECT cedula_venta 
		FROM venta
                WHERE venta.cedula_vendedor = vendedor.cedula_vendedor);
 

/* ventas realizadas por personas que hayan nacido despues de 1 enero 1980 y hayan hecho el pedido 
antes del 1 Diciembre 2015 */
SELECT codigo_venta, valor_venta
FROM venta
WHERE EXISTS (SELECT cedula
	      FROM vendedor
	      WHERE venta.cedula_vendedor = vendedor.cedula AND fecha_nto > '1980/01/01')
AND EXISTS (SELECT codigo_pedido
	    FROM pedido
	    WHERE pedido.codigo_pedido = venta.codigo_pedido AND pedido.fecha < '2015/12/01');

/*Consulta que muestre el dia de la fecha especifica con la suma de la cantidad de productos*/
SELECT facturas.cod_producto, nombre, day(fecha), cantidad, sum(cantidad) AS total_vta 
FROM facturas, productos 
WHERE day(fecha)=27 
AND facturas.cod_producto=productos.cod_producto AND facturas.cod_producto=1;
 
 /*Consulta que muestre el total y total con iva*/
SELECT numfac, cantidad, precio, (precio*cantidad) AS total, iva, ((precio*cantidad)*iva)/100 AS total_iva 
FROM facturas, presentaciones 
WHERE facturas.codpro-presentaciones.codpro;
-------------------------------------------------------------------------------------------------------

/*Consultas Join*/

/*INNER JOIN TRES LLAVES FORANEAS*/
SELECT campo1, campo2, campo3....
FROM talba1 INNER JOIN 
(tabla2 INNER JOIN 
(tabla3 ON tabla3.campo3=tablax.campox)
ON tabla2.campo2=tabla3.campo3)
ON tabla1.campo1=tabla2.campo2);

/*Inner Join*/
SELECT T1.Col1, T1.Col2, T1.Col3, T2.Col7
FROM Tabla1 INNER JOIN Tabla2
ON T1.Col1 = T2.Col1;

/*Outer Join*/
SELECT T1.Col1, T1.Col2, T1.Col3, T2.Col7
FROM Tabla1 [LEFT/RIGHT/FULL] [OUTER] JOIN Tabla2 
ON Condiciones_Vinculos_Tablas;

/*Left Join*/
SELECT T1.Col1, T1.Col2, T1.Col3, T2.Col7
FROM Tabla1 LEFT JOIN Tabla2 
ON T1.Col1 = T2.Col1;

/*Rigth Join*/
SELECT T1.Col1, T1.Col2, T1.Col3, T2.Col7
FROM Tabla1 RIGHT JOIN Tabla2 
ON T1.Col1 = T2.Col1;

/*Full Join*/
SELECT T1.Col1, T1.Col2, T1.Col3, T2.Col7
FROM Tabla1 FULL JOIN Tabla2 
ON T1.Col1 = T2.Col1;