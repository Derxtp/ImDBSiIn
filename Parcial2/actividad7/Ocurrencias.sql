

-- script usado:
CREATE TABLE ocurrencias (
    Proceso VARCHAR(20),
    Mensaje VARCHAR(100),
    Ocurrencia INT
);


INSERT INTO ocurrencias (Proceso, Mensaje, Ocurrencia) VALUES
    ('Web', 'Error: No se puede dividir por 0', 3),
    ('RestAPI', 'Error: Fallo la conversión', 5),
    ('App', 'Error: Fallo la conversión', 7),
    ('RestAPI', 'Error: Error sin identificar', 9),
    ('Web', 'Error: Error sin identificar', 1),
    ('App', 'Error: Error sin identificar', 10),
    ('Web', 'Estado Completado', 8),
    ('RestAPI', 'Estado Completado', 6);

SELECT Proceso, Mensaje, Ocurrencia
FROM ocurrencias AS l
WHERE Ocurrencia = (
    SELECT MAX(Ocurrencia)
    FROM ocurrencias AS sub
    WHERE sub.Mensaje = l.Mensaje
);


-- la consola;

mysql> SELECT Proceso, Mensaje, Ocurrencia
    -> FROM ocurrencias AS l
    -> WHERE Ocurrencia = (
    ->     SELECT MAX(Ocurrencia)
    ->     FROM ocurrencias AS sub
    ->     WHERE sub.Mensaje = l.Mensaje
    -> );
+---------+----------------------------------+------------+
| Proceso | Mensaje                          | Ocurrencia |
+---------+----------------------------------+------------+
| Web     | Error: No se puede dividir por 0 |          3 |
| App     | Error: Fallo la conversión       |          7 |
| App     | Error: Error sin identificar     |         10 |
| Web     | Estado Completado                |          8 |
+---------+----------------------------------+------------+
4 rows in set (0.00 sec)
mysql> select * from ocurrencias;
+---------+----------------------------------+------------+
| Proceso | Mensaje                          | Ocurrencia |
+---------+----------------------------------+------------+
| Web     | Error: No se puede dividir por 0 |          3 |
| RestAPI | Error: Fallo la conversión       |          5 |
| App     | Error: Fallo la conversión       |          7 |
| RestAPI | Error: Error sin identificar     |          9 |
| Web     | Error: Error sin identificar     |          1 |
| App     | Error: Error sin identificar     |         10 |
| Web     | Estado Completado                |          8 |
| RestAPI | Estado Completado                |          6 |
+---------+----------------------------------+------------+
8 rows in set (0.00 sec)