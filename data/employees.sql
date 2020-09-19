DELETE FROM employees;
DROP USER OWEN;
DROP USER DUKE;
DROP USER STAFFORD;
DROP USER NORMAN;
DROP USER MACK;
DROP USER MACON;
DROP USER BLAZE;
DROP USER REBECCA;
DROP USER REEVES;
DROP USER ADRIAN;
DROP USER XERXES;
DROP USER MIRANDA;
DROP USER WYNNE;
DROP USER LEONARD;
DROP USER ANIKA;
DROP USER CAMERON;
DROP USER COLBY;
DROP USER FAITH;
DROP USER OMAR;
DROP USER NIGEL;

DROP ROLE NON_SYSTEM;
CREATE ROLE NON_SYSTEM;
GRANT CREATE SESSION TO NON_SYSTEM;
GRANT SELECT ON employees TO NON_SYSTEM;
GRANT SELECT ON credentials TO NON_SYSTEM;
GRANT SELECT ON past_credentials TO NON_SYSTEM;
GRANT SELECT ON leaves TO NON_SYSTEM;
GRANT SELECT ON evaluations TO NON_SYSTEM;
GRANT SELECT ON claims TO NON_SYSTEM;
GRANT SELECT ON payslips TO NON_SYSTEM;
GRANT SELECT ON countries TO NON_SYSTEM;
GRANT SELECT ON locations TO NON_SYSTEM;
GRANT SELECT ON corporation_groups TO NON_SYSTEM;
GRANT SELECT ON jobs TO NON_SYSTEM;
GRANT SELECT ON job_history TO NON_SYSTEM;

GRANT UPDATE ON employees TO NON_SYSTEM;
GRANT UPDATE ON credentials TO NON_SYSTEM;
GRANT UPDATE ON past_credentials TO NON_SYSTEM;
GRANT UPDATE ON leaves TO NON_SYSTEM;
GRANT UPDATE ON evaluations TO NON_SYSTEM;
GRANT UPDATE ON claims TO NON_SYSTEM;
GRANT UPDATE ON payslips TO NON_SYSTEM;
GRANT UPDATE ON countries TO NON_SYSTEM;
GRANT UPDATE ON locations TO NON_SYSTEM;
GRANT UPDATE ON corporation_groups TO NON_SYSTEM;
GRANT UPDATE ON jobs TO NON_SYSTEM;
GRANT UPDATE ON job_history TO NON_SYSTEM;

GRANT DELETE ON employees TO NON_SYSTEM;
GRANT DELETE ON credentials TO NON_SYSTEM;
GRANT DELETE ON past_credentials TO NON_SYSTEM;
GRANT DELETE ON leaves TO NON_SYSTEM;
GRANT DELETE ON evaluations TO NON_SYSTEM;
GRANT DELETE ON claims TO NON_SYSTEM;
GRANT DELETE ON payslips TO NON_SYSTEM;
GRANT DELETE ON countries TO NON_SYSTEM;
GRANT DELETE ON locations TO NON_SYSTEM;
GRANT DELETE ON corporation_groups TO NON_SYSTEM;
GRANT DELETE ON jobs TO NON_SYSTEM;
GRANT DELETE ON job_history TO NON_SYSTEM;

GRANT INSERT ON employees TO NON_SYSTEM;
GRANT INSERT ON credentials TO NON_SYSTEM;
GRANT INSERT ON past_credentials TO NON_SYSTEM;
GRANT INSERT ON leaves TO NON_SYSTEM;
GRANT INSERT ON evaluations TO NON_SYSTEM;
GRANT INSERT ON claims TO NON_SYSTEM;
GRANT INSERT ON payslips TO NON_SYSTEM;
GRANT INSERT ON countries TO NON_SYSTEM;
GRANT INSERT ON locations TO NON_SYSTEM;
GRANT INSERT ON corporation_groups TO NON_SYSTEM;
GRANT INSERT ON jobs TO NON_SYSTEM;
GRANT INSERT ON job_history TO NON_SYSTEM;

INSERT INTO employees (id,manager_id,job_id,corporation_group_id,slug,full_name,date_of_birth,address,phone,email,salary,start_date,biography) VALUES (1,null,4,4,'OWEN','Owen X. Richmond','30-Dec-90','105-5697 Eget Road','095-556-8612','owen@gmail.com',8846,'19-Nov-20','fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat');
CREATE USER OWEN IDENTIFIED BY OWEN;
GRANT NON_SYSTEM TO OWEN;
INSERT INTO employees (id,manager_id,job_id,corporation_group_id,slug,full_name,date_of_birth,address,phone,email,salary,start_date,biography) VALUES (2,null,2,5,'BLAZE','Blaze G. Knox','02-Jan-94','Ap #791-1187 Fusce St.','091-593-3407','blaze@gmail.com',8676,'05-Aug-20','nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc.');
CREATE USER BLAZE IDENTIFIED BY BLAZE;
GRANT NON_SYSTEM TO BLAZE;
INSERT INTO employees (id,manager_id,job_id,corporation_group_id,slug,full_name,date_of_birth,address,phone,email,salary,start_date,biography) VALUES (3,null,8,9,'REBECCA','Rebecca Z. Wallace','16-Jul-92','308-2602 Elementum Avenue','023-270-2423','rebecca@gmail.com',6111,'10-Mar-21','Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique');
CREATE USER REBECCA IDENTIFIED BY REBECCA;
GRANT NON_SYSTEM TO REBECCA;
INSERT INTO employees (id,manager_id,job_id,corporation_group_id,slug,full_name,date_of_birth,address,phone,email,salary,start_date,biography) VALUES (4,null,5,3,'DUKE','Jescie B. Duke','27-Sep-91','Ap #652-1532 Et Rd.','061-316-8492','duke@gmail.com',7876,'09-May-21','nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque');
CREATE USER DUKE IDENTIFIED BY DUKE;
GRANT NON_SYSTEM TO DUKE;
INSERT INTO employees (id,manager_id,job_id,corporation_group_id,slug,full_name,date_of_birth,address,phone,email,salary,start_date,biography) VALUES (5,null,7,2,'STAFFORD','Rana D. Stafford','16-Jul-90','931-7351 Commodo Ave','065-009-4951','stafford@gmail.com',7969,'14-Feb-21','dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et');
CREATE USER STAFFORD IDENTIFIED BY STAFFORD;
GRANT NON_SYSTEM TO STAFFORD;
INSERT INTO employees (id,manager_id,job_id,corporation_group_id,slug,full_name,date_of_birth,address,phone,email,salary,start_date,biography) VALUES (6,2,2,4,'NORMAN','Keely S. Norman','16-Dec-92','909-1717 Nibh St.','014-907-8372','norman@gmail.com',8444,'06-Nov-19','neque. Sed eget lacus. Mauris non dui nec urna suscipit');
CREATE USER NORMAN IDENTIFIED BY NORMAN;
GRANT NON_SYSTEM TO NORMAN;
INSERT INTO employees (id,manager_id,job_id,corporation_group_id,slug,full_name,date_of_birth,address,phone,email,salary,start_date,biography) VALUES (7,1,4,5,'MACK','Dillon H. Mack','07-Oct-89','P.O. Box 263, 1353 Iaculis Rd.','002-465-0944','mack@gmail.com',7804,'08-Apr-21','nec, diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis');
CREATE USER MACK IDENTIFIED BY MACK;
GRANT NON_SYSTEM TO MACK;
INSERT INTO employees (id,manager_id,job_id,corporation_group_id,slug,full_name,date_of_birth,address,phone,email,salary,start_date,biography) VALUES (8,1,3,9,'MACON','Macon X. Tate','22-Jun-92','P.O. Box 595, 2479 Ultrices, Road','047-585-3984','macon@gmail.com',8037,'24-Sep-19','aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis');
CREATE USER MACON IDENTIFIED BY MACON;
GRANT NON_SYSTEM TO MACON;
INSERT INTO employees (id,manager_id,job_id,corporation_group_id,slug,full_name,date_of_birth,address,phone,email,salary,start_date,biography) VALUES (9,2,5,3,'REEVES','Ira B. Reeves','25-Oct-92','8996 Non, Ave','011-276-8405','reeves@gmail.com',6240,'19-Jul-21','at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum');
CREATE USER REEVES IDENTIFIED BY REEVES;
GRANT NON_SYSTEM TO REEVES;
INSERT INTO employees (id,manager_id,job_id,corporation_group_id,slug,full_name,date_of_birth,address,phone,email,salary,start_date,biography) VALUES (10,1,9,2,'ADRIAN','Adrian R. Solomon','10-Mar-95','893-3130 Cursus Rd.','021-380-6116','adrian@gmail.com',6765,'28-Aug-21','Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede.');
CREATE USER ADRIAN IDENTIFIED BY ADRIAN;
GRANT NON_SYSTEM TO ADRIAN;
INSERT INTO employees (id,manager_id,job_id,corporation_group_id,slug,full_name,date_of_birth,address,phone,email,salary,start_date,biography) VALUES (11,4,5,1,'XERXES','Xerxes R. Irwin','18-Apr-91','P.O. Box 520, 8150 Vestibulum. Ave','058-515-6213','xerxes@gmail.com',8471,'08-Jul-21','est, congue a, aliquet vel, vulputate eu, odio. Phasellus at');
CREATE USER XERXES IDENTIFIED BY XERXES;
GRANT NON_SYSTEM TO XERXES;
INSERT INTO employees (id,manager_id,job_id,corporation_group_id,slug,full_name,date_of_birth,address,phone,email,salary,start_date,biography) VALUES (12,2,2,6,'MIRANDA','Miranda B. Erickson','23-Feb-92','2821 Sed Street','096-408-9918','miranda@gmail.com',5838,'14-Aug-20','a, aliquet vel, vulputate eu, odio. Phasellus at augue id');
CREATE USER MIRANDA IDENTIFIED BY MIRANDA;
GRANT NON_SYSTEM TO MIRANDA;
INSERT INTO employees (id,manager_id,job_id,corporation_group_id,slug,full_name,date_of_birth,address,phone,email,salary,start_date,biography) VALUES (13,2,4,1,'WYNNE','Wynne Q. Shelton','14-Dec-90','5508 Id, Rd.','006-482-4477','wynne@gmail.com',7459,'07-May-21','risus a ultricies adipiscing, enim mi tempor lorem, eget mollis');
CREATE USER WYNNE IDENTIFIED BY WYNNE;
GRANT NON_SYSTEM TO WYNNE;
INSERT INTO employees (id,manager_id,job_id,corporation_group_id,slug,full_name,date_of_birth,address,phone,email,salary,start_date,biography) VALUES (14,5,7,6,'LEONARD','Leonard O. Snider','13-Mar-94','710-8334 Non, Street','068-031-6493','leonard@gmail.com',5589,'01-Feb-21','at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum');
CREATE USER LEONARD IDENTIFIED BY LEONARD;
GRANT NON_SYSTEM TO LEONARD;
INSERT INTO employees (id,manager_id,job_id,corporation_group_id,slug,full_name,date_of_birth,address,phone,email,salary,start_date,biography) VALUES (15,1,9,4,'ANIKA','Anika J. Sellers','24-May-93','Ap #551-8469 Ultricies Avenue','049-827-1246','anika@gmail.com',5143,'16-Feb-21','arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim.');
CREATE USER ANIKA IDENTIFIED BY ANIKA;
GRANT CREATE SESSION TO ANIKA;
INSERT INTO employees (id,manager_id,job_id,corporation_group_id,slug,full_name,date_of_birth,address,phone,email,salary,start_date,biography) VALUES (16,4,6,5,'CAMERON','Cameron D. Ramos','09-Aug-91','P.O. Box 241, 8195 Sapien, Rd.','016-916-2983','cameron@gmail.com',5263,'23-Jul-20','dictum eleifend, nunc risus varius orci, in consequat enim diam');
CREATE USER CAMERON IDENTIFIED BY CAMERON;
GRANT NON_SYSTEM TO CAMERON;
INSERT INTO employees (id,manager_id,job_id,corporation_group_id,slug,full_name,date_of_birth,address,phone,email,salary,start_date,biography) VALUES (17,3,9,8,'COLBY','Colby C. Pace','16-May-90','Ap #385-8907 Neque Rd.','002-075-7649','colby@gmail.com',6813,'16-Feb-21','quam quis diam. Pellentesque habitant morbi tristique senectus et netus');
CREATE USER COLBY IDENTIFIED BY COLBY;
GRANT CREATE SESSION TO COLBY;
INSERT INTO employees (id,manager_id,job_id,corporation_group_id,slug,full_name,date_of_birth,address,phone,email,salary,start_date,biography) VALUES (18,5,6,3,'FAITH','Faith G. Blackwell','14-Mar-91','P.O. Box 864, 2548 Leo. Ave','053-804-8536','faith@gmail.com',8622,'13-Aug-20','sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque');
CREATE USER FAITH IDENTIFIED BY FAITH;
GRANT NON_SYSTEM TO FAITH;
INSERT INTO employees (id,manager_id,job_id,corporation_group_id,slug,full_name,date_of_birth,address,phone,email,salary,start_date,biography) VALUES (19,2,7,2,'OMAR','Omar O. Huff','28-Mar-94','8542 Nunc Ave','060-040-0602','omar@gmail.com',5919,'13-Nov-19','Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum');
CREATE USER OMAR IDENTIFIED BY OMAR;
GRANT NON_SYSTEM TO OMAR;
INSERT INTO employees (id,manager_id,job_id,corporation_group_id,slug,full_name,date_of_birth,address,phone,email,salary,start_date,biography) VALUES (20,5,8,8,'NIGEL','Nigel K. Mcclure','06-Jul-90','Ap #913-2650 Luctus Ave','094-292-9182','nigel@gmail.com',8742,'17-Nov-20','rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at,');
CREATE USER NIGEL IDENTIFIED BY NIGEL;
GRANT NON_SYSTEM TO NIGEL;

SELECT * FROM employees;