OPTIONS(SKIP=2)
LOAD DATA
CHARACTERSET WE8MSWIN1252
INFILE 'archivos/FARMACIAS.txt'
INTO TABLE farmacia TRUNCATE
FIELDS TRAILING NULLCOLS
(
fm_id POSITION(1:10) "TRIM(:fm_id)",
fm_nombre POSITION(12:32) "TRIM(:fm_nombre)",
fm_direccion POSITION(34:61) "TRIM(:fm_direccion)",
fm_telefono POSITION(63:70) "TRIM(:fm_telefono)"
)
