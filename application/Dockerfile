FROM centos:7

MAINTAINER Robert de Bock

LABEL Description="Base RUNDECK image" Version="1.0"

# These variables -must- be adjusted in order to be able to use RUNDECK.
ENV HOST localhost
ENV URL http://localhost:8080/rundeck

# These variables -may- be adjusted to your liking.
ENV CONTEXT /rundeck
ENV PORT 4440
ENV MYSQL_HOST mysql
ENV MYSQL_DATABASE rundeck
ENV MYSQL_USER rundeck
ENV MYSQL_PASSWORD rundeck

VOLUME /var/log/rundeck
VOLUME /var/rundeck

RUN rpm -Uvh http://repo.rundeck.org/latest.rpm
RUN yum -y install java-1.8.0-openjdk \
                   openssh-clients \ 
                   rundeck && \
    yum -y clean all

CMD echo "Preparing RUNDECK on ${URL}" && \
    sed -i '/dataSource.url/d' /etc/rundeck/rundeck-config.properties && \
    echo "dataSource.url = jdbc:mysql://${MYSQL_HOST}/${MYSQL_DATABASE}?autoReconnect=true" >> /etc/rundeck/rundeck-config.properties && \
    echo "dataSource.username=${MYSQL_USER}" >> /etc/rundeck/rundeck-config.properties && \
    echo "dataSource.password=${MYSQL_PASSWORD}" >> /etc/rundeck/rundeck-config.properties && \
    sed -i '/grails.serverURL/d' /etc/rundeck/rundeck-config.properties && \
    echo "grails.serverURL=${URL}" >> /etc/rundeck/rundeck-config.properties && \
    sed -i '/framework.server.hostname/d' /etc/rundeck/framework.properties && \
    echo "framework.server.hostname = ${HOST}" >> /etc/rundeck/framework.properties && \
    sed -i '/framework.server.port/d' /etc/rundeck/framework.properties && \
    echo "framework.server.port = ${PORT}" >> /etc/rundeck/framework.properties && \
    sed -i '/framework.server.url/d' /etc/rundeck/framework.properties && \
    echo "framework.server.url = ${URL}" >> /etc/rundeck/framework.properties && \
    source /etc/rundeck/profile && \
    ${JAVA_HOME:-/usr}/bin/java ${RDECK_JVM} -Dserver.web.context=${CONTEXT} -Drundeck.jetty.connector.forwarded=true -cp ${BOOTSTRAP_CP} com.dtolabs.rundeck.RunServer /var/lib/rundeck ${RDECK_HTTP_PORT}

EXPOSE 4440
