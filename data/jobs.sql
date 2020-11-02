DELETE FROM jobs;

INSERT INTO DB_OWNER.jobs (id, job_title) VALUES (1, 'Software Engineer');
INSERT INTO DB_OWNER.jobs (id, job_title) VALUES (2, 'Dev Ops Specialist');
INSERT INTO DB_OWNER.jobs (id, job_title) VALUES (3, 'UI/UX Designer');
INSERT INTO DB_OWNER.jobs (id, job_title) VALUES (4, 'Administrative Assistant');
INSERT INTO DB_OWNER.jobs (id, job_title) VALUES (5, 'Administrative Clerk');
INSERT INTO DB_OWNER.jobs (id, job_title) VALUES (6, 'Financial Analyst');
INSERT INTO DB_OWNER.jobs (id, job_title) VALUES (7, 'Financial Auditor');
INSERT INTO DB_OWNER.jobs (id, job_title) VALUES (8, 'Research Associate');
INSERT INTO DB_OWNER.jobs (id, job_title) VALUES (9, 'Research Staff');

COMMIT;

SELECT * FROM jobs;