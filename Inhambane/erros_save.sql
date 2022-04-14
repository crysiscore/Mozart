
select obs_id,person_id, concept_id,order_id,obs_datetime,location_id 
 from openmrs.obs where encounter_id= 15364 order by concept_id ;



 delete  from openmrs.obs where obs_id in (547906);
  delete from openmrs.obs where obs_id in (547515);
  delete from openmrs.obs where obs_id in (547907,547909);
delete from openmrs.obs where obs_id in (547507,148729,148730);