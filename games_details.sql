CREATE DATABASE IF NOT EXISTS `basketballdb`;
USE `basketballdb`;



DROP TABLE  IF EXISTS `Games_Details`;

CREATE TABLE `GAMES_DETAILS` (
    game_id INTEGER,
    team_id INTEGER,
    player_id INTEGER,
    min VARCHAR(255),
    pts INTEGER DEFAULT NULL,
    reb INTEGER DEFAULT NULL,
    ast INTEGER DEFAULT NULL,
    stl INTEGER DEFAULT NULL,
    blk INTEGER DEFAULT NULL,

    PRIMARY KEY(game_id, player_id, team_id),
    FOREIGN KEY(player_id) REFERENCES `PLAYERS`(player_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(game_id) REFERENCES `GAMES`(game_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(team_id) REFERENCES `TEAMS`(team_id) ON DELETE CASCADE ON UPDATE CASCADE
);