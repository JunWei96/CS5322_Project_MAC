DELETE FROM locations;

INSERT INTO DB_OWNER.locations (id, country_id, address, postal_code, city) VALUES (1, 1, 'Science Park Drive 14', 'S1234', 'Singapore');
INSERT INTO DB_OWNER.locations (id, country_id, address, postal_code, city) VALUES (2, 2, '3400  Canis Heights Drive', 'US123', 'New York');

COMMIT;

SELECT * FROM locations;