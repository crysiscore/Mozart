
use openmrs;

set @ydata := '2019-09-20';
set @sismaLocationID := 1090928; -- cs_macasselane
set @openmrsID :=316;


update global_property 
set property_value = @sismaLocationID
where  property ='esaudemetadata.hfc';

update global_property 
set property_value = @ydata 
where  property ='esaudemetadata.dateToImportTo';

select  property,property_value,description,uuid from global_property where property ='esaudemetadata.hfc' or property='esaudemetadata.dateToImportTo';


SET foreign_key_checks = 0;
UPDATE obs en SET en.location_id = @openmrsID WHERE en.location_id IS NULL OR en.location_id != @openmrsID;
UPDATE encounter en SET en.location_id = @openmrsID WHERE en.location_id IS NULL OR en.location_id != @openmrsID;
UPDATE visit en SET en.location_id = @openmrsID WHERE en.location_id IS NULL OR en.location_id != @openmrsID;
UPDATE patient_program en SET en.location_id = @openmrsID WHERE en.location_id IS NULL OR en.location_id != @openmrsID;

call temp.proc_remove_dups_filas();
call temp.proc_remove_dups_buscas();

-- Check if two patients are using the same NID (Problem caused by synchronization)
-- ---------------------------------------------------------------------------------
SELECT identifier,Count(*)
FROM openmrs.patient_identifier
WHERE voided=0 AND identifier_type=2
GROUP BY identifier
HAVING Count(*)>=2;

call export_db.EXPORTDB();
