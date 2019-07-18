
SELECT obs_id,person_id, concept_id,order_id,obs_datetime,location_id ,voided
 FROM openmrs.obs WHERE encounter_id= 19227 ORDER BY concept_id ;


 DELETE FROM openmrs.obs WHERE obs_id IN (241321);