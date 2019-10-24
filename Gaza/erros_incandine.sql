
select obs_id,person_id, concept_id,order_id,obs_datetime,location_id 
 from openmrs.obs where encounter_id= 35375 order by concept_id ;



 delete  from openmrs.obs where obs_id in (335821);
  delete from openmrs.obs where obs_id in (335814,335831,335832,430688,411957,371893,371894,411954,411956,430722,371886,411958,430721,411955);
 


