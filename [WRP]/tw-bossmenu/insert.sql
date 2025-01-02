CREATE TABLE IF NOT EXISTS `tw_bossmenu` (
  `jobname` varchar(100) NOT NULL DEFAULT '',
  `jobLabel` varchar(50) DEFAULT NULL,
  `jobDescription` text DEFAULT NULL,
  `jobLogo` longtext DEFAULT NULL,
  `jobBanner` longtext DEFAULT NULL,
  `openLoc` longtext DEFAULT NULL,
  `stashLoc` longtext DEFAULT NULL,
  `jobHistory` longtext DEFAULT '[]',
  `permissions` longtext DEFAULT '{"players":[],"grades":[]}',
  `outfitList` longtext DEFAULT '[]',
  `blipData` longtext DEFAULT '[]',
  `isGang` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`jobname`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

ALTER TABLE `tw_bossmenu`
ADD COLUMN IF NOT EXISTS `blipData` longtext DEFAULT '[]';
