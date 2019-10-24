
select obs_id,person_id, concept_id,order_id,obs_datetime,location_id 
 from openmrs.obs where encounter_id= 220096 order by concept_id ;



 delete  from openmrs.obs where obs_id in (2633519);
  delete from openmrs.obs where obs_id in (2633520);

  

