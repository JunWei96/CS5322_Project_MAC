CONNECT DB_OWNER/DB_OWNER;

CREATE OR REPLACE PACKAGE PRIVATE_LABEL_FUNCTIONS AS
    FUNCTION get_emp_compartments(group_type varchar) RETURN varchar;
END;
/
CREATE OR REPLACE PACKAGE LABEL_FUNCTIONS AS
    FUNCTION get_emp_label(corporation_group_id int) RETURN LBACSYS.LBAC_LABEL;
    FUNCTION get_report_label(author_id int) RETURN LBACSYS.LBAC_LABEL;
    FUNCTION get_hr_review_label(author_id int) RETURN LBACSYS.LBAC_LABEL;
END;

/
CREATE OR REPLACE PACKAGE BODY PRIVATE_LABEL_FUNCTIONS IS
    FUNCTION get_emp_compartments(group_type varchar)
    RETURN VARCHAR IS returnValue VARCHAR2(30);
    BEGIN
        CASE
        WHEN group_type = 'hr' THEN
            RETURN 'HR';
        WHEN group_type = 'finance' THEN
            RETURN 'FIN';
        WHEN group_type = 'auditor' THEN
            RETURN 'AUD';
        ELSE
            RETURN 'GE';              
        END CASE;
    END;

END PRIVATE_LABEL_FUNCTIONS;
/
CREATE OR REPLACE PACKAGE BODY LABEL_FUNCTIONS IS
    FUNCTION get_emp_label(corporation_group_id int)
    RETURN LBACSYS.LBAC_LABEL AS 
        label VARCHAR2(80);
        sessionUser VARCHAR2(30);
        s_level VARCHAR(30);
        group_type VARCHAR2(20);
        country_id int;
        country_code VARCHAR(20);
        location_id INT;
    BEGIN
        s_level := 'S';
        sessionUser := SYS_CONTEXT('USERENV','SESSION_USER');
        IF sessionUser LIKE 'HS%' THEN
            s_level := 'HS';
        END IF;

        BEGIN
            SELECT group_type, location_id
                INTO group_type, location_id
                FROM corporation_groups 
                WHERE id = corporation_group_id;
            SELECT country_id
                INTO country_id
                FROM locations
                WHERE id = location_id;
            SELECT country_code
                INTO country_code
                FROM countries
                WHERE id = country_id;
            
        EXCEPTION WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20000, 'Essential data is not found.');
        END;

        RETURN TO_LBAC_DATA_LABEL('HR_OLS_POLICY', s_level || ':GE:' || country_code);
    END;
    
    FUNCTION get_report_label(author_id int)
    RETURN LBACSYS.LBAC_LABEL AS
        label VARCHAR2(80);
        sessionUser VARCHAR2(30);
        s_level VARCHAR(30);
        corporation_group_id int;
        group_type VARCHAR2(20);
        country_id int;
        country_code VARCHAR(20);
        location_id INT;
    BEGIN
        s_level := 'S';
        sessionUser := SYS_CONTEXT('USERENV','SESSION_USER');
        IF (sessionUser LIKE 'HS_%') THEN
            s_level := 'HS';
        END IF;

        BEGIN
            SELECT corporation_group_id
                INTO corporation_group_id
                FROM employees
                WHERE id = author_id;
            SELECT group_type, location_id
                INTO group_type, location_id
                FROM corporation_groups 
                WHERE id = corporation_group_id;
            SELECT country_id
                INTO country_id
                FROM locations
                WHERE id = location_id;
            SELECT country_code
                INTO country_code
                FROM countries
                WHERE id = country_id;
        EXCEPTION WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20000, 'Essential data is not found.');
        END;

        RETURN TO_LBAC_DATA_LABEL('HR_OLS_POLICY', s_level || ':' || PRIVATE_LABEL_FUNCTIONS.get_emp_compartments(group_type) || ':' || country_code);
    END;
    
    FUNCTION get_hr_review_label(author_id int)
    RETURN LBACSYS.LBAC_LABEL AS
        label VARCHAR2(80);
        sessionUser VARCHAR2(30);
        s_level VARCHAR(30);
        corporation_group_id int;
        group_type VARCHAR2(20);
        country_id int;
        country_code VARCHAR(20);
        location_id INT;
    BEGIN
        s_level := 'S';
        sessionUser := SYS_CONTEXT('USERENV','SESSION_USER');
        IF (sessionUser LIKE 'HS_%') THEN
            s_level := 'HS';
        END IF;

        BEGIN
            SELECT corporation_group_id
                INTO corporation_group_id
                FROM employees
                WHERE id = author_id;
            SELECT group_type, location_id
                INTO group_type, location_id
                FROM corporation_groups 
                WHERE id = corporation_group_id;
            SELECT country_id
                INTO country_id
                FROM locations
                WHERE id = location_id;
            SELECT country_code
                INTO country_code
                FROM countries
                WHERE id = country_id;
        EXCEPTION WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20000, 'Essential data is not found.');
        END;

        RETURN TO_LBAC_DATA_LABEL('HR_OLS_POLICY', s_level || ':' || 'HR:' || country_code);
    END;
END LABEL_FUNCTIONS;
/
GRANT EXECUTE ON LABEL_FUNCTIONS TO PUBLIC;
