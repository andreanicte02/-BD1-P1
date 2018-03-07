OPTIONS(SKIP=2)
LOAD DATA
CHARACTERSET WE8MSWIN1252
INFILE 'archivos/MEDICINAS.txt'
INTO TABLE medicina TRUNCATE
FIELDS TRAILING NULLCOLS
(
md_id POSITION(1:10) "TRIM(:md_id)",
md_nombre_comercial POSITION(12:32) "TRIM(:md_nombre_comercial)",
md_formula POSITION(34:61) "TRIM(:md_formula)",
laboratorio_lb_id POSITION(63:71) "TRIM(:laboratorio_lb_id)"

)
