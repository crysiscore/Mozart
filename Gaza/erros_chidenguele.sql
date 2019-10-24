
select obs_id,person_id, concept_id,order_id,obs_datetime,location_id 
 from openmrs.obs where encounter_id= 136876 order by concept_id ;


select obs_id,person_id, concept_id,order_id,obs_datetime,location_id 
 from openmrs.obs where encounter_id= 111458 order by concept_id ;






delete  from openmrs.obs where obs_id in (1559293);
delete from openmrs.obs where obs_id in (1559277);

delete from openmrs.obs where obs_id in (1327463);
delete from openmrs.obs where obs_id in (1327466,1316807,1327465);
delete from openmrs.obs where obs_id in (1327464,1316808,1327463);


delete from openmrs.obs where obs_id in (1339365,1354133,1354134);
delete from openmrs.obs where obs_id in (1354131,1339362,1354136);

delete from openmrs.obs where obs_id in (1507679,1505662,1507681,1505661,1505660,1505663,1507677,1507680);
    delete from openmrs.obs where obs_id in (
        delete from openmrs.obs where obs_id in (
