# Dockerize-me

This is an rails application used for sampling a Development Environment docker structure. Use as a start point for a new rails application (while is updated) or as reference on what to do to hava a dockerized environment in few minutes.

Check what we did in:
- Dockerfile: File that creates the project image.
- Docker-Entrypoint: Script that runs whenever you start an application container generated with the image.
- Docker-compose: File responsible for structuring the required services to have a development environment.
- Database-setup: Script that runs some database migrations for when you start the project first time.
- DockerIgnore: File responsible on ignoring some files/folders in order to make other Docker proccess idempotent.

#### Setup with Docker
- Docker installation

  - Install docker on your system (exemples with Linux and Snap)

    ```bash
      sudo snap install docker --devmode
    ```

  - Create and enter docker group. As seen in https://askubuntu.com/questions/941816/permission-denied-when-running-docker-after-installing-it-as-a-snap

    ```bash
      $ newgrp docker
      $ sudo addgroup --system docker
      $ sudo adduser $USER docker
      $ sudo snap disable docker
      $ sudo snap enable docker
    ```

- Setup the applicaiton
  ```bash
    git https://git.dev.codus.com.br/yves.medhard/railsnewdockerized.git
    ./bin/setup
  ```
- Run Application

  - Complete
    ```bash
      docker-compose up
    ```
  - Only Web
    ```bash
      docker-compose up web
    ```
  - Only Web with connected ports (debug)
    ```bash
      docker-compose run --service-ports web server
    ```
  - Other commands
    ```bash
      docker-compose run {aplicação} {comando}
    ```
    Application:
    - web

    Comands:
    - setup: Setups the application
    - server: Start application server.
    - test: Runs test suit
    - migrate: Migrates test and developent
    - Any other command is executed

  - A server is already running. Check /web/tmp/pids/server.pid.
    ```bash
      docker-compose run web rm /web/tmp/pids/server.pid
    ```
  - Failed to save 'file': Insufficient permissions. Select 'Retry as Sudo' to retry as superuser.

    This occours because docker generates files in a isolated namespace, with an unique user. That makes the file unaccessible to other users requiring `root` permission to edit. We can do it with the program chown in super user mode.
    ```bash
      sudo chown -R {user} {file or folder}
    ```
    Exemplo:
      ```bash
        sudo chown -R codus db/
      ```
      Obs: The parameter `-R` sets the program to change the permission to all child files in the folder specified recursivelly.
