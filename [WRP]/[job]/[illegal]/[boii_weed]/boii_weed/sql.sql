CREATE TABLE IF NOT EXISTS `drug_tables` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `owner` VARCHAR(255) NOT NULL,
    `drug` VARCHAR(255) NOT NULL,
    `coords` JSON NOT NULL,
    `personal_xp` TINYINT(1) NOT NULL DEFAULT 0,
    `level` INT NOT NULL DEFAULT 1,
    `xp` INT NOT NULL DEFAULT 0,
    `xp_required` INT NOT NULL DEFAULT 1000,
    `is_out` TINYINT(1) NOT NULL DEFAULT 0,
    `contributors` JSON NOT NULL DEFAULT (JSON_OBJECT()),
    `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS `drug_processors` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `player` VARCHAR(255) NOT NULL,
    `drug` VARCHAR(255) NOT NULL,
    `level` INT NOT NULL DEFAULT 1,
    `xp` INT NOT NULL DEFAULT 0,
    `xp_required` INT NOT NULL DEFAULT 1000,
    `metadata` JSON NOT NULL DEFAULT (JSON_OBJECT()),
    UNIQUE (`player`, `drug`)
);

CREATE TABLE IF NOT EXISTS `drug_plants` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `owner` VARCHAR(255) NOT NULL,
    `drug` VARCHAR(255) NOT NULL,
    `strain` VARCHAR(255) NOT NULL,
    `gender` ENUM("m", "f") NOT NULL DEFAULT "f",
    `coords` JSON NOT NULL,
    `stage` INT(1) NOT NULL DEFAULT 1,
    `growth` FLOAT NOT NULL DEFAULT 0,
    `health` FLOAT NOT NULL DEFAULT 100,
    `water` FLOAT NOT NULL DEFAULT 0,
    `food` FLOAT NOT NULL DEFAULT 0,
    `quality` FLOAT NOT NULL DEFAULT 0,
    `altitude_resistance` INT(1) NOT NULL DEFAULT 1 CHECK (`altitude_resistance` BETWEEN 1 AND 5),
    `disease_resistance` INT(1) NOT NULL DEFAULT 1 CHECK (`disease_resistance` BETWEEN 1 AND 5),
    `pest_resistance` INT(1) NOT NULL DEFAULT 1 CHECK (`pest_resistance` BETWEEN 1 AND 5),
    `soil_resistance` INT(1) NOT NULL DEFAULT 1 CHECK (`soil_resistance` BETWEEN 1 AND 5),
    `weather_resistance` INT(1) NOT NULL DEFAULT 1 CHECK (`weather_resistance` BETWEEN 1 AND 5),
    `has_disease` TINYINT(1) NOT NULL DEFAULT 0,
    `diseases` JSON NOT NULL DEFAULT (JSON_OBJECT()),
    `has_pests` TINYINT(1) NOT NULL DEFAULT 0,
    `pests` JSON NOT NULL DEFAULT (JSON_OBJECT()),
    `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS `drug_growers` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `player` VARCHAR(255) NOT NULL,
    `drug` VARCHAR(255) NOT NULL,
    `strain` VARCHAR(255) NOT NULL,
    `level` INT NOT NULL DEFAULT 1, 
    `xp` INT NOT NULL DEFAULT 0, 
    `xp_required` INT NOT NULL DEFAULT 1000,
    `altitude_resistance` INT(1) NOT NULL DEFAULT 1 CHECK (`altitude_resistance` BETWEEN 1 AND 5),
    `disease_resistance` INT(1) NOT NULL DEFAULT 1 CHECK (`disease_resistance` BETWEEN 1 AND 5),
    `pest_resistance` INT(1) NOT NULL DEFAULT 1 CHECK (`pest_resistance` BETWEEN 1 AND 5),
    `soil_resistance` INT(1) NOT NULL DEFAULT 1 CHECK (`soil_resistance` BETWEEN 1 AND 5),
    `weather_resistance` INT(1) NOT NULL DEFAULT 1 CHECK (`weather_resistance` BETWEEN 1 AND 5),
    `metadata` JSON NOT NULL DEFAULT (JSON_OBJECT()),
    UNIQUE (`player`, `strain`)
);
