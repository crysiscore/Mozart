
select obs_id,person_id, concept_id,order_id,obs_datetime,location_id ,voided
 from openmrs.obs where encounter_id= 179964 and voided =0  order by concept_id ;


select obs_id,person_id, concept_id,order_id,obs_datetime,location_id ,voided
 from openmrs.obs where encounter_id= 270450 and voided =0  order by concept_id ;

select obs_id,person_id, concept_id,order_id,obs_datetime,location_id ,voided
 from openmrs.obs where encounter_id= 277443 and voided =0  order by concept_id ;



 delete from openmrs.obs where obs_id in (2632258,2632257,2632256,2632255,2632254,2332341,2632253);
  delete from openmrs.obs where obs_id in (3111393,3074723,3132188,3172045,3131690,3131686);


