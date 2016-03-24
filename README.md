# docker-compose-rundeck
An environment to run RUNDECK.

There are 3 containers configured:
- apache - As a web frontend.
- RUNDECK - The application.
- mysql - The storage.

LIMITATIONS:
- No SSL is configured on the Apache HTTPD web frontend
- MySQL does not store it's database's data persistently.

To use this "environment" issue:

    git clone https://github.com/robertdebock/docker-compose-rundeck.git
    cd docker-compose-rundeck
    docker-compose up
