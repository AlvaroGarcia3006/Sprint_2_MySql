USE tienda;

#1· Lista el nombre de todos los productos que hay en la tabla producto.
SELECT nombre FROM producto;

#2· Lista los nombres y los precios de todos los productos de la tabla producto.
SELECT nombre, precio FROM producto;

#3· Lista todas las columnas de la tabla producto.
SELECT * FROM producto;

#4· Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
SELECT nombre, precio AS '€', ROUND(precio*1.03, 2) AS 'USD'
FROM producto;

#5· Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). 
#Utiliza los siguientes sobrenombre para las columnas: nombre de producto, euros, dólares.
SELECT nombre AS 'nombre de producto', precio AS 'euros', ROUND(precio*1.03, 2) AS 'dólares'
FROM producto;

#6· Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.
SELECT UPPER(nombre), precio
FROM producto;

#7· Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.
SELECT LOWER(nombre), precio
FROM producto;

#8· Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
SELECT nombre, UPPER(substr(nombre, 1, 2)) AS Siglas
FROM fabricante;

#9· Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
SELECT nombre, ROUND(precio)
FROM producto;

#10· Lista los nombres y precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
SELECT nombre, TRUNCATE(precio, 0) AS 'Precio Truncado'
FROM producto;

#11· Lista el código de los fabricantes que tienen productos en la tabla producto.
SELECT codigo_fabricante FROM producto;

#12· Lista el código de los fabricantes que tienen productos en la mesa producto, eliminando los códigos que aparecen repetidos.
SELECT DISTINCT	codigo_fabricante FROM producto;

#13· Lista los nombres de los fabricantes ordenados de forma ascendente.
SELECT nombre FROM fabricante ORDER BY nombre ASC;

#14· Lista los nombres de los fabricantes ordenados de forma descendente.
SELECT nombre FROM fabricante ORDER BY nombre DESC;

#15· Lista los nombres de los productos ordenados, en primer lugar, por el nombre de forma ascendente y, 
#en segundo lugar, por el precio de forma descendente.
SELECT nombre 
FROM producto
ORDER BY nombre ASC, precio DESC;

#16· Devuelve una lista con las 5 primeras filas de la tabla fabricante.
SELECT * FROM fabricante LIMIT 5;

#17· Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también debe incluirse en la respuesta.
SELECT * FROM fabricante Limit 3, 2;

#18· Lista el nombre y precio del producto más barato. (Utiliza solo las cláusulas ORDER BY y LIMIT). 
#NOTA: Aquí no podría usar MIN(precio), necesitaría GROUP BY.
SELECT nombre, precio
FROM producto
ORDER BY precio ASC LIMIT 1;

#19· Lista el nombre y precio del producto más caro. (Utiliza solo las cláusulas ORDER BY y LIMIT). 
#NOTA: Aquí no podría usar MAX(precio), necesitaría GROUP BY.
SELECT nombre, precio
FROM producto
ORDER BY precio DESC LIMIT 1;

#20· Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.
SELECT nombre
FROM producto
	WHERE codigo_fabricante = 2;