DROP TABLE bookings;
DROP TABLE workouts;
DROP TABLE members;

CREATE TABLE members (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  dob DATE,
  goal VARCHAR(255)
);

CREATE TABLE workouts (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  type VARCHAR(255),
  trainer VARCHAR(255),
  day_of_week VARCHAR(255),
  start_time TIME NOT NULL,
  end_time TIME NOT NULL
);

CREATE TABLE bookings (
  id SERIAL PRIMARY KEY,
  member_id INT references members(id) ON DELETE CASCADE,
  workout_id INT references workouts(id) ON DELETE CASCADE
);
