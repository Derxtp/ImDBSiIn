--el script:
CREATE TABLE requisitos (
    Descripcion VARCHAR(50)
);

CREATE TABLE candidatos (
    Id_candidato INT,
    Descripcion VARCHAR(50)
);

INSERT INTO requisitos (Descripcion)
VALUES
  ('Geólogo'),
  ('Astrónomo'),
  ('Técnico');


INSERT INTO candidatos (Id_candidato, Descripcion)
VALUES
  (1001, 'Geólogo'),
  (1001, 'Astrónomo'),
  (1001, 'Bioquímico'),
  (1001, 'Técnico'),
  (2002, 'Cirujano'),
  (2002, 'Mecánico'),
  (2002, 'Geólogo'),
  (3003, 'Geólogo'),
  (3003, 'Astrónomo'),
  (4004, 'Ingeniero');

SELECT 
    c.Id_candidato
FROM 
    candidatos c
JOIN 
    requisitos r ON c.Descripcion = r.Descripcion
GROUP BY 
    c.Id_candidato
HAVING 
    COUNT(DISTINCT c.Descripcion) = (SELECT COUNT(*) FROM requisitos);

-- la consola:

mysql> SELECT 
    ->     c.Id_candidato
    -> FROM 
    ->     candidatos c
    -> JOIN 
    ->     requisitos r ON c.Descripcion = r.Descripcion
    -> GROUP BY 
    ->     c.Id_candidato
    -> HAVING 
    ->     COUNT(DISTINCT c.Descripcion) = (SELECT COUNT(*) FROM requisitos);
+--------------+
| Id_candidato |
+--------------+
|         1001 |
+--------------+
1 row in set (0.00 sec)