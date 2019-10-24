
select obs_id,person_id, concept_id,order_id,obs_datetime,location_id 
 from openmrs.obs where encounter_id= 245693 order by concept_id ;


select obs_id,person_id, concept_id,order_id,obs_datetime,location_id 
 from openmrs.obs where encounter_id= 234900 order by concept_id ;



 delete  from openmrs.obs where obs_id in (3038615);
  delete from openmrs.obs where obs_id in (3133815);
  delete from openmrs.obs where obs_id in (3133836);
 delete from openmrs.obs where obs_id in (3133837);


