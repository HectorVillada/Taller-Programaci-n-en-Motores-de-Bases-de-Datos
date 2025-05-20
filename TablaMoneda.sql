--Crear la tabla Moneda:


CREATE TABLE Moneda (
    Id INT PRIMARY KEY,
    Moneda VARCHAR(255),
    Sigla VARCHAR(10),
    Imagen VARCHAR(255)
);

-- Insertar registros en la tabla Moneda
INSERT INTO Moneda (Id, Moneda, Sigla) VALUES (1, 'PESO COLOMBIANO', 'COP');
INSERT INTO Moneda (Id, Moneda, Sigla) VALUES (2, 'PESO ARGENTINO', 'ARS');
INSERT INTO Moneda (Id, Moneda, Sigla) VALUES (3, 'PESO BOLIVIANO', 'BOB');
INSERT INTO Moneda (Id, Moneda, Sigla) VALUES (4, 'REAL', 'BRL');
INSERT INTO Moneda (Id, Moneda, Sigla) VALUES (5, 'DOLAR CANADIENSE', 'CAD');
INSERT INTO Moneda (Id, Moneda, Sigla) VALUES (6, 'COLON', 'CRC');
INSERT INTO Moneda (Id, Moneda, Sigla) VALUES (7, 'PESO DOMINICANO', 'DOP');
INSERT INTO Moneda (Id, Moneda, Sigla) VALUES (8, 'DOLAR', 'USD'); -- Asumiendo que CUBA usa el dólar estadounidense
INSERT INTO Moneda (Id, Moneda, Sigla) VALUES (9, 'PESO CHILENO', 'CLP');
INSERT INTO Moneda (Id, Moneda, Sigla) VALUES (10, 'QUETZAL', 'GTQ');
INSERT INTO Moneda (Id, Moneda, Sigla) VALUES (11, 'PESO', 'HNL'); -- Asumiendo que HONDURAS usa "PESO" como se indicó
INSERT INTO Moneda (Id, Moneda, Sigla) VALUES (12, 'PESO MEXICANO', 'MXN');
INSERT INTO Moneda (Id, Moneda, Sigla) VALUES (13, 'PESO', 'NIO'); -- Asumiendo que NICARAGUA usa "PESO" como se indicó
INSERT INTO Moneda (Id, Moneda, Sigla) VALUES (14, 'BALBOA', 'PAB');
INSERT INTO Moneda (Id, Moneda, Sigla) VALUES (15, 'GUARANI', 'PYG');
INSERT INTO Moneda (Id, Moneda, Sigla) VALUES (16, 'NUEVO SOL', 'PEN');
INSERT INTO Moneda (Id, Moneda, Sigla) VALUES (17, 'PESO URUGUAYO', 'UYU');
INSERT INTO Moneda (Id, Moneda, Sigla) VALUES (18, 'NUEVO BOLIVAR', 'VEF');
INSERT INTO Moneda (Id, Moneda, Sigla) VALUES (19, 'LIBRA', 'GBP'); -- Asumiendo que "LIBRA " se refiere a Libra Esterlina
INSERT INTO Moneda (Id, Moneda, Sigla) VALUES (20, 'EURO', 'EUR');
INSERT INTO Moneda (Id, Moneda, Sigla) VALUES (21, 'DOLAR AUSTRALIANO', 'AUD');

--la columna Sigla coincide con una moneda específica y luego establece 
--el valor de la columna Imagen a la ruta del archivo de imagen correspondiente.
UPDATE Moneda SET Imagen = '/imagenes/Sigla/COP.png' WHERE Sigla = 'COP';
UPDATE Moneda SET Imagen = '/imagenes/Sigla/ARS.png' WHERE Sigla = 'ARS';
UPDATE Moneda SET Imagen = '/imagenes/Sigla/BOB.png' WHERE Sigla = 'BOB';
UPDATE Moneda SET Imagen = '/imagenes/Sigla/BRL.png' WHERE Sigla = 'BRL';
UPDATE Moneda SET Imagen = '/imagenes/Sigla/CAD.png' WHERE Sigla = 'CAD';
UPDATE Moneda SET Imagen = '/imagenes/Sigla/CRC.png' WHERE Sigla = 'CRC';
UPDATE Moneda SET Imagen = '/imagenes/Sigla/DOP.png' WHERE Sigla = 'DOP';
UPDATE Moneda SET Imagen = '/imagenes/Sigla/USD.png' WHERE Sigla = 'USD';
UPDATE Moneda SET Imagen = '/imagenes/Sigla/CLP.png' WHERE Sigla = 'CLP';
UPDATE Moneda SET Imagen = '/imagenes/Sigla/GTQ.png' WHERE Sigla = 'GTQ';
UPDATE Moneda SET Imagen = '/imagenes/Sigla/HNL.png' WHERE Sigla = 'HNL';
UPDATE Moneda SET Imagen = '/imagenes/Sigla/MXN.png' WHERE Sigla = 'MXN';
UPDATE Moneda SET Imagen = '/imagenes/Sigla/NIO.png' WHERE Sigla = 'NIO';
UPDATE Moneda SET Imagen = '/imagenes/Sigla/PAB.png' WHERE Sigla = 'PAB';
UPDATE Moneda SET Imagen = '/imagenes/Sigla/PYG.png' WHERE Sigla = 'PYG';
UPDATE Moneda SET Imagen = '/imagenes/Sigla/PEN.png' WHERE Sigla = 'PEN';
UPDATE Moneda SET Imagen = '/imagenes/Sigla/UYU.png' WHERE Sigla = 'UYU';
UPDATE Moneda SET Imagen = '/imagenes/Sigla/VEF.png' WHERE Sigla = 'VEF';
UPDATE Moneda SET Imagen = '/imagenes/Sigla/GBP.png' WHERE Sigla = 'GBP';
UPDATE Moneda SET Imagen = '/imagenes/Sigla/EUR.png' WHERE Sigla = 'EUR';
UPDATE Moneda SET Imagen = '/imagenes/Sigla/AUD.png' WHERE Sigla = 'AUD';