# docker-compose-rundeck
An environment to run RUNDECK.

There are 3 containers configured:
- Apache HTTPD - As a web frontend.
- RUNDECK - The application.
- MySQL - The storage for jobs and job-history.

To use this "environment" issue:

    git clone https://github.com/robertdebock/docker-compose-rundeck.git
    cd docker-compose-rundeck
    # Edit settings in variables.env to you liking.
    docker-compose build
    docker-compose up

When everything has been started (should take some 30 seconds) you can visit the URL that you've specified in variables.env.

Interesting settings:
- The "web" service must be listening to a port, you may need to change "ports" in docker-compose.yml
- The "mysql" service has a "volume" and "command" for fixing a permission problem when mounting Mac OS X host-volumes into the container. (fix-mysql-permissions.sh) It may be unnecessary for you Docker host. 
