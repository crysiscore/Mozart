/*

mysql -uroot  -ppassword  < MOZART_EXPORTDBUpdateQ22022.sql ;
mysql -uroot  -ppassword  < sp_temp.sql
mysql -uroot  -ppassword -e " grant all privileges on *.* to 'esaude'@'%';  flush privileges; "
mysql -uesaude   -pesaude openmrs

*/

SELECT  l.location_id, l.UUID, l.NAME FROM location l WHERE l.NAME in  (SELECT property_value FROM global_property WHERE property = 'default_location' );

UPDATE global_property SET property_value = 212 WHERE property='mozart.location';

-- Confirmar o sisma code
select location_id, value_reference  from location_attribute where location_id=212; 
-- set @sismaLocationID := 1110512;  -- cs_inhagoia



use openmrs;
set @openmrsID :=212;
SET foreign_key_checks = 0;
UPDATE obs en SET en.location_id = @openmrsID WHERE en.location_id IS NULL OR en.location_id != @openmrsID;
UPDATE encounter en SET en.location_id = @openmrsID WHERE en.location_id IS NULL OR en.location_id != @openmrsID;
UPDATE visit en SET en.location_id = @openmrsID WHERE en.location_id IS NULL OR en.location_id != @openmrsID;
UPDATE patient_program en SET en.location_id = @openmrsID WHERE en.location_id IS NULL OR en.location_id != @openmrsID;
SET foreign_key_checks = 1;

call temp.proc_remove_dups_filas();
call temp.proc_remove_dups_buscas();
call temp.proc_limpar_nid();

-- Check if two patients are using the same NID (Problem caused by synchronization)

CALL export_db.EXPORTDB('2022-03-20'); 

