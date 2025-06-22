-- Step 1: Create a user with a secure password
CREATE USER 'gurbani'@'localhost' IDENTIFIED BY 'StrongP#ssword123';

-- Step 2: Grant all privileges on a specific database (similar to db_owner in SQL Server)
GRANT ALL PRIVILEGES ON your_database_name.* TO 'gurbani'@'localhost';

-- Step 3: Apply changes
FLUSH PRIVILEGES;
