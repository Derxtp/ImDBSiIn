-- script usado:

CREATE TABLE Promedio_de_ventas_mensuales (
    id_orden INT,
    id_cliente INT,
    Fecha DATE,
    Total DECIMAL(10,2),
    Estado VARCHAR(10)
);

INSERT INTO Promedio_de_ventas_mensuales (id_orden, id_cliente, Fecha, Total, Estado)
VALUES
(1, 1001, '01/01/2025', 100, 'JAL'),
(2, 1001, '01/01/2025', 150, 'JAL'),
(3, 1001, '01/01/2025', 75, 'JAL'),
(4, 1001, '02/01/2025', 100,'JAL'),
(5, 1001, '03/01/2025', 100, 'JAL'),
(6, 2002, '02/01/2025', 75, 'JAL'),
(7, 2002, '02/01/2025', 150, 'JAL'),
(8, 3003, '01/01/2025', 100, 'CDMX'),
(9, 3003, '02/01/2025', 100, 'CDMX'),
(10, 3003, '03/01/2025', 100, 'CDMX'),
(11, 4004, '04/01/2025', 100, 'CDMX'),
(12, 4004, '05/01/2025', 50, 'CDMX'),
(13, 4004, '05/01/2025', 100, 'CDMX');

SELECT Estado
FROM (
   
    SELECT Estado, Id_cliente, AVG(Total) AS Promedio
    FROM Promedio_de_ventas_mensuales
    GROUP BY Estado, Id_cliente
) AS ClientesPromedio
GROUP BY Estado
HAVING MIN(Promedio) > 100;

SELECT Estado, Id_cliente, AVG(Total) AS Promedio
FROM Promedio_de_ventas_mensuales
GROUP BY Estado, Id_cliente

SELECT Estado
FROM ( ... ) AS ClientesPromedio
GROUP BY Estado
HAVING MIN(Promedio) > 100;


-- la consola:


mysql> SELECT Estado
    -> FROM (
    ->    
    ->     SELECT Estado, Id_cliente, AVG(Total) AS Promedio
    ->     FROM Promedio_de_ventas_mensuales
    ->     GROUP BY Estado, Id_cliente
    -> ) AS ClientesPromedio
    -> GROUP BY Estado
    -> HAVING MIN(Promedio) > 100;
+--------+
| Estado |
+--------+
| JAL    |
+--------+
1 row in set (0.01 sec)

mysql> 
mysql> select * from Promedio_de_ventas_mensuales;
+----------+------------+------------+--------+--------+
| id_orden | id_cliente | Fecha      | Total  | Estado |
+----------+------------+------------+--------+--------+
|        1 |       1001 | 0000-00-00 | 100.00 | JAL    |
|        2 |       1001 | 0000-00-00 | 150.00 | JAL    |
|        3 |       1001 | 0000-00-00 |  75.00 | JAL    |
|        4 |       1001 | 0000-00-00 | 100.00 | JAL    |
|        5 |       1001 | 0000-00-00 | 100.00 | JAL    |
|        6 |       2002 | 0000-00-00 |  75.00 | JAL    |
|        7 |       2002 | 0000-00-00 | 150.00 | JAL    |
|        8 |       3003 | 0000-00-00 | 100.00 | CDMX   |
|        9 |       3003 | 0000-00-00 | 100.00 | CDMX   |
|       10 |       3003 | 0000-00-00 | 100.00 | CDMX   |
|       11 |       4004 | 0000-00-00 | 100.00 | CDMX   |
|       12 |       4004 | 0000-00-00 |  50.00 | CDMX   |
|       13 |       4004 | 0000-00-00 | 100.00 | CDMX   |
+----------+------------+------------+--------+--------+
13 rows in set (0.00 sec)