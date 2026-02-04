#David Rodriguez
#Juan Sebastián Rocha
#Tomás Palacios

CREATE SCHEMA crud;

DROP TABLE IF EXISTS crud.tabla;

CREATE TABLE crud.tabla (
  cedula INT,
  nombre VARCHAR(20) NOT NULL,
  apellido VARCHAR(20) NOT NULL,
  genero VARCHAR(20) NOT NULL,
  fecha_nacimiento DATE NOT NULL,
  email VARCHAR(50) NOT NULL,

  PRIMARY KEY (cedula),
  CHECK (genero IN ('Feminino','Masculino', 'Otro')),
  CHECK (fecha_nacimiento >= '1950-01-01')
);

SELECT *
FROM crud.tabla;

INSERT INTO crud.tabla
VALUES (154214, 'David', 'Rodriguez', 'Masculino', '2000-07-18', 'david@hotmail.com');
