CREATE TABLE author (
  id INT GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR(30),
  last_name VARCHAR(30),
  PRIMARY KEY(id)
);

CREATE TABLE game (
  multiplayer BOOLEAN,
  last_played_at DATE,
)
