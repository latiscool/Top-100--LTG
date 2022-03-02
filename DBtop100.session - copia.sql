
-- 1. Crear base de datos llamada películas.
-- ******************************************
CREATE TABLE peliculas

-- CREAR TABLAS peliculas y reparto
-- ----------------------------------
(id INT UNIQUE PRIMARY KEY,
Pelicula VARCHAR (100),
Año_estreno INT,
Director VARCHAR (100)
);

CREATE TABLE reparto(   
id INT,
Actor VARCHAR(100),
FOREIGN KEY(id) REFERENCES peliculas (id)
);


-- 2. Cargar ambos archivos a su tabla correspondiente (COMENTADO comando consola psql)
-- -- ******************************************
--  \copy peliculas FROM 'H:\BD_dia_4\peliculas.csv' csv header
--  \copy reparto FROM 'H:\BD_dia_4\reparto.csv' csv header

-- 3. Obtener el ID de la película “Titanic”.
-- ******************************************
SELECt pelicula, id FROM peliculas
WHERE pelicula='Titanic';


-- 4. Listar a todos los actores que aparecen en la película "Titanic"
-- ******************************************************************
SELECT actor as actores_titanic FROM reparto
WHERE reparto.id=2;

-- 5. Consultar en cuántas películas del top 100 participa Harrison Ford.
-- ********************************************************************

SELECT pelicula as Peliculas_Harrison_Ford
FROM reparto, peliculas
WHERE reparto.actor='Harrison Ford' AND peliculas.id=reparto.id;


-- 6.-Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de
-- manera ascendente
-- ************************************************************************************

SELECT pelicula, año_estreno AS Fecha_1990_al_1999 FROM peliculas
WHERE año_estreno BETWEEN 1990 AND 1999
ORDER BY pelicula ASC;

-- 7. Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser
-- nombrado para la consulta como “longitud_titulo”.
-- ************************************************************************************

SELECT pelicula, LENGTH (pelicula) AS longitud_titulo
FROM peliculas
ORDER BY longitud_titulo DESC


-- 8. Consultar cual es la longitud más grande entre todos los títulos de las películas
-- ************************************************************************************

SELECT pelicula, MAX(LENGTH(pelicula)) AS logitud_maxima
FROM peliculas
GROUP BY pelicula
ORDER BY logitud_maxima DESC
LIMIT 1;

