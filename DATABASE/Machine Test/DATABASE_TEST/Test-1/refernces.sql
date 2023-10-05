-- ------------------------------------------------------------------------------------------------------------------------

-- To delete all the tables in a PostgreSQL database, you can use the following steps:

-- ------------------------------------------------------------------------------------------------------------------------

-- 1) Connect to the database where the tables are located using the psql command or any PostgreSQL client of your choice.

-- 2) Disable foreign key constraints temporarily to avoid conflicts while deleting the tables. 
-- Run the following command:

--         SET session_replication_role = replica;

-- 3) Generate the necessary SQL statements to drop all the tables in the database. 
-- You can use the following query to generate the statements dynamically:

--         SELECT 'DROP TABLE IF EXISTS "' || tablename || '" CASCADE;' AS sql
--         FROM pg_tables
--         WHERE schemaname = 'public';

-- 4) Copy the generated SQL statements from the result and execute them to drop the tables. 
-- Make sure to copy the complete statements without any modifications.

-- 5) Enable foreign key constraints again. Run the following command:

--         SET session_replication_role = DEFAULT;

-- By following these steps, you can delete all the tables in a PostgreSQL database. Note that this action is irreversible, 
-- and all data in the tables will be permanently deleted. Please exercise caution and ensure you have a backup of your 
-- data before proceeding with the deletion.
