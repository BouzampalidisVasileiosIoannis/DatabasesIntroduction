CREATE DATABASE IF NOT EXISTS `basketballdb`;

USE `basketballdb`;

DROP TABLE IF EXISTS `TEAMS`;

CREATE TABLE `TEAMS`(
    team_id INTEGER NOT NULL,
    nickname VARCHAR(255),
    year_founded INTEGER,
    city VARCHAR(255),

    PRIMARY KEY(team_id),
    CHECK (year_founded > 1800)
);

LOAD DATA INFILE 'teams.csv' INTO TABLE `TEAMS` FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\n';