





CREATE TABLE eliminar_los_duplicados (valor INTEGER);

INSERT INTO eliminar_los_duplicados VALUES (1), (1), (2), (3), (3), (4);


CREATE TABLE muestra (valor INTEGER);


INSERT INTO muestra (valor)
SELECT DISTINCT valor FROM eliminar_los_duplicados;


ALTER TABLE muestra RENAME TO eliminar_los_duplicados;

-- consola 

mysql> SELECT * FROM muestra;
+-------+
| valor |
+-------+
|     1 |
|     2 |
|     3 |
|     4 |
+-------+
4 rows in set (0.00 sec)