-- script usado :
CREATE TABLE desagrupacion (
    Producto VARCHAR(50),
    Cantidad INT
);


INSERT INTO desagrupacion (Producto, Cantidad) VALUES ('Lápiz', 3);
INSERT INTO desagrupacion (Producto, Cantidad) VALUES ('Borrador', 4);
INSERT INTO desagrupacion (Producto, Cantidad) VALUES ('Cuaderno', 2);

SELECT Producto, 1 AS Cantidad
FROM desagrupacion
JOIN (
    SELECT 1 AS num
    UNION ALL SELECT 2
    UNION ALL SELECT 3
    UNION ALL SELECT 4
) AS Numeros ON Numeros.num <= desagrupacion.Cantidad;


-- consola:


mysql> SELECT Producto, 1 AS Cantidad
    -> FROM desagrupacion
    -> JOIN (
    ->     SELECT 1 AS num
    ->     UNION ALL SELECT 2
    ->     UNION ALL SELECT 3
    ->     UNION ALL SELECT 4
    -> ) AS Numeros ON Numeros.num <= desagrupacion.Cantidad;
+----------+----------+
| Producto | Cantidad |
+----------+----------+
| Cuaderno |        1 |
| Borrador |        1 |
| Lápiz    |        1 |
| Cuaderno |        1 |
| Borrador |        1 |
| Lápiz    |        1 |
| Borrador |        1 |
| Lápiz    |        1 |
| Borrador |        1 |
+----------+----------+
9 rows in set (0.00 sec)

mysql> select * from desagrupacion;
+----------+----------+
| Producto | Cantidad |
+----------+----------+
| Lápiz    |        3 |
| Borrador |        4 |
| Cuaderno |        2 |
+----------+----------+
3 rows in set (0.00 sec)