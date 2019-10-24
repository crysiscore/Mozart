

select * from openmrs.patint_identifier where identifier='0806001/13/0860'
update  openmrs.patint_identifier  set patint_identifier = '010806001/2013/00860'
where patient_id=9169;


ERROR 1062 (23000): Duplicate entry '05010001/10/1964-2018-11-21 00:00:00-TDF+3TC+EFV' for key 'unique_key'
ERROR 1062 (23000): Duplicate entry '07010901/07/1575-2018-02-02 00:00:00-AZT+3TC+NVP' for key 'unique_key'
ERROR 1062 (23000): Duplicate entry '07010001/06/3987-2018-02-02 00:00:00-AZT+3TC+NVP' for key 'unique_key'
'0800201/07/0518-2017-08-28 00:00:00-TDF+3TC+EFV'