--Taller 1

--David Rodriguez, Juan Sebastián Rocha y Tomás Palacios

CREATE SCHEMA taller1;

DROP TABLE IF EXISTS taller1.homicidios;
DROP TABLE IF EXISTS taller1.municipio;
DROP TABLE IF EXISTS taller1.departamento;

CREATE TABLE taller1.departamento (
  id INT NOT NULL,
  nombre VARCHAR(20) NOT NULL,

  PRIMARY KEY (id)
);

CREATE TABLE taller1.municipio (
  id INT NOT NULL,
  id_departamento INT NOT NULL,
  nombre VARCHAR(20) NOT NULL,

  PRIMARY KEY (id),
  FOREIGN KEY (id_departamento) references taller1.departamento(id)
);

CREATE TABLE taller1.homicidios (
  id INT NOT NULL,
  id_municipio INT NOT NULL,
  fecha DATE NOT NULL,
  genero VARCHAR(20) NOT NULL,
  edad INT NOT NULL,
  grupo_edad VARCHAR(20) NOT NULL,
  numero_homicidios INT NOT NULL,

  PRIMARY KEY (id),
  FOREIGN KEY (id_municipio) references taller1.municipio(id),
  CHECK (genero IN ('MASCULINO','FEMENINO')),
  CHECK (grupo_edad IN ('ADOLESCENTES','ADULTOS', 'MENORES'))
);

INSERT INTO taller1.departamento VALUES
              (13, 'Bolívar'),
              (86, 'Putumayo'),
              (25, 'Cundinamarca'),
              (50, 'Meta'),
              (54, 'Norte de Santander'),
              (17, 'Caldas'),
              (76, 'Valle del Cauca'),
              (66, 'Risaralda');

INSERT INTO taller1.municipio VALUES
              (13458, 13, 'Montecristo'),
              (86571, 86, 'Puerto Guzmán'),
              (25438, 25, 'Medina'),
              (50006, 50, 'Acacías'),
              (54001, 54, 'Cúcuta'),
              (17380, 17, 'La Dorada'),
              (86865, 86, 'Valle del Guamuez'),
              (76834, 76, 'Tuluá'),
              (66594, 66, 'Quinchía');

INSERT INTO taller1.homicidios VALUES
              (1, 13458, '2013-11-20', 'MASCULINO', 54, 'ADULTOS', 1),
              (2, 86571, '2003-04-01', 'MASCULINO', 39, 'ADULTOS', 1),
              (3, 25438, '2007-05-06', 'MASCULINO', 39, 'ADULTOS', 1),
              (4, 50006, '2004-04-03', 'MASCULINO', 24, 'ADULTOS', 1),
              (5, 54001, '2016-08-07', 'MASCULINO', 28, 'ADULTOS', 1),
              (6, 17380, '2006-08-23', 'MASCULINO', 29, 'ADULTOS', 1),
              (7, 86865, '2016-07-24', 'MASCULINO', 17, 'ADOLESCENTES', 2),
              (8, 54001, '2011-04-15', 'MASCULINO', 66, 'ADULTOS', 1),
              (9, 76834, '2012-06-02', 'MASCULINO', 34, 'ADULTOS', 1),
              (10, 66594, '2009-08-12', 'MASCULINO', 36, 'ADULTOS', 1);

SELECT *
FROM taller1.departamento;

SELECT *
FROM taller1.municipio;

SELECT *
FROM taller1.homicidios;