-- Generado por Oracle SQL Developer Data Modeler 3.1.3.709
--   en:        2017-05-05 18:16:49 CEST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE Arqueologia 
    ( 
     "ID-Arqueologia" INTEGER  NOT NULL , 
     "Nombre-Objeto" VARCHAR2 (40 CHAR)  NOT NULL , 
     Dimensiones NUMBER  NOT NULL , 
     Peso NUMBER  NOT NULL , 
     "Fecha-Ingreso" DATE  NOT NULL , 
     Inscripcion VARCHAR2 (20)  NOT NULL , 
     "ID-Global+Propietario" NVARCHAR2 (20)  NOT NULL , 
     "ID-Conservacion" INTEGER  NOT NULL , 
     "ID-Desperfecto1" INTEGER  NOT NULL , 
     Cultura VARCHAR2 (30 CHAR)  NOT NULL , 
     Serie VARCHAR2 (20 CHAR)  NOT NULL , 
     Descubridor VARCHAR2 (30 CHAR)  NOT NULL , 
     Procedencia VARCHAR2 (40 CHAR)  NOT NULL , 
     Comentario VARCHAR2 (200 CHAR)  NOT NULL , 
     "ID-Material" INTEGER  NOT NULL , 
     "ID-Desperfecto" INTEGER  NOT NULL 
    ) 
;


CREATE UNIQUE INDEX Arqueologia__IDX ON Arqueologia 
    ( 
     "ID-Global+Propietario" ASC 
    ) 
;
CREATE UNIQUE INDEX Arqueologia__IDXv1 ON Arqueologia 
    ( 
     "ID-Conservacion" ASC 
    ) 
;
CREATE UNIQUE INDEX Arqueologia__IDXv2 ON Arqueologia 
    ( 
     "ID-Desperfecto1" ASC 
    ) 
;

ALTER TABLE Arqueologia 
    ADD CONSTRAINT "Arqueologia PK" PRIMARY KEY ( "ID-Arqueologia" ) ;



CREATE TABLE Artistas 
    ( 
     "ID-Artista" INTEGER  NOT NULL , 
     Apellidos VARCHAR2 (40 CHAR) , 
     Nombre VARCHAR2 (40 CHAR) , 
     "Fecha-Nacimiento" DATE , 
     "Lugar-Nacimiento" VARCHAR2 (40 CHAR) 
    ) 
;



ALTER TABLE Artistas 
    ADD CONSTRAINT "Artistas PK" PRIMARY KEY ( "ID-Artista" ) ;



CREATE TABLE "Bellas artes" 
    ( 
     "ID-BellasArtes" INTEGER  NOT NULL , 
     "ID-Artista" INTEGER , 
     "Fecha-Creacion" DATE , 
     Estilo VARCHAR2 (40 CHAR)  NOT NULL , 
     Tecnica VARCHAR2 (40 CHAR)  NOT NULL , 
     Soporte VARCHAR2 (20)  NOT NULL , 
     Dimensiones NUMBER  NOT NULL , 
     Ubicacion VARCHAR2 (90 CHAR)  NOT NULL , 
     "ID-Global+Propietario" NVARCHAR2 (20)  NOT NULL , 
     Iconografia VARCHAR2 (300 CHAR)  NOT NULL , 
     Adquisicion VARCHAR2 (50 CHAR)  NOT NULL , 
     "Fecha-ingreso" VARCHAR2 (50 CHAR)  NOT NULL , 
     "ID-Material" INTEGER  NOT NULL 
    ) 
;


CREATE UNIQUE INDEX "Bellas artes__IDX" ON "Bellas artes" 
    ( 
     "ID-Global+Propietario" ASC 
    ) 
;

ALTER TABLE "Bellas artes" 
    ADD CONSTRAINT "Bellas artes PK" PRIMARY KEY ( "ID-BellasArtes" ) ;



CREATE TABLE Bibliografia 
    ( 
     "Autor-escrito" VARCHAR2 (20 CHAR)  NOT NULL , 
     Editorial VARCHAR2 (30 CHAR) , 
     "Año-publicacion" DATE  NOT NULL , 
     "Pagina-referencia" VARCHAR2 (30 CHAR)  NOT NULL , 
     "ID-BellasArtes" INTEGER  NOT NULL , 
     "ID-Arqueologia" INTEGER  NOT NULL , 
     "ID-Etnologia" INTEGER  NOT NULL 
    ) 
;




CREATE TABLE Conservacion 
    ( 
     "ID-Conservacion" INTEGER  NOT NULL , 
     "Nivel-Conservacion" VARCHAR2 (20 CHAR)  NOT NULL , 
     "ID-Arqueologia" INTEGER  NOT NULL , 
     "ID-Etnologia" INTEGER  NOT NULL 
    ) 
;


CREATE UNIQUE INDEX Conservacion__IDX ON Conservacion 
    ( 
     "ID-Arqueologia" ASC 
    ) 
;
CREATE UNIQUE INDEX Conservacion__IDXv1 ON Conservacion 
    ( 
     "ID-Etnologia" ASC 
    ) 
;

ALTER TABLE Conservacion 
    ADD CONSTRAINT "Conservacion PK" PRIMARY KEY ( "ID-Conservacion" ) ;



CREATE TABLE Descripciones 
    ( 
     "ID-Objeto" INTEGER  NOT NULL , 
     Descripcion VARCHAR2 (200 CHAR) , 
     "ID-BellasArtes" INTEGER  NOT NULL , 
     "ID-Global+Propietario" NVARCHAR2 (20)  NOT NULL , 
     "ID-Etnologia" INTEGER  NOT NULL , 
     "ID-Arqueologia" INTEGER  NOT NULL 
    ) 
;



ALTER TABLE Descripciones 
    ADD CONSTRAINT "Descripciones PK" PRIMARY KEY ( "ID-Objeto" ) ;



CREATE TABLE Desperfectos 
    ( 
     "ID-Desperfecto" INTEGER  NOT NULL , 
     Desperfecto VARCHAR2 (20 CHAR)  NOT NULL , 
     Comentario VARCHAR2 (200 CHAR)  NOT NULL , 
     "ID-Arqueologia" INTEGER  NOT NULL , 
     "ID-Etnologia" INTEGER  NOT NULL 
    ) 
;


CREATE UNIQUE INDEX Desperfectos__IDX ON Desperfectos 
    ( 
     "ID-Arqueologia" ASC 
    ) 
;
CREATE UNIQUE INDEX Desperfectos__IDXv1 ON Desperfectos 
    ( 
     "ID-Etnologia" ASC 
    ) 
;

ALTER TABLE Desperfectos 
    ADD CONSTRAINT "Desperfectos PK" PRIMARY KEY ( "ID-Desperfecto" ) ;



CREATE TABLE Etnologia 
    ( 
     "ID-Etnologia" INTEGER  NOT NULL , 
     "Fecha-ingreso" DATE  NOT NULL , 
     "Fecha-adquisicion" DATE  NOT NULL , 
     "Numero-Entrada" INTEGER  NOT NULL , 
     "Numero-Libro" INTEGER  NOT NULL , 
     Dimensiones NUMBER  NOT NULL , 
     "ID-Conservacion" INTEGER  NOT NULL , 
     Adquisicion VARCHAR2 (200 CHAR)  NOT NULL , 
     Procedencia VARCHAR2 (200 CHAR)  NOT NULL , 
     "ID-Material" INTEGER  NOT NULL , 
     "ID-Global+Propietario" NVARCHAR2 (20)  NOT NULL , 
     "ID-Conservacion1" INTEGER  NOT NULL , 
     "ID-Desperfecto1" INTEGER  NOT NULL , 
     Descripcion VARCHAR2 (200 CHAR)  NOT NULL , 
     "ID-Desperfecto" INTEGER  NOT NULL 
    ) 
;


CREATE UNIQUE INDEX Etnologia__IDX ON Etnologia 
    ( 
     "ID-Global+Propietario" ASC 
    ) 
;
CREATE UNIQUE INDEX Etnologia__IDXv1 ON Etnologia 
    ( 
     "ID-Conservacion1" ASC 
    ) 
;
CREATE UNIQUE INDEX Etnologia__IDXv2 ON Etnologia 
    ( 
     "ID-Desperfecto1" ASC 
    ) 
;

ALTER TABLE Etnologia 
    ADD CONSTRAINT "Estnologia PK" PRIMARY KEY ( "ID-Etnologia" ) ;



CREATE TABLE Exposicion 
    ( 
     Lugar VARCHAR2 (30 CHAR)  NOT NULL , 
     Fecha DATE , 
     Coleccion VARCHAR2 (30 CHAR) , 
     "ID-BellasArtes" INTEGER  NOT NULL 
    ) 
;


CREATE UNIQUE INDEX Exposicion__IDX ON Exposicion 
    ( 
     "ID-BellasArtes" ASC 
    ) 
;


CREATE TABLE "ID-Artista" 
    ( 
     "Bellas artes_ID-BellasArtes" INTEGER  NOT NULL , 
     "Artistas_ID-Artista" INTEGER  NOT NULL 
    ) 
;



ALTER TABLE "ID-Artista" 
    ADD CONSTRAINT "ID-Artista__IDX" PRIMARY KEY ( "Bellas artes_ID-BellasArtes", "Artistas_ID-Artista" ) ;



CREATE TABLE Intervenciones 
    ( 
     Fotografia BLOB  NOT NULL , 
     Conclusiones VARCHAR2 (300 CHAR)  NOT NULL , 
     Estudios VARCHAR2 (300 CHAR)  NOT NULL , 
     Metodologia VARCHAR2 (30 CHAR)  NOT NULL , 
     "Intervenciones-anteriores" VARCHAR2 (200 CHAR) , 
     Muestras VARCHAR2 (200 CHAR) , 
     Prioridad INTEGER  NOT NULL , 
     "Restaurador/a" VARCHAR2 (30 CHAR)  NOT NULL , 
     Justificacion VARCHAR2 (200 CHAR)  NOT NULL , 
     Recomendaciones VARCHAR2 (300 CHAR)  NOT NULL , 
     "ID-BellasArtes" INTEGER , 
     "ID-Arqueologia" INTEGER , 
     "ID-Etnologia" INTEGER 
    ) 
;




CREATE TABLE Materiales 
    ( 
     "ID-Material" INTEGER  NOT NULL , 
     Material VARCHAR2 (200 CHAR)  NOT NULL , 
     "ID-Etnologia" INTEGER  NOT NULL , 
     "ID-BellasArtes" INTEGER  NOT NULL , 
     "ID-Arqueologia" INTEGER  NOT NULL 
    ) 
;



ALTER TABLE Materiales 
    ADD CONSTRAINT "Materiales PK" PRIMARY KEY ( "ID-Material" ) ;



CREATE TABLE Objetos 
    ( 
     "ID-Global+Propietario" NVARCHAR2 (20)  NOT NULL , 
     Imagen BLOB  NOT NULL , 
     "ID-BellasArtes" INTEGER  NOT NULL , 
     "ID-Arqueologia" INTEGER  NOT NULL , 
     "ID-Etnologia" INTEGER  NOT NULL 
    ) 
;


CREATE UNIQUE INDEX Objetos__IDX ON Objetos 
    ( 
     "ID-Arqueologia" ASC 
    ) 
;
CREATE UNIQUE INDEX Objetos__IDXv1 ON Objetos 
    ( 
     "ID-Etnologia" ASC 
    ) 
;
CREATE UNIQUE INDEX Objetos__IDXv2 ON Objetos 
    ( 
     "ID-BellasArtes" ASC 
    ) 
;

ALTER TABLE Objetos 
    ADD CONSTRAINT "Objetos PK" PRIMARY KEY ( "ID-Global+Propietario" ) ;



CREATE TABLE Procedencia 
    ( 
     Yacimiento VARCHAR2 (50 CHAR)  NOT NULL , 
     Municipio VARCHAR2 (50 CHAR)  NOT NULL , 
     Hallagzo VARCHAR2 (200 CHAR) , 
     "ID-Arqueologia" INTEGER  NOT NULL 
    ) 
;


CREATE UNIQUE INDEX Procedencia__IDX ON Procedencia 
    ( 
     "ID-Arqueologia" ASC 
    ) 
;



ALTER TABLE Bibliografia 
    ADD CONSTRAINT Bibliografia1 FOREIGN KEY 
    ( 
     "ID-BellasArtes"
    ) 
    REFERENCES "Bellas artes" 
    ( 
     "ID-BellasArtes"
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE Bibliografia 
    ADD CONSTRAINT Bibliografia2 FOREIGN KEY 
    ( 
     "ID-Arqueologia"
    ) 
    REFERENCES Arqueologia 
    ( 
     "ID-Arqueologia"
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE Bibliografia 
    ADD CONSTRAINT Bibliografia3 FOREIGN KEY 
    ( 
     "ID-Etnologia"
    ) 
    REFERENCES Etnologia 
    ( 
     "ID-Etnologia"
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE Descripciones 
    ADD CONSTRAINT Descripcion1 FOREIGN KEY 
    ( 
     "ID-BellasArtes"
    ) 
    REFERENCES "Bellas artes" 
    ( 
     "ID-BellasArtes"
    ) 
;


ALTER TABLE Descripciones 
    ADD CONSTRAINT Descripcion2 FOREIGN KEY 
    ( 
     "ID-Global+Propietario"
    ) 
    REFERENCES Objetos 
    ( 
     "ID-Global+Propietario"
    ) 
;


ALTER TABLE Descripciones 
    ADD CONSTRAINT Descripcion3 FOREIGN KEY 
    ( 
     "ID-Etnologia"
    ) 
    REFERENCES Etnologia 
    ( 
     "ID-Etnologia"
    ) 
;


ALTER TABLE Exposicion 
    ADD CONSTRAINT Exposicion FOREIGN KEY 
    ( 
     "ID-BellasArtes"
    ) 
    REFERENCES "Bellas artes" 
    ( 
     "ID-BellasArtes"
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE "ID-Artista" 
    ADD CONSTRAINT FK_ASS_1 FOREIGN KEY 
    ( 
     "Bellas artes_ID-BellasArtes"
    ) 
    REFERENCES "Bellas artes" 
    ( 
     "ID-BellasArtes"
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE "ID-Artista" 
    ADD CONSTRAINT FK_ASS_2 FOREIGN KEY 
    ( 
     "Artistas_ID-Artista"
    ) 
    REFERENCES Artistas 
    ( 
     "ID-Artista"
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE Etnologia 
    ADD CONSTRAINT "ID-Categoria" FOREIGN KEY 
    ( 
     "ID-Global+Propietario"
    ) 
    REFERENCES Objetos 
    ( 
     "ID-Global+Propietario"
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE Objetos 
    ADD CONSTRAINT "ID-Categoria" FOREIGN KEY 
    ( 
     "ID-Arqueologia"
    ) 
    REFERENCES Arqueologia 
    ( 
     "ID-Arqueologia"
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE Arqueologia 
    ADD CONSTRAINT "ID-Categoria" FOREIGN KEY 
    ( 
     "ID-Global+Propietario"
    ) 
    REFERENCES Objetos 
    ( 
     "ID-Global+Propietario"
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE Objetos 
    ADD CONSTRAINT "ID-Categoriav1" FOREIGN KEY 
    ( 
     "ID-Etnologia"
    ) 
    REFERENCES Etnologia 
    ( 
     "ID-Etnologia"
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE Etnologia 
    ADD CONSTRAINT "ID-Conservacion" FOREIGN KEY 
    ( 
     "ID-Conservacion1"
    ) 
    REFERENCES Conservacion 
    ( 
     "ID-Conservacion"
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE Arqueologia 
    ADD CONSTRAINT "ID-Conservacion" FOREIGN KEY 
    ( 
     "ID-Conservacion"
    ) 
    REFERENCES Conservacion 
    ( 
     "ID-Conservacion"
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE Conservacion 
    ADD CONSTRAINT "ID-Conservacion" FOREIGN KEY 
    ( 
     "ID-Arqueologia"
    ) 
    REFERENCES Arqueologia 
    ( 
     "ID-Arqueologia"
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE Conservacion 
    ADD CONSTRAINT "ID-Conservacionv1" FOREIGN KEY 
    ( 
     "ID-Etnologia"
    ) 
    REFERENCES Etnologia 
    ( 
     "ID-Etnologia"
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE Etnologia 
    ADD CONSTRAINT "ID-Desperfecto" FOREIGN KEY 
    ( 
     "ID-Desperfecto1"
    ) 
    REFERENCES Desperfectos 
    ( 
     "ID-Desperfecto"
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE Desperfectos 
    ADD CONSTRAINT "ID-Desperfecto" FOREIGN KEY 
    ( 
     "ID-Arqueologia"
    ) 
    REFERENCES Arqueologia 
    ( 
     "ID-Arqueologia"
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE Arqueologia 
    ADD CONSTRAINT "ID-Desperfecto" FOREIGN KEY 
    ( 
     "ID-Desperfecto1"
    ) 
    REFERENCES Desperfectos 
    ( 
     "ID-Desperfecto"
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE Desperfectos 
    ADD CONSTRAINT "ID-Desperfectov1" FOREIGN KEY 
    ( 
     "ID-Etnologia"
    ) 
    REFERENCES Etnologia 
    ( 
     "ID-Etnologia"
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE Materiales 
    ADD CONSTRAINT "ID-Material" FOREIGN KEY 
    ( 
     "ID-Etnologia"
    ) 
    REFERENCES Etnologia 
    ( 
     "ID-Etnologia"
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE Materiales 
    ADD CONSTRAINT "ID-Materialv2" FOREIGN KEY 
    ( 
     "ID-BellasArtes"
    ) 
    REFERENCES "Bellas artes" 
    ( 
     "ID-BellasArtes"
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE Materiales 
    ADD CONSTRAINT "ID-Materialv3" FOREIGN KEY 
    ( 
     "ID-Arqueologia"
    ) 
    REFERENCES Arqueologia 
    ( 
     "ID-Arqueologia"
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE Objetos 
    ADD CONSTRAINT "ID-Objeto" FOREIGN KEY 
    ( 
     "ID-BellasArtes"
    ) 
    REFERENCES "Bellas artes" 
    ( 
     "ID-BellasArtes"
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE "Bellas artes" 
    ADD CONSTRAINT "ID-Objeto" FOREIGN KEY 
    ( 
     "ID-Global+Propietario"
    ) 
    REFERENCES Objetos 
    ( 
     "ID-Global+Propietario"
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE Procedencia 
    ADD CONSTRAINT Procedencia FOREIGN KEY 
    ( 
     "ID-Arqueologia"
    ) 
    REFERENCES Arqueologia 
    ( 
     "ID-Arqueologia"
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE Descripciones 
    ADD CONSTRAINT Relation_15 FOREIGN KEY 
    ( 
     "ID-Arqueologia"
    ) 
    REFERENCES Arqueologia 
    ( 
     "ID-Arqueologia"
    ) 
;


ALTER TABLE Intervenciones 
    ADD CONSTRAINT Relation_21 FOREIGN KEY 
    ( 
     "ID-BellasArtes"
    ) 
    REFERENCES "Bellas artes" 
    ( 
     "ID-BellasArtes"
    ) 
;


ALTER TABLE Intervenciones 
    ADD CONSTRAINT Relation_22 FOREIGN KEY 
    ( 
     "ID-Arqueologia"
    ) 
    REFERENCES Arqueologia 
    ( 
     "ID-Arqueologia"
    ) 
;


ALTER TABLE Intervenciones 
    ADD CONSTRAINT Relation_23 FOREIGN KEY 
    ( 
     "ID-Etnologia"
    ) 
    REFERENCES Etnologia 
    ( 
     "ID-Etnologia"
    ) 
;



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            14
-- CREATE INDEX                            16
-- ALTER TABLE                             41
-- CREATE VIEW                              0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE STRUCTURED TYPE                   0
-- CREATE COLLECTION TYPE                   0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
