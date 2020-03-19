-- MySQL dump 10.13  Distrib 5.6.16, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: temp
-- ------------------------------------------------------
-- Server version	5.6.16-1~exp1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping routines for database 'temp'
--
/*!50003 DROP PROCEDURE IF EXISTS `proc_remove_dups_buscas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_remove_dups_buscas`()
BEGIN
  DECLARE dup int;
  
  SELECT count(*) INTO dup 
        from (SELECT patient_id, encounter_datetime, COUNT(*)
			   FROM   openmrs.encounter
			   WHERE  voided = 0 AND encounter_type = 21
			   GROUP BY 1 , 2
			   HAVING COUNT(*) >= 2) duplicados;
 
 
   WHILE dup > 0 DO
    
 		DELETE FROM export_db.t_void_duplo;
		INSERT INTO export_db.t_void_duplo 
 		SELECT Min(encounter_id)
			FROM openmrs.encounter,(
				SELECT patient_id,encounter_datetime
				FROM openmrs.encounter
				WHERE voided=0 AND encounter_type=21 GROUP BY 1,2 
				HAVING Count(*)>=2 )duplo_tarv
		WHERE encounter.patient_id=duplo_tarv.patient_id
		AND encounter.encounter_datetime=duplo_tarv.encounter_datetime AND encounter_type=21 
		AND encounter.voided=0 
		GROUP BY duplo_tarv.patient_id;

	 	UPDATE openmrs.encounter SET voided=1	WHERE encounter_id IN(SELECT encounter_id 
 					  FROM export_db.t_void_duplo);
 		UPDATE openmrs.obs SET voided=1     	WHERE encounter_id IN( SELECT encounter_id 
                        FROM export_db.t_void_duplo); 

 		SELECT count(*) INTO dup 
        from (SELECT patient_id, encounter_datetime, COUNT(*)
			   FROM   openmrs.encounter
			   WHERE  voided = 0 AND encounter_type = 21
			   GROUP BY 1 , 2
			   HAVING COUNT(*) >= 2 ) duplicados; 
   END WHILE;
   
SELECT patient_id, encounter_datetime, COUNT(*)
			   FROM   openmrs.encounter
			   WHERE  voided = 0 AND encounter_type = 21
			   GROUP BY 1 , 2
			   HAVING COUNT(*) >= 2;
                    
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_remove_dups_filas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_remove_dups_filas`()
BEGIN
  DECLARE dup int;
  
  SELECT count(*) INTO dup 
        from (SELECT patient_id,encounter_datetime,Count(*)
			        FROM openmrs.encounter 
                    WHERE voided=0 AND encounter_type= 18 
					GROUP BY 1,2 HAVING Count(*)>=2 ) duplicados;
 
 
   WHILE dup > 0 DO
    
 		DELETE FROM export_db.t_void_duplo;
 		INSERT INTO export_db.t_void_duplo 
		        SELECT Min(encounter_id) 
			    FROM openmrs.encounter,( SELECT patient_id,encounter_datetime
 										 FROM openmrs.encounter
 										 WHERE voided=0 AND encounter_type=18 
                                          GROUP BY 1,2 
                                          HAVING Count(*)>=2) duplo_tarv 
                 WHERE encounter.patient_id=duplo_tarv.patient_id 
                 AND encounter.encounter_datetime=duplo_tarv.encounter_datetime 
                 AND encounter_type=18 AND encounter.voided=0
                 GROUP BY duplo_tarv.patient_id;

	 	UPDATE openmrs.encounter SET voided=1	WHERE encounter_id IN(SELECT encounter_id 
 					  FROM export_db.t_void_duplo);
 		UPDATE openmrs.obs SET voided=1     	WHERE encounter_id IN( SELECT encounter_id 
                        FROM export_db.t_void_duplo); 

 		 SELECT count(*) INTO dup 
        from (SELECT patient_id,encounter_datetime,Count(*)
			        FROM openmrs.encounter 
                    WHERE voided=0 AND encounter_type= 18 
					GROUP BY 1,2 HAVING Count(*)>=2 ) duplicados; 
   END WHILE;
   
   SELECT patient_id,encounter_datetime,Count(*)
			        FROM openmrs.encounter 
                    WHERE voided=0 AND encounter_type= 18 
					GROUP BY 1,2 HAVING Count(*)>=2 ;
   
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-12  9:21:41
