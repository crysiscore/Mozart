/* drop database openmrs; create database openmrs; drop database export_db;

cd /data/mozart/
mysql -uroot  -ppassword -e "create database export_db;"
mysql -uroot  -ppassword -e "create database temp;"

mysql -uroot  -ppassword export_db < MOZART_EXPORTDUpdate11092020.sql;
mysql -uroot  -ppassword temp < sp_temp.sql

mysql -uroot  -ppassword -e " grant all privileges on *.* to 'esaude'@'%';  flush privileges; "
 
SELECT location_id,NAME,address2,county_district,state_province,location_id FROM openmrs.location l WHERE county_district='Cidade de Maputo'; 
SELECT location_id,NAME,address2,county_district,state_province,location_id FROM openmrs.location l WHERE county_district='Maputo'; 

*/

SELECT  l.location_id, l.UUID, l.NAME FROM location l WHERE l.NAME in  (SELECT property_value FROM global_property WHERE property = 'default_location' );

UPDATE global_property SET property_value = 212 WHERE property='mozart.location';




use openmrs;

-- set @ydata := '2021-03-20';
-- set @sismaLocationID := 1110106;  -- cs_hpi
set @openmrsID :=212;



-- update global_property 
-- set property_value = @sismaLocationID
-- where  property ='esaudemetadata.hfc';


-- update global_property 
-- set property_value = @ydata 
-- where  property ='esaudemetadata.dateToImportTo';

-- select  property,property_value,description,uuid from global_property where property ='esaudemetadata.hfc' or property='esaudemetadata.dateToImportTo';

SET foreign_key_checks = 0;
UPDATE obs en SET en.location_id = @openmrsID WHERE en.location_id IS NULL OR en.location_id != @openmrsID;
UPDATE encounter en SET en.location_id = @openmrsID WHERE en.location_id IS NULL OR en.location_id != @openmrsID;
UPDATE visit en SET en.location_id = @openmrsID WHERE en.location_id IS NULL OR en.location_id != @openmrsID;
UPDATE patient_program en SET en.location_id = @openmrsID WHERE en.location_id IS NULL OR en.location_id != @openmrsID;

call temp.proc_remove_dups_filas();
call temp.proc_remove_dups_buscas();



CALL export_db.EXPORTDB('2021-12-20'); 



