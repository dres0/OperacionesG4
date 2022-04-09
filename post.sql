-- La academia está trabajando en mejorar su plataforma de estudio y planea crear un espacio
-- que sirva como una red social entre estudiantes y docentes, por lo que necesita almacenar
-- en una base de datos los post y comentarios que se generen.
-- ● Parte 1: Creación, inserciones, modificaciones y eliminaciones en la tabla “Posts”.
-- ● Parte 2: Creación e inserciones en la tabla “comentarios”.

-- Parte 1
-- 1. Crear una base de datos con nombre “Posts”. (1 Punto)
\c dres0
DROP DATABASE posts;
CREATE DATABASE posts;
\c posts
-- 2. Crear una tabla “post”, con los atributos id, nombre de usuario, fecha de creación,
-- contenido y descripción. (1 Punto)
CREATE TABLE post(
    id SERIAL,
    userName VARCHAR(30),
    createdAt DATE,
    content VARCHAR,
    descripcion VARCHAR,
    PRIMARY KEY (id)
);
\dt
-- 3. Insertar 3 post, 2 para el usuario "Pamela" y uno para "Carlos". (0.6 Puntos)
INSERT INTO post (userName, createdAt, content, descripcion)
VALUES('Pamela', '2021-04-07', 'Esto es un contenido', 'Esto es una descripcion');
INSERT INTO post (userName, createdAt, content, descripcion)
VALUES('Pamela', '2021-04-08', 'Esto es un contenido', 'Esto es una descripcion');
INSERT INTO post (userName, createdAt, content, descripcion)
VALUES('Carlos', '2021-04-09', 'Esto es un contenido', 'Esto es una descripcion');
SELECT * FROM post;
-- 4. Modificar la tabla post, agregando la columna título. (1 Punto)
ALTER TABLE post ADD title VARCHAR(100);
SELECT * FROM post;
-- 5. Agregar título a las publicaciones ya ingresadas. (1 Punto)
UPDATE post SET title = 'Esto es un titulo' WHERE id = 1;
UPDATE post SET title = 'Esto es un titulo' WHERE id = 2;
UPDATE post SET title = 'Esto es un titulo' WHERE id = 3;
SELECT * FROM post;
-- 6. Insertar 2 post para el usuario "Pedro". (0.4 Puntos)
INSERT INTO post (userName, createdAt, content, descripcion, title)
VALUES ('Pedro', '2021-04-10', 'Esto es un contenido', 'Esto es una descripcion', 'Esto es un titulo');
INSERT INTO post (userName, createdAt, content, descripcion, title)
VALUES ('Pedro', '2021-04-10', 'Esto es un contenido', 'Esto es una descripcion', 'Esto es un titulo');
SELECT * FROM post;
-- 7. Eliminar el post de Carlos. (1 Punto)
DELETE FROM post WHERE userName = 'Carlos';
SELECT * FROM post;
-- 8. Ingresar un nuevo post para el usuario "Carlos". (0.6 Puntos
INSERT INTO post (userName, createdAt, content, descripcion, title)
VALUES('Carlos', '2021-04-09', 'Esto es un contenido', 'Esto es una descripcion', 'Esto es un titulo');
SELECT* FROM post;

-- Parte 2
-- 1. Crear una nueva tabla llamada “comentarios”, con los atributos id, fecha, hora de
-- creación y contenido, que se relacione con la tabla posts. (1 Punto)
CREATE TABLE comentarios(
    id SERIAL,
    post_id INT,
    createdAt DATE,
    content VARCHAR,
    FOREIGN KEY (post_id) REFERENCES post (id)
);
\dt
-- 2. Crear 2 comentarios para el post de "Pamela" y 4 para "Carlos". (0.4 Puntos)
INSERT INTO comentarios (post_id, createdAt, content)
VALUES (1, '2021-05-10 15:16:13', 'Esto es un comentario para Pamela');
INSERT INTO comentarios (post_id, createdAt, content)
VALUES (1, '2021-05-11 10:00:04', 'Esto es un comentario para Pamela');
INSERT INTO comentarios (post_id, createdAt, content)
VALUES (6, '2021-05-12 10:00:00', 'Esto es un comentario para Carlos');
INSERT INTO comentarios (post_id, createdAt, content)
VALUES (6, '2021-05-13 10:36:13', 'Esto es un comentario para Carlos');
INSERT INTO comentarios (post_id, createdAt, content)
VALUES (6, '2021-05-14 11:16:13', 'Esto es un comentario para Carlos');
INSERT INTO comentarios (post_id, createdAt, content)
VALUES (6, '2021-05-15 12:16:13', 'Esto es un comentario para Carlos');
SELECT * FROM comentarios;
-- 3. Crear un nuevo post para "Margarita". (1 Punto)
INSERT INTO post (userName, createdAt, content, descripcion, title)
VALUES('Margarita', '2021-06-11', 'Esto es un contenido para Margarita', 'Esto es una descripcion para Margarita', ' Esto es un titulo para Margarita');
SELECT * FROM post;
-- 4. Ingresar 5 comentarios para el post de Margarita. (1 Punto)
INSERT INTO comentarios (post_id, createdAt, content)
VALUES (7, '2021-05-16 12:16:13', 'Esto es un comentario para Margarita');
INSERT INTO comentarios (post_id, createdAt, content)
VALUES (7, '2021-05-16 13:16:13', 'Esto es un comentario para Margarita');
INSERT INTO comentarios (post_id, createdAt, content)
VALUES (7, '2021-05-16 14:16:13', 'Esto es un comentario para Margarita');
INSERT INTO comentarios (post_id, createdAt, content)
VALUES (7, '2021-05-16 15:16:13', 'Esto es un comentario para Margarita');
INSERT INTO comentarios (post_id, createdAt, content)
VALUES (7, '2021-05-16 16:16:13', 'Esto es un comentario para Margarita');
SELECT * FROM post;