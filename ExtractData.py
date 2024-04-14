#import mysql.connector
import json
import psycopg2


# Establish connection to MySQL server
try:
    connection = psycopg2.connect(
        dbname="Final",
        user="postgres",
        password="123123",
        host="localhost",
        port="5432"
    )
    print("Connected to PostgreSQL server")
except psycopg2.Error as e:
    print("Error connecting to PostgreSQL server:", e)
# Create cursor object

#Open 
with open('open-data-master/competitions.json', 'r') as file:
    data = json.load(file)
    #print(data);
#For each league:
    #1.Add seasons competition to competition
    #2.In open-data/data/matches/competition_id/season_id find mathes and home&away team
        #In open-data/data/lineups/match_id, find the two team participated lineup , 
        #Loop: For each loop, 
        # check if team not been recorded,
        # If so, team add the home & away team_id,team_name,season_id,competition_id
        # Record the match_id, 
    #3.Loop through each match_id array, record two teamId, 
        # check if team member existed 
            # If extisted, pass
            # If not, a
    #Loop through events in the events file
        #Check each event
#La Liga,  2020/2021
    #add Liga(11,90)
#La Liga, 2019/2020
    #add Liga(11,42)
#La Liga,2018/2019
    #add Liga(11,4)
#Premier League, 2003/2004
    #add Liga(2,44)