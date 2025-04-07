CREATE TABLE  Registro_de_proceso_indeterminado (
    Flujo VARCHAR(10),
    Paso int(10) NOT NULL,
    Estado VARCHAR(10)
);

INSERT INTO 
Registro_de_proceso_indeterminado
VALUES
('Alpha',1,'Error'),
('Alpha',2,'Finalizado'),
('Alpha',3,'Corriendo'),
('Bravo',1,'Finalizado'),
('Bravo',2,'Finalizado'),
('Charlie',1,'Corriendo'),
('Charlie',2,'Corriendo'),
('Delta',1,'Error'),
('Delta',2,'Error'),
('Echo',1,'Corriendo'),
('Echo',2,'Finalizado');

-- (1) Limpieza de la tabla si es que ya existe
DROP TABLE IF EXISTS Registro_de_proceso_indeterminado;

-- (2) Creación de la tabla
CREATE TABLE Registro_de_proceso_indeterminado (
    Flujo VARCHAR(10),
    Paso INT(10) NOT NULL,
    Estado VARCHAR(10)
);


INSERT INTO Registro_de_proceso_indeterminado (Flujo, Paso, Estado)
VALUES
    ('Alpha', 1, 'Error'),
    ('Alpha', 2, 'Finalizado'),
    ('Alpha', 3, 'Corriendo'),
    ('Bravo', 1, 'Finalizado'),
    ('Bravo', 2, 'Finalizado'),
    ('Charlie', 1, 'Corriendo'),
    ('Charlie', 2, 'Corriendo'),
    ('Delta', 1, 'Error'),
    ('Delta', 2, 'Error'),
    ('Echo', 1, 'Corriendo'),
    ('Echo', 2, 'Finalizado');

-- (4) Consulta para obtener el estado general esperado de cada flujo
SELECT 
    Flujo,
    CASE
        -- Si todos los pasos tienen el mismo estado, se muestra ese estado.
        WHEN COUNT(DISTINCT Estado) = 1 THEN MIN(Estado)
        -- Si alguno tiene Error junto con otros estados, se asigna "Indeterminado".
        WHEN SUM(CASE WHEN Estado = 'Error' THEN 1 ELSE 0 END) > 0 THEN 'Indeterminado'
        -- Si no hay Error y hay combinación de Finalizado y Corriendo, se asigna "Corriendo".
        ELSE 'Corriendo'
    END AS Estado
FROM Registro_de_proceso_indeterminado
GROUP BY Flujo;






SELECT 
    Flujo,
    CASE
                WHEN COUNT(DISTINCT Estado) = 1 THEN MIN(Estado)
        
        WHEN SUM(CASE WHEN Estado = 'Error' THEN 1 ELSE 0 END) > 0 THEN 'Indeterminado'
                ELSE 'Corriendo'
    END AS Estado
FROM Registro_de_proceso_indeterminado
GROUP BY Flujo;