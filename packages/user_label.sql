CREATE OR REPLACE PACKAGE PRIVATE_USER_LABEL_FUNCTIONS AS
    FUNCTION get_user_max_security_level(sessionUser varchar, group_type varchar, is_manager integer) RETURN varchar;
    FUNCTION get_user_groups(sessionUser varchar, country varchar) RETURN varchar;
    FUNCTION get_user_compartments(sessionUser varchar, group_type varchar) RETURN varchar;
END;
/
CREATE OR REPLACE PACKAGE USER_LABEL_FUNCTIONS AS
    FUNCTION get_user_label(sessionUser varchar, group_type varchar, is_manager integer, country varchar) RETURN varchar;
END;

/
CREATE OR REPLACE PACKAGE BODY PRIVATE_USER_LABEL_FUNCTIONS IS
    FUNCTION get_user_max_security_level(sessionUser varchar, group_type varchar, is_manager integer)
    RETURN VARCHAR IS returnValue VARCHAR2(30);
    BEGIN
        IF (sessionUser = 'SYSTEM') THEN
            RETURN 'HS';
        END IF;
        
        IF (group_type = 'hr' OR group_type = 'finance' OR group_type = 'auditor' OR is_manager = 1) THEN
            return 'S';
        ELSE
            return 'C';
        END IF;
    END;
    
    FUNCTION get_user_groups(sessionUser varchar, country varchar)
    RETURN VARCHAR IS returnValue VARCHAR2(30);
    BEGIN
        IF (sessionUser = 'SYSTEM') THEN
            RETURN 'GLOB';
        END IF;

        RETURN country;
    END;
    
    FUNCTION get_user_compartments(sessionUser varchar, group_type varchar)
    RETURN VARCHAR IS returnValue VARCHAR2(30);
    BEGIN
        IF (sessionUser = 'SYSTEM') THEN
            RETURN 'SA';
        END IF;
        
        CASE
        WHEN group_type = 'hr' THEN
            RETURN 'HR';
        WHEN group_type = 'finance' THEN
            RETURN 'FIN'; 
        ELSE
            RETURN 'GE';              
        END CASE;
    END;

END PRIVATE_USER_LABEL_FUNCTIONS;
/
CREATE OR REPLACE PACKAGE BODY USER_LABEL_FUNCTIONS IS
    FUNCTION get_user_label(sessionUser varchar, group_type varchar, is_manager integer, country varchar)
    RETURN VARCHAR IS returnValue VARCHAR2(50);
    BEGIN
        RETURN PRIVATE_USER_LABEL_FUNCTIONS.get_user_max_security_level(sessionUser, group_type, is_manager) || 
            ':' || PRIVATE_USER_LABEL_FUNCTIONS.get_user_compartments(sessionUser, group_type) || 
            ':' || PRIVATE_USER_LABEL_FUNCTIONS.get_user_groups(sessionUser, country);
    END;
END USER_LABEL_FUNCTIONS;
/
GRANT EXECUTE ON USER_LABEL_FUNCTIONS TO PUBLIC;
