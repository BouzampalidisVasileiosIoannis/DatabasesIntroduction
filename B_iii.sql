SELECT
	t.team_id,
    t.nickname,
    COUNT(g.game_id) AS totalGames,
    SUM(g.home_team_wins) AS wins,
    COUNT(g.game_id) - SUM(g.home_team_wins) AS losses,
    SUM(g.home_team_wins) /  COUNT(g.game_id) - SUM(g.home_team_wins) AS winLossRatio
FROM 
	teams AS t 
JOIN 
	games AS g ON t.team_id = g.home_team_id
GROUP BY 
	t.team_id
HAVING 
	COUNT(g.game_id) > 0;