#CREATE DATABASE chachito;
#SHOW DATABASES;

# Usar una base de datos
USE chachito;

CREATE TABLE animales (
	id int,
    # El tipo varchar quiere decir que es una cadena, dentro de los parentesis se da la longitud, que tan largo debe ser la cadena
    tipo varchar(255),
    estado varchar(255),
    PRIMARY KEY(id)
);

# incertar datos en la tabla
## dentro de los parentesis van los registro que vamos a llenar con algun valor
## Insertar los datos const VALUES
# INSERT INTO animales ( tipo, estado ) VALUES ( 'Chanchito', 'Feliz' );

# Modificar la tabla id e se incrementa en 1 cuando se crea una tabla
ALTER TABLE animales MODIFY COLUMN id int auto_increment; 

SHOW CREATE TABLE animales;

CREATE TABLE `animales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `check_estado_not_empty` CHECK (`estado` <> '''')
);

# agregar registros
INSERT INTO animales ( tipo, estado ) VALUES ( 'Chanchito', 'Feliz' );
INSERT INTO animales ( tipo, estado ) VALUES ( 'Gato', 'Feliz' );
INSERT INTO animales ( tipo, estado ) VALUES ( 'perro', 'triste' );
INSERT INTO animales ( tipo, estado ) VALUES ( 'girrafa', 'falopa' );
INSERT INTO animales ( tipo, estado ) VALUES ( 'Foca', 'nada' );


# LISTAR REGISTROS
## listar todos los registros
SELECT * FROM animales;

## Listas todos los registros ¡PERO! si el id el igual 1
SELECT * FROM animales WHERE id = 1;
/* SALIDA
| id | tipo      | estado |
+-------------------------+
| 1  | Chanchito | Feliz  |
*/

## Listar todos los registros por el estado
SELECT * FROM animales WHERE estado = 'falopa';
/* SALIDA
| id | tipo    | estado |
+-----------------------+
| 6  | girrafa | falopa |
*/

## Listar todos los registros por el estado y tipo
SELECT * FROM animales WHERE estado = 'feliz' AND tipo = 'chanchito';
/* SALIDA
| id | tipo       | estado |
+--------------------------+
| 1  | chanchito  | Feliz  |
| 2  | chanchito  | Feliz  |
*/

# ACTUALIZAR REGISTROS.
## Indica que dentro de la tabla de animales se quire actualizar el estado del id 1
UPDATE animales SET estado = 'falopa' WHERE id = 1;

SELECT * FROM animales WHERE estado = 'falopa' AND tipo = 'chanchito';

# ELIMINAR REGISTROS.
## Por defecto mySQL no permite eliminar todo sin un "WHERE"
-- DELETE FROM animales WHERE estado = 'feliz';
/* Suelta el siguiente error
Error Code: 1175. You are using safe update mode and you tried to update 
a table without a WHERE that uses a KEY column To disable safe mode, 
toggle the option in Preferences -> SQL Editor and reconnect.

NO LO DESACTIVES
*/

## Se tiene que usar un id
DELETE FROM animales WHERE id = 6;
SELECT * FROM animales;

## Aqui me arroja el mismo error. syntaxis incorrecta
-- UPDATE animales SET estado = 'falopa';

## syntaxis correcta
UPDATE animales SET estado = 'Rulo' WHERE id = 5;
SELECT * FROM animales;

# Evitar que los datos de estado esten vacios

ALTER TABLE animales ADD CONSTRAINT check_estado_not_empty CHECK (estado <> '');
ALTER TABLE animales ADD CONSTRAINT check_tipo_not_empty CHECK (tipo <> '');
/*
Error Code: 1064. You have an error in your SQL syntax; check the manual that corresponds to your MariaDB 
server version for the right syntax to use near 'ADD CONSTRAINT check_estado_not_empty CHECK (estado <> '')' at line 1

Error Code: 4025. CONSTRAINT `check_estado_not_empty` failed for `chachito`.`animales


Error Code: 4025. CONSTRAINT `check_estado_not_empty` failed for `chachito`.`animales`


*/

UPDATE animales SET tipo = 'caballo' WHERE id = 7;
SELECT * FROM animales;

## tanto los UPDATE y DELETE necesitan el WHERE para ejecutarce
-- UPDATE animales SET estado = 'falopa';
-- DELETE FROM animales;
## Error 1175

# ESTAS SON LAS ACCIONES DE CRUD
## Create
## Read
## Update
## Delete






