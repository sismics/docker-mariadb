#!/bin/bash

VOLUME_HOME="/var/lib/mysql"
chmod 644 /etc/mysql/mariadb.conf.d/*.cnf

if [[ ! -f $VOLUME_HOME/initialized ]]; then
    echo "=> An empty or uninitialized MariaDB volume is detected in $VOLUME_HOME"
    echo "=> Installing MariaDB ..."
    mysql_install_db > /dev/null 2>&1
    echo "=> Done!"  
    /usr/local/bin/create_mariadb_admin_user.sh
else
    echo "=> Using an existing volume of MariaDB"
fi

exec mysqld_safe
