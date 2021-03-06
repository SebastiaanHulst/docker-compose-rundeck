# docker-compose-rundeck
An environment to run RUNDECK.

## Overview
There are 3 containers configured:
- Apache HTTPD - As a web frontend.
- RUNDECK - The application.
- MySQL - The storage for jobs and job-history.

## Starting it up.
The variables.env needs to be set like you would like, here is a sample:

    # Variables are set here and available in each Docker container.
    SSL_COUNTRY=NL
    SSL_STATE=Utrecht
    SSL_LOCATION=Breukelen
    SSL_ORGANIZATION=http://meinit.nl/
    SSL_ORGANIZATIONAL_UNIT=robert@meinit.nl
    SSL_COMMONNAME=rundeck.meinit.nl
    
    HOST=192.168.99.100
    URL=https://192.168.99.100/rundeck
    SERVERNAME=rundeck.meinit.nl
    SERVERADMIN=robert@meinit.nl

    MYSQL_ROOT_PASSWORD=rundeck
    MYSQL_DATABASE=rundeck
    MYSQL_USER=rundeck
    MYSQL_PASSWORD=rundeck

After creating the variables.env, run these commands.

    git clone https://github.com/robertdebock/docker-compose-rundeck.git
    cd docker-compose-rundeck
    # Edit settings in variables.env to you liking, see above.
    docker-compose up

When everything has been started (should take some 30 seconds) you can visit the URL that you've specified in variables.env.
The default username and password is "admin" and "admin".

## Interesting settings:
- The "web" service must be listening to a port, you may need to change "ports" in docker-compose.yml
- The "mysql" service has a "volume" and "command" for fixing a permission problem when mounting Mac OS X host-volumes into the container. (fix-mysql-permissions.sh) It may be unnecessary for you Docker host. 

## Backup and Restore
To backup data, use:

    ./scripts/backup.sh

And to restore:

    ./scripts/restore.sh
