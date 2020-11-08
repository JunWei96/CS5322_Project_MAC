CONNECT DB_OWNER/DB_OWNER;

DELETE FROM countries;

INSERT INTO DB_OWNER.countries (id, name, country_code) VALUES (1, 'Singapore',  'SG');
INSERT INTO DB_OWNER.countries (id, name, country_code) VALUES (2, 'United States',  'US');

COMMIT;

SELECT * FROM countries;