This is a simple Swiss Pairings tournament API using Python and PostGreSQL.

Swiss Pairings means everyone plays through the whole tournament, with round re-seeding based on wins.

This project uses Vagrant and Virtual box. Please see the following links to set up those if they're not already on your computer:

http://vagrantup.com/

https://www.virtualbox.org/

When these are installed, start the Vagrant Virtual Machine. Open Terminal/Command Prompt and type in vagrant up and vagrant ssh to get the machine running.

Launch PSQL by typing in psql to the Terminal/Command Prompt.

Then create database:
CREATE DATABASE tournament; (Needs to be tournament as that is the name at the top of the tournament.py file. In order to change db name, must change the name in the file.)

Run the tournament.sql file to create tables/view:
\i tournament.sql

tournament_test.py is the file that tests all the functions defined in tournament.py

connect()
Sets up connection to DB.

deleteMatches()
Delete all data from matches table.

deletePlayers()
Delete all data from players table.

countPlayers()
Get count of all players from players DB by getting number of all player IDs.

registerPlayer(name)
Takes name argument to add into the players DB, each player gets own unique ID as set in tournament.sql

playerStandings()
Fetches list of players from the standings view defined in tournament.sql, will automatically list all players in order by wins.

reportMatch(winner, loser)
Takes two arguments: unique IDs of players to enter into winner and loser columns in matches table.

swissPairings()
Takes list of tuples from standings view to set up next round of tournament matches.