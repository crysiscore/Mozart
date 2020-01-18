 -- select * from openmrs.obs where encounter_id= 328661 order by concept_id ;
--  select * from openmrs.obs where encounter_id= 250526 order by concept_id ;
-- select * from openmrs.obs where encounter_id= 250479 order by concept_id ;
select * from openmrs.obs where encounter_id= 383024 order by concept_id ;
select obs_id,person_id, concept_id,order_id,obs_datetime,location_id 
 from openmrs.obs where encounter_id= 432831 order by concept_id ;

select obs_id,person_id, concept_id,order_id,obs_datetime,location_id 
 from openmrs.obs where encounter_id= 714634 order by concept_id ;



 delete from openmrs.obs where obs_id in (5131179);
 delete from openmrs.obs where obs_id in (5267479);
 delete from openmrs.obs where obs_id in (5293329,5293470,5293486);
 delete from openmrs.obs where obs_id in (5323923);
 delete from openmrs.obs where obs_id in (5704613,5704618,5704619,5704620,5704621);
 delete from openmrs.obs where obs_id in (5131179,7834866,7834861);
 delete from openmrs.obs where obs_id in (7833957,7833940,7833938);
 delete from openmrs.obs where obs_id in (7838162,7838148,7838156,7838140,7838151,7838150,7838158,7838154,7838155,7838152,7838163)
 delete from openmrs.obs where obs_id in (7868778,7868795,7868794,7868805,7868797,7868784,7868784,7868773,7868777,7868787,7868780)
-- select * from export_db.t_tratamentotb where data = '0000-00-00 00:00:00';
-- delete  from export_db.t_tratamentotb where data = '0000-00-00 00:00:00';