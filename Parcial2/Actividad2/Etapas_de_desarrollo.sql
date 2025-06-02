
-----script utilizado:
CREATE TABLE Etapas_de_Desarrollo (
    Desarrollo VARCHAR(20),
    Etapa INT NOT NULL,
    Finalizado DATE
);

INSERT INTO Etapas_de_Desarrollo (Desarrollo, Etapa, Finalizado)
VALUES
  ('RestAPI', 1, STR_TO_DATE('01/02/2024','%d/%m/%Y')),
  ('RestAPI', 2, STR_TO_DATE('30/05/2024','%d/%m/%Y')),
  ('RestAPI', 3, STR_TO_DATE('29/06/2024','%d/%m/%Y')),
  ('Web', 1, STR_TO_DATE('28/10/2024','%d/%m/%Y')),
  ('Web', 2, STR_TO_DATE('20/11/2024','%d/%m/%Y')),
  ('Web', 3, NULL),   --importante, etapa sin finalizar se inserta null por que si o no sirve y explota la chingadera
  ('App', 1, STR_TO_DATE('30/01/2025','%d/%m/%Y')),
  ('App', 2, NULL);   --estapa sin finalizar
 

SELECT DISTINCT Desarrollo
FROM Etapas_de_Desarrollo
WHERE Finalizado IS NULL;

--la consola:
mysql> select * from Etapas_de_Desarrollo;
+------------+-------+------------+
| Desarrollo | Etapa | Finalizado |
+------------+-------+------------+
| RestAPI    |     1 | 2024-02-01 |
| RestAPI    |     2 | 2024-05-30 |
| RestAPI    |     3 | 2024-06-29 |
| Web        |     1 | 2024-10-28 |
| Web        |     2 | 2024-11-20 |
| Web        |     3 | NULL       |
| App        |     1 | 2025-01-30 |
| App        |     2 | NULL       |
+------------+-------+------------+
8 rows in set (0.01 sec)

mysql> 
mysql> SELECT DISTINCT Desarrollo
    -> FROM Etapas_de_Desarrollo
    -> WHERE Finalizado IS NULL;
+------------+
| Desarrollo |
+------------+
| Web        |
| App        |
+------------+
2 rows in set (0.01 sec)