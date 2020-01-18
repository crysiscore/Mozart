SELECT obs_id,person_id, concept_id,order_id,obs_datetime,location_id ,voided
 FROM openmrs.obs WHERE encounter_id= 280676 ORDER BY concept_id ;


DELETE FROM openmrs.obs WHERE obs_id IN (2233633,2233647);
DELETE FROM openmrs.obs WHERE obs_id IN (2110833,2110834);
delete from openmrs.obs where obs_id in (3163520,3145473,3145465);
delete from openmrs.obs where obs_id in (3163517,3163517,3163919,3176543,3189022);

ERROR 1062 (23000): Duplicate entry '08111101/15/0184' 