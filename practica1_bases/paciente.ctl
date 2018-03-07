OPTIONS(SKIP=2)
LOAD DATA
CHARACTERSET WE8MSWIN1252
INFILE 'archivos/PACIENTES.txt'
INTO TABLE paciente TRUNCATE
FIELDS TRAILING NULLCOLS
(
pc_id POSITION(1:10) "TRIM(:pc_id)",
pc_nombre POSITION(12:32) "TRIM(:pc_nombre)",
pc_telefono POSITION(44:52) "TRIM(:pc_telefono)",
pc_direccion POSITION(54:84) "TRIM(:pc_direccion)",
doctor_dc_id POSITION(86:97) "TRIM(:doctor_dc_id)"
)