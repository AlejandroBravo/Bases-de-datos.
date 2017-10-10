set echo on

spo Salida.txt

set linesize 200
set pagesize 3000

drop table Cliente cascade constraints;
drop table Pago cascade constraints;
drop table Dirección cascade constraints;
drop table Pedido cascade constraints;
drop table Linea.Pedido cascade constraints;
drop table Producto cascade constraints;

drop user Carro cascade;

create user CARRO identified by carro;
alter user CARRO default tablespace users;
grant unlimited tablespace to CARRO;
grant create session to CARRO;
grant create table to CARRO;
alter session set NLS_DATE_FORMAT = 'DD-MM-YYYY';
grant create view to CARRO;
conn CARRO/carro;


CREATE TABLE cliente (
    "Cli-Nombre"   VARCHAR2(150 CHAR) NOT NULL
);

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( "Cli-Nombre" );

CREATE TABLE direccion (
    calle                  VARCHAR2(100 CHAR) NOT NULL,
    ciudad                 VARCHAR2(50 CHAR) NOT NULL,
    "Co-Postal"            INTEGER NOT NULL,
    pais                   VARCHAR2(50 CHAR) NOT NULL,
    "Cliente_Cli-Nombre"   VARCHAR2(150 CHAR),
    direccion_id           NUMBER NOT NULL
);

ALTER TABLE direccion ADD CONSTRAINT direccion_pk PRIMARY KEY ( direccion_id );

CREATE TABLE linea (
    "Nu-Unidades"           INTEGER NOT NULL,
    "Precio-Total"          INTEGER NOT NULL,
    "Pedido_Id-Pedido"      INTEGER NOT NULL,
    "Producto_Pro-Nombre"   VARCHAR2(100 CHAR) NOT NULL
);

CREATE TABLE pago (
    "Metodo-Pago"            VARCHAR2(20 CHAR) NOT NULL,
    "Numero-Tarjeta"         NVARCHAR2(15) NOT NULL,
    "Pedido_Id-Pedido"       INTEGER NOT NULL,
    direccion_direccion_id   NUMBER NOT NULL
);

CREATE UNIQUE INDEX pago__idx ON
    pago ( "Pedido_Id-Pedido" ASC );

ALTER TABLE pago ADD CONSTRAINT pago_pk PRIMARY KEY ( "Numero-Tarjeta" );

CREATE TABLE pedido (
    "Id-Pedido"              INTEGER NOT NULL,
    fecha                    DATE NOT NULL,
    "Cliente_Cli-Nombre"     VARCHAR2(150 CHAR) NOT NULL,
    "Pago_Numero-Tarjeta"    NVARCHAR2(15) NOT NULL,
    direccion_direccion_id   NUMBER NOT NULL
);

CREATE UNIQUE INDEX pedido__idx ON
    pedido ( "Pago_Numero-Tarjeta" ASC );

ALTER TABLE pedido ADD CONSTRAINT pedido_pk PRIMARY KEY ( "Id-Pedido" );

CREATE TABLE producto (
    "Pro-Nombre"   VARCHAR2(100 CHAR) NOT NULL,
    "Pro-Precio"   INTEGER NOT NULL
);

ALTER TABLE producto ADD CONSTRAINT producto_pk PRIMARY KEY ( "Pro-Nombre" );

ALTER TABLE direccion
    ADD CONSTRAINT direccion_cliente_fk FOREIGN KEY ( "Cliente_Cli-Nombre" )
        REFERENCES cliente ( "Cli-Nombre" )
            ON DELETE CASCADE;

ALTER TABLE linea
    ADD CONSTRAINT linea_pedido_fk FOREIGN KEY ( "Pedido_Id-Pedido" )
        REFERENCES pedido ( "Id-Pedido" )
            ON DELETE CASCADE;

ALTER TABLE linea
    ADD CONSTRAINT linea_producto_fk FOREIGN KEY ( "Producto_Pro-Nombre" )
        REFERENCES producto ( "Pro-Nombre" )
            ON DELETE CASCADE;

ALTER TABLE pago
    ADD CONSTRAINT pago_direccion_fk FOREIGN KEY ( direccion_direccion_id )
        REFERENCES direccion ( direccion_id )
            ON DELETE CASCADE;

ALTER TABLE pago
    ADD CONSTRAINT pago_pedido_fk FOREIGN KEY ( "Pedido_Id-Pedido" )
        REFERENCES pedido ( "Id-Pedido" )
            ON DELETE CASCADE;

ALTER TABLE pedido
    ADD CONSTRAINT pedido_cliente_fk FOREIGN KEY ( "Cliente_Cli-Nombre" )
        REFERENCES cliente ( "Cli-Nombre" )
            ON DELETE CASCADE;

ALTER TABLE pedido
    ADD CONSTRAINT pedido_direccion_fk FOREIGN KEY ( direccion_direccion_id )
        REFERENCES direccion ( direccion_id )
            ON DELETE CASCADE;

ALTER TABLE pedido
    ADD CONSTRAINT pedido_pago_fk FOREIGN KEY ( "Pago_Numero-Tarjeta" )
        REFERENCES pago ( "Numero-Tarjeta" )
            ON DELETE CASCADE;

insert into Cliente values('Armando Bulla Jaleo');
insert into Cliente values('Isabel Pantoja Martinez');

insert into Direccion values ('Av.Piruleta', 'Caceres', 11013, 'Argentina', 'Armando Bulla Jaleo');
insert into Direccion values ('Av.de la Carcel', 'Alcala', 11000, 'España', 'Isabel Pantoja Martinez');

insert into Producto values ('Tambores mal afinados', 10);
insert into Producto values ('Bolsas de basura', 15);

insert into Pago values ('MasterCard', 11111111111, 'Av.Piruleta', 1);
insert into Pago values ('VisaBlack', 22222222222, 'Av.de la Carcel', 2);

insert into Pedido values (1, SYSDATE, 'Armando Bulla Jaleo', 'Av.Piruleta', 11111111111);
insert into Pedido values (2, SYSDATE, 'Isabel Pantoja Martinez', 'Av.de la Carcel', 22222222222);

insert into Linea values (5, 100, 1, 'Tambores mal afinados');
insert into Linea values (1, 10, 2, 'Bolsas de basura');

CREATE OR REPLACE VIEW Factura  AS
SELECT
    cliente."Cli-Nombre" AS nombre,
    direccion.calle AS calle,
    direccion.ciudad AS ciudad,
    direccion."Co-Postal" AS "Codigo-Postal",
    direccion.pais AS pais,
    linea."Nu-Unidades" AS unidades,
    linea."Precio-Total" AS "Precio-Total",
    pago."Numero-Tarjeta" AS tarjeta,
    pago."Metodo-Pago" AS "Metodo-Pago",
    producto."Pro-Nombre" AS "Pro-Nombre",
    producto."Pro-Precio" AS "Pro-Precio",
    pedido."Id-Pedido" AS "Id-Pedido",
    pedido.fecha AS fecha
FROM
    cliente
    INNER JOIN direccion ON cliente."Cli-Nombre" = direccion."Cliente_Cli-Nombre"
    INNER JOIN pago ON direccion.direccion_id = pago.direccion_direccion_id
    INNER JOIN pedido ON pedido."Id-Pedido" = pago."Pedido_Id-Pedido"
                         AND cliente."Cli-Nombre" = pedido."Cliente_Cli-Nombre"
                         AND direccion.direccion_id = pedido.direccion_direccion_id
                         AND pago."Numero-Tarjeta" = pedido."Pago_Numero-Tarjeta"
    INNER JOIN linea ON pedido."Id-Pedido" = linea."Pedido_Id-Pedido"
    INNER JOIN producto ON producto."Pro-Nombre" = linea."Producto_Pro-Nombre" 
;

CREATE SEQUENCE direccion_direccion_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER direccion_direccion_id_trg BEFORE
    INSERT ON direccion
    FOR EACH ROW
    WHEN ( new.direccion_id IS NULL )
BEGIN
    :new.direccion_id := direccion_direccion_id_seq.nextval;
END;
/
exit


spo off
