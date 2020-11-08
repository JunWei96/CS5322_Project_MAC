CONNECT DB_OWNER/DB_OWNER

DELETE FROM employees;

INSERT INTO DB_OWNER.employees (id,job_id,corporation_group_id,slug,full_name,date_of_birth,email,start_date) VALUES (1,4,4,'OWEN','Owen X. Richmond','30-Dec-90','owen@gmail.com','19-Nov-20');
INSERT INTO DB_OWNER.employees (id,job_id,corporation_group_id,slug,full_name,date_of_birth,email,start_date) VALUES (2,2,5,'BLAZE','Blaze G. Knox','02-Jan-94','blaze@gmail.com','05-Aug-20');
INSERT INTO DB_OWNER.employees (id,job_id,corporation_group_id,slug,full_name,date_of_birth,email,start_date) VALUES (3,8,9,'REBECCA','Rebecca Z. Wallace','16-Jul-92','rebecca@gmail.com','10-Mar-21');
INSERT INTO DB_OWNER.employees (id,job_id,corporation_group_id,slug,full_name,date_of_birth,email,start_date) VALUES (4,5,3,'DUKE','Jescie B. Duke','27-Sep-91','duke@gmail.com','09-May-21');
INSERT INTO DB_OWNER.employees (id,job_id,corporation_group_id,slug,full_name,date_of_birth,email,start_date) VALUES (5,7,2,'STAFFORD','Rana D. Stafford','16-Jul-90','stafford@gmail.com','14-Feb-21');
INSERT INTO DB_OWNER.employees (id,job_id,corporation_group_id,slug,full_name,date_of_birth,email,start_date) VALUES (6,2,4,'NORMAN','Keely S. Norman','16-Dec-92','norman@gmail.com','06-Nov-19');
INSERT INTO DB_OWNER.employees (id,job_id,corporation_group_id,slug,full_name,date_of_birth,email,start_date) VALUES (7,4,4,'MACK','Dillon H. Mack','07-Oct-89','mack@gmail.com','08-Apr-21');
INSERT INTO DB_OWNER.employees (id,job_id,corporation_group_id,slug,full_name,date_of_birth,email,start_date) VALUES (8,3,7,'MACON','Macon X. Tate','22-Jun-92','macon@gmail.com','24-Sep-19');
INSERT INTO DB_OWNER.employees (id,job_id,corporation_group_id,slug,full_name,date_of_birth,email,start_date) VALUES (9,5,3,'REEVES','Ira B. Reeves','25-Oct-92','reeves@gmail.com','19-Jul-21');
INSERT INTO DB_OWNER.employees (id,job_id,corporation_group_id,slug,full_name,date_of_birth,email,start_date) VALUES (10,9,2,'ADRIAN','Adrian R. Solomon','10-Mar-95','adrian@gmail.com','28-Aug-21');
INSERT INTO DB_OWNER.employees (id,job_id,corporation_group_id,slug,full_name,date_of_birth,email,start_date) VALUES (11,5,1,'XERXES','Xerxes R. Irwin','18-Apr-91','xerxes@gmail.com','08-Jul-21');
INSERT INTO DB_OWNER.employees (id,job_id,corporation_group_id,slug,full_name,date_of_birth,email,start_date) VALUES (12,2,6,'MIRANDA','Miranda B. Erickson','23-Feb-92','miranda@gmail.com','14-Aug-20');
INSERT INTO DB_OWNER.employees (id,job_id,corporation_group_id,slug,full_name,date_of_birth,email,start_date) VALUES (13,4,1,'WYNNE','Wynne Q. Shelton','14-Dec-90','wynne@gmail.com','07-May-21');
INSERT INTO DB_OWNER.employees (id,job_id,corporation_group_id,slug,full_name,date_of_birth,email,start_date) VALUES (14,7,6,'LEONARD','Leonard O. Snider','13-Mar-94','leonard@gmail.com','01-Feb-21');
INSERT INTO DB_OWNER.employees (id,job_id,corporation_group_id,slug,full_name,date_of_birth,email,start_date) VALUES (15,9,4,'ANIKA','Anika J. Sellers','24-May-93','anika@gmail.com','16-Feb-21');
INSERT INTO DB_OWNER.employees (id,job_id,corporation_group_id,slug,full_name,date_of_birth,email,start_date) VALUES (16,6,5,'CAMERON','Cameron D. Ramos','09-Aug-91','cameron@gmail.com','23-Jul-20');
INSERT INTO DB_OWNER.employees (id,job_id,corporation_group_id,slug,full_name,date_of_birth,email,start_date) VALUES (17,9,8,'COLBY','Colby C. Pace','16-May-90','colby@gmail.com','16-Feb-21');
INSERT INTO DB_OWNER.employees (id,job_id,corporation_group_id,slug,full_name,date_of_birth,email,start_date) VALUES (18,6,3,'FAITH','Faith G. Blackwell','14-Mar-91','faith@gmail.com','13-Aug-20');
INSERT INTO DB_OWNER.employees (id,job_id,corporation_group_id,slug,full_name,date_of_birth,email,start_date) VALUES (19,7,2,'OMAR','Omar O. Huff','28-Mar-94','omar@gmail.com','13-Nov-19');
INSERT INTO DB_OWNER.employees (id,job_id,corporation_group_id,slug,full_name,date_of_birth,email,start_date) VALUES (20,8,8,'NIGEL','Nigel K. Mcclure','06-Jul-90','nigel@gmail.com','17-Nov-20');

COMMIT;

SELECT * FROM DB_OWNER.employees;