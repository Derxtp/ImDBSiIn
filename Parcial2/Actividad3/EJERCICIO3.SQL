CREATE TABLE CONJUNTO_ENTEROS (
    Entero INT NOT NULL
);

INSERT INTO CONJUNTO_ENTEROS (Entero) VALUES 
(5),
(6),
(10),
(10),
(13),
(14),
(17),
(20),
(81),
(90),
(76);


-- Media (Promedio)
SELECT AVG(Entero) AS Media
FROM CONJUNTO_ENTEROS;

-- Mediana (Valor central)
SELECT Entero AS Mediana
FROM (
    SELECT Entero, ROW_NUMBER() OVER (ORDER BY Entero) AS fila,
           COUNT(*) OVER () AS total
    FROM CONJUNTO_ENTEROS
) subconsulta
WHERE fila IN (CEIL(total / 2), FLOOR((total + 1) / 2));

-- Moda (Número más frecuente)
SELECT Entero AS Moda
FROM CONJUNTO_ENTEROS
GROUP BY Entero
ORDER BY COUNT(*) DESC, Entero
LIMIT 1;

-- Rango (Máximo - Mínimo)
SELECT (MAX(Entero) - MIN(Entero)) AS Rango
FROM CONJUNTO_ENTEROS;