CONNECT DB_OWNER/DB_OWNER

CREATE TABLE DB_OWNER.employees (
  id int PRIMARY KEY,
  job_id int,
  corporation_group_id int,
  slug varchar(30) UNIQUE,
  full_name varchar(30),
  date_of_birth date,
  email varchar(50),
  start_date date
);

CREATE TABLE DB_OWNER.jobs (
  id int PRIMARY KEY,
  job_title varchar(100),
  salary int
);

CREATE TABLE DB_OWNER.hr_reviews (
  id int PRIMARY KEY,
  author int,
  employee int,
  date_created date,
  link varchar(255)
);

CREATE TABLE DB_OWNER.reports (
  id int PRIMARY KEY,
  author int,
  date_created date,
  name varchar(255),
  link varchar(255)
);

CREATE TABLE DB_OWNER.countries (
  id int PRIMARY KEY,
  name varchar(100),
  country_code varchar(10)
);

CREATE TABLE DB_OWNER.locations (
  id int PRIMARY KEY,
  country_id int,
  address varchar(255),
  postal_code varchar(100),
  city varchar(100)
);

CREATE TABLE DB_OWNER.corporation_groups (
  id int PRIMARY KEY,
  location_id int,
  name varchar(100),
  group_type varchar(20) DEFAULT 'normal' check (group_type in ('normal', 'hr', 'auditor', 'finance'))
);

ALTER TABLE DB_OWNER.employees ADD FOREIGN KEY (job_id) REFERENCES jobs (id);

ALTER TABLE DB_OWNER.employees ADD FOREIGN KEY (corporation_group_id) REFERENCES corporation_groups (id);

ALTER TABLE DB_OWNER.hr_reviews ADD FOREIGN KEY (author) REFERENCES employees (id);

ALTER TABLE DB_OWNER.hr_reviews ADD FOREIGN KEY (employee) REFERENCES employees (id);

ALTER TABLE DB_OWNER.reports ADD FOREIGN KEY (author) REFERENCES employees (id);

ALTER TABLE DB_OWNER.locations ADD FOREIGN KEY (country_id) REFERENCES countries (id);

ALTER TABLE DB_OWNER.corporation_groups ADD FOREIGN KEY (location_id) REFERENCES locations (id);
