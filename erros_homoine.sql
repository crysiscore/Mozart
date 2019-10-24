
select obs_id,person_id, concept_id,order_id,obs_datetime,location_id 
 from openmrs.obs where encounter_id= 283727 order by concept_id ;


select obs_id,person_id, concept_id,order_id,obs_datetime,location_id ,encounter_id
 from openmrs.obs where encounter_id= 334485 order by concept_id ;


select obs_id,person_id, concept_id,order_id,obs_datetime,location_id ,encounter_id
 from openmrs.obs where encounter_id= 389739 order by concept_id ;

 delete from openmrs.obs where obs_id in (3710862);
  delete from openmrs.obs where obs_id in (3712617);
delete from openmrs.obs where obs_id in (4850081);
delete from openmrs.obs where obs_id in (4850082);

  ERROR 1062 (23000): Duplicate entry '08040601/16/202' for key 'nid'