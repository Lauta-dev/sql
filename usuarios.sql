CREATE DATABASE usuarios;
USE usuarios;

CREATE TABLE usuario (
	id int not null auto_increment,
    name varchar(255) not null,
    edad int not null,
    email varchar(255) not null,
    primary key(id)
);

INSERT INTO usuario (name, edad, email) values ("Lautaro", 21, "lauta@gmail.com");
INSERT INTO usuario (name, edad, email) values ("Karina",40,"krn@gmail.com");
INSERT INTO usuario (name, edad, email) values ("Facu",15,"fcd@gmail.com");
INSERT INTO usuario (name, edad, email) values ("Jotaro",16,"jojo@gmail.com");
INSERT INTO usuario (name, edad, email) values ("Kurapica",16,"kurapica@gmail.com");
INSERT INTO usuario (name, edad, email) values ("Gon",12,"gon@gmail.com");
INSERT INTO usuario (name, edad, email) values ("Leorio",14,"lerio@gmail.com");
INSERT INTO usuario (name, edad, email) values ("Gohan", 16, "chichi@cc.com");

INSERT INTO usuario (name, edad, email)
VALUES
	("Goku", 45, "supersayan@cc.com"),
    ("Picolo", 50, "pan@cc.com"),
    ("Hisoka", 60, "hisoka@gmail.com"),
    ("Card Jonson", 21, "cj@hotmail.com");

# Muestra las tablas con un limite de 4 tablas
SELECT * FROM usuario LIMIT 4;

SELECT * FROM usuario WHERE edad <= 15;

# quiero buscar un email dependiendo de su nombre por ejemplo:

# goku@cc.com y picolo@cc.com
# tienen el mismo dominio asi que quiero eso
SELECT * FROM usuario WHERE edad >= 40 AND email = "pan@cc.nk";

SELECT * FROM usuario WHERE email LIKE "%@cc.com";

SELECT * FROM usuario;
DELETE FROM usuario WHERE id = 12;

ALTER TABLE usuario ADD UNIQUE (email, name);

SELECT 
    id, email
FROM usuario
ORDER BY email;

DELETE t1 FROM usuario t1
INNER JOIN usuario t2
WHERE t1.id > t2.id AND t1.email = t2.email;

SELECT * FROM usuario;

# Buscar por orden
SELECT * FROM usuario WHERE name != "jotaro";           # Mostrar todos los datos que no contengan "jotaro"
SELECT * FROM usuario WHERE edad >= 15 AND edad <= 30;  # Mostrar los datos que esten entre 15 y 30
SELECT * FROM usuario WHERE edad BETWEEN 15 AND 30;     # Mostrar los datos que esten entre 15 y 30
SELECT * FROM usuario WHERE email LIKE "%@cc%";         # Mostrar los datos que esten relacionado con @cc, con los porcentajes (%) no importa que alla delante ni atras

SELECT * FROM usuario ORDER BY edad asc;                # Mostrar los datos de forma asendente
SELECT * FROM usuario ORDER BY edad desc;               # Mostrar los datos de forma desendente

SELECT MAX(edad) AS mayor FROM usuario; 				# Mostrar la edad maxima
SELECT MIN(edad) AS menor FROM usuario; 				# Mostrar la edad minima

SELECT name, email FROM usuario; 						# Mostrar la columnas que queramos despues de SELECT

SELECT id, name AS nombre, email AS mail FROM usuario;  # Mostrar las columnas con nombre diferentes usando AS






