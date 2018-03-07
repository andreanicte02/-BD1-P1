OPTIONS(SKIP=2)
LOAD DATA
CHARACTERSET WE8MSWIN1252
INFILE 'archivos/LISTA_PRECIOS.txt'
INTO TABLE lista_precio TRUNCATE
FIELDS TRAILING NULLCOLS
(
farmacia_fm_id POSITION(1:10) "TRIM(:farmacia_fm_id)",
medicina_md_id POSITION(12:21) "TRIM(:medicina_md_id)",
lp_precio POSITION(23:32) "TRIM(:lp_precio)"
)
