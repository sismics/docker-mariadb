#
# Dockerfile for Mariadb 10.0, see: https://github.com/tutumcloud/tutum-docker-mariadb
#
# Instructions: 
#
# docker build -t sismics/mariadb .
# docker run -d -p 3306:3306 --name mariadb --volumes-from=mariadb_data sismics/mariadb
#
# The first time that you run your container, a new user admin with all privileges will be created in Mariadb with a random password. To get the password, check the logs of the container by running:
# docker logs <CONTAINER_ID>
#
# Change the password with the commands:
# mariadb -uadmin -p<PASSWORD> -h<DOCKER_HOST>
# set PASSWORD=PASSWORD('new_password')
# 
# You can now test your deployment:
# mariadb -uadmin -p -h<DOCKER_HOST>

FROM ubuntu:noble
MAINTAINER Jean-Marc Tremeaux <jm.tremeaux@sismics.com>

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install mariadb-server pwgen

COPY etc /etc
COPY usr /usr

ENV MARIADB_USER admin
ENV MARIADB_PASS **Random**

EXPOSE 3306
CMD ["/usr/local/bin/entrypoint.sh"]
