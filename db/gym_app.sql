DROP TABLE bookings;
DROP TABLE workouts;
DROP TABLE members;

CREATE TABLE members (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  age INT,
  goal VARCHAR(255)
);

CREATE TABLE workouts (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  type VARCHAR(255),
  trainer VARCHAR(255),
  capacity INT
);

CREATE TABLE bookings (
  id SERIAL PRIMARY KEY,
  member_id INT references members(id),
  workout_id INT references workouts(id)
);
