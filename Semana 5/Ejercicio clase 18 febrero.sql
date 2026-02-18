SELECT *
FROM dane.dane_hogares;
--Exploración

SELECT departamento, total_menores_15_anios
FROM dane.dane_hogares
WHERE departamento = 'Caldas'
  OR departamento = 'Risaralda'
  OR departamento = 'Quindio';

--Caldas = 169,983
--Quindio = 89,813
--Risaralda = 161,210

SELECT departamento
FROM dane.dane_hogares
WHERE total_hogares > 500000;
--Los departamentos con más de 500.000 hogares son Antioquia, Atlántico, Bogotá, Bolívar, Cundinamarca, Santander y Valle del Cauca

SELECT departamento
FROM dane.dane_hogares
WHERE total_menores_15_anios > 1000000;
--Los departamentos con más de 1.000.000 de menores de 15 años son Antioquia y Bogotá

SELECT departamento
FROM dane.dane_hogares
WHERE (departamento = 'Caldas'
  OR departamento = 'Risaralda'
  OR departamento = 'Quindio')
  AND total_hogares > 300000;
--El único departamento del eje cafetero que tiene más de 300.000 hogares es Caldas

SELECT departamento
FROM dane.dane_hogares
WHERE total_hogares > 1000000
  AND total_menores_15_anios > 1000000;
--Los departamentos con más de 1.000.000 de hogares y más de 1.000.000 de menores de 15 años son Antioquia y Bogotá