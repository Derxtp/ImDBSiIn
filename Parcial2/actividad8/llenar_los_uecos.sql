-- Si la tabla ya existe, la eliminamos (nota: esta sintaxis es válida en SQL Server)
IF OBJECT_ID('rellenar_los_huecos', 'U') IS NOT NULL
    DROP TABLE rellenar_los_huecos;
GO

-- Creamos la tabla desde cero
CREATE TABLE rellenar_los_huecos (
    Fila INT PRIMARY KEY,
    Aplicacion VARCHAR(50) NULL,
    Estado VARCHAR(50) NOT NULL
);
GO

-- Insertamos los datos iniciales
INSERT INTO rellenar_los_huecos (Fila, Aplicacion, Estado)
VALUES
    (1, 'Web',     'Aprobado'),
    (2, NULL,      'Fallo'),
    (3, NULL,      'Fallo'),
    (4, NULL,      'Fallo'),
    (5, 'App',     'Aprobado'),
    (6, NULL,      'Fallo'),
    (7, NULL,      'Fallo'),
    (8, NULL,      'Aprobado'),
    (9, NULL,      'Aprobado'),
    (10, 'RESTAPI','Fallo'),
    (11, NULL,     'Fallo'),
    (12, NULL,     'Fallo');
GO


WITH cte AS (
    SELECT 
        Fila,
        Aplicacion,
        Estado,
        
        COUNT(Aplicacion) OVER (ORDER BY Fila) AS grupo
    FROM rellenar_los_huecos
)
SELECT 
    Fila,
    COALESCE(Aplicacion, MAX(Aplicacion) OVER (PARTITION BY grupo)) AS Aplicacion,
    Estado
FROM cte
ORDER BY Fila;


-- consola 


+------+------------+----------+
| Fila | Aplicacion | Estado   |
+------+------------+----------+
|    1 | Web        | Aprobado |
|    2 | Web        | Fallo    |
|    3 | Web        | Fallo    |
|    4 | Web        | Fallo    |
|    5 | App        | Aprobado |
|    6 | App        | Fallo    |
|    7 | App        | Fallo    |
|    8 | App        | Aprobado |
|    9 | App        | Aprobado |
|   10 | RESTAPI    | Fallo    |
|   11 | RESTAPI    | Fallo    |
|   12 | RESTAPI    | Fallo    |
+------+------------+----------+
12 rows in set (0.01 sec)