-- ========================================
-- LIMPIEZA INICIAL (si Moneda ya existe)
-- ========================================
	-- ELIMINAR COLUMNAS EN LA TABLA PAIS
DO $$ 
BEGIN
    -- Verificar si la columna IdMoneda existe en la tabla Pais
    IF EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'pais' AND column_name = 'idmoneda') THEN
        ALTER TABLE Pais DROP COLUMN idmoneda;
    END IF;

    -- Verificar si la columna MapaImagen existe en la tabla Pais
    IF EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'pais' AND column_name = 'mapaimagen') THEN
        ALTER TABLE Pais DROP COLUMN MapaImagen;
    END IF;

    -- Verificar si la columna BanderaImagen existe en la tabla Pais
    IF EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'pais' AND column_name = 'banderaimagen') THEN
        ALTER TABLE Pais DROP COLUMN BanderaImagen;
    END IF;
END$$;
	-- ELIMINAR LA TABLA MONEDA
DO $$ 
BEGIN 
    -- Verificar si la tabla Moneda existe
    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'moneda') THEN 
        -- Eliminar la tabla Moneda
        DROP TABLE Moneda CASCADE; -- Eliminar la tabla Moneda y sus dependencias
    END IF; 
END$$;

-- ========================================
-- Crear tabla Moneda si no existe
-- ========================================
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'moneda') THEN
        CREATE TABLE Moneda (
            Id INT PRIMARY KEY,
            Moneda VARCHAR(255),
            Sigla VARCHAR(10) UNIQUE,
            Imagen VARCHAR(255)
        );
    END IF;
END$$;

-- ========================================
-- Insertar monedas (se reinserta si fueron borradas)
-- ========================================
INSERT INTO Moneda (Id, Moneda, Sigla)
VALUES 
    (1, 'PESO COLOMBIANO', 'COP'),
    (2, 'PESO ARGENTINO', 'ARS'),
    (3, 'PESO BOLIVIANO', 'BOB'),
    (4, 'REAL', 'BRL'),
    (5, 'DOLAR CANADIENSE', 'CAD'),
    (6, 'COLON', 'CRC'),
    (7, 'PESO DOMINICANO', 'DOP'),
    (8, 'DOLAR', 'USD'),
    (9, 'PESO CHILENO', 'CLP'),
    (10, 'QUETZAL', 'GTQ'),
    (11, 'PESO', 'PES'),
    (12, 'PESO MEXICANO', 'MXN'),
    (13, 'BALBOA', 'PAB'),
    (14, 'GUARANI', 'PYG'),
    (15, 'NUEVO SOL', 'PEN'),
    (16, 'PESO URUGUAYO', 'UYU'),
    (17, 'NUEVO BOLIVAR', 'VEF'),
    (18, 'LIBRA', 'GBP'),
    (19, 'EURO', 'EUR'),
    (20, 'DOLAR AUSTRALIANO', 'AUD');

-- ========================================
-- Asignar ruta de imagen a cada moneda (opcional)
-- ========================================
--UPDATE Moneda SET Imagen = '/imagenes/Sigla/' || Sigla || '.png';

-- ========================================
-- Agregar columnas a Pais si no existen
-- ========================================

-- Agregar columna IdMoneda si no existe
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name='pais' AND column_name='idmoneda'
    ) THEN
        ALTER TABLE Pais ADD COLUMN IdMoneda INT;
    END IF;
END$$;

-- Agregar columna MapaImagen si no existe
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name='pais' AND column_name='mapaimagen'
    ) THEN
        ALTER TABLE Pais ADD COLUMN MapaImagen BYTEA NULL;
    END IF;
END$$;

-- Agregar columna BanderaImagen si no existe
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name='pais' AND column_name='banderaimagen'
    ) THEN
        ALTER TABLE Pais ADD COLUMN BanderaImagen BYTEA NULL;
    END IF;
END$$;

-- ========================================
-- Agregar restricción de clave foránea si no existe
-- ========================================
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.table_constraints 
        WHERE table_name = 'pais' AND constraint_type = 'FOREIGN KEY' AND constraint_name = 'fk_moneda'
    ) THEN
        ALTER TABLE Pais
        ADD CONSTRAINT fk_moneda FOREIGN KEY (IdMoneda) REFERENCES Moneda(Id);
    END IF;
END$$;

-- ========================================
-- Actualizar mapas de los países (opcional)
-- ========================================
UPDATE Pais SET MapaImagen = '/imagenes/mapas/colombia.png' WHERE Nombre = 'COLOMBIA';
UPDATE Pais SET MapaImagen = '/imagenes/mapas/argentina.png' WHERE Nombre = 'ARGENTINA';
UPDATE Pais SET MapaImagen = '/imagenes/mapas/bolivia.png' WHERE Nombre = 'BOLIVIA';
UPDATE Pais SET MapaImagen = '/imagenes/mapas/brasil.png' WHERE Nombre = 'BRASIL';
UPDATE Pais SET MapaImagen = '/imagenes/mapas/canada.png' WHERE Nombre = 'CANADA';
UPDATE Pais SET MapaImagen = '/imagenes/mapas/costa_rica.png' WHERE Nombre = 'COSTA RICA';
UPDATE Pais SET MapaImagen = '/imagenes/mapas/republica_dominicana.png' WHERE Nombre = 'REPUBLICA DOMINICANA';
UPDATE Pais SET MapaImagen = '/imagenes/mapas/cuba.png' WHERE Nombre = 'CUBA';
UPDATE Pais SET MapaImagen = '/imagenes/mapas/chile.png' WHERE Nombre = 'CHILE';
UPDATE Pais SET MapaImagen = '/imagenes/mapas/ecuador.png' WHERE Nombre = 'ECUADOR';
UPDATE Pais SET MapaImagen = '/imagenes/mapas/estados_unidos_america.png' WHERE Nombre = 'ESTADOS UNIDOS DE AMÉRICA';
UPDATE Pais SET MapaImagen = '/imagenes/mapas/guatemala.png' WHERE Nombre = 'GUATEMALA';
UPDATE Pais SET MapaImagen = '/imagenes/mapas/honduras.png' WHERE Nombre = 'HONDURAS';
UPDATE Pais SET MapaImagen = '/imagenes/mapas/mexico.png' WHERE Nombre = 'MÉXICO';
UPDATE Pais SET MapaImagen = '/imagenes/mapas/nicaragua.png' WHERE Nombre = 'NICARAGUA';
UPDATE Pais SET MapaImagen = '/imagenes/mapas/panama.png' WHERE Nombre = 'PANAMA';
UPDATE Pais SET MapaImagen = '/imagenes/mapas/paraguay.png' WHERE Nombre = 'PARAGUAY';
UPDATE Pais SET MapaImagen = '/imagenes/mapas/peru.png' WHERE Nombre = 'PERU';
UPDATE Pais SET MapaImagen = '/imagenes/mapas/uruguay.png' WHERE Nombre = 'URUGUAY';
UPDATE Pais SET MapaImagen = '/imagenes/mapas/venezuela.png' WHERE Nombre = 'VENEZUELA';
UPDATE Pais SET MapaImagen = '/imagenes/mapas/reino_unido.png' WHERE Nombre = 'REINO UNIDO';
UPDATE Pais SET MapaImagen = '/imagenes/mapas/espana.png' WHERE Nombre = 'ESPAÑA';
UPDATE Pais SET MapaImagen = '/imagenes/mapas/italia.png' WHERE Nombre = 'ITALIA';
UPDATE Pais SET MapaImagen = '/imagenes/mapas/francia.png' WHERE Nombre = 'FRANCIA';
UPDATE Pais SET MapaImagen = '/imagenes/mapas/australia.png' WHERE Nombre = 'AUSTRALIA';

-- ========================================
-- Actualizar banderas de los países (opcional)
-- ========================================
UPDATE Pais SET BanderaImagen = '/imagenes/banderas/colombia.png' WHERE Nombre = 'COLOMBIA';
UPDATE Pais SET BanderaImagen = '/imagenes/banderas/argentina.png' WHERE Nombre = 'ARGENTINA';
UPDATE Pais SET BanderaImagen = '/imagenes/banderas/bolivia.png' WHERE Nombre = 'BOLIVIA';
UPDATE Pais SET BanderaImagen = '/imagenes/banderas/brasil.png' WHERE Nombre = 'BRASIL';
UPDATE Pais SET BanderaImagen = '/imagenes/banderas/canada.png' WHERE Nombre = 'CANADA';
UPDATE Pais SET BanderaImagen = '/imagenes/banderas/costa_rica.png' WHERE Nombre = 'COSTA RICA';
UPDATE Pais SET BanderaImagen = '/imagenes/banderas/republica_dominicana.png' WHERE Nombre = 'REPUBLICA DOMINICANA';
UPDATE Pais SET BanderaImagen = '/imagenes/banderas/cuba.png' WHERE Nombre = 'CUBA';
UPDATE Pais SET BanderaImagen = '/imagenes/banderas/chile.png' WHERE Nombre = 'CHILE';
UPDATE Pais SET BanderaImagen = '/imagenes/banderas/ecuador.png' WHERE Nombre = 'ECUADOR';
UPDATE Pais SET BanderaImagen = '/imagenes/banderas/estados_unidos_america.png' WHERE Nombre = 'ESTADOS UNIDOS DE AMÉRICA';
UPDATE Pais SET BanderaImagen = '/imagenes/banderas/guatemala.png' WHERE Nombre = 'GUATEMALA';
UPDATE Pais SET BanderaImagen = '/imagenes/banderas/honduras.png' WHERE Nombre = 'HONDURAS';
UPDATE Pais SET BanderaImagen = '/imagenes/banderas/mexico.png' WHERE Nombre = 'MÉXICO';
UPDATE Pais SET BanderaImagen = '/imagenes/banderas/nicaragua.png' WHERE Nombre = 'NICARAGUA';
UPDATE Pais SET BanderaImagen = '/imagenes/banderas/panama.png' WHERE Nombre = 'PANAMA';
UPDATE Pais SET BanderaImagen = '/imagenes/banderas/paraguay.png' WHERE Nombre = 'PARAGUAY';
UPDATE Pais SET BanderaImagen = '/imagenes/banderas/peru.png' WHERE Nombre = 'PERU';
UPDATE Pais SET BanderaImagen = '/imagenes/banderas/uruguay.png' WHERE Nombre = 'URUGUAY';
UPDATE Pais SET BanderaImagen = '/imagenes/banderas/venezuela.png' WHERE Nombre = 'VENEZUELA';
UPDATE Pais SET BanderaImagen = '/imagenes/banderas/reino_unido.png' WHERE Nombre = 'REINO UNIDO';
UPDATE Pais SET BanderaImagen = '/imagenes/banderas/espana.png' WHERE Nombre = 'ESPAÑA';
UPDATE Pais SET BanderaImagen = '/imagenes/banderas/italia.png' WHERE Nombre = 'ITALIA';
UPDATE Pais SET BanderaImagen = '/imagenes/banderas/francia.png' WHERE Nombre = 'FRANCIA';
UPDATE Pais SET BanderaImagen = '/imagenes/banderas/australia.png' WHERE Nombre = 'AUSTRALIA';

-- ========================================
-- Asignar IdMoneda a cada país
-- usando el valor de la columna Moneda
-- ========================================
UPDATE Pais SET IdMoneda = 1 WHERE Moneda = 'PESO COLOMBIANO';
UPDATE Pais SET IdMoneda = 2 WHERE Moneda = 'PESO ARGENTINO';
UPDATE Pais SET IdMoneda = 3 WHERE Moneda = 'PESO BOLIVIANO';
UPDATE Pais SET IdMoneda = 4 WHERE Moneda = 'REAL';
UPDATE Pais SET IdMoneda = 5 WHERE Moneda = 'DOLAR CANADIENSE';
UPDATE Pais SET IdMoneda = 6 WHERE Moneda = 'COLON';
UPDATE Pais SET IdMoneda = 7 WHERE Moneda = 'PESO DOMINICANO';
UPDATE Pais SET IdMoneda = 8 WHERE Moneda = 'DOLAR';
UPDATE Pais SET IdMoneda = 9 WHERE Moneda = 'PESO CHILENO';
UPDATE Pais SET IdMoneda = 10 WHERE Moneda = 'QUETZAL';
UPDATE Pais SET IdMoneda = 11 WHERE Moneda = 'PESO';
UPDATE Pais SET IdMoneda = 12 WHERE Moneda = 'PESO MEXICANO';
UPDATE Pais SET IdMoneda = 13 WHERE Moneda = 'BALBOA';
UPDATE Pais SET IdMoneda = 14 WHERE Moneda = 'GUARANI';
UPDATE Pais SET IdMoneda = 15 WHERE Moneda = 'NUEVO SOL';
UPDATE Pais SET IdMoneda = 16 WHERE Moneda = 'PESO URUGUAYO';
UPDATE Pais SET IdMoneda = 17 WHERE Moneda = 'NUEVO BOLIVAR';
UPDATE Pais SET IdMoneda = 18 WHERE Moneda = 'LIBRA ';
UPDATE Pais SET IdMoneda = 19 WHERE Moneda = 'EURO';
UPDATE Pais SET IdMoneda = 20 WHERE Moneda = 'DOLAR AUSTRALIANO';


-- Eliminar la columna Moneda de la tabla Pais (solo si ya se usa IdMoneda)
--ALTER TABLE Pais DROP COLUMN Moneda;


--Consultar Pais
SELECT *
	FROM Pais
	ORDER BY Id;
--Consultar Moneda	
SELECT*
	FROM Moneda