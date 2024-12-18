#!/bin/sh

mysql_install_db

sleep 5

# Start MariaDB in safe mode
/usr/bin/mysqld_safe &

sleep 5

if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]
then
	echo "Database already exists"
else
	# Secure the MariaDB installation
	mysql_secure_installation << EOF

	Y
	Y
	$MYSQL_ROOT_PASSWORD
	$MYSQL_ROOT_PASSWORD
	Y
	n
	Y
	Y
EOF

echo "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot

echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE; GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_ADMIN'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'; FLUSH PRIVILEGES;" | mysql -u root

echo "CREATE USER IF NOT EXISTS '$MYSQL_ADMIN'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql -uroot
echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO 'evocatur'@'%' IDENTIFIED BY 'evocatur'; FLUSH PRIVILEGES;" | mysql -uroot

mysql -uroot -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE < /usr/local/bin/wordpress.sql
fi


# Shutdown MariaDB
mysqladmin -u root -p"$MYSQL_ROOT_PASSWORD" shutdown

# Run any additional commands passed to the script
exec "$@"
