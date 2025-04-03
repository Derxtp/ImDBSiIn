CREATE TABLE Inventario (
    Fecha DATE NOT NULL,
    Ajuste INT NOT NULL
);

INSERT INTO Inventario (Fecha, Ajuste) VALUES 
(STR_TO_DATE('03/01/2025', '%m/%d/%Y'), 100),
(STR_TO_DATE('04/01/2025', '%m/%d/%Y'), 75),
(STR_TO_DATE('05/01/2025', '%m/%d/%Y'), -150),
(STR_TO_DATE('06/01/2025', '%m/%d/%Y'), 50),
(STR_TO_DATE('07/01/2025', '%m/%d/%Y'), -70);


SELECT 
    Fecha,
    Ajuste,
    SUM(Ajuste) OVER (ORDER BY Fecha) AS Inventario
FROM 
    Inventario;