-- Q1: Sort players in La Liga 2020/2021 by average xG scores
SELECT player_name, AVG(xG) AS avg_xG
FROM Player
WHERE season_id = (SELECT season_id FROM Season WHERE competition_id = 1 AND season_name = '2020/2021')
    AND shots > 0
GROUP BY player_name
ORDER BY avg_xG DESC;

-- Q2: Find players in La Liga 2020/2021 with most shots
SELECT player_name, shots
FROM Player
WHERE season_id = (SELECT season_id FROM Season WHERE competition_id = 1 AND season_name = '2020/2021')
    AND shots > 0
ORDER BY shots DESC;

-- Q3: Find players with most first-time shots in La Liga 2020/2021, 2019/2020, and 2018/2019
SELECT player_name, SUM(firstShot) AS total_first_shots
FROM Player
WHERE season_id IN (
        SELECT season_id FROM Season
        WHERE competition_id = 1
        AND season_name IN ('2020/2021', '2019/2020', '2018/2019')
    )
    AND firstShot > 0
GROUP BY player_name
ORDER BY total_first_shots DESC;

-- Q4: Find teams in La Liga 2020/2021 with most passes
SELECT team_name, passes
FROM Team
WHERE season_id = (SELECT season_id FROM Season WHERE competition_id = 1 AND season_name = '2020/2021')
    AND passes > 0
ORDER BY passes DESC;

-- Q5: Find players in Premier League 2003/2004 who were the most intended recipients of passes
SELECT player_name, recievePass
FROM Player
WHERE season_id = (SELECT season_id FROM Season WHERE competition_id = 2 AND season_name = '2003/2004')
    AND recievePass > 0
ORDER BY recievePass DESC;

-- Q6: Find teams in Premier League 2003/2004 with most shots
SELECT team_name, shots
FROM Team
WHERE season_id = (SELECT season_id FROM Season WHERE competition_id = 2 AND season_name = '2003/2004')
    AND shots > 0
ORDER BY shots DESC;

-- Q7: Find players in La Liga 2020/2021 who made the most through balls
SELECT player_name, thourghBall
FROM Player
WHERE season_id = (SELECT season_id FROM Season WHERE competition_id = 1 AND season_name = '2020/2021')
    AND thourghBall > 0
ORDER BY thourghBall DESC;

-- Q8: Find teams in La Liga 2020/2021 that made the most through balls
SELECT team_name, SUM(thourghBall) AS total_through_balls
FROM Player
JOIN Team ON Player.team_id = Team.team_id
WHERE Team.season_id = (SELECT season_id FROM Season WHERE competition_id = 1 AND season_name = '2020/2021')
    AND Player.thourghBall > 0
GROUP BY team_name
ORDER BY total_through_balls DESC;
