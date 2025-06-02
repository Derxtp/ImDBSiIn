
-- el script usado:
CREATE TABLE volver_al_fututop (
    Inicio DATE,
    Final DATE
);

INSERT INTO volver_al_fututop (Inicio, Final) VALUES
    ('2025-01-01', '2025-01-05'),
    ('2025-01-03', '2025-01-09'),
    ('2025-01-10', '2025-01-11'),
    ('2025-01-12', '2025-01-16'),
    ('2025-01-15', '2025-01-19');

WITH cte AS (
  SELECT 
    Inicio,
    Final,
    CASE 
      WHEN LAG(Final) OVER (ORDER BY Inicio) IS NULL THEN 1
      WHEN Inicio > LAG(Final) OVER (ORDER BY Inicio) THEN 1
      ELSE 0
    END AS nueva_isla
  FROM volver_al_fututop
),
islas AS (
  SELECT 
    Inicio,
    Final,
    SUM(nueva_isla) OVER (ORDER BY Inicio ROWS UNBOUNDED PRECEDING) AS id_isla
  FROM cte
)
SELECT 
  MIN(Inicio) AS Inicio,
  MAX(Final) AS Final
FROM islas
GROUP BY id_isla
ORDER BY MIN(Inicio);


-- la consola:

+------------+------------+
| Inicio     | Final      |
+------------+------------+
| 2025-01-01 | 2025-01-09 |
| 2025-01-10 | 2025-01-11 |
| 2025-01-12 | 2025-01-19 |
+------------+------------+
3 rows in set (0.00 sec)

mysql> select * from volver_al_fututop;
+------------+------------+
| Inicio     | Final      |
+------------+------------+
| 2025-01-01 | 2025-01-05 |
| 2025-01-03 | 2025-01-09 |
| 2025-01-10 | 2025-01-11 |
| 2025-01-12 | 2025-01-16 |
| 2025-01-15 | 2025-01-19 |
+------------+------------+
5 rows in set (0.00 sec)