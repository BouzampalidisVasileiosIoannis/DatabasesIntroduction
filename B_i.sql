WITH TripleDoubles AS (
	SELECT
		p1.player_id, p2.player_name, COUNT(*) AS AllTripleDoubles
	FROM
		games_details AS p1 JOIN players AS p2 ON p1.player_id = p2.player_id
	WHERE
		(p1.pts >= 10 AND p1.reb >= 10 AND p1.ast >= 10)
	GROUP BY p1.player_id, p2.player_name
)
	SELECT
		player_id,
		player_name, 
        AllTripleDoubles
	FROM 
		TripleDoubles
	ORDER BY
		AllTripleDoubles DESC
	LIMIT 1;