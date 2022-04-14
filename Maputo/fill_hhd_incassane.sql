DELIMITER $$

USE `export_db`$$

DROP PROCEDURE IF EXISTS `FillTHDD`$$

CREATE PROCEDURE `FillTHDD`(distrito VARCHAR(40))
    READS SQL DATA
BEGIN

TRUNCATE TABLE t_hdd;

INSERT INTO t_hdd(hdd,designacao,LOCAL,distrito,provincia,location_id)
SELECT location_id,NAME,address2,county_district,state_province,location_id
FROM openmrs.location l
WHERE county_district=distrito;


UPDATE t_hdd,
	(SELECT hdd,
				CASE hdd
					WHEN 212   THEN '1110613'		
				ELSE hdd
				END AS codhdd
		FROM t_hdd )codhdd
SET t_hdd.hdd=codhdd.codhdd
WHERE t_hdd.hdd=codhdd.hdd;

DELETE FROM t_hdd WHERE LENGTH(hdd)<=4;

END$$

DELIMITER ;