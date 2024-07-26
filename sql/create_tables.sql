CREATE TYPE gender_type AS ENUM ('male', 'female', 'other');

CREATE TABLE "Country" (
  id SERIAL PRIMARY KEY,
  name VARCHAR(99) NOT NULL
);

CREATE TABLE "File" (
  id SERIAL PRIMARY KEY,
  file_name VARCHAR(254) NOT NULL,
  mime_type VARCHAR(49) NOT NULL,
  file_key VARCHAR(254) NOT NULL,
  url VARCHAR(254) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE "Person" (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(99) NOT NULL,
  last_name VARCHAR(99) NOT NULL,
  biography TEXT,
  date_of_birth DATE,
  gender gender_type,
  country_id INT,
  primary_photo_id INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (country_id) REFERENCES "Country"(id),
  FOREIGN KEY (primary_photo_id) REFERENCES "File"(id)
);

CREATE TABLE "PersonPhotos" (
  id SERIAL PRIMARY KEY,
  person_id INT NOT NULL,
  photo_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (person_id) REFERENCES "Person"(id),
  FOREIGN KEY (photo_id) REFERENCES "File"(id)
);

CREATE TABLE "Movie" (
  id SERIAL PRIMARY KEY,
  title VARCHAR(254) NOT NULL,
  description TEXT,
  budget DECIMAL(19, 2),
  release_date DATE,
  duration INT,
  country_id INT,
  director_id INT,
  poster_id INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (country_id) REFERENCES "Country"(id),
  FOREIGN KEY (director_id) REFERENCES "Person"(id),
  FOREIGN KEY (poster_id) REFERENCES "File"(id)
);

CREATE TABLE "Genre" (
  id SERIAL PRIMARY KEY,
  name VARCHAR(99) NOT NULL UNIQUE
);

CREATE TABLE "MovieGenres" (
  movie_id INT,
  genre_id INT,
  PRIMARY KEY (movie_id, genre_id),
  FOREIGN KEY (movie_id) REFERENCES "Movie"(id),
  FOREIGN KEY (genre_id) REFERENCES "Genre"(id)
);

CREATE TYPE character_role AS ENUM ('leading', 'supporting', 'background');

CREATE TABLE "Character" (
  id SERIAL PRIMARY KEY,
  name VARCHAR(254) NOT NULL,
  description TEXT,
  role character_role,
  movie_id INT,
  actor_id INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (movie_id) REFERENCES "Movie"(id),
  FOREIGN KEY (actor_id) REFERENCES "Person"(id)
);

CREATE TABLE "UserAccount" (
  id SERIAL PRIMARY KEY,
  username VARCHAR(49) UNIQUE NOT NULL,
  first_name VARCHAR(99) NOT NULL,
  last_name VARCHAR(99) NOT NULL,
  email VARCHAR(99) UNIQUE NOT NULL,
  password VARCHAR(254) NOT NULL,
  avatar_id INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (avatar_id) REFERENCES "File"(id)
);

CREATE TABLE "FavoriteMovie" (
  user_id INT,
  movie_id INT,
  PRIMARY KEY (user_id, movie_id),
  FOREIGN KEY (user_id) REFERENCES "UserAccount"(id),
  FOREIGN KEY (movie_id) REFERENCES "Movie"(id)
);