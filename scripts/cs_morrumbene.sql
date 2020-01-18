USE openmrs;

SET @ydata := '2019-12-20';
SET @sismaLocationID := 1081111; -- CS Morrumbene
SET @openmrsID :=212;


INSERT INTO global_property (property,property_value,description,UUID)
VALUES('esaudemetadata.hfc',@sismaLocationID,'health facility code',UUID());
INSERT INTO global_property (property,property_value,description,UUID) 
VALUES('esaudemetadata.dateToImportTo',@ydata,'Date when data should be fetched to provide it',UUID());

SET FOREIGN_KEY_CHECKS = 0;
UPDATE obs en SET en.location_id = @openmrsID WHERE en.location_id IS NULL OR en.location_id != @openmrsID;
UPDATE encounter en SET en.location_id = @openmrsID WHERE en.location_id IS NULL OR en.location_id != @openmrsID;
UPDATE visit en SET en.location_id = @openmrsID WHERE en.location_id IS NULL OR en.location_id != @openmrsID;
UPDATE patient_program en SET en.location_id = @openmrsID WHERE en.location_id IS NULL OR en.location_id != @openmrsID;

CALL temp.proc_remove_dups_filas();
CALL temp.proc_remove_dups_buscas();

-- Check if two patients are using the same NID (Problem caused by synchronization)
-- ---------------------------------------------------------------------------------
SELECT identifier,COUNT(*)
FROM openmrs.patient_identifier
WHERE voided=0 AND identifier_type=2
GROUP BY identifier
HAVING COUNT(*)>=2;

CALL export_db.EXPORTDB();