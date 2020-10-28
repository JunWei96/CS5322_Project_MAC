CREATE OR REPLACE PACKAGE USER_LABEL_FUNCTIONS AS
    FUNCTION get_user_max_security_level(sessionUser varchar, group_type varchar, is_manager integer) RETURN varchar;
END;

/
CREATE OR REPLACE PACKAGE BODY USER_LABEL_FUNCTIONS IS
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
END USER_LABEL_FUNCTIONS;
/
GRANT EXECUTE ON USER_LABEL_FUNCTIONS TO PUBLIC;
