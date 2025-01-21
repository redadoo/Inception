#!/bin/sh

if [ -z "$MYSQL_USER" ] || [ -z "$MYSQL_PASSWORD" ] || [ -z "$MYSQL_HOSTNAME" ] || [ -z "$MYSQL_DATABASE" ]; then
  echo "Error: MySQL environment variables (MYSQL_ADMIN, MYSQL_PASSWORD, MYSQL_HOSTNAME, MYSQL_DATABASE) must be set."
  exit 1
fi

if [ -f ./wp-config.php ]; then
  echo "WordPress config file already exists, skipping creation."
else
  sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
  sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
  sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
  sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php

  cp wp-config-sample.php wp-config.php
  chmod 644 wp-config.php
  echo "wp-config.php has been created successfully."
fi

exec "$@"
