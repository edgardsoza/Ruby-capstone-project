CREATE TABLE item (
    id SERIAL PRIMARY KEY,
    genre_id INT,
    author_id INT,
    label_id INT,
    publish_date DATE,
    archived BOOLEAN,
    FOREIGN KEY (genre_id) REFERENCES genres (id),
    FOREIGN KEY (author_id) REFERENCES author (id),
    FOREIGN KEY (label_id) REFERENCES label (id)
  );

CREATE TABLE books (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    publish_date DATE,
    archived BOOLEAN,
    publisher VARCHAR(20),
    cover_state VARCHAR(20),
    label_ID INTEGER,
    genre_ID INTEGER,
    CONSTRAINT fk_label FOREIGN KEY (label_ID) REFERENCES label (ID),
    CONSTRAINT fk_genre FOREIGN KEY (genre_ID) REFERENCES genres (ID)
  );

  CREATE TABLE label (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(50) NOT NULL,
    color VARCHAR(50) NOT NULL
  );

CREATE TABLE music_albums(
    id SERIAL PRIMARY KEY,
    publish_date VARCHAR(60),
    on_spotify BOOLEAN,
    archived BOOLEAN,
    genre_id INT,
    author_id INT,
    source_id INT,
    label_id INT
);

CREATE TABLE genres( 
	id SERIAL PRIMARY KEY,
	name VARCHAR(60)
);

alter table music_albums add constraint fk_genre_id foreign key (genre_id) references genres(id);

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
