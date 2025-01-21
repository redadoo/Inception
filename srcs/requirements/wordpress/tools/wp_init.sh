#!/bin/sh

# Check if the required environment variables are set
if [ -z "$MYSQL_USER" ] || [ -z "$MYSQL_PASSWORD" ] || [ -z "$MYSQL_HOSTNAME" ] || [ -z "$MYSQL_DATABASE" ]; then
  echo "Error: MySQL environment variables (MYSQL_USER, MYSQL_PASSWORD, MYSQL_HOSTNAME, MYSQL_DATABASE) must be set."
  exit 1
fi

# Check if the WordPress config file already exists
if [ -f ./wp-config.php ]; then
  echo "WordPress config file already exists, skipping creation."
else

  # Modify wp-config-sample.php with the environment variables
  sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
  sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
  sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
  sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php

  cp wp-config-sample.php wp-config.php
  
  chmod 644 wp-config.php

  # wp user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_PASS

  echo "wp-config.php has been created successfully."
fi

# Execute the provided command
exec "$@"
