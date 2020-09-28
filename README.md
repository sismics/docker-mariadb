[![GitHub release](https://img.shields.io/github/release/sismics/docker-mariadb.svg?style=flat-square)](https://github.com/sismics/docker-backupninja/releases/latest)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

## About
Docker image for MariaDB

## Usage
- Create a volume for persistent storage:

```
docker volume create --name=mariadb_data
```

- Copy the **docker-compose.yml** and modify it if needed.

- Start the MariaDB server:

```
docker-compose create
docker-compose start
```

- Look at the logs to see your default password:

```
docker logs mariadb
```

- Connect to your DB and **change the default password**

Default users :
- **root** / no password (can connect from mariadb container only).
- **admin** / random password (can connect from all hosts)
