# Contaichallenge

# Contaí Challenge

Challenge make to contaí selective process to new software engineer, the project consists in a API to make basic arithmetic calculations (+, -, /, *). The API was developed using ***Elixir*** language, the web framework is ***Phoenix***, the database connector is the ***Ecto*** with ***Postgres*** adapter, documented with ***Swagger*** and ***Docker*** for containers manager.

## Project Structure
The structure of the project is simple, is described in the image below.

![Image: Simple Structure of Project.](https://i.ibb.co/7bms57c/Captura-de-Tela-2021-03-21-a-s-15-20-54.png)

## Run in Docker

The project already have a ***Dockerfile*** and a ***docker-compose.yml*** file, so is very simple to run, just need clone this repository in your computer and need the docker cli installed too. To run just type the following commands in o your terminal.

This command will build our project and create an image.

```
docker-compose build
```

This will run the migrations of the database.

```
docker-compose run web bin/contaichallenge eval "Contaichallenge.Release.migrate"
```

This will startup our project.

```
docker-compose up -d
```

If everything is ok, the project listen in [http://localhost:4000](http://localhost:4000), the ***Swagger*** docs can be found in the [http://localhost:4000/api/swagger](http://localhost:4000/api/swagger).

To change the listen port ou url need follow the Elixir docs.

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
