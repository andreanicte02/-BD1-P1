
DROP TABLE doctor CASCADE CONSTRAINTS ;

DROP TABLE paciente CASCADE CONSTRAINTS ;

DROP TABLE medicina CASCADE CONSTRAINTS;

DROP TABLE laboratorio CASCADE CONSTRAINTS;

DROP TABLE farmacia CASCADE CONSTRAINTS;

DROP TABLE lista_precio CASCADE CONSTRAINTS;

DROP TABLE prescripcion CASCADE CONSTRAINTS;




CREATE TABLE doctor
  (
    dc_id                NUMBER NOT NULL ,
    dc_nombre            VARCHAR2 (45) NOT NULL ,
    dc_especialidad      NUMBER ,
    dc_anios_experiencia NUMBER default 1 ,
    dc_salario           NUMBER ,
    CHECK (dc_anios_experiencia >0 AND dc_anios_experiencia<50),
    CHECK (dc_salario > 2500)
  ) ;
ALTER TABLE doctor ADD CONSTRAINT doctor_PK PRIMARY KEY ( dc_id ) ;



CREATE TABLE paciente
  (
    pc_id              NUMBER NOT NULL ,
    pc_fechanacimiento DATE  ,
    pc_nombre          VARCHAR2 (45) NOT NULL ,
    pc_telefono        VARCHAR2 (45) NOT NULL ,
    pc_direccion       VARCHAR2 (45) ,
    doctor_dc_id       NUMBER NOT NULL
  ) ;
ALTER TABLE paciente ADD CONSTRAINT paciente_PK PRIMARY KEY ( pc_id ) ;




CREATE TABLE laboratorio
  (
    lb_id               NUMBER NOT NULL ,
    lb_nombre           VARCHAR2 (45) NOT NULL ,
    lb_telefono         VARCHAR2 (45) NOT NULL 
  ) ;
ALTER TABLE laboratorio ADD CONSTRAINT laboratorio_PK PRIMARY KEY ( lb_id ) ;




CREATE TABLE medicina
  (
    md_id               NUMBER NOT NULL ,
    md_nombre_comercial VARCHAR2 (45) NOT NULL ,
    md_formula          VARCHAR2 (45) NOT NULL ,
    laboratorio_lb_id   NUMBER NOT NULL,
    CHECK(md_nombre_comercial = UPPER(md_nombre_comercial))
  ) ;
ALTER TABLE medicina ADD CONSTRAINT medicina_PK PRIMARY KEY ( md_id ) ;


CREATE TABLE farmacia
  (
    fm_id        NUMBER NOT NULL ,
    fm_nombre    VARCHAR2 (45 CHAR) NOT NULL ,
    fm_direccion VARCHAR2 (45) ,
    fm_telefono  VARCHAR2 (45) NOT NULL
  ) ;
ALTER TABLE farmacia ADD CONSTRAINT farmacia_PK PRIMARY KEY ( fm_id ) ;


CREATE TABLE lista_precio
  (
    lp_precio      NUMBER ,
    farmacia_fm_id NUMBER NOT NULL ,
    medicina_md_id NUMBER NOT NULL ,
    CHECK(lp_precio>0)
  ) ;
ALTER TABLE lista_precio ADD CONSTRAINT lista_precio_PK PRIMARY KEY ( farmacia_fm_id, medicina_md_id ) ;



CREATE TABLE prescripcion
  (
    cantidad      NUMBER NOT NULL ,
    paciente_pc_id NUMBER NOT NULL ,
    doctor_dc_id   NUMBER NOT NULL ,
    medicina_md_id NUMBER NOT NULL ,
    fecha          DATE ,
    CHECK(cantidad>0)
  ) ;
ALTER TABLE prescripcion ADD CONSTRAINT prescripcion_PK PRIMARY KEY ( paciente_pc_id, doctor_dc_id,medicina_md_id ) ;








ALTER TABLE paciente ADD CONSTRAINT paciente_doctor_FK FOREIGN KEY ( doctor_dc_id ) REFERENCES doctor ( dc_id ) ;

ALTER TABLE medicina ADD CONSTRAINT medicina_laboratorio_FK FOREIGN KEY ( laboratorio_lb_id ) REFERENCES laboratorio ( lb_id ) ;


ALTER TABLE lista_precio ADD CONSTRAINT lista_precio_farmacia_FK FOREIGN KEY ( farmacia_fm_id ) REFERENCES farmacia ( fm_id ) ;

ALTER TABLE lista_precio ADD CONSTRAINT lista_precio_medicina_FK FOREIGN KEY ( medicina_md_id ) REFERENCES medicina ( md_id ) ;



ALTER TABLE prescripcion ADD CONSTRAINT prescripcion_doctor_FK FOREIGN KEY ( doctor_dc_id ) REFERENCES doctor ( dc_id ) ;

ALTER TABLE prescripcion ADD CONSTRAINT prescripcion_medicina_FK FOREIGN KEY ( medicina_md_id ) REFERENCES medicina ( md_id ) ;

ALTER TABLE prescripcion ADD CONSTRAINT prescripcion_paciente_FK FOREIGN KEY ( paciente_pc_id ) REFERENCES paciente ( pc_id ) ;

