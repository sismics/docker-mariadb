#!/bin/bash

VOLUME_HOME="/var/lib/mysql"
chmod 644 /etc/mysql/mariadb.conf.d/*.cnf

if [[ ! -d $VOLUME_HOME/mysql ]]; then
    echo "=> An empty or uninitialized Mariadb volume is detected in $VOLUME_HOME"
    echo "=> Installing Mariadb ..."
    mysql_install_db > /dev/null 2>&1
    echo "=> Done!"  
    /usr/local/bin/create_mariadb_admin_user.sh
else
    echo "=> Using an existing volume of Mariadb"
fi

exec mysqld_safe
