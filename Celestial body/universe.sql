-- Drop the database if it already exists (so you can re-run this file)
DROP DATABASE IF EXISTS universe;

-- Create the universe database
CREATE DATABASE universe;

-- Connect to the universe database
\c universe;

-- =========================
-- Table: galaxy
-- =========================
CREATE TABLE galaxy (
  galaxy_id SERIAL PRIMARY KEY,         -- auto-increment ID
  name VARCHAR(100) UNIQUE NOT NULL,    -- unique name, required
  description TEXT,                     -- free text
  has_life BOOLEAN NOT NULL,            -- true/false
  distance_from_earth INT NOT NULL      -- distance in light years
);

-- =========================
-- Table: star
-- =========================
CREATE TABLE star (
  star_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id), -- foreign key
  age_in_millions_of_years INT NOT NULL,
  is_spherical BOOLEAN NOT NULL
);

-- =========================
-- Table: planet
-- =========================
CREATE TABLE planet (
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  star_id INT NOT NULL REFERENCES star(star_id),
  planet_type VARCHAR(50) NOT NULL,
  has_life BOOLEAN NOT NULL,
  distance_from_star NUMERIC(10,2) NOT NULL -- numeric example
);

-- =========================
-- Table: moon
-- =========================
CREATE TABLE moon (
  moon_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  planet_id INT NOT NULL REFERENCES planet(planet_id),
  radius INT NOT NULL,
  is_spherical BOOLEAN NOT NULL
);

-- =========================
-- Extra Table: comet (5th table)
-- =========================
CREATE TABLE comet (
  comet_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  description TEXT,
  has_tail BOOLEAN NOT NULL,
  orbit_speed NUMERIC(10,2) NOT NULL
);

-- =========================
-- Insert sample data
-- =========================

-- Galaxies (6 rows)
INSERT INTO galaxy (name, description, has_life, distance_from_earth) VALUES
('Milky Way', 'Our home galaxy', TRUE, 0),
('Andromeda', 'Nearest big galaxy', FALSE, 2537000),
('Triangulum', 'Small spiral galaxy', FALSE, 3000000),
('Whirlpool', 'Spiral galaxy with arms', FALSE, 23000000),
('Sombrero', 'Bright galaxy with dust ring', FALSE, 29000000),
('Cartwheel', 'Ring-shaped galaxy', FALSE, 500000000);

-- Stars (6 rows)
INSERT INTO star (name, galaxy_id, age_in_millions_of_years, is_spherical) VALUES
('Sun', 1, 4600, TRUE),
('Alpha Centauri A', 1, 5000, TRUE),
('Betelgeuse', 1, 10000, FALSE),
('Rigel', 2, 8000, TRUE),
('Vega', 3, 455, TRUE),
('Sirius', 1, 242, TRUE);

-- Planets (12 rows)
INSERT INTO planet (name, star_id, planet_type, has_life, distance_from_star) VALUES
('Earth', 1, 'Terrestrial', TRUE, 1.00),
('Mars', 1, 'Terrestrial', FALSE, 1.52),
('Jupiter', 1, 'Gas Giant', FALSE, 5.20),
('Saturn', 1, 'Gas Giant', FALSE, 9.58),
('Neptune', 1, 'Ice Giant', FALSE, 30.07),
('Proxima b', 2, 'Terrestrial', FALSE, 0.05),
('Rigel I', 4, 'Gas Giant', FALSE, 1.30),
('Rigel II', 4, 'Ice Giant', FALSE, 2.50),
('Vega I', 5, 'Terrestrial', FALSE, 0.70),
('Sirius I', 6, 'Gas Giant', FALSE, 1.80),
('Sirius II', 6, 'Ice Giant', FALSE, 2.60),
('Betelgeuse I', 3, 'Gas Giant', FALSE, 1.50);

-- Moons (20 rows)
INSERT INTO moon (name, planet_id, radius, is_spherical) VALUES
('Moon', 1, 1737, TRUE),
('Phobos', 2, 11, FALSE),
('Deimos', 2, 6, FALSE),
('Io', 3, 1821, TRUE),
('Europa', 3, 1560, TRUE),
('Ganymede', 3, 2634, TRUE),
('Callisto', 3, 2410, TRUE),
('Titan', 4, 2575, TRUE),
('Enceladus', 4, 252, TRUE),
('Mimas', 4, 198, FALSE),
('Triton', 5, 1353, TRUE),
('Nereid', 5, 170, FALSE),
('Proxima b I', 6, 500, TRUE),
('Rigel I A', 7, 1000, TRUE),
('Rigel II A', 8, 700, TRUE),
('Rigel II B', 8, 300, FALSE),
('Vega I A', 9, 250, FALSE),
('Sirius I A', 10, 800, TRUE),
('Sirius II A', 11, 400, TRUE),
('Betelgeuse I A', 12, 600, TRUE);

-- Comets (3 rows just to have data)
INSERT INTO comet (name, description, has_tail, orbit_speed) VALUES
('Halley', 'Famous short-period comet', TRUE, 70.56),
('Hale-Bopp', 'Bright long-period comet', TRUE, 44.2),
('Encke', 'Shortest known orbital period', TRUE, 69.9);
