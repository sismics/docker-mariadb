#!/usr/bin/env bash
docker rm -f mariadb
docker run -d -p 3306:3306 --name mariadb --restart=always \
    -v mariadb_data:/var/lib/mysql \
    sismics/mariadb:10.0 $1
