CREATE SCHEMA clientes;

DROP TABLE IF EXISTS clientes.detalle_pedido;
DROP TABLE IF EXISTS clientes.pedido;
DROP TABLE IF EXISTS clientes.producto;
DROP TABLE IF EXISTS clientes.cliente;

CREATE TABLE clientes.cliente (
  id INT NOT NULL,
  nombre VARCHAR(20) NOT NULL,
  apellido VARCHAR(20) NOT NULL,
  correo VARCHAR(50) NOT NULL,
  fecha_registro DATE NOT NULL,

  PRIMARY KEY (id)
);

CREATE TABLE clientes.producto (
  id INT NOT NULL,
  nombre VARCHAR(20) NOT NULL,
  descripcion VARCHAR(100),
  precio INT NOT NULL,

  PRIMARY KEY (id)
);

CREATE TABLE clientes.pedido (
  id INT NOT NULL,
  fecha DATE NOT NULL,
  id_cliente INT NOT NULL,
  precio_total INT NOT NULL,

  PRIMARY KEY (id),
  FOREIGN KEY (id_cliente) references clientes.cliente(id)
);

CREATE TABLE clientes.detalle_pedido (
  id INT NOT NULL,
  id_pedido INT NOT NULL,
  id_producto INT NOT NULL,
  unidades INT NOT NULL,

  PRIMARY KEY (id),
  FOREIGN KEY (id_pedido) references clientes.pedido(id),
  FOREIGN KEY (id_producto) references clientes.producto(id)

);

INSERT INTO clientes.cliente
VALUES
(1, 'Melissa', 'Robles', 'mv.robles@uniandes.edu.co', '2023-08-07'),
(2, 'Daniel', 'Aguirre', 'ed.aguirre@uniandes.edu.co', '2023-08-06'),
(3, 'Maria', 'Perez', 'mp@gmail.com', '2023-08-05'),
(4, 'Juan', 'Rodriguez', 'jr@gmail.com', '2023-08-05');

INSERT INTO clientes.producto
VALUES
(10, 'Lapiz', 'Lapiz', 500),
(11, 'Cuaderno', 'Cuaderno 1 materia', 7000),
(12, 'Borrador', 'Borrador marca x', 1000);

INSERT INTO clientes.pedido
VALUES 
(20, '08/08/2023', 1, 14500),
(21, '08/08/2023', 2, 1500);

INSERT INTO clientes.detalle_pedido
VALUES
(30, 20, 11, 2),
(31, 20, 10, 1),
(32, 21, 10, 1),
(33, 21, 12, 1);
