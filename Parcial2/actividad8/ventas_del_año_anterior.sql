CREATE TABLE ventas_anio_anterior (
    anio INT NOT NULL,
    cantidad DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (anio, cantidad)
);

INSERT INTO ventas_anio_anterior (anio, cantidad) VALUES
(2025, 352645),
(2024, 165565),
(2024, 254654),
(2023, 159521),
(2023, 251696),
(2023, 111894);

SELECT anio, SUM(cantidad) AS total
FROM ventas_anio_anterior
WHERE anio IN (2025, 2024, 2023)
GROUP BY anio
ORDER BY anio DESC;

-- consola 



mysql> CREATE TABLE ventas_anio_anterior (
    ->     anio INT NOT NULL,
    ->     cantidad DECIMAL(10, 2) NOT NULL,
    ->     PRIMARY KEY (anio, cantidad)
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql> INSERT INTO ventas_anio_anterior (anio, cantidad) VALUES
    -> (2025, 352645),
    -> (2024, 165565),
    -> (2024, 254654),
    -> (2023, 159521),
    -> (2023, 251696),
    -> (2023, 111894);
Query OK, 6 rows affected (0.01 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> SELECT anio, SUM(cantidad) AS total
    -> FROM ventas_anio_anterior
    -> WHERE anio IN (2025, 2024, 2023)
    -> GROUP BY anio
    -> ORDER BY anio DESC;
+------+-----------+
| anio | total     |
+------+-----------+
| 2025 | 352645.00 |
| 2024 | 420219.00 |
| 2023 | 523111.00 |
+------+-----------+
3 rows in set (0.01 sec)