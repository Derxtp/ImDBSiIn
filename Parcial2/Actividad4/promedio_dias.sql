CREATE TABLE FlujosDeTrabajo (
    Desarrollo VARCHAR(20) NOT NULL,
    Terminacion DATE NOT NULL
);

INSERT INTO FlujosDeTrabajo (Desarrollo, Terminacion) VALUES 
('RestAPI', STR_TO_DATE('06/01/2024', '%m/%d/%Y')),
('RestAPI', STR_TO_DATE('06/14/2024', '%m/%d/%Y')),
('RestAPI', STR_TO_DATE('06/15/2024', '%m/%d/%Y')),
('Web', STR_TO_DATE('06/01/2024', '%m/%d/%Y')),
('Web', STR_TO_DATE('06/02/2024', '%m/%d/%Y')),
('Web', STR_TO_DATE('06/19/2024', '%m/%d/%Y')),
('App', STR_TO_DATE('05/15/2024', '%m/%d/%Y')),
('App', STR_TO_DATE('06/01/2024', '%m/%d/%Y')),
('App', STR_TO_DATE('06/30/2024', '%m/%d/%Y'));


WITH Diferencias AS (
    SELECT 
        Desarrollo,
        Terminacion,
        LAG(Terminacion) OVER (PARTITION BY Desarrollo ORDER BY Terminacion) AS FechaAnterior,
        DATEDIFF(Terminacion, LAG(Terminacion) OVER (PARTITION BY Desarrollo ORDER BY Terminacion)) AS DiasEntreIteraciones
    FROM FlujosDeTrabajo
)
SELECT 
    Desarrollo,
    ROUND(AVG(DiasEntreIteraciones)) AS Promedio
FROM Diferencias
WHERE FechaAnterior IS NOT NULL
GROUP BY Desarrollo;