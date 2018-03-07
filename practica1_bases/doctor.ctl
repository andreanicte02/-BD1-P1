OPTIONS(SKIP=2)
LOAD DATA
CHARACTERSET WE8MSWIN1252
INFILE 'archivos/DOCTORES.txt'
INTO TABLE doctor TRUNCATE
FIELDS TRAILING NULLCOLS
(
dc_id POSITION(1:10) "TRIM(:dc_id)",
dc_nombre POSITION(12:32) "TRIM(:dc_nombre)",
dc_especialidad POSITION(34:42) "TRIM(:dc_especialidad)",
dc_anios_experiencia POSITION(44:52) "TRIM(:dc_anios_experiencia)",
dc_salario POSITION(54:63) "TRIM(:dc_salario)"
)
