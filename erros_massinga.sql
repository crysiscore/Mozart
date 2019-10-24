 -- select * from openmrs.obs where encounter_id= 328661 order by concept_id ;
--  select * from openmrs.obs where encounter_id= 250526 order by concept_id ;
-- select * from openmrs.obs where encounter_id= 250479 order by concept_id ;
select * from openmrs.obs where encounter_id= 383024 order by concept_id ;
select obs_id,person_id, concept_id,order_id,obs_datetime,location_id 
 from openmrs.obs where encounter_id= 432831 order by concept_id ;

select obs_id,person_id, concept_id,order_id,obs_datetime,location_id 
 from openmrs.obs where encounter_id= 383024 order by concept_id ;



 delete from openmrs.obs where obs_id in (5131179);
 delete from openmrs.obs where obs_id in (5267479);
 delete from openmrs.obs where obs_id in (5293329,5293470,5293486);
 delete from openmrs.obs where obs_id in (5323923);
 delete from openmrs.obs where obs_id in (5704613,5704618,5704619,5704620,5704621);
 delete from openmrs.obs where obs_id in (5131179);


| 08090001/17/228 |        2 |
ERROR 1062 (23000): Duplicate entry '08090001/16/1391' for key 'nid'

-- select * from export_db.t_tratamentotb where data = '0000-00-00 00:00:00';
-- delete  from export_db.t_tratamentotb where data = '0000-00-00 00:00:00';