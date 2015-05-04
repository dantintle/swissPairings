-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.



CREATE TABLE players(
id serial PRIMARY KEY,
name varchar(255)
);

CREATE TABLE matches(
id serial PRIMARY KEY,
winner int REFERENCES players(id),
loser int REFERENCES players(id)
);


#view takes id and name from players table and times player id is in winner column from matches table to count wins. also uses total times player.id appears in winner and loser columns to get matches played. then is ordered by matches won to get standings list.

CREATE VIEW standings as select players.id, players.name, (select count (*) from matches where matches.winner = players.id) as matches_won, (select count(*) from matches where players.id in (winner, loser)) as matches_played from players order by matches_won DESC;