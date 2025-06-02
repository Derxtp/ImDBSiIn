CREATE TABLE EMPLEADOS (
	id_Empleado INT(16) NOT NULL,
    id_Gerente INT(16) NULL,
    Puesto VARCHAR(16) NOT NULL,
	PRIMARY KEY(id_Empleado, Puesto)
);

INSERT INTO 
EMPLEADOS 
VALUES 
(1001,0,'Presidente'),
(2002,'1001','Director'),
(3003,'1001','Gerente'),
(4004,'2002','Ingeniero'),
(5005,'2002','Contador'),
(6006,'2002','Administrador');


SELECT e.Id_empleado, e.Id_gerente, e.Puesto,
CASE 
WHEN e.Id_gerente IS 0 THEN 0
WHEN e.Id_gerente = 1001 THEN 1
ELSE 2
END AS Nivel 
FROM EMPLEADOS e
ORDER BY Nivel, Id_gerente;


CREATE TABLE Predicados (
id_cliente INT(16) NOT NULL,
id_Orden INT(16) NOT NULL,
Estado_Destino VARCHAR(16),
Costo VARCHAR(16)
);


INSERT INTO Predicados VALUES
(1001,'2','CDMX','$400'),
(1001,'3','CDMX','$545'),
(1001,'4','CDMX','$321');