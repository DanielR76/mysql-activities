/*Ingresar a postgres*/
sudo su postgres

/*iniciar el cliente de psql en nuestra consola*/
psql -U user -W -h host database

/*Ingresar a */
psql

\q



/*Crear nuevo usuario*/
createuser --interactive

/*Crear BD*/
createdb nombre_Base_Datos
password usuarios

/*Eliminar db*/
dropdb nombre_Base_Datos

/*Ingresar a usuario*/
psql -U usuarios -W

/*Crear usuario*/
sudo -u postgres createuser --interactive

/*Ingresar a usuario con respectiva bd*/
psql -d base_datos -U nombre_usuario -W

/*Cambiar password a algunusuario*/
alter user postgres with password '12345';

/*Reiniciar postgresql*/
service postgresql restart

/*lista de nuestras bases de datos*/
\l

/*Ver tablas*/
\d

/*Para ver la información de la estructura de una tabla en especifico*/
d\ nombre_tabla

/*Seleccionar una base de datos o cambiar*/
\c nombre_Base_Datos

/*Borrar o eliminar una base de datos*/
DROP DATABASE nombre_Base_Datos;

/*Borrar o eliminar una tabla en especifico*/
DROP TABLE nombre_tabla;

/*Vaciar una tabla en especifico*/
TRUNCATE TABLE nombre_tabla RESTART IDENTITY