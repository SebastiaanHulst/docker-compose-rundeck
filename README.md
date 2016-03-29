# docker-compose-rundeck
An environment to run RUNDECK.

There are 3 containers configured:
- Apache HTTPD - As a web frontend.
- RUNDECK - The application.
- MySQL - The storage for jobs and job-history.

To use this "environment" issue:

    git clone https://github.com/robertdebock/docker-compose-rundeck.git
    cd docker-compose-rundeck
    # Edit settings (See below) to you liking.
    docker-compose up

Interesting settings:
- The "web" service must be listening to a port, you may need to change "ports".
- For every service where "volumes" are used; change the mapping to a location where you want to store the persistent data.
- The "rundeck" service must be given an "HOST" and "URL". The HOST is where the API will be available, the URL is where a user will be redirected to. This is likely a (publicly) available URL like: https://example.com/rundeck.
- The "mysql" service has a "volume" and "command" for fixing a permission problem when mounting host-volumes into the container. It may be unnecessary for you Docker host. 
