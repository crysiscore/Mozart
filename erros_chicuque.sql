
select obs_id,person_id, concept_id,order_id,obs_datetime,location_id 
 from openmrs.obs where encounter_id= 245693 order by concept_id ;


 delete from openmrs.obs where obs_id in (3038504);
  delete from openmrs.obs where obs_id in (3133813,3133837,3133815);
 -- delete from openmrs.obs where obs_id in ();
-- delete from openmrs.obs where obs_id in ();


