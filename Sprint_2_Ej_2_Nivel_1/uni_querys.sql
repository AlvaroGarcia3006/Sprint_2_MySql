USE universidad;

#1· Devuelve un listado con el primer apellido, segundo apellido y el nombre de todos los alumnos/as. 
#El listado deberá estar ordenado alfabéticamente de menor a mayor por el primer apellido, segundo apellido y nombre.
SELECT apellido1, apellido2, nombre
FROM persona WHERE tipo = 'alumno'
ORDER BY apellido1, apellido2, nombre;

#2· Halla el nombre y los dos apellidos de los alumnos que no han dado de alta su número de teléfono en la base de datos.
SELECT nombre, apellido1, apellido2
FROM persona WHERE telefono IS NULL;

#3· Devuelve el listado de los alumnos que nacieron en 1999.
SELECT * FROM persona WHERE fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31'; 

#4· Devuelve el listado de profesores/as que no han dado de alta su número de teléfono en la base de datos y además su NIF termina en K.
SELECT * FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE '%K';

#5· Devuelve el listado de las asignaturas que se imparten en el primer cuatrimestre, en el tercer curso del grado que tiene el identificador 7.
SELECT * FROM asignatura WHERE id_grado = 7 AND curso = 3 AND cuatrimestre = 1;

#6· Devuelve un listado de los profesores/as junto con el nombre del departamento al que están vinculados.
#El listado debe devolver cuatro columnas, primer apellido, segundo apellido, nombre y nombre del departamento.
#El resultado estará ordenado alfabéticamente de menor a mayor por apellidos y nombre.
SELECT persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre AS departamento
FROM persona
	JOIN profesor ON profesor.id_profesor = persona.id
	JOIN departamento ON departamento.id = profesor.id_departamento
ORDER BY persona.apellido1, persona.apellido2, persona.nombre;

#7· Devuelve un listado con el nombre de las asignaturas, año de inicio y año de fin del curso escolar del alumno/a con NIF 26902806M.
SELECT a.nombre, y.anyo_inicio, y.anyo_fin
FROM asignatura a, curso_escolar y, persona p, alumno_se_matricula_asignatura m
WHERE p.nif LIKE '26902806M'
	AND p.id = m.id_alumno
    AND m.id_asignatura = a.id
    AND m.id_curso_escolar = y.id;

#8· Devuelve un listado con el nombre de todos los departamentos que tienen profesores/as que imparten alguna asignatura 
#en el Grado en Ingeniería Informática (Plan 2015).
SELECT DISTINCT d.nombre
FROM departamento d, profesor p, asignatura a, grado g
WHERE d.id = p.id_departamento
	AND p.id_profesor = a.id_profesor
    AND g.id = a.id_grado
    AND g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';

#9· Devuelve un listado con todos los alumnos que se han matriculado en alguna asignatura durante el curso escolar 2018/2019.
SELECT p.id, p.nombre, p.apellido1
FROM persona p
	JOIN alumno_se_matricula_asignatura m ON m.id_alumno = p.id
    JOIN curso_escolar c ON c.id = m.id_curso_escolar
WHERE c.anyo_inicio LIKE '2018'
GROUP BY p.id;

#10· Devuelve un listado con los nombres de todos los profesores/as y los departamentos que tienen vinculados. 
#El listado también debe mostrar aquellos profesores/as que no tienen ningún departamento asociado. 
#El listado debe devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y nombre del profesor/a. 
#El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del departamento, apellidos y nombre.
SELECT d.nombre AS departamento, pe.apellido1, pe.apellido2, pe.nombre
FROM persona pe 
	LEFT JOIN profesor pr ON pe.id = pr.id_profesor
    LEFT JOIN departamento d ON pr.id_departamento = d.id
WHERE pe.tipo = 'profesor'
ORDER BY 1, 2, 3 , 4 ASC;

#11· Devuelve un listado con los profesores/as que no están asociados a un departamento.
SELECT *
FROM persona pe
	LEFT JOIN profesor pr ON pe.id = pr.id_profesor
WHERE pe.tipo = 'profesor' AND id_profesor IS NULL;

#12· Devuelve un listado con los departamentos que no tienen profesores asociados.
SELECT *
FROM departamento d
	RIGHT JOIN profesor pr ON d.id = pr.id_departamento
WHERE pr.id_departamento IS NULL;

#13· Devuelve un listado con los profesores/as que no imparten ninguna asignatura.
SELECT *
FROM persona pe
	LEFT JOIN profesor pr ON pe.id = pr.id_profesor
    LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor
WHERE pe.tipo = 'profesor' AND a.id_profesor IS NULL;

#14· Devuelve un listado con las asignaturas que no tienen un profesor/a asignado.
SELECT *
FROM asignatura
WHERE id_profesor IS NULL;

#15· Devuelve el número total de alumnos existentes.
SELECT COUNT(*) 'Alumnos Totales'
FROM persona
WHERE tipo = 'alumno';

#16· Calcula cuántos alumnos nacieron en 1999.
SELECT COUNT(*) AS 'Alumnos nacidos en 1999'
FROM persona
WHERE tipo = 'alumno' AND fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31' ;

#17· Calcula cuántos profesores/as hay en cada departamento. El resultado sólo debe mostrar dos columnas, 
#una con el nombre del departamento y otra con el número de profesores/as que hay en ese departamento. 
#El resultado sólo debe incluir los departamentos que tienen profesores/as asociados y tendrá que estar ordenado de mayor a 
#menor por el número de profesores/as.
SELECT d.nombre, COUNT(DISTINCT p.id_profesor) as profesores
FROM departamento d
	JOIN profesor p ON p.id_departamento = d.id
GROUP BY d.nombre
ORDER BY COUNT(DISTINCT p.id_profesor) DESC;

#18· Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno. 
#Ten en cuenta que pueden existir grados que carecen de asignaturas asociadas. Estos grados también deben aparecer en el listado. 
#El resultado deberá estar ordenado de mayor a menor por el número de asignaturas.
SELECT g.nombre, COUNT(a.id) AS 'Nº asignaturas'
FROM grado g
	LEFT JOIN asignatura a ON g.id = a.id_grado
GROUP BY g.nombre;

#19· Devuelve un listado con el nombre de todos los grados existentes en la base de datos y 
#el número de asignaturas que tiene cada uno, de los grados que tengan más de 40 asignaturas asociadas.
SELECT g.nombre, COUNT(a.id) AS 'Nº asignaturas'
FROM grado g
	LEFT JOIN asignatura a ON g.id = a.id_grado
GROUP BY g.nombre
HAVING COUNT(a.id) > 40;

#20· Devuelve todos los datos del alumno/a más joven.
SELECT *
FROM persona
WHERE tipo = 'alumno'
ORDER BY fecha_nacimiento DESC
LIMIT 1;