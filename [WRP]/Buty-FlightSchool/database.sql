CREATE TABLE `flyschool` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`identifier` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`airplane` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`helicopter` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;