DROP TABLE IF EXISTS users        CASCADE;
DROP TABLE IF EXISTS properties   CASCADE;
DROP TABLE IF EXISTS reservations CASCADE;
DROP TABLE IF EXISTS addresses    CASCADE;
DROP TABLE IF EXISTS reviews      CASCADE;

CREATE TABLE users (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL
);

CREATE TABLE properties (
  id SERIAL PRIMARY KEY NOT NULL,
  title VARCHAR(255) NOT NULL,
  description VARCHAR(255) NOT NULL,
  cost_per_night INTEGER NOT NULL DEFAULT 0,
  parking_spaces INTEGER NOT NULL DEFAULT 0,
  number_of_bathrooms INTEGER NOT NULL DEFAULT 0,
  number_of_bedrooms INTEGER NOT NULL DEFAULT 0,
  thumbnail VARCHAR(255) NOT NULL,
  cover VARCHAR(255) NOT NULL,
  is_active BOOLEAN NOT NULL DEFAULT TRUE,
  address_id INTEGER REFERENCES addresses(id) ON DELETE CASCADE
  owner_id INTEGER REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE addresses (
  id SERIAL PRIMARY KEY NOT NULL,
  country VARCHAR(100) NOT NULL,
  province VARCHAR(100) NOT NULL, 
  city VARCHAR(100) NOT NULL,
  street VARCHAR(100) NOT NULL,
  post_code VARCHAR(6) NOT NULL
);

CREATE TABLE reservations (
  id SERIAL PRIMARY KEY NOT NULL,
  start_date DATE,
  end_date DATE,
  guest_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  property_id INTEGER REFERENCES properties(id) ON DELETE CASCADE 
);

CREATE TABLE reviews (
  id SERIAL PRIMARY KEY NOT NULL,
  reservation_id INTEGER REFERENCES reservations(id) ON DELETE CASCADE,
  property_id INTEGER REFERENCES properties(id) ON DELETE CASCADE,
  guest_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  review TEXT,
  stars SMALLINT NOT NULL DEFAULT 0
);