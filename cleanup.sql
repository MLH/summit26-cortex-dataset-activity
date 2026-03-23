DECLARE
    obj_name VARCHAR;
    schema_name VARCHAR;
    drop_stmt VARCHAR;
    schema_cursor CURSOR FOR
        SELECT SCHEMA_NAME FROM SNOWFLAKE_LEARNING_DB.INFORMATION_SCHEMA.SCHEMATA
        WHERE SCHEMA_NAME NOT IN ('INFORMATION_SCHEMA');
    sv_cursor CURSOR FOR
        SELECT "name", "schema_name" FROM TABLE(RESULT_SCAN(LAST_QUERY_ID()));
    tbl_cursor CURSOR FOR
        SELECT "name", "schema_name" FROM TABLE(RESULT_SCAN(LAST_QUERY_ID()));
BEGIN
    -- Drop all semantic views
    SHOW SEMANTIC VIEWS IN DATABASE SNOWFLAKE_LEARNING_DB;
    FOR sv IN sv_cursor DO
        drop_stmt := 'DROP SEMANTIC VIEW IF EXISTS SNOWFLAKE_LEARNING_DB.' || sv."schema_name" || '.' || sv."name";
        EXECUTE IMMEDIATE drop_stmt;
    END FOR;

    -- Drop all tables
    SHOW TABLES IN DATABASE SNOWFLAKE_LEARNING_DB;
    FOR tbl IN tbl_cursor DO
        drop_stmt := 'DROP TABLE IF EXISTS SNOWFLAKE_LEARNING_DB.' || tbl."schema_name" || '.' || tbl."name";
        EXECUTE IMMEDIATE drop_stmt;
    END FOR;
END;

SELECT 'All cleaned up! You’re ready to start another adventure!' as STATUS;