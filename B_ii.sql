WITH HomeGamePoints AS (
	SELECT g.home_team_id, g.game_id, g.home_team_wins, g1.pts
    FROM games AS g JOIN games_details AS g1 ON g.game_id = g1.game_id
    WHERE g.home_team_wins = 1
), AwayGamePoints AS (
	SELECT g.visitor_game_id, g.game_id, g.home_team_wins, g1.pts
    FROM games AS g JOIN games_details AS g1 ON g.game_id = g1.game_id
    WHERE g.home_team_wins = 0
), AllGamePoints AS (
	SELECT h.home_team_id AS team_id, h.game_id, h.home_team_wins, h.pts
    FROM HomeGamePoints AS h 
		UNION ALL
			SELECT a.visitor_team_id AS team_id, a.game_id, a.home_team_wins, a.pts
            FROM AwayGamePoints AS a
	)
    SELECT t.nickname, total.game_id, total.pts
    FROM AllGamePoints AS total JOIN teams AS t ON t.team_id = total.team_id
    ORDER BY total.pts DESC 
    LIMIT 1;