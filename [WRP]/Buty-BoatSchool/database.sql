CREATE TABLE `boatlicense` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`identifier` LONGTEXT NOT NULL COLLATE 'utf8mb4_general_ci',
	`theoretical` LONGTEXT NOT NULL COLLATE 'utf8mb4_general_ci',
	`practical` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;