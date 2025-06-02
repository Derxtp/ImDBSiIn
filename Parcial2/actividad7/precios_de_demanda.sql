-- script usado :

CREATE TABLE Precios (
    Id_producto INT,
    Fecha DATE,
    Precio DECIMAL(10,2)
);

INSERT INTO Precios (Id_producto, Fecha, Precio) VALUES 
  (1001, '2025-06-01', 75.00),
  (1001, '2025-06-08', 79.99), 
  (2002, '2025-05-10', 55.50),
  (2002, '2025-05-19', 59.99); 


SELECT p.Id_producto, p.Fecha, p.Precio
FROM Precios p
JOIN (
  SELECT Id_producto, MAX(Fecha) AS Fecha_Maxima
  FROM Precios
  GROUP BY Id_producto
) AS ultimas_actualizaciones 
  ON p.Id_producto = ultimas_actualizaciones.Id_producto
  AND p.Fecha = ultimas_actualizaciones.Fecha_Maxima;


-- consola :

mysql> select * from Precios;
+-------------+------------+--------+
| Id_producto | Fecha      | Precio |
+-------------+------------+--------+
|        1001 | 2025-06-01 |  75.00 |
|        1001 | 2025-06-08 |  79.99 |
|        2002 | 2025-05-10 |  55.50 |
|        2002 | 2025-05-19 |  59.99 |
+-------------+------------+--------+
4 rows in set (0.00 sec)

mysql> SELECT p.Id_producto, p.Fecha, p.Precio
    -> FROM Precios p
    -> JOIN (
    ->   SELECT Id_producto, MAX(Fecha) AS Fecha_Maxima
    ->   FROM Precios
    ->   GROUP BY Id_producto
    -> ) AS ultimas_actualizaciones 
    ->   ON p.Id_producto = ultimas_actualizaciones.Id_producto
    ->   AND p.Fecha = ultimas_actualizaciones.Fecha_Maxima;
+-------------+------------+--------+
| Id_producto | Fecha      | Precio |
+-------------+------------+--------+
|        1001 | 2025-06-08 |  79.99 |
|        2002 | 2025-05-19 |  59.99 |
+-------------+------------+--------+
2 rows in set (0.01 sec)