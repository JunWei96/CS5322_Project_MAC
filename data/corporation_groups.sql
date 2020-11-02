DELETE FROM corporation_groups;

-- Group at location in SG
INSERT INTO DB_OWNER.corporation_groups (id, location_id, name, group_type) 
    VALUES (1, 1, 'HR', 'hr');
INSERT INTO DB_OWNER.corporation_groups (id, location_id, name, group_type)
    VALUES (2, 1, 'Finance', 'finance');
INSERT INTO DB_OWNER.corporation_groups (id, location_id, name, group_type) 
    VALUES (3, 1, 'Auditor', 'auditor');
INSERT INTO DB_OWNER.corporation_groups (id, location_id, name) 
    VALUES (4, 1, 'Software Development');
INSERT INTO DB_OWNER.corporation_groups (id, location_id, name) 
    VALUES (5, 1, 'Research');

-- Group at location in US
INSERT INTO DB_OWNER.corporation_groups (id, location_id, name, group_type) 
    VALUES (6, 2, 'HR', 'hr');
INSERT INTO DB_OWNER.corporation_groups (id, location_id, name, group_type) 
    VALUES (7, 2, 'Auditor', 'auditor');
INSERT INTO DB_OWNER.corporation_groups (id, location_id, name, group_type) 
    VALUES (8, 2, 'Finance', 'finance');
INSERT INTO DB_OWNER.corporation_groups (id, location_id, name) 
    VALUES (9, 2, 'Research');
    
COMMIT;

SELECT * FROM corporation_groups;