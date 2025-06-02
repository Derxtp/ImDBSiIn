-- script usado :

CREATE TABLE SintaxisTabla (
    Sintaxis VARCHAR(50)
);

INSERT INTO SintaxisTabla (Sintaxis) VALUES ('SELECT');
INSERT INTO SintaxisTabla (Sintaxis) VALUES ('Producto,');
INSERT INTO SintaxisTabla (Sintaxis) VALUES ('Precio,');
INSERT INTO SintaxisTabla (Sintaxis) VALUES ('Disponibilidad,');
INSERT INTO SintaxisTabla (Sintaxis) VALUES ('FROM');
INSERT INTO SintaxisTabla (Sintaxis) VALUES ('Productos');
INSERT INTO SintaxisTabla (Sintaxis) VALUES ('WHERE');
INSERT INTO SintaxisTabla (Sintaxis) VALUES ('Precio');
INSERT INTO SintaxisTabla (Sintaxis) VALUES ('>100');


SELECT GROUP_CONCAT(Sintaxis SEPARATOR ' ') AS SentenciaSQL
FROM (
    SELECT 'SELECT' AS Sintaxis
    UNION ALL SELECT 'Producto,'
    UNION ALL SELECT 'Precio,'
    UNION ALL SELECT 'Disponibilidad,'
    UNION ALL SELECT 'FROM'
    UNION ALL SELECT 'Productos'
    UNION ALL SELECT 'WHERE'
    UNION ALL SELECT 'Precio'
    UNION ALL SELECT '>100'
) AS SintaxisTabla;

-- consola :


mysql> select * from SintaxisTabla;
+-----------------+
| Sintaxis        |
+-----------------+
| SELECT          |
| Producto,       |
| Precio,         |
| Disponibilidad, |
| FROM            |
| Productos       |
| WHERE           |
| Precio          |
| >100            |
+-----------------+
9 rows in set (0.00 sec)

mysql> 
mysql> SELECT GROUP_CONCAT(Sintaxis SEPARATOR ' ') AS SentenciaSQL
    -> FROM (
    ->     SELECT 'SELECT' AS Sintaxis
    ->     UNION ALL SELECT 'Producto,'
    ->     UNION ALL SELECT 'Precio,'
    ->     UNION ALL SELECT 'Disponibilidad,'
    ->     UNION ALL SELECT 'FROM'
    ->     UNION ALL SELECT 'Productos'
    ->     UNION ALL SELECT 'WHERE'
    ->     UNION ALL SELECT 'Precio'
    ->     UNION ALL SELECT '>100'
    -> ) AS SintaxisTabla;
+---------------------------------------------------------------------------+
| SentenciaSQL                                                              |
+---------------------------------------------------------------------------+
| SELECT Producto, Precio, Disponibilidad, FROM Productos WHERE Precio >100 |
+---------------------------------------------------------------------------+
1 row in set (0.00 sec)