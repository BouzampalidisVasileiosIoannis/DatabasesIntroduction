CREATE DATABASE IF NOT EXISTS `basketballdb`;


USE `basketballdb`;
DROP TABLE IF EXISTS `PLAYERS` ;

CREATE TABLE `PLAYERS`(
    player_id INTEGER NOT NULL,
    player_name VARCHAR(255),
    team_id INTEGER,
    season VARCHAR(255),


    PRIMARY KEY(player_id,team_id),
    FOREIGN KEY(team_id) REFERENCES `TEAMS`(team_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CHECK (season > 1900)
);