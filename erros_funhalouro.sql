
select obs_id,person_id, concept_id,order_id,obs_datetime,location_id 
 from openmrs.obs where encounter_id= 117160 order by concept_id ;



 delete  from openmrs.obs where obs_id in (1419144);
  delete from openmrs.obs where obs_id in (1438203);
   delete from openmrs.obs where obs_id in (1419131);
  