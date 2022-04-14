
-- drop database openmrs; create database openmrs; drop database export_db;


cd /data/Mozart/Q4_2021
mysql -uroot  -ppassword -e "drop database openmrs; create database openmrs; drop database export_db; drop database temp ;"
mysql -uroot  -ppassword -e "create database temp;"

mysql -uroot  -ppassword  < MOZART_EXPORTDBUpdateQ42021.sql;
mysql -uroot  -ppassword  < sp_temp.sql

mysql -uroot  -ppassword -e " grant all privileges on *.* to 'esaude'@'%';  flush privileges; "
 

SELECT location_id,NAME,address2,county_district,state_province,location_id FROM openmrs.location l WHERE county_district='Cidade de Maputo'; 
SELECT location_id,NAME,address2,county_district,state_province,location_id FROM openmrs.location l WHERE county_district='Maputo'; 

