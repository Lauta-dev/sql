CREATE DATABASE chachito;
SHOW DATABASES;

# Usar una base de datos
USE chanchito;

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
INSERT INTO animales ( tipo, estado ) VALUES ( 'Chanchito', 'Feliz' );

# Modificar la tabla id e se incrementa en 1 cuando se crea una tabla
ALTER TABLE animales MODIFY COLUMN id int auto_increment; 

SHOW CREATE TABLE animales

CREATE TABLE `animales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
