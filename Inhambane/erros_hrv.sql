
select obs_id,person_id, concept_id,order_id,obs_datetime,location_id 
 from openmrs.obs where encounter_id= 637717 order by concept_id ;



 delete  from openmrs.obs where obs_id in (7500483,7500509,7500514,7500479,7500481,7500500,7500510,7500488,7500493);
  delete from openmrs.obs where obs_id in (7500499,7500472,7500507,7500503,7500496,7500484,7500508,7500511,7500512);

  delete from openmrs.obs where obs_id in (7500474,7500475,7500494,7500515,7500516);
    delete from openmrs.obs where obs_id in (7459230)
    delete from openmrs.obs where obs_id in (