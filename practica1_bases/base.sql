
DROP TABLE doctor CASCADE CONSTRAINTS ;

DROP TABLE paciente CASCADE CONSTRAINTS ;

DROP TABLE medicina CASCADE CONSTRAINTS;

DROP TABLE laboratorio CASCADE CONSTRAINTS;




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
    lb_nombre           VARCHAR2 (45) ,
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






ALTER TABLE paciente ADD CONSTRAINT paciente_doctor_FK FOREIGN KEY ( doctor_dc_id ) REFERENCES doctor ( dc_id ) ;

ALTER TABLE medicina ADD CONSTRAINT medicina_laboratorio_FK FOREIGN KEY ( laboratorio_lb_id ) REFERENCES laboratorio ( lb_id ) ;
