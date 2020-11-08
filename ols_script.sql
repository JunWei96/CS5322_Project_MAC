@utils/reset.sql

rem ====================================================================
rem  Create database owner
rem ====================================================================

DROP USER DB_OWNER;
CREATE USER DB_OWNER IDENTIFIED BY DB_OWNER;
GRANT CONNECT, RESOURCE, SELECT_CATALOG_ROLE TO DB_OWNER;
GRANT UNLIMITED TABLESPACE TO DB_OWNER;

rem ====================================================================
rem Connect as LBACSYS to grant authorization to DB_OWNER
rem ====================================================================

CONNECT LBACSYS/LBACSYS

GRANT EXECUTE ON sa_components TO DB_OWNER WITH GRANT OPTION;
GRANT EXECUTE ON sa_user_admin TO DB_OWNER WITH GRANT OPTION;
GRANT EXECUTE ON sa_user_admin TO DB_OWNER WITH GRANT OPTION;
GRANT EXECUTE ON sa_label_admin TO DB_OWNER WITH GRANT OPTION;
GRANT EXECUTE ON sa_policy_admin TO DB_OWNER WITH GRANT OPTION;
GRANT EXECUTE ON sa_audit_admin  TO DB_OWNER WITH GRANT OPTION;

GRANT LBAC_DBA TO DB_OWNER;
GRANT EXECUTE ON sa_sysdba TO DB_OWNER;
GRANT EXECUTE ON to_lbac_data_label TO DB_OWNER;


rem ====================================================================
rem  Creating Policy: 'HR_OLS_POLICY'
rem ====================================================================

CONNECT DB_OWNER/DB_OWNER;
EXECUTE SA_SYSDBA.DROP_POLICY(policy_name => 'HR_OLS_POLICY', drop_column => TRUE);
EXECUTE SA_SYSDBA.CREATE_POLICY(policy_name => 'HR_OLS_POLICY', column_name => 'HR_OLS', default_options => 'READ_CONTROL, WRITE_CONTROL');
EXECUTE SA_SYSDBA.ENABLE_POLICY('HR_OLS_POLICY');
GRANT HR_OLS_POLICY_DBA TO DB_OWNER;

rem ====================================================================
rem  Creating Levels, Compartments and Groups
rem ====================================================================
CONNECT DB_OWNER/DB_OWNER

BEGIN
    SA_COMPONENTS.CREATE_LEVEL (
        policy_name => 'HR_OLS_POLICY',
        level_num   => 3000,
        short_name  => 'HS',
        long_name   => 'HIGHLY_SENSITIVE');

    SA_COMPONENTS.CREATE_LEVEL (
        policy_name => 'HR_OLS_POLICY',
        level_num   => 2000,
        short_name  => 'S',
        long_name   => 'SENSITIVE');
      
    SA_COMPONENTS.CREATE_LEVEL (
        policy_name => 'HR_OLS_POLICY',
        level_num   => 1000,
        short_name  => 'C',
        long_name   => 'CONFIDENTIAL');

    SA_COMPONENTS.CREATE_COMPARTMENT (
        policy_name      => 'HR_OLS_POLICY',
        long_name        => 'SYSTEM_ADMIN',
        short_name       => 'SA',
        comp_num         =>  6000);

    SA_COMPONENTS.CREATE_COMPARTMENT (
        policy_name      => 'HR_OLS_POLICY',
        long_name        => 'HUMAN_RESOURCE',
        short_name       => 'HR',
        comp_num         =>  5000);
 
    SA_COMPONENTS.CREATE_COMPARTMENT (
        policy_name      => 'HR_OLS_POLICY',
        long_name        => 'FINANCE',
        short_name       => 'FIN',
        comp_num         =>  4000);
 
    SA_COMPONENTS.CREATE_COMPARTMENT (
        policy_name      => 'HR_OLS_POLICY',
        long_name        => 'AUDITOR',
        short_name       => 'AUD',
        comp_num         =>  3000);
  
    SA_COMPONENTS.CREATE_COMPARTMENT (
        policy_name      => 'HR_OLS_POLICY',
        long_name        => 'GENERAL_EMP',
        short_name       => 'GE',
        comp_num         =>  2000);

    SA_COMPONENTS.CREATE_GROUP (
        policy_name     => 'HR_OLS_POLICY',
        group_num       => 3000,
        short_name      => 'GLOB',
        long_name       => 'GLOBAL');

    SA_COMPONENTS.CREATE_GROUP (
        policy_name     => 'HR_OLS_POLICY',
        group_num       => 2000,
        short_name      => 'SG',
        long_name       => 'SINGAPORE',
        parent_name     => 'GLOB');

    SA_COMPONENTS.CREATE_GROUP (
        policy_name     => 'HR_OLS_POLICY',
        group_num       => 1000,
        short_name      => 'US',
        long_name       => 'United_States',
        parent_name     => 'GLOB');
END;
/
rem ====================================================================
rem  Creating Table
rem ====================================================================
CONNECT DB_OWNER/DB_OWNER
@schema.sql

rem ====================================================================
rem  Compiling functions
rem ====================================================================
CONNECT DB_OWNER/DB_OWNER
@packages/load_packages.sql

rem ====================================================================
rem  Apply policy to tables
rem ====================================================================
CONNECT DB_OWNER/DB_OWNER
BEGIN
  SA_POLICY_ADMIN.REMOVE_TABLE_POLICY('HR_OLS_POLICY','DB_OWNER','EMPLOYEES');
  SA_POLICY_ADMIN.APPLY_TABLE_POLICY (
    policy_name => 'HR_OLS_POLICY',
    schema_name => 'DB_OWNER',
    table_name  => 'EMPLOYEES',
    table_options => 'READ_CONTROL,WRITE_CONTROL,CHECK_CONTROL',
    label_function => 'DB_OWNER.LABEL_FUNCTIONS.get_emp_label(:new.corporation_group_id)');
END;
/
BEGIN
  SA_POLICY_ADMIN.REMOVE_TABLE_POLICY('HR_OLS_POLICY','DB_OWNER','REPORTS');
  SA_POLICY_ADMIN.APPLY_TABLE_POLICY (
    policy_name => 'HR_OLS_POLICY',
    schema_name => 'DB_OWNER',
    table_name  => 'REPORTS',
    table_options => 'READ_CONTROL,WRITE_CONTROL,CHECK_CONTROL',
    label_function => 'DB_OWNER.LABEL_FUNCTIONS.get_report_label(:new.author)');
END;
/
BEGIN
  SA_POLICY_ADMIN.REMOVE_TABLE_POLICY('HR_OLS_POLICY','DB_OWNER','HR_REVIEWS');
  SA_POLICY_ADMIN.APPLY_TABLE_POLICY (
    policy_name => 'HR_OLS_POLICY',
    schema_name => 'DB_OWNER',
    table_name  => 'HR_REVIEWS',
    table_options => 'READ_CONTROL,WRITE_CONTROL,CHECK_CONTROL',
    label_function => 'DB_OWNER.LABEL_FUNCTIONS.get_hr_review_label(:new.author)');
END;
/
rem ====================================================================
rem  Creating test users
rem ====================================================================
CONNECT SYSTEM/cs5322t2010;
DROP USER HR_SG;
DROP USER HR_US;
DROP USER HR_GLOB;
DROP USER AUD_SG;
DROP USER AUD_US;
DROP USER FIN_SG;
DROP USER FIN_US;
DROP USER HS_FIN_SG;
CREATE USER HR_SG IDENTIFIED BY HR_SG;
CREATE USER HR_US IDENTIFIED BY HR_US;
CREATE USER HR_GLOB IDENTIFIED BY HR_GLOB;
CREATE USER AUD_SG IDENTIFIED BY AUD_SG;
CREATE USER AUD_US IDENTIFIED BY AUD_US;
CREATE USER FIN_SG IDENTIFIED BY FIN_SG;
CREATE USER FIN_US IDENTIFIED BY FIN_US;
CREATE USER HS_FIN_SG IDENTIFIED BY HS_FIN_SG;
GRANT CONNECT TO HR_SG, HR_US, HR_GLOB, AUD_SG, AUD_US, FIN_SG, FIN_US, HS_FIN_SG;
GRANT SELECT, UPDATE, DELETE, INSERT ON DB_OWNER.employees TO PUBLIC;
GRANT SELECT, UPDATE, DELETE, INSERT ON DB_OWNER.reports TO PUBLIC;
GRANT SELECT, UPDATE, DELETE, INSERT ON DB_OWNER.hr_reviews TO PUBLIC;
GRANT SELECT ON DB_OWNER.corporation_groups TO PUBLIC;
GRANT SELECT ON DB_OWNER.countries TO PUBLIC;
GRANT SELECT ON DB_OWNER.locations TO PUBLIC;


CONNECT DB_OWNER/DB_OWNER
BEGIN
    SA_USER_ADMIN.SET_USER_LABELS('HR_OLS_POLICY','HR_SG','S:HR,GE:SG');
    SA_USER_ADMIN.SET_USER_LABELS('HR_OLS_POLICY','HR_US','S:HR,GE:US');
    SA_USER_ADMIN.SET_USER_LABELS('HR_OLS_POLICY','HR_GLOB','S:HR,GE:GLOB');
    SA_USER_ADMIN.SET_USER_LABELS('HR_OLS_POLICY','AUD_SG','HS:AUD,GE,HR,FIN:SG');
    SA_USER_ADMIN.SET_USER_LABELS('HR_OLS_POLICY','AUD_US','HS:AUD,GE,HR,FIN:US');
    SA_USER_ADMIN.SET_USER_LABELS('HR_OLS_POLICY','FIN_SG','S:FIN,GE:SG');
    SA_USER_ADMIN.SET_USER_LABELS('HR_OLS_POLICY','FIN_US','S:FIN,GE:US');
    SA_USER_ADMIN.SET_USER_LABELS('HR_OLS_POLICY','HS_FIN_SG','HS:FIN,GE:SG');
END;
/
rem ====================================================================
rem  Apply privileges
rem ====================================================================
CONNECT DB_OWNER/DB_OWNER
EXECUTE SA_USER_ADMIN.SET_USER_PRIVS('HR_OLS_POLICY', 'DB_OWNER', 'FULL');
rem ====================================================================
rem  Populating Tables
rem ====================================================================
CONNECT DB_OWNER/DB_OWNER
@data/load_data.sql
rem ====================================================================
rem  Test: employees table
rem ====================================================================
-- Will return the employees from SG
CONNECT HR_SG/HR_SG;
DECLARE
    counter INT;
BEGIN
    SELECT COUNT(*) INTO counter FROM DB_OWNER.employees;
    IF counter != 14 THEN
        RAISE_APPLICATION_ERROR(-20000, 'Incorrect number of rows.');
    END IF;
END;
/
-- Will return employees from US
CONNECT HR_US/HR_US;
DECLARE
    counter INT;
BEGIN
    SELECT COUNT(*) INTO counter FROM DB_OWNER.employees;
    IF counter != 6 THEN
        RAISE_APPLICATION_ERROR(-20000, 'Incorrect number of rows.');
    END IF;
END;
/
rem ====================================================================
rem  Test: reports table
rem ====================================================================
--CONNECT DB_OWNER/DB_OWNER;
--SELECT id, author, link FROM DB_OWNER.reports;

-- Will return all the audit,finance,hr reports from SG
CONNECT AUD_SG/AUD_SG;
DECLARE
    counter INT;
BEGIN
    SELECT COUNT(R.id) --, R.author, CP.group_type, C.country_code 
        INTO counter
        FROM DB_OWNER.reports R
        INNER JOIN DB_OWNER.employees E ON R.author = E.id
        INNER JOIN DB_OWNER.corporation_groups CP ON CP.id = E.corporation_group_id
        INNER JOIN DB_OWNER.locations LOC ON LOC.id = CP.location_id
        INNER JOIN DB_OWNER.countries C ON C.id = LOC.country_id;
    IF counter != 315 THEN
        RAISE_APPLICATION_ERROR(-20000, 'Incorrect number of rows.');
    END IF;
END;
/
-- Will return all the audit,finance,hr reports from US
CONNECT AUD_US/AUD_US;
DECLARE
    counter INT;
BEGIN
    SELECT count(R.id) --, R.author, CP.group_type, C.country_code
        INTO counter
        FROM DB_OWNER.reports R 
        INNER JOIN DB_OWNER.employees E ON R.author = E.id
        INNER JOIN DB_OWNER.corporation_groups CP ON CP.id = E.corporation_group_id
        INNER JOIN DB_OWNER.locations LOC ON LOC.id = CP.location_id
        INNER JOIN DB_OWNER.countries C ON C.id = LOC.country_id;
    IF counter != 186 THEN
        RAISE_APPLICATION_ERROR(-20000, 'Incorrect number of rows.');
    END IF;
END;
/
-- Will return all the finance reports from SG
CONNECT FIN_SG/FIN_SG;
DECLARE
    counter INT;
BEGIN
    SELECT count(R.id) --, R.author, CP.group_type, C.country_code
        into counter
        FROM DB_OWNER.reports R 
        INNER JOIN DB_OWNER.employees E ON R.author = E.id
        INNER JOIN DB_OWNER.corporation_groups CP ON CP.id = E.corporation_group_id
        INNER JOIN DB_OWNER.locations LOC ON LOC.id = CP.location_id
        INNER JOIN DB_OWNER.countries C ON C.id = LOC.country_id;

    IF counter != 104 THEN
        RAISE_APPLICATION_ERROR(-20000, 'Incorrect number of rows.');
    END IF;
END;
/
-- Will return all the finance reports from SG including the highly sensitive one
CONNECT HS_FIN_SG/HS_FIN_SG;
DECLARE
    counter INT;
BEGIN
    SELECT count(R.id) --, R.author, CP.group_type, C.country_code
        into counter
        FROM DB_OWNER.reports R 
        INNER JOIN DB_OWNER.employees E ON R.author = E.id
        INNER JOIN DB_OWNER.corporation_groups CP ON CP.id = E.corporation_group_id
        INNER JOIN DB_OWNER.locations LOC ON LOC.id = CP.location_id
        INNER JOIN DB_OWNER.countries C ON C.id = LOC.country_id;

    IF counter != 105 THEN
        RAISE_APPLICATION_ERROR(-20000, 'Incorrect number of rows.');
    END IF;
END;
/
-- Will return all the finance reports from US
CONNECT FIN_US/FIN_US;
DECLARE
    counter INT;
BEGIN
    SELECT count(R.id) --,R.author, CP.group_type, C.country_code
        into counter
        FROM DB_OWNER.reports R 
        INNER JOIN DB_OWNER.employees E ON R.author = E.id
        INNER JOIN DB_OWNER.corporation_groups CP ON CP.id = E.corporation_group_id
        INNER JOIN DB_OWNER.locations LOC ON LOC.id = CP.location_id
        INNER JOIN DB_OWNER.countries C ON C.id = LOC.country_id;
    IF counter != 74 THEN
        RAISE_APPLICATION_ERROR(-20000, 'Incorrect number of rows.');
    END IF;
END;   
/
-- Will return all the hr reports from SG
CONNECT HR_SG/HR_SG;
DECLARE
    counter INT;
BEGIN
    SELECT count(R.id) --,R.author, CP.group_type, C.country_code
        into counter
        FROM DB_OWNER.reports R 
        INNER JOIN DB_OWNER.employees E ON R.author = E.id
        INNER JOIN DB_OWNER.corporation_groups CP ON CP.id = E.corporation_group_id
        INNER JOIN DB_OWNER.locations LOC ON LOC.id = CP.location_id
        INNER JOIN DB_OWNER.countries C ON C.id = LOC.country_id;
    IF counter != 85 THEN
        RAISE_APPLICATION_ERROR(-20000, 'Incorrect number of rows.');
    END IF;
END;   
/
-- Will return all the hr reports from US
CONNECT HR_US/HR_US;
DECLARE
    counter INT;
BEGIN
    SELECT count(R.id) --,R.author, CP.group_type, C.country_code
        into counter
        FROM DB_OWNER.reports R 
        INNER JOIN DB_OWNER.employees E ON R.author = E.id
        INNER JOIN DB_OWNER.corporation_groups CP ON CP.id = E.corporation_group_id
        INNER JOIN DB_OWNER.locations LOC ON LOC.id = CP.location_id
        INNER JOIN DB_OWNER.countries C ON C.id = LOC.country_id;
    IF counter != 74 THEN
        RAISE_APPLICATION_ERROR(-20000, 'Incorrect number of rows.');
    END IF;
END;   
/
-- Will return all the HR reports from US and SG
CONNECT HR_GLOB/HR_GLOB;
DECLARE
    counter INT;
BEGIN
    SELECT count(R.id) --,R.author, CP.group_type, C.country_code
        into counter
        FROM DB_OWNER.reports R 
        INNER JOIN DB_OWNER.employees E ON R.author = E.id
        INNER JOIN DB_OWNER.corporation_groups CP ON CP.id = E.corporation_group_id
        INNER JOIN DB_OWNER.locations LOC ON LOC.id = CP.location_id
        INNER JOIN DB_OWNER.countries C ON C.id = LOC.country_id;
    IF counter != 159 THEN
        RAISE_APPLICATION_ERROR(-20000, 'Incorrect number of rows.');
    END IF;
END;   
/
rem ====================================================================
rem  Test: hr_reviews table
rem ====================================================================
-- Will only return the reviews in SG
CONNECT HR_SG/HR_SG;
DECLARE
    counter INT;
BEGIN
    SELECT count(R.id) --, R.author, CP.group_type, C.country_code
        INTO counter
        FROM DB_OWNER.hr_reviews R 
        INNER JOIN DB_OWNER.employees E ON R.author = E.id
        INNER JOIN DB_OWNER.corporation_groups CP ON CP.id = E.corporation_group_id
        INNER JOIN DB_OWNER.locations LOC ON LOC.id = CP.location_id
        INNER JOIN DB_OWNER.countries C ON C.id = LOC.country_id;
    IF counter != 56 THEN
        RAISE_APPLICATION_ERROR(-20000, 'Incorrect number of rows.');
    END IF;
END;   
/
-- Will only return the hr reviews in US
CONNECT HR_US/HR_US;
DECLARE
    counter INT;
BEGIN
    SELECT count(R.id) --, R.author, CP.group_type, C.country_code
        INTO counter
        FROM DB_OWNER.hr_reviews R 
        INNER JOIN DB_OWNER.employees E ON R.author = E.id
        INNER JOIN DB_OWNER.corporation_groups CP ON CP.id = E.corporation_group_id
        INNER JOIN DB_OWNER.locations LOC ON LOC.id = CP.location_id
        INNER JOIN DB_OWNER.countries C ON C.id = LOC.country_id;
    IF counter != 44 THEN
        RAISE_APPLICATION_ERROR(-20000, 'Incorrect number of rows.');
    END IF;
END;   
/
-- Will return the hr reviews of all countries.
CONNECT HR_GLOB/HR_GLOB;
DECLARE
    counter INT;
BEGIN
    SELECT count(R.id) --, R.author, CP.group_type, C.country_code
        INTO counter
        FROM DB_OWNER.hr_reviews R 
        INNER JOIN DB_OWNER.employees E ON R.author = E.id
        INNER JOIN DB_OWNER.corporation_groups CP ON CP.id = E.corporation_group_id
        INNER JOIN DB_OWNER.locations LOC ON LOC.id = CP.location_id
        INNER JOIN DB_OWNER.countries C ON C.id = LOC.country_id;
    IF counter != 100 THEN
        RAISE_APPLICATION_ERROR(-20000, 'Incorrect number of rows.');
    END IF;
END;   
/
-- Will only return the reviews from US.
CONNECT AUD_US/AUD_US;
DECLARE
    counter INT;
BEGIN
    SELECT count(R.id) --, R.author, CP.group_type, C.country_code
        INTO counter
        FROM DB_OWNER.hr_reviews R 
        INNER JOIN DB_OWNER.employees E ON R.author = E.id
        INNER JOIN DB_OWNER.corporation_groups CP ON CP.id = E.corporation_group_id
        INNER JOIN DB_OWNER.locations LOC ON LOC.id = CP.location_id
        INNER JOIN DB_OWNER.countries C ON C.id = LOC.country_id;
    IF counter != 44 THEN
        RAISE_APPLICATION_ERROR(-20000, 'Incorrect number of rows.');
    END IF;
END;   
/
-- Should not return any hr_reviews.
CONNECT FIN_US/FIN_US;
DECLARE
    counter INT;
BEGIN
    SELECT count(R.id) --, R.author, CP.group_type, C.country_code
        INTO counter
        FROM DB_OWNER.hr_reviews R 
        INNER JOIN DB_OWNER.employees E ON R.author = E.id
        INNER JOIN DB_OWNER.corporation_groups CP ON CP.id = E.corporation_group_id
        INNER JOIN DB_OWNER.locations LOC ON LOC.id = CP.location_id
        INNER JOIN DB_OWNER.countries C ON C.id = LOC.country_id;
    IF counter != 0 THEN
        RAISE_APPLICATION_ERROR(-20000, 'Incorrect number of rows.');
    END IF;
END;   
