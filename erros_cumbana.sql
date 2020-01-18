
select obs_id,person_id, concept_id,order_id,obs_datetime,location_id 
 from openmrs.obs where encounter_id= 135113 order by concept_id ;

select obs_id,person_id, concept_id,order_id,obs_datetime,location_id 
 from openmrs.obs where encounter_id= 133965 order by concept_id ;

select obs_id,person_id, concept_id,order_id,obs_datetime,location_id 
 from openmrs.obs where encounter_id= 132551 order by concept_id ;

select obs_id,person_id, concept_id,order_id,obs_datetime,location_id 
 from openmrs.obs where encounter_id= 135113 order by concept_id ;



 delete from openmrs.obs where obs_id in (1485569,1485556);
 delete from openmrs.obs where obs_id in (1475459);

delete from openmrs.obs where obs_id in (1461625);
delete from openmrs.obs where obs_id in (1461627);


delete from openmrs.obs where obs_id in (1433379,1421446,1421532,1421533);
delete from openmrs.obs where obs_id in (1433390,1485569,1485556);


