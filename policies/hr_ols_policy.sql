CONNECT LBACSYS/LBACSYS

BEGIN
    SA_SYSDBA.DROP_POLICY(
        policy_name => 'HR_OLS_POLICY',
        drop_column => TRUE
    );
    SA_SYSDBA.CREATE_POLICY(
        policy_name => 'HR_OLS_POLICY',
        column_name => 'HR_OLS',
        default_options => 'READ_CONTROL, WRITE_CONTROL'
    );
    SA_SYSDBA.ENABLE_POLICY ('HR_OLS_POLICY');
END;
/
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
        long_name       => 'SINGAPORE');

    SA_COMPONENTS.CREATE_GROUP (
        policy_name     => 'HR_OLS_POLICY',
        group_num       => 1000,
        short_name      => 'US',
        long_name       => 'United_States');

    SA_USER_ADMIN.SET_USER_PRIVS(
        policy_name   => 'HR_OLS_POLICY',
        user_name     => 'DUKE', 
        privileges    => 'READ');

    SA_USER_ADMIN.SET_USER_PRIVS(
        policy_name   => 'HR_OLS_POLICY',
        user_name     => 'SYSTEM_ADMIN', 
        privileges    => 'FULL');
END;