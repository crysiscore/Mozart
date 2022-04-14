
select obs_id,person_id, concept_id,order_id,obs_datetime,location_id 
 from openmrs.obs where encounter_id= 56633 order by concept_id ;


 delete from openmrs.obs where obs_id in (1389535,1389534);
  delete from openmrs.obs where obs_id in ();
 -- delete from openmrs.obs where obs_id in ();
-- delete from openmrs.obs where obs_id in ();

