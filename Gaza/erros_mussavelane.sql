
select obs_id,person_id, concept_id,order_id,obs_datetime,location_id 
 from openmrs.obs where encounter_id= 3121 order by concept_id ;



 delete  from openmrs.obs where obs_id in (33422);
  delete from openmrs.obs where obs_id in (33423);
 