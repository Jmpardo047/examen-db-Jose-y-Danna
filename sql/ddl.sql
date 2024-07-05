DROP DATABASE IF EXISTS garden;
CREATE DATABASE garden;
USE garden;

CREATE TABLE IF NOT EXISTS gama_producto(
    gama VARCHAR(50),
    descripcion_texto TEXT,
    descripcion_html TEXT,
    imagen VARCHAR(256),
    CONSTRAINT pk_gama_producto PRIMARY KEY (gama)
);

CREATE TABLE IF NOT EXISTS producto(
    codigo_producto VARCHAR(15),
    nombre VARCHAR(70),
    gama VARCHAR(50),
    dimensiones VARCHAR(25),
    proveedor VARCHAR(50),
    descripcion TEXT,
    cantidad_en_stock SMALLINT(6),
    precio_venta DECIMAL(15,2),
    precio_proveedor DECIMAL(15,2),
    CONSTRAINT pk_codigo_producto PRIMARY KEY (codigo_producto),
    CONSTRAINT fk_gama_producto FOREIGN KEY (gama) REFERENCES gama_producto(gama)
);

CREATE TABLE IF NOT EXISTS oficina (
    codigo_oficina VARCHAR(10),
    ciudad VARCHAR(30),
    pais VARCHAR(50),
    region VARCHAR(50),
    codigo_postal VARCHAR(10),
    telefono VARCHAR(20),
    linea_direccion1 VARCHAR(50),
    linea_direccion2 VARCHAR(50),
    CONSTRAINT pk_id_cod_ofcina PRIMARY KEY (codigo_oficina);
)

CREATE TABLE IF NOT EXISTS empleado (
    codigo_empleado INT(11),
    nombre VARCHAR(50),
    apellido1 VARCHAR(50),
    apellido2 VARCHAR(50),
    extension VARCHAR(10),
    email VARCHAR(10),
    codigo_oficina VARCHAR(10),
    codigo_jefe INT(11),
    puesto VARCHAR(50),
    CONSTRAINT pk_id_cod_empleado PRIMARY KEY (codigo_empleado);
    CONSTRAINT fk_id_empleado_cod_oficina FOREIGN KEY (codigo_oficina) REFERENCES oficina(codigo_oficina);
)

CREATE TABLE IF NOT EXISTS cliente (
    codigo_cliente INT(11),
    nombre_cliente VARCHAR(50),
    nombre_contacto VARCHAR(30),
    apellido_contacto VARCHAR(30),
    telefono VARCHAR(15),
    fax VARCHAR(15),
    linea_direccion1 VARCHAR(50),
    linea_direccion2 VARCHAR(50),
    ciudad VARCHAR(50),
    region VARCHAR(50),
    pais VARCHAR(50),
    codigo_postal VARCHAR(10),
    codigo_empleado_rep_ventas INT(11),
    limite_credito DECIMAL(15,2),
    CONSTRAINT pk_id_cod_cliente  PRIMARY KEY (codigo_cliente)
    CONSTRAINT fk_id_cliente_cod_empleado FOREIGN KEY codigo_empleado_rep_ventas REFERENCES empleado(codigo_empleado);
)



CREATE TABLE IF NOT EXISTS detalle_pedido