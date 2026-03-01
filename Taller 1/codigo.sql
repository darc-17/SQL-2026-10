--Taller 1

--David Rodriguez, Juan Sebastián Rocha y Tomás Palacios

-- Se crea el esquema en el que se trabajara el taller
CREATE SCHEMA taller1;

--PUNTO 1: CREAR

-- Se crean los comandos de eliminar tablas como buena practica para evitar confusiones
DROP TABLE IF EXISTS taller1.homicidios;
DROP TABLE IF EXISTS taller1.municipio;
DROP TABLE IF EXISTS taller1.departamento;

-- Se crea la tabla de departamento con las restricciones establecidas
CREATE TABLE taller1.departamento (
  id INT NOT NULL,
  nombre VARCHAR(20) NOT NULL,

  -- Se establece la primary key
  PRIMARY KEY (id)
);

-- Se crea la tabla de municipio con las restricciones establecidas, en el orden logico, pues contiene una FK de departamento
CREATE TABLE taller1.municipio (
  id INT NOT NULL,
  id_departamento INT NOT NULL,
  nombre VARCHAR(20) NOT NULL,

  PRIMARY KEY (id),
  FOREIGN KEY (id_departamento) references taller1.departamento(id)
);

-- Nuevamente, se crean la tabla de homicidios teniendo en cuenta las restricciones y el orden logico por FK
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

-- PUNTO 2: INSERTAR

-- Se insertan los datos requeridos
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

-- PUNTO 3: SELECCIONAR

-- Se seleccionan los departamentos
SELECT *
FROM taller1.departamento;

-- Se seleccionan los municipios
SELECT *
FROM taller1.municipio;

-- Esto no lo pide el taller pero se hace con el fin de poder visualizar la estructura de la tabla 
SELECT *
FROM taller1.homicidios;

-- Se seleccionan de la tabla homicidios el id_municipio y el numero de homicidios
SELECT id_municipio,numero_homicidios
FROM taller1.homicidios

-- Se seleccionan los municipios en putumayo (osea que el id_departamento sea el de putumayo (86))
SELECT *
FROM taller1.municipio
WHERE id_departamento IN(86)

-- Se seleccionan la cantidad de homicios adolecentes en la tabla
SELECT SUM(numero_homicidios) AS total_homicios_adolecentes
FROM taller1.homicidios
WHERE grupo_edad IN('ADOLESCENTES');

-- Se seleccionan el nombre y el id de los municipios montecristo y medina
SELECT nombre,id
FROM taller1.municipio
WHERE nombre IN('Montecristo','Medina');

-- Se seleecionan los homicidios que tienen como id_municipio el de la dorada, Caldas (17380) 
SELECT *
FROM taller1.homicidios
WHERE id_municipio IN(17380);

-- Se seleccional los homicidios ocurridos entre 2009 y 2016
SELECT *
FROM taller1.homicidios
WHERE fecha BETWEEN '2009-01-01' AND '2016-12-31';

-- PUNTO 4: REEMPLAZAR

-- Se puede ver que las columnas problematicas (con tilde) son las de los nombres por lo que se hicieron unos replace anidados para quitar los caracteres problematicos
UPDATE taller1.departamento
SET nombre =
    REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(nombre, 'á', 'a'),'é', 'e'),'í', 'i'),'ó', 'o'),'ú', 'u'),'ñ', 'n');

UPDATE taller1.municipio
SET nombre =REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(nombre, 'á', 'a'),'é', 'e'),'í', 'i'),'ó', 'o'),'ú', 'u'),'ñ', 'n');

-- PUNTO 5: ELIMINAR
-- Eliminamos la columna grupo_edad:

ALTER TABLE taller1.homicidios 
DROP COLUMN grupo_edad;

-- Ahora eliminamos los registros

TRUNCATE taller1.departamento CASCADE;