#### Setup com Docker
- Instalação do docker

  - Instale o docker no seu sistema (aqui exemplificamos com Linux e Snap)

    ```bash
      sudo snap install docker --devmode
    ```

  - Crie e entre no grupo docker. Visto em https://askubuntu.com/questions/941816/permission-denied-when-running-docker-after-installing-it-as-a-snap

    ```bash
      $ newgrp docker
      $ sudo addgroup --system docker
      $ sudo adduser $USER docker
      $ sudo snap disable docker
      $ sudo snap enable docker
    ```

- Fazer o Setup da Aplicação
  ```bash
    git clone git@git.dev.codus.com.br:visa/core.git
    ./bin/setup
  ```
- Subir aplicação

  - Completa
    ```bash
      docker-compose up
    ```
  - Apenas Web
    ```bash
      docker-compose up web
    ```
  - Apenas Web com portas conectadas (debug)
    ```bash
      docker-compose run --service-ports web server
    ```
  - Outros comandos
    ```bash
      docker-compose run {aplicação} {comando}
    ```
    Aplicações:
    - web

    Comandos:
    - setup: Faz o setup da aplicação
    - server: Inicia o servidor da aplicação
    - test: Roda a suite de testes da aplicação
    - migrate: Realiza a migração do banco
    - Qualquer outro comando será executado no ambiente da aplicação selecionada

  - A server is already running. Check /web/tmp/pids/server.pid.
    ```bash
      docker-compose run web rm /web/tmp/pids/server.pid
    ```
  - Failed to save 'file': Insufficient permissions. Select 'Retry as Sudo' to retry as superuser.

    Isso ocorre pois o docker gera os arquivos como `root` e com permissão de edição apenas para o usuário `docker`.

    Para editar devemos dar permissão para nosso usuário
    ```bash
      sudo chown -R {user} {file or folder}
    ```
    Exemplo:
      ```bash
        sudo chown -R codus db/
      ```
      Obs: O parâmetro `-R` configura o programa para dar permissão para todos os arquivos filhos da pasta selecionada de forma recursiva.
