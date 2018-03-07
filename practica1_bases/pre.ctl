OPTIONS(SKIP=2)
LOAD DATA
CHARACTERSET WE8MSWIN1252
INFILE 'archivos/PRESCRIPCIONES.txt'
INTO TABLE prescripcion TRUNCATE
FIELDS TRAILING NULLCOLS
(
paciente_pc_id POSITION(1:10) "TRIM(:paciente_pc_id)",
doctor_dc_id POSITION(12:21) "TRIM(:doctor_dc_id)",
medicina_md_id POSITION(23:32) "TRIM(:medicina_md_id)",
fecha POSITION(34:43) "TO_DATE(:fecha,'YYYY/MM/DD','NLS_DATE_LANGUAGE=ENGLISH')",
cantidad POSITION(45:54) "TRIM(:cantidad)"
)
