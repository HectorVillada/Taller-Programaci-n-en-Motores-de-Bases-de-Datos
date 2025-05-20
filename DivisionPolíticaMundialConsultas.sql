--¿Cuántas divisiones políticas tiene un país y como se le denomina a la división?
--a. Incluyendo todos los países que no tienen regiones registradas:
SELECT column_name 
FROM information_schema.columns 
WHERE table_name = 'tiporegion';

SELECT P.Nombre, COUNT(R.Id), tiporegion
FROM Region R RIGHT JOIN Pais P ON R.IdPais = P.ID
INNER JOIN TipoRegion T ON P.IdTipoRegion = T.Id
GROUP BY P.Nombre, tiporegion
ORDER BY P.Nombre
--Incluyendo sólo los países que tienen regiones registradas:
SELECT P.Nombre, COUNT(R.Id), tiporegion
FROM Region R INNER JOIN Pais P ON R.IdPais = P.ID
INNER JOIN TipoRegion T ON P.IdTipoRegion = T.Id
GROUP BY P.Nombre, tiporegion
ORDER BY P.Nombre

--b. ¿Cuál es el área y población de los países del continente “América”?
SELECT P.Nombre, SUM(R.Area) AS TotalArea,
SUM(R.Poblacion) AS TotalPoblacion
FROM Region R INNER JOIN Pais P ON R.IdPais = P.ID
INNER JOIN Continente C ON P.IdContinente = C.Id
WHERE UPPER(C.Nombre)='AMERICA'
GROUP BY P.Nombre
ORDER BY P.Nombre

--c. ¿Cuál es la capital del país “Argentina”?
SELECT C.Nombre
FROM Pais P INNER JOIN Region R ON P.Id = R.IdPais
INNER JOIN Ciudad C ON R.Id = C.IdRegion
WHERE LOWER(P.Nombre)='argentina'
AND C.CapitalPais=true 

--d. ¿Dónde está ubicada la ciudad con nombre “Barbosa”?
SELECT R.Nombre || ' (' || P.Nombre || ')' AS Ubicacion
FROM Pais P INNER JOIN Region R ON P.Id = R.IdPais
INNER JOIN Ciudad C ON R.Id = C.IdRegion
WHERE LOWER(C.Nombre)='barbosa'
ORDER BY R.Nombre, P.Nombre

--e. ¿De qué región es capital la ciudad de “Hermosillo”?
SELECT R.Nombre
FROM Region R
JOIN Ciudad C
ON R.Id=C.IdRegion
WHERE C.Nombre='Hermosillo' AND
C.CapitalRegion=true

--f. ¿Cuál es la región de “Brasil” con mayor población?
SELECT Region.nombre, Region.Poblacion
FROM Region
WHERE Poblacion IN
(SELECT MAX(Region.Poblacion)
FROM Pais INNER JOIN Region ON
Pais.Id=Region.IdPais
WHERE Pais.Nombre='BRASIL')

--g. ¿Cuál es la región de “México” con menor área?
SELECT Region.Nombre, Region.Area
FROM Pais INNER JOIN Region ON Pais.Id=Region.IdPais
WHERE Pais.Nombre='MEXICO'
AND Area IN
(SELECT MIN(Region.Area)
FROM Pais INNER JOIN Region ON
Pais.Id=Region.IdPais
WHERE Pais.Nombre='MEXICO')

SELECT Region.Nombre, Region.Area
FROM Pais INNER JOIN Region ON Pais.Id=Region.IdPais
WHERE Pais.Nombre='VENEZUELA'
AND Area IN
(SELECT MIN(Region.Area)
FROM Pais INNER JOIN Region ON
Pais.Id=Region.IdPais
WHERE Pais.Nombre='VENEZUELA')
--h. ¿De qué país es capital “Bogotá”? (El nombre completo de la ciudad es “SANTA FE DE BOGOTA D.C.”)
SELECT P.Nombre
FROM Pais P INNER JOIN Region R ON P.Id = R.IdPais
INNER JOIN Ciudad C ON R.Id = C.IdRegion
WHERE POSITION('BOGOTA' IN UPPER(c.Nombre))>0
AND C.CapitalPais=true

--Consultar Pais
SELECT*
	FROM Moneda
--Consultar Pais	
SELECT*
	FROM Moneda