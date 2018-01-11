--------------------------------------------
-- Part 3 - Basic SQL Queries
-- write queries to select the following
--------------------------------------------

-- All columns for all players from the New York Knicks (NYK).
SELECT * FROM players
WHERE team= 'NYK';




-- All columns for all players from the Indiana Packers (IND) who are under 26
-- years old.

SELECT * FROM players
WHERE team= 'IND' AND age < 26;




-- All columns for all players, ordered from least points scored to most points
-- scored.

SELECT * FROM players
ORDER BY points ASC;



-- Name and Points per game (points/games), for the players with the top 20 points
-- per game.

SELECT name, points FROM players
ORDER BY points DESC LIMIT 20;




-- The average age for all players.
SELECT AVG(age)
FROM players;


-- The average age for all players on the Oklahoma City Thunder (OKC).



SELECT AVG(age)
FROM players
WHERE team= 'OKC';



-- The average age for all players who played more than 40 games.

SELECT AVG(age)
FROM players
WHERE games > 40;




--------------------------------------------
-- BONUS - Advanced SQL Queries
-- write queries to select the following
--------------------------------------------

-- The team and total points scored from all players on that team (team points)
-- ordered from most team points to least.

-- WORDING OF THIS WAS WEIRDDDD

SELECT team, points 
FROM players
ORDER BY points DESC;



-- The age and the average points per game for that age, ordered from oldest to
-- youngest for all ages.



SELECT age, AVG(points / games)
FROM players
GROUP BY age
ORDER BY age DESC;



-- The team and the the number of players who score above 12 points per game on

-- that team, ordered from the most number of players to the least number of players.

--  id  |       name        | age | team | games | points
-- -----+-------------------+-----+------+-------+--------
--    3 | Arron Afflalo     |  26 | DEN  |    62 |    943
--    7 | LaMarcus Aldridge |  26 | POR  |    55 |   1191
--    9 | Ray Allen         |  36 | BOS  |    46 |    655
--   17 | Ryan Anderson     |  23 | ORL  |    61 |    980
--   18 | Carmelo Anthony   |  27 | NYK  |    55 |   1245
--   30 | Andrea Bargnani   |  26 | TOR  |    31 |    603
--   36 | Nicolas Batum     |  23 | POR  |    59 |    818
--   45 | Chauncey Billups  |  35 | LAC  |    20 |    299
--   55 | Carlos Boozer     |  30 | CHI  |    66 |    991
--   56 | Chris Bosh        |  27 | MIA  |    57 |   1025
--   68 | Kobe Bryant       |  33 | LAL  |    58 |   1616
--   75 | Andrew Bynum      |  24 | LAL  |    60 |   1123
--   97 | DeMarcus Cousins  |  21 | SAC  |    64 |   1160
--   98 | Jamal Crawford    |  31 | POR  |    60 |    837
--   99 | Jordan Crawford   |  23 | WAS  |    64 |    938
--  102 | Stephen Curry     |  23 | GSW  |    26 |    383
--  113 | Luol Deng         |  26 | CHI  |    54 |    828
--  115 | DeMar DeRozan     |  22 | TOR  |    63 |   1054
--  124 | Tim Duncan        |  35 | SAS  |    58 |    895
--  126 | Kevin Durant      |  23 | OKC  |    66 |   1850

--  ONLY 15 TEAMS
-- POR 3
-- CHI 2
-- LAL 2
-- TOR 2
-- SAC 1
-- DEN 1
-- BOS 1
-- ORL 1
-- NYK 1
-- LAC 1
-- MIA 1
--  WAS 1
--  GSW 1
--  SAS 1
--  OKC 1


-- SELECT team, COUNT(name)
-- FROM players
-- WHERE (points/games) > 12
-- GROUP BY team, players.points
-- ORDER BY COUNT(players) DESC ;

SELECT team, COUNT(name)
FROM players
WHERE EXISTS (SELECT name FROM players WHERE  ((players.points / players.games) > 12))
GROUP BY players.team
ORDER BY COUNT(name) DESC ;

-- SELECT COUNT(name), team
-- FROM players
-- GROUP BY team
-- WHERE (points/games > 5)
-- ORDER BY COUNT(name) DESC;

-- SELECT team, COUNT(name)
-- FROM players
-- GROUP BY players.points, players.team, players.games
-- HAVING (points/games) > 12;


