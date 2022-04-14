
select obs_id,person_id, concept_id,order_id,obs_datetime,location_id 
 from openmrs.obs where encounter_id= 631712 order by concept_id ;



 delete  from openmrs.obs where obs_id in (7500483,7500509,7500514,7500479,7500481,7500500,7500510,7500488,7500493);
