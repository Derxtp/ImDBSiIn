--script usado:
CREATE TABLE directorio_telefonico (
    customer_ID INT(5),
    type_phone VARCHAR(10),
    Number_ VARCHAR(20)
);

INSERT INTO directorio_telefonico (customer_ID, type_phone, Number_)
VALUES
(1001, 'Celular', '333-897-5421'),
(1001, 'Trabajo', '333-897-6542'),
(1001, 'Casa',    '333-688-9874'),
(2002, 'Celular', '333-963-6544'),
(2002, 'Trabajo', '333-812-9856'),
(3003, 'Celular', '333-987-6541');

SELECT 
    customer_ID,
    MAX(CASE WHEN type_phone = 'Celular' THEN Number_ END) AS Celular,
    MAX(CASE WHEN type_phone = 'Trabajo' THEN Number_ END) AS Trabajo,
    MAX(CASE WHEN type_phone = 'Casa' THEN Number_ END) AS Casa
FROM directorio_telefonico
GROUP BY customer_ID;

---- la consola:


mysql> select * from directorio_telefonico;
+-------------+------------+--------------+
| customer_ID | type_phone | Number_      |
+-------------+------------+--------------+
|        1001 | Celular    | 333-897-5421 |
|        1001 | Trabajo    | 333-897-6542 |
|        1001 | Casa       | 333-688-9874 |
|        2002 | Celular    | 333-963-6544 |
|        2002 | Trabajo    | 333-812-9856 |
|        3003 | Celular    | 333-987-6541 |
+-------------+------------+--------------+
6 rows in set (0.00 sec)

mysql> SELECT 
    ->     customer_ID,
    ->     MAX(CASE WHEN type_phone = 'Celular' THEN Number_ END) AS Celular,
    ->     MAX(CASE WHEN type_phone = 'Trabajo' THEN Number_ END) AS Trabajo,
    ->     MAX(CASE WHEN type_phone = 'Casa' THEN Number_ END) AS Casa
    -> FROM directorio_telefonico
    -> GROUP BY customer_ID;
+-------------+--------------+--------------+--------------+
| customer_ID | Celular      | Trabajo      | Casa         |
+-------------+--------------+--------------+--------------+
|        1001 | 333-897-5421 | 333-897-6542 | 333-688-9874 |
|        2002 | 333-963-6544 | 333-812-9856 | NULL         |
|        3003 | 333-987-6541 | NULL         | NULL         |
+-------------+--------------+--------------+--------------+
3 rows in set (0.00 sec)