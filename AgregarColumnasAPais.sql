-- Agregar la columna IdMoneda como clave foránea
ALTER TABLE Pais
ADD COLUMN IdMoneda INT;

-- Agregar la columna Mapa
ALTER TABLE Pais
ADD COLUMN MapaImagen VARCHAR(255);

-- Agregar la columna Bandera
ALTER TABLE Pais
ADD COLUMN BanderaImagen VARCHAR(255);

-- Actualizar la tabla Pais con las rutas de las imágenes del mapa (ejemplos)
UPDATE Pais
SET MapaImagen = '/imagenes/mapas/colombia.png'
WHERE Nombre = 'COLOMBIA';

UPDATE Pais
SET MapaImagen = '/imagenes/mapas/argentina.png'
WHERE Nombre = 'ARGENTINA';

UPDATE Pais
SET MapaImagen = '/imagenes/mapas/bolivia.png'
WHERE Nombre = 'BOLIVIA';

UPDATE Pais
SET MapaImagen = '/imagenes/mapas/brasil.png'
WHERE Nombre = 'BRASIL';

UPDATE Pais
SET MapaImagen = '/imagenes/mapas/canada.png'
WHERE Nombre = 'CANADA';

UPDATE Pais
SET MapaImagen = '/imagenes/mapas/costa_rica.png'
WHERE Nombre = 'COSTA RICA';

UPDATE Pais
SET MapaImagen = '/imagenes/mapas/republica_dominicana.png'
WHERE Nombre = 'REPUBLICA DOMINICANA';

UPDATE Pais
SET MapaImagen = '/imagenes/mapas/cuba.png'
WHERE Nombre = 'CUBA';

UPDATE Pais
SET MapaImagen = '/imagenes/mapas/chile.png'
WHERE Nombre = 'CHILE';

UPDATE Pais
SET MapaImagen = '/imagenes/mapas/ecuador.png'
WHERE Nombre = 'ECUADOR';

UPDATE Pais
SET MapaImagen = '/imagenes/mapas/estados_unidos_america.png'
WHERE Nombre = 'ESTADOS UNIDOS DE AMÉRICA';

UPDATE Pais
SET MapaImagen = '/imagenes/mapas/guatemala.png'
WHERE Nombre = 'GUATEMALA';

UPDATE Pais
SET MapaImagen = '/imagenes/mapas/honduras.png'
WHERE Nombre = 'HONDURAS';

UPDATE Pais
SET MapaImagen = '/imagenes/mapas/mexico.png'
WHERE Nombre = 'MÉXICO';

UPDATE Pais
SET MapaImagen = '/imagenes/mapas/nicaragua.png'
WHERE Nombre = 'NICARAGUA';

UPDATE Pais
SET MapaImagen = '/imagenes/mapas/panama.png'
WHERE Nombre = 'PANAMA';

UPDATE Pais
SET MapaImagen = '/imagenes/mapas/paraguay.png'
WHERE Nombre = 'PARAGUAY';

UPDATE Pais
SET MapaImagen = '/imagenes/mapas/peru.png'
WHERE Nombre = 'PERU';

UPDATE Pais
SET MapaImagen = '/imagenes/mapas/uruguay.png'
WHERE Nombre = 'URUGUAY';

UPDATE Pais
SET MapaImagen = '/imagenes/mapas/venezuela.png'
WHERE Nombre = 'VENEZUELA';

UPDATE Pais
SET MapaImagen = '/imagenes/mapas/reino_unido.png'
WHERE Nombre = 'REINO UNIDO';

UPDATE Pais
SET MapaImagen = '/imagenes/mapas/espana.png'
WHERE Nombre = 'ESPAÑA';

UPDATE Pais
SET MapaImagen = '/imagenes/mapas/italia.png'
WHERE Nombre = 'ITALIA';

UPDATE Pais
SET MapaImagen = '/imagenes/mapas/francia.png'
WHERE Nombre = 'FRANCIA';

UPDATE Pais
SET MapaImagen = '/imagenes/mapas/australia.png'
WHERE Nombre = 'AUSTRALIA';

-- Actualizar la tabla Pais con las rutas de las imágenes de la bandera (ejemplos)
UPDATE Pais
SET BanderaImagen = '/imagenes/banderas/colombia.png'
WHERE Nombre = 'COLOMBIA';

UPDATE Pais
SET BanderaImagen = '/imagenes/banderas/argentina.png'
WHERE Nombre = 'ARGENTINA';

UPDATE Pais
SET BanderaImagen = '/imagenes/banderas/bolivia.png'
WHERE Nombre = 'BOLIVIA';

UPDATE Pais
SET BanderaImagen = '/imagenes/banderas/brasil.png'
WHERE Nombre = 'BRASIL';

UPDATE Pais
SET BanderaImagen = '/imagenes/banderas/canada.png'
WHERE Nombre = 'CANADA';

UPDATE Pais
SET BanderaImagen = '/imagenes/banderas/costa_rica.png'
WHERE Nombre = 'COSTA RICA';

UPDATE Pais
SET BanderaImagen = '/imagenes/banderas/republica_dominicana.png'
WHERE Nombre = 'REPUBLICA DOMINICANA';

UPDATE Pais
SET BanderaImagen = '/imagenes/banderas/cuba.png'
WHERE Nombre = 'CUBA';

UPDATE Pais
SET BanderaImagen = '/imagenes/banderas/chile.png'
WHERE Nombre = 'CHILE';

UPDATE Pais
SET BanderaImagen = '/imagenes/banderas/ecuador.png'
WHERE Nombre = 'ECUADOR';

UPDATE Pais
SET BanderaImagen = '/imagenes/banderas/estados_unidos_america.png'
WHERE Nombre = 'ESTADOS UNIDOS DE AMÉRICA';

UPDATE Pais
SET BanderaImagen = '/imagenes/banderas/guatemala.png'
WHERE Nombre = 'GUATEMALA';

UPDATE Pais
SET BanderaImagen = '/imagenes/banderas/honduras.png'
WHERE Nombre = 'HONDURAS';

UPDATE Pais
SET BanderaImagen = '/imagenes/banderas/mexico.png'
WHERE Nombre = 'MÉXICO';

UPDATE Pais
SET BanderaImagen = '/imagenes/banderas/nicaragua.png'
WHERE Nombre = 'NICARAGUA';

UPDATE Pais
SET BanderaImagen = '/imagenes/banderas/panama.png'
WHERE Nombre = 'PANAMA';

UPDATE Pais
SET BanderaImagen = '/imagenes/banderas/paraguay.png'
WHERE Nombre = 'PARAGUAY';

UPDATE Pais
SET BanderaImagen = '/imagenes/banderas/peru.png'
WHERE Nombre = 'PERU';

UPDATE Pais
SET BanderaImagen = '/imagenes/banderas/uruguay.png'
WHERE Nombre = 'URUGUAY';

UPDATE Pais
SET BanderaImagen = '/imagenes/banderas/venezuela.png'
WHERE Nombre = 'VENEZUELA';

UPDATE Pais
SET BanderaImagen = '/imagenes/banderas/reino_unido.png'
WHERE Nombre = 'REINO UNIDO';

UPDATE Pais
SET BanderaImagen = '/imagenes/banderas/espana.png'
WHERE Nombre = 'ESPAÑA';

UPDATE Pais
SET BanderaImagen = '/imagenes/banderas/italia.png'
WHERE Nombre = 'ITALIA';

UPDATE Pais
SET BanderaImagen = '/imagenes/banderas/francia.png'
WHERE Nombre = 'FRANCIA';

UPDATE Pais
SET BanderaImagen = '/imagenes/banderas/australia.png'
WHERE Nombre = 'AUSTRALIA';

-- Actualizar la tabla Pais con los IdMoneda correspondientes
UPDATE Pais SET IdMoneda = 1 WHERE Nombre = 'COLOMBIA';
UPDATE Pais SET IdMoneda = 2 WHERE Nombre = 'ARGENTINA';
UPDATE Pais SET IdMoneda = 3 WHERE Nombre = 'BOLIVIA';
UPDATE Pais SET IdMoneda = 4 WHERE Nombre = 'BRASIL';
UPDATE Pais SET IdMoneda = 5 WHERE Nombre = 'CANADA';
UPDATE Pais SET IdMoneda = 6 WHERE Nombre = 'COSTA RICA';
UPDATE Pais SET IdMoneda = 7 WHERE Nombre = 'REPUBLICA DOMINICANA';
UPDATE Pais SET IdMoneda = 8 WHERE Nombre = 'CUBA';
UPDATE Pais SET IdMoneda = 9 WHERE Nombre = 'CHILE';
UPDATE Pais SET IdMoneda = 8 WHERE Nombre = 'ECUADOR'; 
UPDATE Pais SET IdMoneda = 8 WHERE Nombre = 'ESTADOS UNIDOS DE AMÉRICA';
UPDATE Pais SET IdMoneda = 10 WHERE Nombre = 'GUATEMALA';
UPDATE Pais SET IdMoneda = 11 WHERE Nombre = 'HONDURAS';
UPDATE Pais SET IdMoneda = 12 WHERE Nombre = 'MÉXICO';
UPDATE Pais SET IdMoneda = 13 WHERE Nombre = 'NICARAGUA';
UPDATE Pais SET IdMoneda = 14 WHERE Nombre = 'PANAMA';
UPDATE Pais SET IdMoneda = 15 WHERE Nombre = 'PARAGUAY';
UPDATE Pais SET IdMoneda = 16 WHERE Nombre = 'PERU';
UPDATE Pais SET IdMoneda = 17 WHERE Nombre = 'URUGUAY';
UPDATE Pais SET IdMoneda = 18 WHERE Nombre = 'VENEZUELA';
UPDATE Pais SET IdMoneda = 19 WHERE Nombre = 'REINO UNIDO';
UPDATE Pais SET IdMoneda = 20 WHERE Nombre = 'ESPAÑA';
UPDATE Pais SET IdMoneda = 20 WHERE Nombre = 'ITALIA';
UPDATE Pais SET IdMoneda = 20 WHERE Nombre = 'FRANCIA';
UPDATE Pais SET IdMoneda = 21 WHERE Nombre = 'AUSTRALIA';

--Clave foránea
ALTER TABLE Pais
ADD CONSTRAINT fk_moneda
FOREIGN KEY (IdMoneda) REFERENCES Moneda(Id);