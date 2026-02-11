CREATE SCHEMA crud;

DROP TABLE IF EXISTS crud.empleados;

-- Creamos tabla
CREATE TABLE crud.empleados (
	id int,
	nombre text,
	edad int,
	salario int,
	departamento text,
	
	PRIMARY KEY(id)
);

-- Instertar datos
INSERT INTO crud.empleados VALUES
              (1, 'Juan', 28, 50000, 'Ventas'),
              (2, 'Ana', 35, 60000, 'Ventas'),
              (3, 'Carlos', 40, 70000, 'TI'),
              (4, 'Elena', 25, 55000, 'Recursos Humanos'),
              (5, 'Miguel', 32, 75000, 'TI');

-- Seleccionar tabla
SELECT *
FROM crud.empleados;

-- Seleccionar empleados que trabajan en Ventas y 
-- tienen más de 30 años o ganan más de $55,000
SELECT *
FROM crud.empleados
WHERE departamento = 'Ventas'
	OR salario > 55000; 
	
-- Seleccionar empleados que ganan entre $50,000 y $70,000 y tienen más de 30 años
SELECT *
FROM crud.empleados
WHERE edad = 30
	OR salario BETWEEN 50000 AND 70000;

-- Seleccionar empleados cuyo nombre comienza con 'A' y trabajan en un departamento que no sea Ventas ni Recursos Humanos
SELECT *
FROM crud.empleados
WHERE nombre like 'A%'
	AND departamento not in ('Ventas', 'Recursos Humanos');


-- Update
ALTER TABLE crud.empleados
ADD estado_civil VARCHAR(20) NOT NULL DEFAULT 'Soltero';

SELECT *
FROM crud.empleados;


UPDATE crud.empleados
SET departamento = 'IT'
WHERE edad >= 30;

SELECT *
FROM crud.empleados;

-- Delete

DELETE FROM crud.empleados
WHERE edad <= 25;

SELECT *
FROM crud.empleados;