set @count = 0;

CREATE DATABASE juegos;
USE juegos;

CREATE TABLE juegos (
	id int not null auto_increment,
    game varchar(255) not null unique,
    created_by int not null,
    image varchar(1000) not null,
    uuid_FRONT_END varchar(50),
    primary key(id)
);

select * from juegos_temp;

DROP TABLE IF EXISTS juegos_temp;

CREATE TABLE juegos_temp (
    id int not null auto_increment,
    game varchar(255) not null unique,
    created_by int not null,
    image varchar(1000) not null,
    uuid_FRONT_END varchar(50),
    primary key(id)
);

INSERT INTO juegos_temp (game, created_by, image, uuid_FRONT_END)
SELECT game, created_by, image, uuid_FRONT_END
FROM juegos;

SELECT * FROM juegos_temp;

