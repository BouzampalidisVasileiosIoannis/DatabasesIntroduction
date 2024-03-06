import mysql.connector

cnx = mysql.connector.connect(
    host="127.0.0.1",
    user="root",
    password="1234",
    database="basketballdb"
)

userQuery = input("Enter team nickname: ")

cursor = cnx.cursor()



query = """
    SELECT 
        g.game_id, 
        g.home_team_wins
    FROM 
        Games AS g 
    JOIN 
        Teams AS home ON g.home_team_id = home.team_id 
    JOIN 
        Teams AS visitor ON g.visitor_team_id = visitor.team_id
    WHERE 
        home.nickname = %s OR visitor.nickname = %s
"""
cursor.execute(query, (userQuery, userQuery))

results = cursor.fetchall()


for result in results:
    print(f"Game ID: {result[0]}, Home Team Wins: {result[1]}")


sec_query = """
    WITH 
        TeamPlayers AS (
            SELECT 
                p.player_name, 
                p.team_id
            FROM 
                players AS p 
            JOIN 
                teams ON p.team_id = teams.team_id
    )
    SELECT 
        tp.team_id, 
        tp.player_name
    FROM
        TeamPlayers AS tp
"""

cursor.execute(sec_query)
sec_results = cursor.fetchall()
team_players = {}

for team_id, player_name in sec_results:
    if team_id not in team_players:
        team_players[team_id] = set()
    team_players[team_id].add(player_name)

for team_id, players in team_players.items():
    players_str = ', '.join(players)
    print("\n" + f"TEAM ID: {team_id}, PLAYERS: {players_str} " + "\n")

cursor.close()
cnx.close()