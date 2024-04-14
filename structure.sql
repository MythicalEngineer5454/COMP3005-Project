CREATE TABLE Season (
    season_id SERIAL PRIMARY KEY,
    competition_id INT,
 
);
-- Create Team table
CREATE TABLE Team (
    team_id SERIAL PRIMARY KEY,
	team_name VARCHAR(255)，
    season_id INT REFERENCES Season(season_id),
    competition_id INT REFERENCES Season(competition_id),
    -- Number of passes
    passes INT,
    -- Number of shots
    shots INT,
    -- Number of through balls
    through_balls INT,
    -- Add other "number of" attributes here
);
-- Create Player table
CREATE TABLE Player (
    player_id SERIAL PRIMARY KEY,
    team_id INT REFERENCES Team(team_id),
	player_name VARCHAR(255)，
    -- Add other columns as needed
	shots INT,
	firstShot INT,
	recievePass INT,
	thourghBall INT,
	completedDribble INT,
	Dribble INT,
);