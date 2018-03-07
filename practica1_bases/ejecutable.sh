ALTER SESSION SET NLS_SORT=SPANISH_AI

sqlplus PRUEBA1/123 @base.sql


sqlldr userid= PRUEBA1/123 control=doctor.ctl
read

sqlldr userid= PRUEBA1/123 control=paciente.ctl
read

sqlldr userid= PRUEBA1/123 control=lab.ctl
read


sqlldr userid= PRUEBA1/123 control=medicina.ctl
read

sqlldr userid= PRUEBA1/123 control=farmacia.ctl
read


sqlldr userid= PRUEBA1/123 control=lp.ctl
read

sqlldr userid= PRUEBA1/123 control=pre.ctl
read
