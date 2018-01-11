----------------------------------
-- Part 1

-- Drop DB if exists
DROP DATABASE IF EXISTS nba_db;

-- Create DB nba_db
CREATE DATABASE nba_db;

-- Connect to nba_db
\c nba_db;

-- Create table here

CREATE TABLE players (
  id serial PRIMARY KEY,
  name varchar(255) NOT NULL,
  age integer NOT NULL,
  team varchar(255) NOT NULL,
  games integer NOT NULL,
  points integer NOT NULL
);

-- Insert player here

INSERT INTO players
(name, age, team, games, points)
VALUES
('Anderson Varejao', 29, 'CLE', 25, 271 );

----------------------------------
-- Part 2
-- Uncomment COPY players statement and modify it with YOUR file path!


COPY players
  (name, age, team, games, points)
FROM '/Users/student_37/Desktop/GDI-HW/hw-w04-d03-NBA-SQL/nba_season_2011-2012.csv'
    DELIMITER ',' CSV;
