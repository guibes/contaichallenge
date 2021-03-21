# Contaichallenge

# Contaí Challenge

Challenge make to contaí selective process to new software engineer, the project consists in a API to make basic arithmetic calculations (+, -, /, *). The API was developed using ***Elixir*** language, the web framework is ***Phoenix***, the database connector is the ***Ecto*** with ***Postgres*** adapter, documented with ***Swagger*** and ***Docker*** for containers manager.

## Project Structure
The structure of the project is simple, is described in the image below.

![Image: Simple Structure of Project.](https://i.ibb.co/7bms57c/Captura-de-Tela-2021-03-21-a-s-15-20-54.png)


## End Points

The project only have two endpoints, one for list all operations and another to create a new operation.

### Create New Operation

<p>
<center>${urlbase}/api/operations/{operation}/{first_factor}/{second_factor}</center>
</p>

Where, ***operation*** is the operation type, can be, ***sum, sub, mul, div***, where sum is sum, sub is subtraction, mul is multiply, div is division. The ***first_factor*** is the first factor of operation, need be a integer value. The ***second_factor*** is the second factor of the operation.

The result is a json like below

```
{
  "message": "Operation created",
  "operation": {
    "first_factor": 1,
    "id": "99674d5e-5cdf-456c-9fb9-c4a2e6a2c0e8",
    "operation": "sum",
    "result": 3,
    "second_factor": 2
  }
}
```

### Get All Operations

<p>
<center>${urlbase}/api/operations/?limit={limit}&offset={offset}</center>
</p>

Where, ***limit*** is the number of lines of display and ***offset*** is the number of rows want skip.

The result is a json array like below.

```
{
  "message": "Operations listed",
  "operations": [
    {
      "first_factor": 1,
      "id": "99674d5e-5cdf-456c-9fb9-c4a2e6a2c0e8",
      "operation": "sum",
      "result": 3,
      "second_factor": 2
    },
    {
      "first_factor": 50,
      "id": "af06c291-a2b5-404a-a5d0-efce2d04313c",
      "operation": "mul",
      "result": 1000,
      "second_factor": 20
    }
  ],
  "operationsCount": 2
}
```

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

If everything is ok, the project listen in http://localhost:4000, the ***Swagger*** docs can be found in the http://localhost:4000/api/swagger.

This project runs is running in heroku, in the https://contaitest.herokuapp.com, the ***Swagger*** is in the same repositories.

To change the listen port ou url need follow the Elixir docs.

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
