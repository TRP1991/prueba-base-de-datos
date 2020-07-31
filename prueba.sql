TRubilarP=# CREATE DATABASE prueba;
CREATE DATABASE
TRubilarP=# \c prueba;
You are now connected to database "prueba" as user "TRubilarP".

prueba=# CREATE TABLE clientes(
prueba(# id INT PRIMARY KEY,
prueba(# nombre_cliente VARCHAR(100),
prueba(# rut VARCHAR (20),
prueba(# direccion_cliente VARCHAR(100)
prueba(# );
CREATE TABLE

prueba=# SELECT * FROM clientes;
 id | nombre_cliente  |    rut     |       direccion_cliente        
----+-----------------+------------+--------------------------------
(0 rows)


prueba=# CREATE TABLE categorias(
prueba(# id INT PRIMARY KEY,
prueba(# nombre_categoria VARCHAR (50),
prueba(# descripcion_producto VARCHAR (100)
prueba(# );
CREATE TABLE

prueba=# SELECT * FROM categorias;
 id | nombre_categoria | descripcion_producto 
----+------------------+----------------------
(0 rows)


prueba=# CREATE TABLE facturas(
prueba(# id INT PRIMARY KEY,
prueba(# fecha_factura DATE,
prueba(# id_cliente INT,
prueba(# sub_total FLOAT,
prueba(# iva FLOAT,
prueba(# precio_total FLOAT,
prueba(# FOREIGN KEY (id_cliente) REFERENCES clientes (id)
prueba(# );
CREATE TABLE

prueba=# SELECT * FROM facturas;
 id | fecha_factura | id_cliente | sub_total | iva | precio_total 
----+---------------+------------+-----------+-----+--------------
(0 rows)


prueba=# CREATE TABLE productos(
prueba(# id INT PRIMARY KEY,
prueba(# nombre_producto VARCHAR(50),
prueba(# descripcion_producto VARCHAR(100),
prueba(# valor_unitario FLOAT,
prueba(# id_categoria INT,
prueba(# FOREIGN KEY (id_categoria) REFERENCES categorias(id)
prueba(# );
CREATE TABLE

prueba=# SELECT * FROM productos;
 id | nombre_producto | descripcion_producto | valor_unitario | id_categoria 
----+-----------------+----------------------+----------------+--------------
(0 rows)



prueba=# CREATE TABLE listados_productos(
prueba(# id INT,
prueba(# FOREIGN KEY (id) REFERENCES facturas (id),
prueba(# id_productos INT,
prueba(# cantidad_productos INT,
prueba(# FOREIGN KEY (id_productos) REFERENCES productos (id),
prueba(# valor_total FLOAT
prueba(# );
CREATE TABLE

prueba=# SELECT * FROM listados_productos;
 id | id_productos | cantidad_productos | valor_total 
----+--------------+--------------------+-------------
(0 rows)


----PARTE 2: CREANDO EL MODELO DE LA BASE DE DATOS----
---Insertar 5 Clientes---

prueba=# INSERT INTO clientes (id, nombre_cliente, rut, direccion_cliente) VALUES (001, 'Tamara Rubilar', '18088356-8', 'Horcon 1338 Quilicura');
prueba=# INSERT INTO clientes (id, nombre_cliente, rut, direccion_cliente) VALUES (002, 'Christian Silva', '15328860-k', 'La Palmilla 4898, Conchalí');
prueba=# INSERT INTO clientes (id, nombre_cliente, rut, direccion_cliente) VALUES (003, 'Karla Arredondo', '18763295-0', 'Piedra Roja 2, Quilicura');
prueba=# INSERT INTO clientes (id, nombre_cliente, rut, direccion_cliente) VALUES (004, 'Macarena Azocar', '17450382-4', 'Leonardo Da Vinci 33, Recoleta');
prueba=# INSERT INTO clientes (id, nombre_cliente, rut, direccion_cliente) VALUES (005, 'Tom Nook', '16899352-1', 'Isla Aberdeen, Animal Crossing');

prueba=# SELECT * FROM clientes;
 id | nombre_cliente  |    rut     |       direccion_cliente        
----+-----------------+------------+--------------------------------
  1 | Tamara Rubilar  | 18088356-8 | Horcon 1338 Quilicura
  2 | Christian Silva | 15328860-k | La Palmilla 4898, Conchalí
  3 | Karla Arredondo | 18763295-0 | Piedra Roja 2, Quilicura
  4 | Macarena Azocar | 17450382-4 | Leonardo Da Vinci 33, Recoleta
  5 | Tom Nook        | 16899352-1 | Isla Aberdeen, Animal Crossing
(5 rows)

---Insertar 8 Productos---

prueba=# INSERT INTO productos (id, nombre_producto, descripcion_producto, valor_unitario) VALUES (10, 'Placa', 'Placa Copo de Nieve', 1000);
INSERT 0 1
prueba=# INSERT INTO productos (id, nombre_producto, descripcion_producto, valor_unitario) VALUES (20, 'Árbol', 'Árbol festivo de sobremesa', 500);
INSERT 0 1
prueba=# INSERT INTO productos (id, nombre_producto, descripcion_producto, valor_unitario) VALUES (30, 'Bolso', 'Bolso copo de nieve', 300);
INSERT 0 1
prueba=# INSERT INTO productos (id, nombre_producto, descripcion_producto, valor_unitario) VALUES (40, 'Lámpara', 'Lámpara frutos del bosque', 600);
INSERT 0 1
prueba=# INSERT INTO productos (id, nombre_producto, descripcion_producto, valor_unitario) VALUES (50, 'Muñeco', 'Muñeco equilibrista', 750);
INSERT 0 1
prueba=# INSERT INTO productos (id, nombre_producto, descripcion_producto, valor_unitario) VALUES (60, 'Conífera', 'Conífera bonsai con agua y hojas', 1500);
INSERT 0 1
prueba=# INSERT INTO productos (id, nombre_producto, descripcion_producto, valor_unitario) VALUES (70, 'Set de luces', 'Set de nieve de luces', 450);
INSERT 0 1
prueba=# INSERT INTO productos (id, nombre_producto, descripcion_producto, valor_unitario) VALUES (80, 'Ornamento', 'Ornamento brote de bambú', 1200);
INSERT 0 1

---(LUEGO DE INSERTAR LOS VALORES PEDIDOS EN LA PRUEBA, ACTUALICÉ LA TABLA INSERTANDO LOS ID DE CADA PRODUCTO POR CATEGORIA)---
prueba=# SELECT * FROM productos;
 id | nombre_producto |       descripcion_producto       | valor_unitario | id_categoria 
----+-----------------+----------------------------------+----------------+--------------
 10 | Placa           | Placa Copo de Nieve              |           1000 |          103
 20 | Árbol           | Árbol festivo de sobremesa       |            500 |          102
 30 | Bolso           | Bolso copo de nieve              |            300 |          103
 40 | Lámpara         | Lámpara frutos del bosque        |            600 |          101
 50 | Muñeco          | Muñeco equilibrista              |            750 |          102
 60 | Conífera        | Conífera bonsai con agua y hojas |           1500 |          103
 70 | Set de luces    | Set de nieve de luces            |            450 |          101
 80 | Ornamento       | Ornamento brote de bambú         |           1200 |          103
(8 rows)


--- Insertar 3 Categorías ---

prueba=# INSERT INTO categorias (id, nombre_categoria, descripcion_producto) VALUES (101, 'Primaveral', 'Proyectos de temporada primaveral.');
INSERT 0 1
prueba=# INSERT INTO categorias (id, nombre_categoria, descripcion_producto) VALUES (102, 'Estival', 'Proyectos de temporada estival,');
INSERT 0 1
prueba=# INSERT INTO categorias (id, nombre_categoria, descripcion_producto) VALUES (103, 'Invierno', 'Proyectos de copo de nieve.');
INSERT 0 1

prueba=# SELECT * FROM categorias;
 id  | nombre_categoria |        descripcion_producto        
-----+------------------+------------------------------------
 101 | Primaveral       | Proyectos de temporada primaveral.
 102 | Estival          | Proyectos de temporada estival,
 103 | Invierno         | Proyectos de copo de nieve.
(3 rows)


---10 facturas---
---2 para el cliente 1, con 2 y 3 productos---
---3 para el cliente 2, con 3, 2 y 3 productos---
---1 para el cliente 3, con 1 producto---
---4 para el cliente 4, con 2, 3, 4 y 1 producto---

---Cliente 1: 2 Facturas con 2 y 3 productos:---
---Factura 1 con 2 productos:---
prueba=# INSERT INTO facturas(id, fecha_factura, id_cliente, sub_total, iva, precio_total) VALUES (1110, '2020-06-01', 001, 1500, 0.19, 1785);
prueba=# INSERT INTO listados_productos(id, id_productos, cantidad_productos, valor_total) VALUES (1110, 10, 1, 1000), (1110, 20, 1, 500);

---Factura 2 con 3 productos:---
prueba=# INSERT INTO facturas(id, fecha_factura, id_cliente, sub_total, iva, precio_total) VALUES (1111, '2020-06-02', 001, 1650, 0.19, 1964);
prueba=# INSERT INTO listados_productos(id, id_productos, cantidad_productos, valor_total) VALUES (1111, 30, 1, 300), (1111, 40, 1, 600), (1111, 50, 1, 750);


---Cliente 2: 3 Facturas con 3, 2 y 3 productos:---
---Factura 1 con 3 productos:---
prueba=# INSERT INTO facturas(id, fecha_factura, id_cliente, sub_total, iva, precio_total) VALUES (1112, '2020-06-03', 002, 3200, 0.19, 3808);
prueba=# INSERT INTO listados_productos(id, id_productos, cantidad_productos, valor_total) VALUES (1112, 20, 1, 500), (1112, 60, 1, 1500), (1112, 80, 1, 1200);

---Factura 2 con 2 productos:---
prueba=# INSERT INTO facturas(id, fecha_factura, id_cliente, sub_total, iva, precio_total) VALUES (1113, '2020-06-04', 002, 2550, 0.19, 3035);
prueba=# INSERT INTO listados_productos(id, id_productos, cantidad_productos, valor_total) VALUES (1113, 40, 2, 1200), (1113, 70, 3, 1350);

---Factura 3 con 3 productos:---
prueba=# INSERT INTO facturas(id, fecha_factura, id_cliente, sub_total, iva, precio_total) VALUES (1114, '2020-06-05', 002, 3100, 0.19, 3689);
prueba=# INSERT INTO listados_productos(id, id_productos, cantidad_productos, valor_total) VALUES (1114, 10, 1, 1000), (1114, 40, 1, 600), (1114, 60, 1, 1500);


---Cliente 3: 1 Factura con 1 Producto:---
prueba=# INSERT INTO facturas(id, fecha_factura, id_cliente, sub_total, iva, precio_total) VALUES (1115, '2020-06-06', 003, 750, 0.19, 893);
prueba=# INSERT INTO listados_productos(id, id_productos, cantidad_productos, valor_total) VALUES (1115, 50, 1, 750);

---Cliente 4: 4 Facturas con 2, 3, 4 y 1 producto---
---Factura con 2 productos:---
prueba=# INSERT INTO facturas(id, fecha_factura, id_cliente, sub_total, iva, precio_total) VALUES (1116, '2020-06-07', 004, 900, 0.19, 1071);
prueba=# INSERT INTO listados_productos(id, id_productos, cantidad_productos, valor_total) VALUES (1116, 30, 1, 300), (1116, 40, 1, 600);

---Factura con 3 productos:---
prueba=# INSERT INTO facturas(id, fecha_factura, id_cliente, sub_total, iva, precio_total) VALUES (1117, '2020-06-08', 004, 2150, 0.19, 2559);
prueba=# INSERT INTO listados_productos(id, id_productos, cantidad_productos, valor_total) VALUES (1117, 20, 1, 500), (1117, 70, 1, 450), (1117, 80, 1, 1200);

---Factura con 4 productos:---
prueba=# INSERT INTO facturas(id, fecha_factura, id_cliente, sub_total, iva, precio_total) VALUES (1118, '2020-06-09', 004, 3550, 0.19, 4225);
prueba=# INSERT INTO listados_productos(id, id_productos, cantidad_productos, valor_total) VALUES (1118, 10, 1, 1000), (1118, 30, 1, 300), (1118, 50, 1, 750), (1118, 60, 1, 1500);

----Factura con 1 producto:---
prueba=# INSERT INTO facturas(id, fecha_factura, id_cliente, sub_total, iva, precio_total) VALUES (1119, '2020-06-10', 004, 450, 0.19, 536);
prueba=# INSERT INTO listados_productos(id, id_productos, cantidad_productos, valor_total) VALUES (1119, 70, 1, 450);

prueba=# SELECT * FROM facturas;
  id  | fecha_factura | id_cliente | sub_total | iva  | precio_total 
------+---------------+------------+-----------+------+--------------
 1110 | 2020-06-01    |          1 |      1500 | 0.19 |         1785
 1111 | 2020-06-02    |          1 |      1650 | 0.19 |         1964
 1112 | 2020-06-03    |          2 |      3200 | 0.19 |         3808
 1113 | 2020-06-04    |          2 |      2550 | 0.19 |         3035
 1114 | 2020-06-05    |          2 |      3100 | 0.19 |         3689
 1115 | 2020-06-06    |          3 |       750 | 0.19 |          893
 1116 | 2020-06-07    |          4 |       900 | 0.19 |         1071
 1117 | 2020-06-08    |          4 |      2150 | 0.19 |         2559
 1118 | 2020-06-09    |          4 |      3550 | 0.19 |         4225
 1119 | 2020-06-10    |          4 |       450 | 0.19 |          536
(10 rows)


prueba=# SELECT * FROM listados_productos;
  id  | id_productos | cantidad_productos | valor_total 
------+--------------+--------------------+-------------
 1110 |           10 |                  1 |        1000
 1110 |           20 |                  1 |         500
 1111 |           30 |                  1 |         300
 1111 |           40 |                  1 |         600
 1111 |           50 |                  1 |         750
 1112 |           20 |                  1 |         500
 1112 |           60 |                  1 |        1500
 1112 |           80 |                  1 |        1200
 1113 |           40 |                  2 |        1200
 1113 |           70 |                  3 |        1350
 1114 |           10 |                  1 |        1000
 1114 |           40 |                  1 |         600
 1114 |           60 |                  1 |        1500
 1115 |           50 |                  1 |         750
 1116 |           30 |                  1 |         300
 1116 |           40 |                  1 |         600
 1117 |           20 |                  1 |         500
 1117 |           70 |                  1 |         450
 1117 |           80 |                  1 |        1200
 1118 |           10 |                  1 |        1000
 1118 |           30 |                  1 |         300
 1118 |           50 |                  1 |         750
 1118 |           60 |                  1 |        1500
 1119 |           70 |                  1 |         450
(24 rows)


---PARTE 3: CONSULTAS---
---¿Que cliente realizó la compra más cara?---
prueba=# SELECT nombre_cliente FROM clientes JOIN facturas ON clientes.id=facturas.id_cliente WHERE facturas.precio_total=(SELECT MAX(precio_total) FROM facturas
prueba=#);

 nombre_cliente  
-----------------
 Macarena Azocar
(1 row)


---¿Que cliente pagó sobre 100 de monto? (AQUÍ LE AUMENTÉ EL PRECIO DE LA CONSULTA PARA HACER UN MEJOR FILTRO CONSIDERANDO LOS PRECIOS QUE UTILICÉ)---
prueba=# SELECT DISTINCT nombre_cliente FROM clientes JOIN facturas ON clientes.id=facturas.id_cliente WHERE facturas.precio_total>1500; 
 
 nombre_cliente  
-----------------
 Tamara Rubilar
 Christian Silva
 Macarena Azocar
(3 rows)


---¿Cuantos clientes han comprado el producto 60--- (AQUÍ REEMPLACÉ 6 POR 60 CONSIDERANDO MIS DATOS EN LA TABLA)
prueba=# SELECT DISTINCT count(nombre_cliente) FROM clientes JOIN facturas ON clientes.id=facturas.id_cliente JOIN listados_productos ON facturas.id=listados_productos.id WHERE listados_productos.id_productos=60; 

 count 
-------
     3
(1 row)

---¿Cuáles son los clientes que compraron el producto 60?---
prueba=# SELECT DISTINCT nombre_cliente FROM clientes JOIN facturas ON clientes.id=facturas.id_cliente JOIN listados_productos ON facturas.id=listados_productos.id WHERE listados_productos.id_productos=60;
 
 nombre_cliente  
-----------------
 Christian Silva
 Macarena Azocar
(2 rows)

---(Cliente 2 (Christian Silva) compró 2 veces el producto 60)---
