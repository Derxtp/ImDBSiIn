CREATE TABLE LICENCIAS_EMPLEADOS (
    Id_empleado INT,
    Licencia VARCHAR(10)
);

INSERT INTO LICENCIAS_EMPLEADOS VALUES
(1001, 'Tipo A'),
(1001, 'Tipo B'),
(1001, 'Tipo C'),
(2002, 'Tipo A'),
(2002, 'Tipo B'),
(2002, 'Tipo C'),
(3003, 'Tipo D'),
(3003, 'Tipo D'),
(4004, 'Tipo A'),
(4004, 'Tipo B'),
(4004, 'Tipo D'),
(5005, 'Tipo A'),
(5005, 'Tipo B'),
(5005, 'Tipo D');


SELECT
    A.Id_empleado AS Empleado1,
    B.Id_empleado AS Empleado2,
    COUNT(A.Licencia) AS Coincidencias
FROM 
    LICENCIAS_EMPLEADOS A
JOIN 
    LICENCIAS_EMPLEADOS B
ON 
    A.Licencia = B.Licencia AND A.Id_empleado != B.Id_empleado
GROUP BY 
    A.Id_empleado, B.Id_empleado
HAVING 
    Coincidencias > 0;