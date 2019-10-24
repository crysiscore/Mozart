  select 	p.patient_id,
					case o.value_coded
						when 1651 then 'AZT+3TC+NVP'
						when 6324 then 'TDF+3TC+EFV'
						when 1703 then 'AZT+3TC+EFV'
						when 6243 then 'TDF+3TC+NVP'
                        when 6104 then  'ABC+3TC+EFV'
                        when 23784 then 'TDF+3TC+DTG'
                        when 23786 then 'ABC+3TC+DTG'
                        when 1311 then 'ABC+3TC+LPV/r (2ª Linha)'
                        when 6234 then 'ABC+TDF+LPV/r'
                        when 1314 then 'AZT+3TC+LPV/r (2ª Linha)'
						when 6103 then  'D4T+3TC+LPV/r'
                        when 23790 then 'TDF+3TC+LPV/r+RTV'
                        when 6107 then 'TDF+AZT+3TC+LPV/r'
                        when 23791 then 'TDF+3TC+ATV/r'
                        when 23792 then 'ABC+3TC+ATV/r'
                        when 23793 then 'AZT+3TC+ATV/r'
                        when 23797 then 'ABC+3TC+DRV/r+RAL'
                        when 6329 then 'TDF+3TC+RAL+DRV/r'
                        when 23815 then 'AZT+3TC+DTG'
                        when 23803 then 'AZT+3TC+RAL+DRV/r'
                        when 23802 then 'AZT+3TC+DRV/r'
                        when 6329 then 'TDF+3TC+RAL+DRV/r'
                        when 23801 then 'AZT+3TC+RAL'
                        when 23798 then '3TC+RAL+DRV/r'
                        when 1313 then 'ABC+3TC+EFV (2ª Linha)'
                        when 23799 then 'TDF+3TC+DTG (2ª Linha)' 
						when 23800 then 'ABC+3TC+DTG (2ª Linha)'
						when 792 then  'D4T+3TC+NVP'
						when 1827 then 'D4T+3TC+EFV'
						when 6102 then 'D4T+3TC+ABC'
						when 6116 then 'AZT+3TC+ABC'
						when 6108 then 'TDF+3TC+LPV/r(2ª Linha)'
						when 6100 then 'AZT+3TC+LPV/r'
                        when 6106 then 'ABC+3TC+LPV'
						when 6330 then 'AZT+3TC+RAL+DRV/r (3ª Linha)'
						when 6105 then 'ABC+3TC+NVP'
						when 6102 then 'D4T+3TC+ABC'
						when 6325 then 'D4T+3TC+ABC+LPV/r (2ª Linha)'
						when 6326 then 'AZT+3TC+ABC+LPV/r (2ª Linha)'
						when 6327 then 'D4T+3TC+ABC+EFV (2ª Linha)'
						when 6328 then 'AZT+3TC+ABC+EFV (2ª Linha)'
						when 6109 then 'AZT+DDI+LPV/r (2ª Linha)'

					else 'OUTRO' end as ultimo_regime,
					e.encounter_datetime data_regime
                   
			from obs o inner join patient p  on o.person_id=p.patient_id inner join encounter e on e.patient_id=p.patient_id								
					where e.encounter_type=18 and e.voided=0  and
								encounter_datetime <=@endDate  and p.voided=0
					and o.obs_datetime=e.encounter_datetime and o.voided=0 and 
					o.concept_id=1088  
		on patient_id=
        select ( patient_id from patient_identifier where identifier = '0800201/07/0518' ) and o.obs_datetime='2017-08-28 00:00:00'



        SELECT encounter_type,e.patient_id,encounter_datetime,count(*) FROM openmrs.encounter e, patient p 
where e.encounter_type=18 and e.voided=0  and p.voided=0 and e.patient_id=p.patient_id
					  and p.patient_id= (select patient_id from patient_identifier where identifier = '080100601/13/0351' ) 
                    and e.encounter_datetime = '2017-01-19 00:00:00'
group by encounter_type,e.patient_id,encounter_datetime
having count(*) > 1