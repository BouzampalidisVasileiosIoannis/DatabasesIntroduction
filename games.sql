CREATE DATABASE IF NOT EXISTS `basketballdb`;


USE `basketballdb`;
DROP TABLE IF EXISTS `GAMES` ;

CREATE TABLE `GAMES` (
    game_id INTEGER NOT NULL,
    home_team_id INTEGER,
    visitor_team_id INTEGER,
    season INTEGER ,
    home_team_wins BOOLEAN,

    PRIMARY KEY(game_id),
    FOREIGN KEY (home_team_id) REFERENCES teams(team_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (visitor_team_id) REFERENCES teams(team_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CHECK (home_team_id <> visitor_team_id),
    CHECK (season > 1900)
);

