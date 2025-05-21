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
    (20, 'DOLAR AUSTRALIANO', 'AUD')
ON CONFLICT (Id) DO NOTHING;

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

/*
-- ========================================
-- BLOQUE 1: RESPALDAR Y ELIMINAR COLUMNA MONEDA
-- ========================================
DO $$
BEGIN
    -- 1. Crear columna MonedaBackup si no existe
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'pais' AND column_name = 'monedabackup'
    ) THEN
        ALTER TABLE Pais ADD COLUMN MonedaBackup VARCHAR(30);
    END IF;

    -- 2. Copiar datos de Moneda a MonedaBackup (si existe)
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'pais' AND column_name = 'moneda'
    ) THEN
        EXECUTE 'UPDATE Pais SET MonedaBackup = Moneda';
    END IF;

    -- 3. Eliminar columna Moneda si existe
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'pais' AND column_name = 'moneda'
    ) THEN
        ALTER TABLE Pais DROP COLUMN Moneda;
    END IF;
END$$;
*/
/*
-- ========================================
-- BLOQUE 2: RESTAURAR COLUMNA MONEDA DESDE MONEDABACKUP
-- ========================================
DO $$
BEGIN
    -- 4. Crear la columna Moneda si no existe
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'pais' AND column_name = 'moneda'
    ) THEN
        ALTER TABLE Pais ADD COLUMN Moneda VARCHAR(30);
    END IF;

    -- 5. Restaurar datos desde MonedaBackup
    EXECUTE 'UPDATE Pais SET Moneda = MonedaBackup WHERE Moneda IS NULL';

    -- 6. Eliminar columna MonedaBackup si existe
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_name = 'pais' AND column_name = 'monedabackup'
    ) THEN
        ALTER TABLE Pais DROP COLUMN MonedaBackup;
    END IF;
END$$;
*/


--Consultar Pais
SELECT *
	FROM Pais
	ORDER BY Id;
--Consultar Moneda	
SELECT*
	FROM Moneda