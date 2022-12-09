DROP DATABASE IF EXISTS platforms_app;
CREATE DATABASE platforms_app;

USE platforms_app;

DROP TABLE IF EXISTS platforms;
CREATE TABLE platforms (
Indexs  INTEGER Primary key,
Type  VARCHAR(255),
Title  VARCHAR(255),
Director   VARCHAR(1200),
Cast      VARCHAR(1200),
Country    VARCHAR(255),
Date_added   VARCHAR(255),
Release_year  INTEGER,
Rating    VARCHAR(255),
Duration   TEXT,
Listed_in  VARCHAR(255),
Description VARCHAR(2000),
Platform  VARCHAR(255)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\all_platforms.csv' 
INTO TABLE platforms
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '\n' 
LINES TERMINATED BY '\r\n' IGNORE 1 LINES;

SET GLOBAL log_bin_trust_function_creators = 1;

-- CONSULTAS
-- 1.Máxima duración según tipo de film (película/serie), por plataforma y por año: El request debe ser: get_max_duration(año, plataforma, [min o season]).

-- Solución 1. Utilizando SET
DROP FUNCTION IF EXISTS maxdurationfilm;
DELIMITER //
CREATE FUNCTION maxdurationfilm(anio INTEGER, plataforma VARCHAR(250), min VARCHAR(250)) RETURNS VARCHAR(250)
BEGIN
	DECLARE film VARCHAR(255);
	SELECT Title INTO film  
	FROM platforms 
	WHERE Release_year = anio AND Platform = plataforma AND Duration LIKE concat("%",min,"%")
	ORDER BY CONVERT(SUBSTRING_INDEX(Duration,' ', 1), UNSIGNED INTEGER) desc
	LIMIT 1;
RETURN film;
END;//

SELECT maxdurationfilm (2018, "hulu", "min")


-- 2.Cantidad de películas y series (separado) por plataforma El request debe ser: get_count_plataform(plataforma)

-- Solución 2. Utilizando SET
DROP PROCEDURE IF EXISTS showcount;
DELIMITER //
CREATE PROCEDURE showcount(IN plataforma VARCHAR(250), OUT platf VARCHAR(250), OUT totalm INTEGER, OUT totals INTEGER)
BEGIN
	SET platf = (plataforma);
    
    SET totalm = (
    SELECT COUNT(Type)
    FROM platforms 
	WHERE Platform = plataforma AND Type = 'Movie');
    
	SET totals = (
    SELECT COUNT(Type)
    FROM platforms 
    WHERE Platform = plataforma AND Type = 'TV Show');
END;//
DELIMITER ;

CALL showcount('netflix', @platf, @totalm, @totals);
SELECT  @platf, @totalm, @totals;


-- 3.Cantidad de veces que se repite un género y plataforma con mayor frecuencia del mismo. El request debe ser: get_listedin('genero')
-- Como ejemplo de género pueden usar 'comedy', el cuál deberia devolverles un cunt de 2099 para la plataforma de amazon.

-- Solución 3. Utilizando SET
DROP PROCEDURE IF EXISTS getlisted;
DELIMITER //
CREATE PROCEDURE getlisted(IN genero VARCHAR(250), OUT platf VARCHAR(250), OUT totalist INTEGER)
BEGIN
	
    SET platf = (
    SELECT Platform
    FROM platforms 
    WHERE Listed_in LIKE concat('%',genero,'%')
    GROUP BY Platform 
    ORDER BY COUNT(Listed_in) DESC
    LIMIT 1);
    
	SET totalist = (
	SELECT COUNT(Listed_in)
    FROM platforms 
    WHERE Listed_in LIKE concat('%',genero,'%')
    GROUP BY Platform 
	ORDER BY COUNT(Listed_in) DESC
    LIMIT 1);
END;//
DELIMITER ;

CALL getlisted('Comedy', @platf, @totalist);
SELECT  @platf, @totalist;

-- 4. Actor que más se repite según plataforma y año. El request debe ser: get_actor(plataforma, año)

-- Solución 4. Utilizando SET
DROP PROCEDURE IF EXISTS getactor;
DELIMITER //
CREATE PROCEDURE getactor(IN plataforma VARCHAR(250), IN anio INTEGER,OUT platf VARCHAR(250),OUT cantidad INTEGER, OUT actor VARCHAR(250))
BEGIN
	SET platf = (plataforma);
    
    SET cantidad = (
    SELECT COUNT(Cast LIKE concat('%',Cast,'%'))
    FROM platforms 
    WHERE Platform = plataforma AND Release_year = anio AND Cast LIKE concat('%',Cast,'%') 
    GROUP BY Platform, Listed_in
    LIMIT 1);
	
    SET actor = (
    SELECT ('%',Cast,'%') AS y
    FROM platform_app
    WHERE y in (SELECT ('%',Cast,'%') 
    FROM platform_app
    WHERE ('%',Cast,'%') = Cast));
    
END;//
DELIMITER ;

CALL getactor('netflix', 2018, @platf, @cantidad, @actor);
SELECT  @platf, @cantidad, @actor;

 

