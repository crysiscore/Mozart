
select obs_id,person_id, concept_id,order_id,obs_datetime,location_id 
 from openmrs.obs where encounter_id= 97589 order by concept_id ;


select obs_id,person_id, concept_id,order_id,obs_datetime,location_id 
 from openmrs.obs where encounter_id= 379182 order by concept_id ;


 delete from openmrs.obs where obs_id in (2867584);
  delete from openmrs.obs where obs_id in (4251990);
 -- delete from openmrs.obs where obs_id in ();
-- delete from openmrs.obs where obs_id in ();

