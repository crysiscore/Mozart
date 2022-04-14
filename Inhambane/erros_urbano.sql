
select obs_id,person_id, concept_id,order_id,obs_datetime,location_id 
 from openmrs.obs where encounter_id= 407363 order by concept_id ;


select obs_id,person_id, concept_id,order_id,obs_datetime,location_id 
 from openmrs.obs where encounter_id= 409390 order by concept_id ;


 delete from openmrs.obs where obs_id in (4581865);
  delete from openmrs.obs where obs_id in (4687847,4687849,4687848,4687850);
 -- delete from openmrs.obs where obs_id in ();
-- delete from openmrs.obs where obs_id in ();

