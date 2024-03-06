WITH PlayerTotalWins AS (
	SELECT 
		p1.player_id,
        p1.player_name,
        SUM(g1.win) AS MinPlayed
	FROM
		players AS p1
	JOIN 
		games_details AS g1 ON p1.player_id = g1.player_id
	GROUP BY 
		p1.player_id, p1.player_name
	HAVING 
		SUM(g1.min) > 80
)
SELECT 
	total.player_id,
    total.player_name,
    SUM(g1.pts) AS totalPoints
FROM 
	PlayerTotalMin AS total
JOIN 
	games_details AS g1 ON total.player_id = g1.player_id
GROUP BY
	total.player_id, total.player_name
ORDER BY SUM(g1.pts) DESC 
LIMIT 1;