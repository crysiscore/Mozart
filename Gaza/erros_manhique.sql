
select obs_id,person_id, concept_id,order_id,obs_datetime,location_id 
 from openmrs.obs where encounter_id= 12267 order by concept_id ;



 delete  from openmrs.obs where obs_id in (116143);
  delete from openmrs.obs where obs_id in (116160,116161);
 


