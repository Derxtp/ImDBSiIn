
DROP TABLE IF EXISTS Astronautas;


CREATE TABLE Datos (
    Categoria CHAR(1),
    Valor INT
);


INSERT INTO Datos (Categoria, Valor) VALUES
    ('A', 10),
    ('A', 15),
    ('A', 5),
    ('B', 8),
    ('B', 12),
    ('B', 20),
    ('C', 18),
    ('C', 25),
    ('C', 30);


SELECT Categoria, SUM(Valor) AS Total
FROM Datos
GROUP BY Categoria
HAVING SUM(Valor) > 20;


--- la consola:



mysql> 
mysql> INSERT INTO Datos (Categoria, Valor) VALUES
    ->     ('A', 10),
    ->     ('A', 15),
    ->     ('A', 5),
    ->     ('B', 8),
    ->     ('B', 12),
    ->     ('B', 20),
    ->     ('C', 18),
    ->     ('C', 25),
    ->     ('C', 30);
Query OK, 9 rows affected (0.10 sec)
Records: 9  Duplicates: 0  Warnings: 0

mysql> 
mysql> SELECT Categoria, SUM(Valor) AS Total
    -> FROM Datos
    -> GROUP BY Categoria
    -> HAVING SUM(Valor) > 20;
+-----------+-------+
| Categoria | Total |
+-----------+-------+
| A         |    30 |
| B         |    40 |
| C         |    73 |
+-----------+-------+
3 rows in set (0.00 sec)