
select obs_id,person_id, concept_id,order_id,obs_datetime,location_id 
 from openmrs.obs where encounter_id= 245693 order by concept_id ;


select obs_id,person_id, concept_id,order_id,obs_datetime,location_id 
 from openmrs.obs where encounter_id= 363336 order by concept_id ;



 delete  from openmrs.obs where obs_id in (3038615);
  delete from openmrs.obs where obs_id in (3133815);
  delete from openmrs.obs where obs_id in (3133836);

 delete from openmrs.obs where obs_id in (3133837,4279057,42790484279052,4279067,4279047,4279046,4279062);
 delete from openmrs.obs where obs_id in (4249193,4249215,4249201,4249207,4249205,4249200,4249219);
delete from openmrs.obs where obs_id in (4279060);
delete from openmrs.obs where obs_id in (