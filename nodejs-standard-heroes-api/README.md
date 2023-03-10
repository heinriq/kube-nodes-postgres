## Node.js with Postgres Example

<img
    src="https://i.imgur.com/jUeBAiH.png"
    alt="Swagger Page of that application"
    title="Swagger Page of that application" />

### Requirements

* Node.js v8+ or Docker and Docker Compose
* Postgres running on local instance or Docker

### Running on localMachine

* Install dependencies - `npm i`
* Run project - `npm start`

### OR: Docker

* `docker-compose up`

### OR: Alternatives on pulling from Docker hub

* Docker hub image: [heinriq/kube-node-postgres](https://hub.docker.com/repository/docker/heinriq/kube-node-postgres)

```shell
docker run -d -p 5432:5432 --name postgres \
    --env POSTGRES_PASSWORD=mysecretpassword \
    --env POSTGRES_DB=heroes\
    postgres
```

```shell
docker run -p 3000:3000 \
    --link postgres:postgres \
    -e POSTGRES_HOST=postgres:mysecretpassword@postgres:5432 \
    -e POSTGRES_DB=heroes \
    -e POSTGRES_SSL=false \
    heinriq/kube-node-postgres:latest
```

### Viewing

* Go to swagger page - `localhost:3000/documentation`
