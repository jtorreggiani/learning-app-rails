# Learning app rails

This repository an web application built with [Ruby on Rails](https://rubyonrails.org/) designed to help learn about the framework and best practices for web development.

## Technology Stack

- [Git](https://git-scm.com/) for version control and collaboration
- [Docker](https://www.docker.com/) for the development environment
- [Ruby 3.2.0](https://www.ruby-lang.org/en/) for the core programming language
- [Ruby on Rails](https://rubyonrails.org/) for the full stack development framework
- [PostgreSQL](https://www.postgresql.org/) for the database
- [TailwindCSS](https://tailwindcss.com/) for the CSS framework
- [Digital Ocean App Platform](https://www.digitalocean.com/products/app-platform) for deploying to production

## Development Environment

This project is setup to use Docker for local development. Assuming you already have [Docker desktop](https://www.docker.com/products/docker-desktop/) installed you should be able to run the following commands to get up
and running.

```
docker compose build
docker compose up
```

To run an instance of the web service.

```
docker compose run web bash
```

### Developing on your host machine

If you would like to run the application without Docker you will need Ruby version 3.2.0 running locally and setup a Postgres Database and update the `database.yml` file with the corresponding values.

## Deployment

This repository is setup to automatically deploy to Digital Ocean (DO) App platform when code is merged into the main branch. Do handles the heavy lifting for build the application. In the future, we will explore deploying this site to other platforms.

## TODO

- [ ] Add tests to CI
- [ ] Add Ruby linters
- [ ] Add Ruby automated documentation
- [ ] Add cucumber for feature testing