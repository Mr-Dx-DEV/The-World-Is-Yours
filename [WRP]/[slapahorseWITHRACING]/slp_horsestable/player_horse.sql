CREATE TABLE IF NOT EXISTS `player_horses` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `license` varchar(50) DEFAULT NULL,
    `horsename` varchar(50) DEFAULT NULL,
    `horsetype` int(11) DEFAULT 1,
    `horsehair` int(11) DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=1;