CREATE TABLE `host` (
`id` bigint unsigned NOT NULL AUTO_INCREMENT,
`v` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
PRIMARY KEY (`id`),
UNIQUE KEY `host_UN` (`v`)
)  DEFAULT CHARSET=binary;
CREATE TABLE `kind` (
`id` bigint unsigned NOT NULL AUTO_INCREMENT,
`v` varchar(255) DEFAULT NULL,
`duration` int unsigned NOT NULL DEFAULT '60',
`warnErr` int unsigned DEFAULT NULL,
`host_id` bigint unsigned NOT NULL,
PRIMARY KEY (`id`),
UNIQUE KEY `kind_UN` (`v`)
) ;
CREATE TABLE `log` (
`id` bigint unsigned NOT NULL AUTO_INCREMENT,
`watch_id` bigint unsigned NOT NULL,
`state` tinyint unsigned NOT NULL,
`ts` bigint unsigned NOT NULL,
PRIMARY KEY (`id`),
UNIQUE KEY `state_watch_id_IDX` (`watch_id`,`ts`)
) DEFAULT CHARSET=binary;
CREATE TABLE `url` (
`id` bigint unsigned NOT NULL AUTO_INCREMENT,
`v` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
PRIMARY KEY (`id`),
UNIQUE KEY `url_UN` (`v`)
)  DEFAULT CHARSET=binary;
CREATE TABLE `watch` (
`id` bigint unsigned NOT NULL AUTO_INCREMENT,
`host_id` bigint unsigned NOT NULL,
`kind_id` bigint unsigned NOT NULL,
`dns_type` tinyint unsigned NOT NULL,
`ts` bigint unsigned NOT NULL DEFAULT '0',
`err` int unsigned NOT NULL DEFAULT '0',
`url_id` bigint unsigned NOT NULL DEFAULT '0',
PRIMARY KEY (`id`),
UNIQUE KEY `watch_UN` (`dns_type`,`kind_id`,`host_id`,`url_id`),
KEY `watch_kind_IDX` (`kind_id`,`ts`)
) ;
DELIMITER ;;
;;
DELIMITER ;
DELIMITER ;;
CREATE FUNCTION "hostId"(val VARBINARY(255)) RETURNS bigint unsigned
BEGIN
DECLARE id BIGINT UNSIGNED;
SELECT host.id INTO id FROM host WHERE v=val;
IF id IS NULL THEN
INSERT INTO host (v) VALUES (val);
SET id = LAST_INSERT_ID();
END IF;
RETURN id;
END ;;
DELIMITER ;
DELIMITER ;;
CREATE FUNCTION "urlId"(val VARBINARY(255)) RETURNS bigint unsigned
BEGIN
DECLARE id BIGINT UNSIGNED;
SELECT url.id INTO id FROM url WHERE v=val;
IF id IS NULL THEN
INSERT INTO url(v) VALUES (val);
SET id = LAST_INSERT_ID();
END IF;
RETURN id;
END ;;
DELIMITER ;
