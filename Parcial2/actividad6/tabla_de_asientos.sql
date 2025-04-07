

-- script usado:
CREATE TABLE asientos (
  num_asiento INT PRIMARY KEY
);


INSERT INTO asientos (num_asiento) VALUES
  (7),
  (13), (14), (15),
  (27), (28), (29), (30), (31), (32), (33), (34), (35),
  (52), (53), (54);

  WITH RECURSIVE numeros AS (
  SELECT 1 AS num
  UNION ALL
  SELECT num + 1 FROM numeros
  WHERE num < (SELECT MAX(num_asiento) FROM asientos)
),
libres AS (
  SELECT num
  FROM numeros
  WHERE num NOT IN (SELECT num_asiento FROM asientos)
),
grupos AS (
  SELECT 
    num,
    num - ROW_NUMBER() OVER (ORDER BY num) AS grupo
  FROM libres
)
SELECT 
  MIN(num) AS espacio_inicio, 
  MAX(num) AS espacio_final
FROM grupos
GROUP BY grupo
ORDER BY espacio_inicio;

WITH RECURSIVE numeros AS (
  SELECT 1 AS num
  UNION ALL
  SELECT num + 1 FROM numeros
  WHERE num < (SELECT MAX(num_asiento) FROM asientos)
)
SELECT COUNT(*) AS disponibles
FROM numeros
WHERE num NOT IN (SELECT num_asiento FROM asientos);

SELECT 
  CASE 
     WHEN num_asiento % 2 = 0 THEN 'pares' 
     ELSE 'impares'
  END AS tipo,
  COUNT(*) AS total
FROM asientos
GROUP BY tipo;


-- en la consola :

mysql> WITH RECURSIVE numeros AS (
    ->   SELECT 1 AS num
    ->   UNION ALL
    ->   SELECT num + 1 FROM numeros
    ->   WHERE num < (SELECT MAX(num_asiento) FROM asientos)
    -> ),
    -> libres AS (
    ->   SELECT num
    ->   FROM numeros
    ->   WHERE num NOT IN (SELECT num_asiento FROM asientos)
    -> ),
    -> grupos AS (
    ->   SELECT 
    ->     num,
    ->     num - ROW_NUMBER() OVER (ORDER BY num) AS grupo
    ->   FROM libres
    -> )
    -> SELECT 
    ->   MIN(num) AS espacio_inicio, 
    ->   MAX(num) AS espacio_final
    -> FROM grupos
    -> GROUP BY grupo
    -> ORDER BY espacio_inicio;
+----------------+---------------+
| espacio_inicio | espacio_final |
+----------------+---------------+
|              1 |             6 |
|              8 |            12 |
|             16 |            26 |
|             36 |            51 |
+----------------+---------------+
4 rows in set (0.01 sec)


mysql> WITH RECURSIVE numeros AS (
    ->   SELECT 1 AS num
    ->   UNION ALL
    ->   SELECT num + 1 FROM numeros
    ->   WHERE num < (SELECT MAX(num_asiento) FROM asientos)
    -> )
    -> SELECT COUNT(*) AS disponibles
    -> FROM numeros
    -> WHERE num NOT IN (SELECT num_asiento FROM asientos);
+-------------+
| disponibles |
+-------------+
|          38 |
+-------------+
1 row in set (0.00 sec)


ysql> SELECT 
    ->   CASE 
    ->      WHEN num_asiento % 2 = 0 THEN 'pares' 
    ->      ELSE 'impares'
    ->   END AS tipo,
    ->   COUNT(*) AS total
    -> FROM asientos
    -> GROUP BY tipo;
+---------+-------+
| tipo    | total |
+---------+-------+
| impares |     9 |
| pares   |     7 |
+---------+-------+
2 rows in set (0.00 sec)

mysql> 