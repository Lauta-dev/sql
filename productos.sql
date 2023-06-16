/*  # LEFT JOIN 

Traer todos los registros de la tabla de usuarios, dependiendo de la consulta

*/

CREATE TABLE products (
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    created_by INT NOT NULL,
    marca VARCHAR(50) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(created_by) REFERENCES usuario(id)
);

RENAME TABLE products TO product;

INSERT INTO product (name, created_by, marca)
VALUES
	("Cartucho Super mario 64", 1, "Nintendo"),
    ("Cartucho Sonic", 2, "Sega"),
    ("Cartucho TLOZ Ocarina of Time", 1, "Nintendo"),
    ("CD SOCOM II", 3, "Activicion"),
    ("CD Black", 2, "Criterion game");

INSERT INTO product (name, created_by, marca)
VALUES
	("Burnaut", 3, "Criterion game"),
    ("Naruto from Boruto Storm 4 Pro: Ultimate Ninja", 2, "Bandal"),
    ("Elder Ring", 1, "From Software"),
    ("Dark Souls", 1, "From Software"),
    ("DOOM 1992", 3, "ID Software");

SELECT * FROM product;

# Aqui se le da un alias a la tabla de usuario despues de "FROM" / FROM usuario alias_a_elegir;
# El LEFT JOIN trae la tabla de usuario y si contiene usuario el mismo id que p.created_by este le dara el producto a su usuario
# Esto trae todos los productos councidan o no.
SELECT u.id, u.name, u.email, p.name FROM usuario u
LEFT JOIN product p ON u.id = p.created_by ORDER BY u.id ASC;

# RIGHT JOIN
# El que va a traer todos los datos sera la tabla de la derecha ( product )
# Esto representa que los datos que no coincidan con la consulta no se traeran a diferencia de LEFT JOIN
# Esto cambia el resultado.
SELECT u.id, u.name, u.email, p.name FROM usuario u
RIGHT JOIN product p ON u.id = p.created_by ORDER BY u.id ASC;

# Inner JOIN
# Trae los usuarios y productos, cuando estos puedan ser asosiados
SELECT u.id, u.name, u.email, p.name FROM usuario u
INNER JOIN product p ON u.id = p.created_by ORDER BY u.id ASC;


/* > CROSS JOIN
## Estudiar mas este JOIN
lo que entendi es que relaciona todos los usuarios con los productos
hay que hacerlo con cuidado porque puede devolver una cantidad gigante de registros;
*/
SELECT u.id, u.name, p.name, p.id FROM usuario u CROSS JOIN product p ORDER BY p.id, u.id ASC;

# GROUP BY
## COUNT
/*
# Estudiar mas sobre GROUP BY
*/
SELECT COUNT(id) AS "Cantidad", marca FROM product GROUP BY marca;
SELECT COUNT(p.id) AS "Cantidad", u.name AS "Nombre", p.name FROM product p LEFT JOIN usuario u ON u.id = p.created_by GROUP BY p.created_by;


/*
- PK = PRIMARY KEY
- NN = NOT NULL
- UQ = UNIQUE

*/


CREATE TABLE IF NOT EXISTS `mydb`.`Usuarios` (
  `id` INT NOT NULL,
  `username` VARCHAR(16) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `password_UNIQUE` (`password` ASC) VISIBLE)
;

CREATE TABLE IF NOT EXISTS `mydb`.`product` (
  `id` INT NOT NULL,
  `name` VARCHAR(250) NOT NULL,
  `brand` VARCHAR(45) NULL,
  `created_by` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `created_by_idx` (`created_by` ASC) VISIBLE,
  CONSTRAINT `created_by`
    FOREIGN KEY (`created_by`)
    REFERENCES `mydb`.`Usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB





