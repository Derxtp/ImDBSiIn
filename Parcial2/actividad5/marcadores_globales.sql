-- script usado :
CREATE TABLE Marcadores (
    JugadorA INT,
    JugadorB INT,
    Marcador INT
);

INSERT INTO Marcadores (JugadorA, JugadorB, Marcador) VALUES (1001, 2002, 150);
INSERT INTO Marcadores (JugadorA, JugadorB, Marcador) VALUES (3003, 4004, 15);
INSERT INTO Marcadores (JugadorA, JugadorB, Marcador) VALUES (4004, 3003, 125);


SELECT JugadorA, JugadorB, SUM(Marcador) AS Marcador
FROM Marcadores
GROUP BY JugadorA, JugadorB;



SELECT JugadorA, JugadorB, SUM(Marcador) AS Marcador
FROM (
    SELECT JugadorA, JugadorB, Marcador FROM Marcadores
    UNION ALL
    SELECT JugadorB AS JugadorA, JugadorA AS JugadorB, Marcador FROM Marcadores
) AS Consolidado
WHERE JugadorA < JugadorB
GROUP BY JugadorA, JugadorB;





-- consola :

mysql> 
mysql> SELECT JugadorA, JugadorB, SUM(Marcador) AS Marcador
    -> FROM Marcadores
    -> GROUP BY JugadorA, JugadorB;
+----------+----------+----------+
| JugadorA | JugadorB | Marcador |
+----------+----------+----------+
|     1001 |     2002 |      150 |
|     3003 |     4004 |       15 |
|     4004 |     3003 |      125 |
+----------+----------+----------+
3 rows in set (0.00 sec)



mysql> SELECT JugadorA, JugadorB, SUM(Marcador) AS Marcador
    -> FROM (
    ->     SELECT JugadorA, JugadorB, Marcador FROM Marcadores
    ->     UNION ALL
    ->     SELECT JugadorB AS JugadorA, JugadorA AS JugadorB, Marcador FROM Marcadores
    -> ) AS Consolidado
    -> WHERE JugadorA < JugadorB
    -> GROUP BY JugadorA, JugadorB;
+----------+----------+----------+
| JugadorA | JugadorB | Marcador |
+----------+----------+----------+
|     1001 |     2002 |      150 |
|     3003 |     4004 |      140 |
+----------+----------+----------+
2 rows in set (0.01 sec)

