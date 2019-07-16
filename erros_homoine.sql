
select obs_id,person_id, concept_id,order_id,obs_datetime,location_id 
 from openmrs.obs where encounter_id= 283727 order by concept_id ;


 delete from openmrs.obs where obs_id in (3710862);
  delete from openmrs.obs where obs_id in (3712617);
 -- delete from openmrs.obs where obs_id in (5293329,5293470,5293486);
-- delete from openmrs.obs where obs_id in (4238626);


-- select * from export_db.t_tratamentotb where data = '0000-00-00 00:00:00';
-- delete  from export_db.t_tratamentotb where data = '0000-00-00 00:00:00';