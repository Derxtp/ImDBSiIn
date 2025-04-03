CREATE TABLE FLUJOS_DE_TRABAJO (
    Flujo varchar(20),
    Caso_1 int(10) NOT NULL,
    Caso_2 int(10) NOT Null,
    Caso_3 int(10) NOT Null
);

INSERT INTO FLUJOS_DE_TRABAJO VALUES
('Alta de usuario',0,0,0),
('Baja de usuario',0,1,1),
('Nueva Orden',1,0,0),
('Eliminar Orden',0,0,0);

SELECT 
    Flujo, 
    (Caso_1 + Caso_2 + Caso_3) AS Aprobado
FROM 
    FLUJOS_DE_TRABAJO;