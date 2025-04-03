CREATE TABLE TestCases (
    Caso VARCHAR(10) NOT NULL
);

INSERT INTO TestCases (Caso) VALUES 
('A'),
('B'),
('C');

WITH RECURSIVE Permutas AS (
    -- Paso inicial: Cada elemento será la base de una permutación
    SELECT 
        Caso AS permutacion,
        Caso AS usados,
        1 AS nivel
    FROM TestCases
    UNION ALL
    -- Iteraciones recursivas: Agregar elementos no usados
    SELECT 
        CONCAT(p.permutacion, ',', t.Caso) AS permutacion,
        CONCAT(p.usados, ',', t.Caso) AS usados,
        p.nivel + 1 AS nivel
    FROM Permutas p
    JOIN TestCases t
        ON FIND_IN_SET(t.Caso, p.usados) = 0
)
-- Resultado final: Mostrar las permutaciones completas (de longitud igual al total de elementos)
SELECT permutacion
FROM Permutas
WHERE nivel = (SELECT COUNT(*) FROM TestCases)
ORDER BY permutacion;