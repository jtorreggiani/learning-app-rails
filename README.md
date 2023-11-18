# Learning app rails

An app for learning ruby on rails.

## About this repository

The repository houses a ruby-on-rails app designed to help learn about to build and deploy web applications.

## System Requirements

- Git
- Docker

## Development

This project is setup to use Docker for development. Assuming you already have Docker desktop installed you should be able to run the following commands to get up
and running.

```
docker compose build
docker compose up
```

To run an instance of the web service.

```
docker compose run web bash
```


### Developing on host machine

If you would like to run the application without Docker you will need Ruby version 3.2.0 running locally and setup a Postgres Database and update the `database.yml` file with the corresponding values.

## Deployment

This repository is setup to automatically deploy to Digital Ocean (DO) App platform when code is merged into the main branch. Do handles the heavy lifting for build the application. In the future, we will explore deploying this site to other platforms.

## TODO

- [ ] Add tests to CI
- [ ] Add Ruby linters