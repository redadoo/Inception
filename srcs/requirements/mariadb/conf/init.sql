-- Create WordPress database
CREATE DATABASE IF NOT EXISTS wordpress_db;

-- Create users
CREATE USER IF NOT EXISTS 'wp_user'@'%' IDENTIFIED BY 'wp_password';
CREATE USER IF NOT EXISTS 'evocatur'@'%' IDENTIFIED BY 'evocatur';

-- Grant privileges
GRANT ALL PRIVILEGES ON wordpress_db.* TO 'wp_user'@'%';

-- Apply changes
FLUSH PRIVILEGES;
