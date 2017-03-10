#!/bin/bash

/usr/bin/mysqld_safe > /dev/null 2>&1 &

RET=1
while [[ RET -ne 0 ]]; do
    echo "=> Waiting for confirmation of Mariadb service startup"
    sleep 5
    mysql -uroot -e "status" > /dev/null 2>&1
    RET=$?
done

if [ "$MARIADB_PASS" = "**Random**" ]; then
    unset MARIADB_PASS
fi

PASS=${MARIADB_PASS:-$(pwgen -s 12 1)}
_word=$( [ ${MARIADB_PASS} ] && echo "preset" || echo "random" )
echo "=> Creating Mariadb user ${MARIADB_USER} with ${_word} password"

mysql -uroot -e "CREATE USER '${MARIADB_USER}'@'%' IDENTIFIED BY '$PASS'"
mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO '${MARIADB_USER}'@'%' WITH GRANT OPTION"

echo "=> Done!"

echo "========================================================================"
echo "You can now connect to this Mariadb Server using:"
echo ""
echo "    mariadb -u$MARIADB_USER -p$PASS -h<host> -P<port>"
echo ""
echo "Please remember to change the above password as soon as possible!"
echo "Mariadb user 'root' has no password but only allows local connections"
echo "========================================================================"

mysqladmin -uroot shutdown

touch /var/lib/mysql/initialized